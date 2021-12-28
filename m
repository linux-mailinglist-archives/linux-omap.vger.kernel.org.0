Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7930480C5E
	for <lists+linux-omap@lfdr.de>; Tue, 28 Dec 2021 19:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236849AbhL1SMM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Dec 2021 13:12:12 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21016 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhL1SMM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Dec 2021 13:12:12 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1640714211; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=R1cxMCvhAEszlHw57OixySlPWMGvPKzBvaK/zZgr6R04RVeJ9mBqOO4l3LMDRZxg0s6lDzNXPjw5n3fuwIduvVM1+r+e47QA/UgVCVwySkO6fF+pIUfnvIoB9NK+KvgsE0wcVR20VtODRABIanSKt6eeaqOblkKTl0s+sq6GZ1k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1640714211; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=yVAhgHN8ExHJyZCfwlBBfyWw9do/V6I42C280ecXvCk=; 
        b=NznhUvMxxRWFr2rqf/URc4o7DBDDXGqHgo+XyS/Xsslbca46n88tk4nreqy7kGwbik5Z5WVEv08jXoX1lKjY/ax9CIuOqrTrHefSm26sh6vrmVGDIuVpnk2fb6UKpVyfEZIIPtxefzuejnR28iY6NYBOKUokhj4kJP/6YvdCcH8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (aftr-37-201-192-113.unity-media.net [37.201.192.113]) by mx.zoho.eu
        with SMTPS id 1640714209296668.619587098191; Tue, 28 Dec 2021 18:56:49 +0100 (CET)
Date:   Tue, 28 Dec 2021 18:56:48 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     sre@kernel.org
Cc:     merlijn@wizzup.org, tony@atomide.com, linux-omap@vger.kernel.org
Subject: [PATCH V3] power: supply: cpcap-battery: Add battery type auto
 detection for mapphone devices
Message-Id: <20211228185648.74ba318e9487ab03834ce40d@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This allows cpcap-battery to detect whitch battery is inserted, HW4X or
BW8X for xt875 and EB41 for xt894 by examining the battery nvmem. If no
known battery is detected sane defaults are used.

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 drivers/power/supply/cpcap-battery.c | 125 ++++++++++++++++++++-------
 1 file changed, 92 insertions(+), 33 deletions(-)

diff --git a/drivers/power/supply/cpcap-battery.c b/drivers/power/supply/cpcap-battery.c
index 8d62d4241da3..e079d5549aea 100644
--- a/drivers/power/supply/cpcap-battery.c
+++ b/drivers/power/supply/cpcap-battery.c
@@ -28,6 +28,7 @@
 #include <linux/power_supply.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/moduleparam.h>
 
 #include <linux/iio/consumer.h>
@@ -73,6 +74,9 @@
 
 #define CPCAP_BATTERY_CC_SAMPLE_PERIOD_MS	250
 
+#define CPCAP_BATTERY_EB41_HW4X_ID 0x9E
+#define CPCAP_BATTERY_BW8X_ID 0x98
+
 enum {
 	CPCAP_BATTERY_IIO_BATTDET,
 	CPCAP_BATTERY_IIO_VOLTAGE,
@@ -138,6 +142,7 @@ struct cpcap_battery_ddata {
 	int charge_full;
 	int status;
 	u16 vendor;
+	bool check_nvmem;
 	unsigned int is_full:1;
 };
 
@@ -354,6 +359,88 @@ cpcap_battery_read_accumulated(struct cpcap_battery_ddata *ddata,
 				       ccd->offset);
 }
 
+
+/*
+ * Based on the values from Motorola mapphone Linux kernel for the
+ * stock Droid 4 battery eb41. In the Motorola mapphone Linux
+ * kernel tree the value for pm_cd_factor is passed to the kernel
+ * via device tree. If it turns out to be something device specific
+ * we can consider that too later. These values are also fine for
+ * Bionic's hw4x.
+ *
+ * And looking at the battery full and shutdown values for the stock
+ * kernel on droid 4, full is 4351000 and software initiates shutdown
+ * at 3078000. The device will die around 2743000.
+ */
+static const struct cpcap_battery_config cpcap_battery_eb41_data = {
+	.cd_factor = 0x3cc,
+	.info.technology = POWER_SUPPLY_TECHNOLOGY_LION,
+	.info.voltage_max_design = 4351000,
+	.info.voltage_min_design = 3100000,
+	.info.charge_full_design = 1740000,
+	.bat.constant_charge_voltage_max_uv = 4200000,
+};
+
+/* Values for the extended Droid Bionic battery bw8x. */
+static const struct cpcap_battery_config cpcap_battery_bw8x_data = {
+	.cd_factor = 0x3cc,
+	.info.technology = POWER_SUPPLY_TECHNOLOGY_LION,
+	.info.voltage_max_design = 4200000,
+	.info.voltage_min_design = 3200000,
+	.info.charge_full_design = 2760000,
+	.bat.constant_charge_voltage_max_uv = 4200000,
+};
+
+/*
+ * Safe values for any lipo battery likely to fit into a mapphone
+ * battery bay.
+ */
+static const struct cpcap_battery_config cpcap_battery_unkown_data = {
+	.cd_factor = 0x3cc,
+	.info.technology = POWER_SUPPLY_TECHNOLOGY_LION,
+	.info.voltage_max_design = 4200000,
+	.info.voltage_min_design = 3200000,
+	.info.charge_full_design = 3000000,
+	.bat.constant_charge_voltage_max_uv = 4200000,
+};
+
+static int cpcap_battery_match_nvmem(struct device *dev, const void *data)
+{
+	if (strcmp(dev_name(dev), "89-500029ba0f73") == 0)
+		return 1;
+	else
+		return 0;
+}
+
+static void cpcap_battery_detect_battery_type(struct cpcap_battery_ddata *ddata)
+{
+	struct nvmem_device *nvmem;
+	u8 battery_id = 0;
+
+	ddata->check_nvmem = false;
+
+	nvmem = nvmem_device_find(NULL, &cpcap_battery_match_nvmem);
+	if (IS_ERR_OR_NULL(nvmem)) {
+		ddata->check_nvmem = true;
+		dev_info_once(ddata->dev, "Can not find battery nvmem device. Assuming generic lipo battery\n");
+	} else if (nvmem_device_read(nvmem, 2, 1, &battery_id) < 0) {
+		battery_id = 0;
+		ddata->check_nvmem = true;
+		dev_warn(ddata->dev, "Can not read battery nvmem device. Assuming generic lipo battery\n");
+	}
+
+	switch (battery_id) {
+	case CPCAP_BATTERY_EB41_HW4X_ID:
+		ddata->config = &cpcap_battery_eb41_data;
+		break;
+	case CPCAP_BATTERY_BW8X_ID:
+		ddata->config = &cpcap_battery_bw8x_data;
+		break;
+	default:
+		ddata->config = &cpcap_battery_unkown_data;
+	}
+}
+
 /**
  * cpcap_battery_cc_get_avg_current - read cpcap coulumb counter
  * @ddata: cpcap battery driver device data
@@ -571,6 +658,9 @@ static int cpcap_battery_get_property(struct power_supply *psy,
 	latest = cpcap_battery_latest(ddata);
 	previous = cpcap_battery_previous(ddata);
 
+	if (ddata->check_nvmem)
+		cpcap_battery_detect_battery_type(ddata);
+
 	switch (psp) {
 	case POWER_SUPPLY_PROP_PRESENT:
 		if (latest->temperature > CPCAP_NO_BATTERY || ignore_temperature_probe)
@@ -982,30 +1072,10 @@ static int cpcap_battery_calibrate(struct cpcap_battery_ddata *ddata)
 	return error;
 }
 
-/*
- * Based on the values from Motorola mapphone Linux kernel. In the
- * the Motorola mapphone Linux kernel tree the value for pm_cd_factor
- * is passed to the kernel via device tree. If it turns out to be
- * something device specific we can consider that too later.
- *
- * And looking at the battery full and shutdown values for the stock
- * kernel on droid 4, full is 4351000 and software initiates shutdown
- * at 3078000. The device will die around 2743000.
- */
-static const struct cpcap_battery_config cpcap_battery_default_data = {
-	.cd_factor = 0x3cc,
-	.info.technology = POWER_SUPPLY_TECHNOLOGY_LION,
-	.info.voltage_max_design = 4351000,
-	.info.voltage_min_design = 3100000,
-	.info.charge_full_design = 1740000,
-	.bat.constant_charge_voltage_max_uv = 4200000,
-};
-
 #ifdef CONFIG_OF
 static const struct of_device_id cpcap_battery_id_table[] = {
 	{
 		.compatible = "motorola,cpcap-battery",
-		.data = &cpcap_battery_default_data,
 	},
 	{},
 };
@@ -1026,28 +1096,17 @@ static const struct power_supply_desc cpcap_charger_battery_desc = {
 static int cpcap_battery_probe(struct platform_device *pdev)
 {
 	struct cpcap_battery_ddata *ddata;
-	const struct of_device_id *match;
 	struct power_supply_config psy_cfg = {};
 	int error;
 
-	match = of_match_device(of_match_ptr(cpcap_battery_id_table),
-				&pdev->dev);
-	if (!match)
-		return -EINVAL;
-
-	if (!match->data) {
-		dev_err(&pdev->dev, "no configuration data found\n");
-
-		return -ENODEV;
-	}
-
 	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
 		return -ENOMEM;
 
+	cpcap_battery_detect_battery_type(ddata);
+
 	INIT_LIST_HEAD(&ddata->irq_list);
 	ddata->dev = &pdev->dev;
-	memcpy(&ddata->config, match->data, sizeof(ddata->config));
 
 	ddata->reg = dev_get_regmap(ddata->dev->parent, NULL);
 	if (!ddata->reg)
-- 
2.34.1
