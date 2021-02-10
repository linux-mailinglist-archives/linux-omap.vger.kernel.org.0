Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E15316195
	for <lists+linux-omap@lfdr.de>; Wed, 10 Feb 2021 09:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbhBJI4g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Feb 2021 03:56:36 -0500
Received: from muru.com ([72.249.23.125]:59734 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229818AbhBJIyf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 10 Feb 2021 03:54:35 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3571380EB;
        Wed, 10 Feb 2021 08:54:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: OMAP2+: Fix smartreflex init regression after dropping legacy data
Date:   Wed, 10 Feb 2021 10:53:48 +0200
Message-Id: <20210210085348.28528-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When I dropped legacy data for omap4 and dra7 smartreflex in favor of
device tree based data, it seems I only testd for the "SmartReflex Class3
initialized" line in dmesg. I missed the fact that there is also
omap_devinit_smartreflex() that happens later, and now it produces an
error on boot for "No Voltage table for the corresponding vdd. Cannot
create debugfs entries for n-values".

This happens as we no longer have the smartreflex instance legacy data,
and have not yet moved completely to device tree based booting for the
driver. Let's fix the issue by changing the smartreflex init to use names.
This should all eventually go away in favor of doing the init in the
driver based on devicetree compatible value.

Note that dra7xx_init_early() is not calling any voltage domain init like
omap54xx_voltagedomains_init(), or a dra7 specific voltagedomains init.
This means that on dra7 smartreflex is still not fully initialized, and
also seems to be missing the related devicetree nodes.

Fixes: a6b1e717e942 ("ARM: OMAP2+: Drop legacy platform data for omap4 smartreflex")
Fixes: e54740b4afe8 ("ARM: OMAP2+: Drop legacy platform data for dra7 smartreflex")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/sr_device.c | 75 +++++++++++++++++++++++++--------
 1 file changed, 58 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-omap2/sr_device.c b/arch/arm/mach-omap2/sr_device.c
--- a/arch/arm/mach-omap2/sr_device.c
+++ b/arch/arm/mach-omap2/sr_device.c
@@ -88,34 +88,26 @@ static void __init sr_set_nvalues(struct omap_volt_data *volt_data,
 
 extern struct omap_sr_data omap_sr_pdata[];
 
-static int __init sr_dev_init(struct omap_hwmod *oh, void *user)
+static int __init sr_init_by_name(const char *name, const char *voltdm)
 {
 	struct omap_sr_data *sr_data = NULL;
 	struct omap_volt_data *volt_data;
-	struct omap_smartreflex_dev_attr *sr_dev_attr;
 	static int i;
 
-	if (!strncmp(oh->name, "smartreflex_mpu_iva", 20) ||
-	    !strncmp(oh->name, "smartreflex_mpu", 16))
+	if (!strncmp(name, "smartreflex_mpu_iva", 20) ||
+	    !strncmp(name, "smartreflex_mpu", 16))
 		sr_data = &omap_sr_pdata[OMAP_SR_MPU];
-	else if (!strncmp(oh->name, "smartreflex_core", 17))
+	else if (!strncmp(name, "smartreflex_core", 17))
 		sr_data = &omap_sr_pdata[OMAP_SR_CORE];
-	else if (!strncmp(oh->name, "smartreflex_iva", 16))
+	else if (!strncmp(name, "smartreflex_iva", 16))
 		sr_data = &omap_sr_pdata[OMAP_SR_IVA];
 
 	if (!sr_data) {
-		pr_err("%s: Unknown instance %s\n", __func__, oh->name);
+		pr_err("%s: Unknown instance %s\n", __func__, name);
 		return -EINVAL;
 	}
 
-	sr_dev_attr = (struct omap_smartreflex_dev_attr *)oh->dev_attr;
-	if (!sr_dev_attr || !sr_dev_attr->sensor_voltdm_name) {
-		pr_err("%s: No voltage domain specified for %s. Cannot initialize\n",
-		       __func__, oh->name);
-		goto exit;
-	}
-
-	sr_data->name = oh->name;
+	sr_data->name = name;
 	if (cpu_is_omap343x())
 		sr_data->ip_type = 1;
 	else
@@ -136,10 +128,10 @@ static int __init sr_dev_init(struct omap_hwmod *oh, void *user)
 		}
 	}
 
-	sr_data->voltdm = voltdm_lookup(sr_dev_attr->sensor_voltdm_name);
+	sr_data->voltdm = voltdm_lookup(voltdm);
 	if (!sr_data->voltdm) {
 		pr_err("%s: Unable to get voltage domain pointer for VDD %s\n",
-			__func__, sr_dev_attr->sensor_voltdm_name);
+			__func__, voltdm);
 		goto exit;
 	}
 
@@ -160,6 +152,20 @@ static int __init sr_dev_init(struct omap_hwmod *oh, void *user)
 	return 0;
 }
 
+static int __init sr_dev_init(struct omap_hwmod *oh, void *user)
+{
+	struct omap_smartreflex_dev_attr *sr_dev_attr;
+
+	sr_dev_attr = (struct omap_smartreflex_dev_attr *)oh->dev_attr;
+	if (!sr_dev_attr || !sr_dev_attr->sensor_voltdm_name) {
+		pr_err("%s: No voltage domain specified for %s. Cannot initialize\n",
+		       __func__, oh->name);
+		return 0;
+	}
+
+	return sr_init_by_name(oh->name, sr_dev_attr->sensor_voltdm_name);
+}
+
 /*
  * API to be called from board files to enable smartreflex
  * autocompensation at init.
@@ -169,7 +175,42 @@ void __init omap_enable_smartreflex_on_init(void)
 	sr_enable_on_init = true;
 }
 
+static const char * const omap4_sr_instances[] = {
+	"mpu",
+	"iva",
+	"core",
+};
+
+static const char * const dra7_sr_instances[] = {
+	"mpu",
+	"core",
+};
+
 int __init omap_devinit_smartreflex(void)
 {
+	const char * const *sr_inst;
+	int i, nr_sr = 0;
+
+	if (soc_is_omap44xx()) {
+		sr_inst = omap4_sr_instances;
+		nr_sr = ARRAY_SIZE(omap4_sr_instances);
+
+	} else if (soc_is_dra7xx()) {
+		sr_inst = dra7_sr_instances;
+		nr_sr = ARRAY_SIZE(dra7_sr_instances);
+	}
+
+	if (nr_sr) {
+		const char *name, *voltdm;
+
+		for (i = 0; i < nr_sr; i++) {
+			name = kasprintf(GFP_KERNEL, "smartreflex_%s", sr_inst[i]);
+			voltdm = sr_inst[i];
+			sr_init_by_name(name, voltdm);
+		}
+
+		return 0;
+	}
+
 	return omap_hwmod_for_each_by_class("smartreflex", sr_dev_init, NULL);
 }
-- 
2.30.1
