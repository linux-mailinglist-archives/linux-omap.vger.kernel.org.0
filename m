Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34D1E3692C8
	for <lists+linux-omap@lfdr.de>; Fri, 23 Apr 2021 15:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242593AbhDWNLl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Apr 2021 09:11:41 -0400
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21123 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242545AbhDWNLl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 23 Apr 2021 09:11:41 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619182545; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=i+LG1Tc6ti9PK1vEaO5ltayUDVjJyv3pyRKW/LEOT6i2qeyvhb0zsTR0UPDKi+xojLGAFi9rBchPHXM2BuUQTDDDoSVEfXTFlc8sPbHpM61XYaXISxFgr4ln13f8ljiggZWR/KYQJzn8OxLDO9Xtc8h1SsJa6ejDh3ocQkB3NOg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1619182545; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=nSPxlV9nE44ILQFzsc70ZwuLQHRsdexGdyZ9jOvuxyc=; 
        b=eB9xEB4U3gsNTO6B3kkfOgbU6HET1X3gVf5e+0NXeGDdEZqnpxyEUSY6yvHH4hnEbCXnVFtpydycGPDoS8yh1+f+6RJHs3ozD4cflWmi6F8w7xoEtoKReRzfVPfV8TdgHW27dRtdLrxcZ0V7GuNuPbrQVkcw5oaErZui6c8x5oE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (ip-95-222-215-151.hsi15.unitymediagroup.de [95.222.215.151]) by mx.zoho.eu
        with SMTPS id 1619182543944207.52861232420764; Fri, 23 Apr 2021 14:55:43 +0200 (CEST)
Date:   Fri, 23 Apr 2021 14:55:43 +0200
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v2 1/2] power: supply: cpcap-battery: Add battery type auto
 detection for mapphone devices
Message-Id: <20210423145543.d007e8aa9bd2fc91dc51caa5@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This allows cpcap-battery to detect whitch battery is inserted, HW4X or BW8X for
xt875 and EB41 for xt894 by examining the battery nvmem. If no known battery is
detected sane defaults are used.

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 drivers/power/supply/cpcap-battery.c | 131 ++++++++++++++++++++-------
 1 file changed, 98 insertions(+), 33 deletions(-)

diff --git a/drivers/power/supply/cpcap-battery.c b/drivers/power/supply/cpcap-battery.c
index 6d5bcdb9f45d..386d269e699f 100644
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
@@ -97,6 +101,7 @@ struct cpcap_interrupt_desc {
 
 struct cpcap_battery_config {
 	int cd_factor;
+	char id;
 	struct power_supply_info info;
 	struct power_supply_battery_info bat;
 };
@@ -138,6 +143,8 @@ struct cpcap_battery_ddata {
 	int charge_full;
 	int status;
 	u16 vendor;
+	bool check_nvmem;
+	bool no_nvmem_warned;
 	unsigned int is_full:1;
 };
 
@@ -354,6 +361,91 @@ cpcap_battery_read_accumulated(struct cpcap_battery_ddata *ddata,
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
+		if (!ddata->no_nvmem_warned) {
+			dev_info(ddata->dev, "Can not find battery nvmem device. Assuming generic lipo battery\n");
+			ddata->no_nvmem_warned = true;
+		}
+	} else if (nvmem_device_read(nvmem, 2, 1, &battery_id) < 0) {
+		battery_id = 0;
+		ddata->check_nvmem = true;
+		dev_warn(ddata->dev, "Can not read battery nvmem device. Assuming generic lipo battery\n");
+	}
+
+	switch (battery_id) {
+	case CPCAP_BATTERY_EB41_HW4X_ID:
+		memcpy(&ddata->config, &cpcap_battery_eb41_data, sizeof(ddata->config));
+		break;
+	case CPCAP_BATTERY_BW8X_ID:
+		memcpy(&ddata->config, &cpcap_battery_bw8x_data, sizeof(ddata->config));
+		break;
+	default:
+		memcpy(&ddata->config, &cpcap_battery_unkown_data, sizeof(ddata->config));
+	}
+}
+
 /**
  * cpcap_battery_cc_get_avg_current - read cpcap coulumb counter
  * @ddata: cpcap battery driver device data
@@ -571,6 +663,9 @@ static int cpcap_battery_get_property(struct power_supply *psy,
 	latest = cpcap_battery_latest(ddata);
 	previous = cpcap_battery_previous(ddata);
 
+	if (ddata->check_nvmem)
+		cpcap_battery_detect_battery_type(ddata);
+
 	switch (psp) {
 	case POWER_SUPPLY_PROP_PRESENT:
 		if (latest->temperature > CPCAP_NO_BATTERY || ignore_temperature_probe)
@@ -969,30 +1064,10 @@ static int cpcap_battery_calibrate(struct cpcap_battery_ddata *ddata)
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
@@ -1010,31 +1085,21 @@ static const struct power_supply_desc cpcap_charger_battery_desc = {
 	.external_power_changed = cpcap_battery_external_power_changed,
 };
 
+
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
2.31.0

