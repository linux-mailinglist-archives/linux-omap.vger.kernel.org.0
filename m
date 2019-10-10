Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38C6CD1D33
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 02:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732480AbfJJAMg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 20:12:36 -0400
Received: from muru.com ([72.249.23.125]:36762 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731916AbfJJAMg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 20:12:36 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 953928140;
        Thu, 10 Oct 2019 00:13:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 5/8] ARM: OMAP2+: Configure voltage controller for cpcap
Date:   Wed,  9 Oct 2019 17:12:21 -0700
Message-Id: <20191010001224.41826-6-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010001224.41826-1-tony@atomide.com>
References: <20191010001224.41826-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can configure voltage controller for cpcap with the data available in
Motorola Mapphone Android Linux kernel. Let's add it so we can have droid4
behave the same way for voltage controller as other omap4 devices and save
some power when idle.

Note that we're now using high-speed i2c mode, looks like the Motorola
kernel had a typo using 0x200 instead of 200 for the timings which may
caused it to not work properly.

Also note that in the long run, this should just become dts data for a
voltage controller device driver. But let's get things working first to
make it possible to test further changes easily.

Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/Makefile     |   5 +
 arch/arm/mach-omap2/omap_twl.c   |   5 -
 arch/arm/mach-omap2/pm.c         |   1 +
 arch/arm/mach-omap2/pm.h         |  14 ++
 arch/arm/mach-omap2/pmic-cpcap.c | 265 +++++++++++++++++++++++++++++++
 5 files changed, 285 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/mach-omap2/pmic-cpcap.c

diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile
@@ -29,6 +29,11 @@ obj-y += mcbsp.o
 endif
 
 obj-$(CONFIG_TWL4030_CORE) += omap_twl.o
+
+ifneq ($(CONFIG_MFD_CPCAP),)
+obj-y 					+= pmic-cpcap.o
+endif
+
 obj-$(CONFIG_SOC_HAS_OMAP2_SDRC)	+= sdrc.o
 
 # SMP support ONLY available for OMAP4
diff --git a/arch/arm/mach-omap2/omap_twl.c b/arch/arm/mach-omap2/omap_twl.c
--- a/arch/arm/mach-omap2/omap_twl.c
+++ b/arch/arm/mach-omap2/omap_twl.c
@@ -36,11 +36,6 @@
 #define OMAP4_VDD_CORE_SR_VOLT_REG	0x61
 #define OMAP4_VDD_CORE_SR_CMD_REG	0x62
 
-#define OMAP4_VP_CONFIG_ERROROFFSET	0x00
-#define OMAP4_VP_VSTEPMIN_VSTEPMIN	0x01
-#define OMAP4_VP_VSTEPMAX_VSTEPMAX	0x04
-#define OMAP4_VP_VLIMITTO_TIMEOUT_US	200
-
 static bool is_offset_valid;
 static u8 smps_offset;
 
diff --git a/arch/arm/mach-omap2/pm.c b/arch/arm/mach-omap2/pm.c
--- a/arch/arm/mach-omap2/pm.c
+++ b/arch/arm/mach-omap2/pm.c
@@ -148,6 +148,7 @@ int __init omap2_common_pm_late_init(void)
 	/* Init the voltage layer */
 	omap3_twl_init();
 	omap4_twl_init();
+	omap4_cpcap_init();
 	omap_voltage_late_init();
 
 	/* Smartreflex device init */
diff --git a/arch/arm/mach-omap2/pm.h b/arch/arm/mach-omap2/pm.h
--- a/arch/arm/mach-omap2/pm.h
+++ b/arch/arm/mach-omap2/pm.h
@@ -107,6 +107,11 @@ extern u16 pm44xx_errata;
 #define IS_PM44XX_ERRATUM(id)		0
 #endif
 
+#define OMAP4_VP_CONFIG_ERROROFFSET	0x00
+#define OMAP4_VP_VSTEPMIN_VSTEPMIN	0x01
+#define OMAP4_VP_VSTEPMAX_VSTEPMAX	0x04
+#define OMAP4_VP_VLIMITTO_TIMEOUT_US	200
+
 #ifdef CONFIG_POWER_AVS_OMAP
 extern int omap_devinit_smartreflex(void);
 extern void omap_enable_smartreflex_on_init(void);
@@ -134,6 +139,15 @@ static inline int omap4_twl_init(void)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_MFD_CPCAP)
+extern int omap4_cpcap_init(void);
+#else
+static inline int omap4_cpcap_init(void)
+{
+	return -EINVAL;
+}
+#endif
+
 #ifdef CONFIG_PM
 extern void omap_pm_setup_oscillator(u32 tstart, u32 tshut);
 extern void omap_pm_get_oscillator(u32 *tstart, u32 *tshut);
diff --git a/arch/arm/mach-omap2/pmic-cpcap.c b/arch/arm/mach-omap2/pmic-cpcap.c
new file mode 100644
--- /dev/null
+++ b/arch/arm/mach-omap2/pmic-cpcap.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * pmic-cpcap.c - CPCAP-specific functions for the OPP code
+ *
+ * Adapted from Motorola Mapphone Android Linux kernel
+ * Copyright (C) 2011 Motorola, Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+
+#include "soc.h"
+#include "pm.h"
+#include "voltage.h"
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include "pm.h"
+#include "vc.h"
+
+/**
+ * omap_cpcap_vsel_to_vdc - convert CPCAP VSEL value to microvolts DC
+ * @vsel: CPCAP VSEL value to convert
+ *
+ * Returns the microvolts DC that the CPCAP PMIC should generate when
+ * programmed with @vsel.
+ */
+unsigned long omap_cpcap_vsel_to_uv(unsigned char vsel)
+{
+	if (vsel > 0x44)
+		vsel = 0x44;
+	return (((vsel * 125) + 6000)) * 100;
+}
+
+/**
+ * omap_cpcap_uv_to_vsel - convert microvolts DC to CPCAP VSEL value
+ * @uv: microvolts DC to convert
+ *
+ * Returns the VSEL value necessary for the CPCAP PMIC to
+ * generate an output voltage equal to or greater than @uv microvolts DC.
+ */
+unsigned char omap_cpcap_uv_to_vsel(unsigned long uv)
+{
+	if (uv < 600000)
+		uv = 600000;
+	else if (uv > 1450000)
+		uv = 1450000;
+	return DIV_ROUND_UP(uv - 600000, 12500);
+}
+
+static struct omap_voltdm_pmic omap_cpcap_core = {
+	.slew_rate = 4000,
+	.step_size = 12500,
+	.vp_erroroffset = OMAP4_VP_CONFIG_ERROROFFSET,
+	.vp_vstepmin = OMAP4_VP_VSTEPMIN_VSTEPMIN,
+	.vp_vstepmax = OMAP4_VP_VSTEPMAX_VSTEPMAX,
+	.vddmin = 900000,
+	.vddmax = 1350000,
+	.vp_timeout_us = OMAP4_VP_VLIMITTO_TIMEOUT_US,
+	.i2c_slave_addr = 0x02,
+	.volt_reg_addr = 0x00,
+	.cmd_reg_addr = 0x01,
+	.i2c_high_speed = true,
+	.vsel_to_uv = omap_cpcap_vsel_to_uv,
+	.uv_to_vsel = omap_cpcap_uv_to_vsel,
+};
+
+static struct omap_voltdm_pmic omap_cpcap_iva = {
+	.slew_rate = 4000,
+	.step_size = 12500,
+	.vp_erroroffset = OMAP4_VP_CONFIG_ERROROFFSET,
+	.vp_vstepmin = OMAP4_VP_VSTEPMIN_VSTEPMIN,
+	.vp_vstepmax = OMAP4_VP_VSTEPMAX_VSTEPMAX,
+	.vddmin = 900000,
+	.vddmax = 1350000,
+	.vp_timeout_us = OMAP4_VP_VLIMITTO_TIMEOUT_US,
+	.i2c_slave_addr = 0x44,
+	.volt_reg_addr = 0x0,
+	.cmd_reg_addr = 0x01,
+	.i2c_high_speed = true,
+	.vsel_to_uv = omap_cpcap_vsel_to_uv,
+	.uv_to_vsel = omap_cpcap_uv_to_vsel,
+};
+
+/**
+ * omap_max8952_vsel_to_vdc - convert MAX8952 VSEL value to microvolts DC
+ * @vsel: MAX8952 VSEL value to convert
+ *
+ * Returns the microvolts DC that the MAX8952 Regulator should generate when
+ * programmed with @vsel.
+ */
+unsigned long omap_max8952_vsel_to_uv(unsigned char vsel)
+{
+	if (vsel > 0x3F)
+		vsel = 0x3F;
+	return (((vsel * 100) + 7700)) * 100;
+}
+
+/**
+ * omap_max8952_uv_to_vsel - convert microvolts DC to MAX8952 VSEL value
+ * @uv: microvolts DC to convert
+ *
+ * Returns the VSEL value necessary for the MAX8952 Regulator to
+ * generate an output voltage equal to or greater than @uv microvolts DC.
+ */
+unsigned char omap_max8952_uv_to_vsel(unsigned long uv)
+{
+	if (uv < 770000)
+		uv = 770000;
+	else if (uv > 1400000)
+		uv = 1400000;
+	return DIV_ROUND_UP(uv - 770000, 10000);
+}
+
+static struct omap_voltdm_pmic omap443x_max8952_mpu = {
+	.slew_rate = 16000,
+	.step_size = 10000,
+	.vp_erroroffset = OMAP4_VP_CONFIG_ERROROFFSET,
+	.vp_vstepmin = OMAP4_VP_VSTEPMIN_VSTEPMIN,
+	.vp_vstepmax = OMAP4_VP_VSTEPMAX_VSTEPMAX,
+	.vddmin = 900000,
+	.vddmax = 1400000,
+	.vp_timeout_us = OMAP4_VP_VLIMITTO_TIMEOUT_US,
+	.i2c_slave_addr = 0x60,
+	.volt_reg_addr = 0x03,
+	.cmd_reg_addr = 0x03,
+	.i2c_high_speed = true,
+	.vsel_to_uv = omap_max8952_vsel_to_uv,
+	.uv_to_vsel = omap_max8952_uv_to_vsel,
+};
+
+/**
+ * omap_fan5355_vsel_to_vdc - convert FAN535503 VSEL value to microvolts DC
+ * @vsel: FAN535503 VSEL value to convert
+ *
+ * Returns the microvolts DC that the FAN535503 Regulator should generate when
+ * programmed with @vsel.
+ */
+unsigned long omap_fan535503_vsel_to_uv(unsigned char vsel)
+{
+	/* Extract bits[5:0] */
+	vsel &= 0x3F;
+
+	return (((vsel * 125) + 7500)) * 100;
+}
+
+/**
+ * omap_fan535508_vsel_to_vdc - convert FAN535508 VSEL value to microvolts DC
+ * @vsel: FAN535508 VSEL value to convert
+ *
+ * Returns the microvolts DC that the FAN535508 Regulator should generate when
+ * programmed with @vsel.
+ */
+unsigned long omap_fan535508_vsel_to_uv(unsigned char vsel)
+{
+	/* Extract bits[5:0] */
+	vsel &= 0x3F;
+
+	if (vsel > 0x37)
+		vsel = 0x37;
+	return (((vsel * 125) + 7500)) * 100;
+}
+
+
+/**
+ * omap_fan535503_uv_to_vsel - convert microvolts DC to FAN535503 VSEL value
+ * @uv: microvolts DC to convert
+ *
+ * Returns the VSEL value necessary for the MAX8952 Regulator to
+ * generate an output voltage equal to or greater than @uv microvolts DC.
+ */
+unsigned char omap_fan535503_uv_to_vsel(unsigned long uv)
+{
+	unsigned char vsel;
+	if (uv < 750000)
+		uv = 750000;
+	else if (uv > 1537500)
+		uv = 1537500;
+
+	vsel = DIV_ROUND_UP(uv - 750000, 12500);
+	return vsel | 0xC0;
+}
+
+/**
+ * omap_fan535508_uv_to_vsel - convert microvolts DC to FAN535508 VSEL value
+ * @uv: microvolts DC to convert
+ *
+ * Returns the VSEL value necessary for the MAX8952 Regulator to
+ * generate an output voltage equal to or greater than @uv microvolts DC.
+ */
+unsigned char omap_fan535508_uv_to_vsel(unsigned long uv)
+{
+	unsigned char vsel;
+	if (uv < 750000)
+		uv = 750000;
+	else if (uv > 1437500)
+		uv = 1437500;
+
+	vsel = DIV_ROUND_UP(uv - 750000, 12500);
+	return vsel | 0xC0;
+}
+
+/* fan5335-core */
+static struct omap_voltdm_pmic omap4_fan_core = {
+	.slew_rate = 4000,
+	.step_size = 12500,
+	.vp_erroroffset = OMAP4_VP_CONFIG_ERROROFFSET,
+	.vp_vstepmin = OMAP4_VP_VSTEPMIN_VSTEPMIN,
+	.vp_vstepmax = OMAP4_VP_VSTEPMAX_VSTEPMAX,
+	.vddmin = 850000,
+	.vddmax = 1375000,
+	.vp_timeout_us = OMAP4_VP_VLIMITTO_TIMEOUT_US,
+	.i2c_slave_addr = 0x4A,
+	.i2c_high_speed = true,
+	.volt_reg_addr = 0x01,
+	.cmd_reg_addr = 0x01,
+	.vsel_to_uv = omap_fan535508_vsel_to_uv,
+	.uv_to_vsel = omap_fan535508_uv_to_vsel,
+};
+
+/* fan5335 iva */
+static struct omap_voltdm_pmic omap4_fan_iva = {
+	.slew_rate = 4000,
+	.step_size = 12500,
+	.vp_erroroffset = OMAP4_VP_CONFIG_ERROROFFSET,
+	.vp_vstepmin = OMAP4_VP_VSTEPMIN_VSTEPMIN,
+	.vp_vstepmax = OMAP4_VP_VSTEPMAX_VSTEPMAX,
+	.vddmin = 850000,
+	.vddmax = 1375000,
+	.vp_timeout_us = OMAP4_VP_VLIMITTO_TIMEOUT_US,
+	.i2c_slave_addr = 0x48,
+	.volt_reg_addr = 0x01,
+	.cmd_reg_addr = 0x01,
+	.i2c_high_speed = true,
+	.vsel_to_uv = omap_fan535503_vsel_to_uv,
+	.uv_to_vsel = omap_fan535503_uv_to_vsel,
+};
+
+int __init omap4_cpcap_init(void)
+{
+	struct voltagedomain *voltdm;
+
+	if (!of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
+		return -ENODEV;
+
+	voltdm = voltdm_lookup("mpu");
+	omap_voltage_register_pmic(voltdm, &omap443x_max8952_mpu);
+
+	if (of_machine_is_compatible("motorola,droid-bionic")) {
+		voltdm = voltdm_lookup("mpu");
+		omap_voltage_register_pmic(voltdm, &omap_cpcap_core);
+
+		voltdm = voltdm_lookup("mpu");
+		omap_voltage_register_pmic(voltdm, &omap_cpcap_iva);
+	} else {
+		voltdm = voltdm_lookup("core");
+		omap_voltage_register_pmic(voltdm, &omap4_fan_core);
+
+		voltdm = voltdm_lookup("iva");
+		omap_voltage_register_pmic(voltdm, &omap4_fan_iva);
+	}
+
+	return 0;
+}
-- 
2.23.0
