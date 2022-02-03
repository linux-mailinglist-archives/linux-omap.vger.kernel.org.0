Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBE84A80B6
	for <lists+linux-omap@lfdr.de>; Thu,  3 Feb 2022 09:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349628AbiBCI4j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Feb 2022 03:56:39 -0500
Received: from muru.com ([72.249.23.125]:45860 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234169AbiBCI4f (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Feb 2022 03:56:35 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AC2678181;
        Thu,  3 Feb 2022 08:56:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/3] clk: ti: Drop legacy compatibility clocks for am4
Date:   Thu,  3 Feb 2022 10:56:17 +0200
Message-Id: <20220203085618.16043-3-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220203085618.16043-1-tony@atomide.com>
References: <20220203085618.16043-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We no longer have users for the compatibility clocks and we can drop them.
These are old duplicate clocks for what we using.

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/Makefile          |   3 +-
 drivers/clk/ti/clk-43xx-compat.c | 225 -------------------------------
 drivers/clk/ti/clk-43xx.c        |   5 +-
 drivers/clk/ti/clkctrl.c         |  16 +--
 drivers/clk/ti/clock.h           |   3 -
 include/dt-bindings/clock/am4.h  |  98 --------------
 6 files changed, 6 insertions(+), 344 deletions(-)
 delete mode 100644 drivers/clk/ti/clk-43xx-compat.c

diff --git a/drivers/clk/ti/Makefile b/drivers/clk/ti/Makefile
--- a/drivers/clk/ti/Makefile
+++ b/drivers/clk/ti/Makefile
@@ -18,8 +18,7 @@ obj-$(CONFIG_SOC_OMAP5)			+= $(clk-common) clk-54xx.o \
 obj-$(CONFIG_SOC_DRA7XX)		+= $(clk-common) clk-7xx.o \
 					   clk-dra7-atl.o dpll3xxx.o \
 					   dpll44xx.o clk-7xx-compat.o
-obj-$(CONFIG_SOC_AM43XX)		+= $(clk-common) dpll3xxx.o clk-43xx.o \
-					   clk-43xx-compat.o
+obj-$(CONFIG_SOC_AM43XX)		+= $(clk-common) dpll3xxx.o clk-43xx.o
 
 endif	# CONFIG_ARCH_OMAP2PLUS
 
diff --git a/drivers/clk/ti/clk-43xx-compat.c b/drivers/clk/ti/clk-43xx-compat.c
deleted file mode 100644
--- a/drivers/clk/ti/clk-43xx-compat.c
+++ /dev/null
@@ -1,225 +0,0 @@
-/*
- * AM43XX Clock init
- *
- * Copyright (C) 2013 Texas Instruments, Inc
- *     Tero Kristo (t-kristo@ti.com)
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- */
-
-#include <linux/kernel.h>
-#include <linux/list.h>
-#include <linux/clk.h>
-#include <linux/clk-provider.h>
-#include <linux/clk/ti.h>
-#include <dt-bindings/clock/am4.h>
-
-#include "clock.h"
-
-static const char * const am4_synctimer_32kclk_parents[] __initconst = {
-	"mux_synctimer32k_ck",
-	NULL,
-};
-
-static const struct omap_clkctrl_bit_data am4_counter_32k_bit_data[] __initconst = {
-	{ 8, TI_CLK_GATE, am4_synctimer_32kclk_parents, NULL },
-	{ 0 },
-};
-
-static const char * const am4_gpio0_dbclk_parents[] __initconst = {
-	"gpio0_dbclk_mux_ck",
-	NULL,
-};
-
-static const struct omap_clkctrl_bit_data am4_gpio1_bit_data[] __initconst = {
-	{ 8, TI_CLK_GATE, am4_gpio0_dbclk_parents, NULL },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_reg_data am4_l4_wkup_clkctrl_regs[] __initconst = {
-	{ AM4_ADC_TSC_CLKCTRL, NULL, CLKF_SW_SUP, "adc_tsc_fck", "l3s_tsc_clkdm" },
-	{ AM4_L4_WKUP_CLKCTRL, NULL, CLKF_SW_SUP, "sys_clkin_ck", "l4_wkup_clkdm" },
-	{ AM4_WKUP_M3_CLKCTRL, NULL, CLKF_NO_IDLEST, "sys_clkin_ck" },
-	{ AM4_COUNTER_32K_CLKCTRL, am4_counter_32k_bit_data, CLKF_SW_SUP, "l4_wkup_cm:clk:0210:8" },
-	{ AM4_TIMER1_CLKCTRL, NULL, CLKF_SW_SUP, "timer1_fck", "l4_wkup_clkdm" },
-	{ AM4_WD_TIMER2_CLKCTRL, NULL, CLKF_SW_SUP, "wdt1_fck", "l4_wkup_clkdm" },
-	{ AM4_I2C1_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_wkupdm_ck", "l4_wkup_clkdm" },
-	{ AM4_UART1_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_wkupdm_ck", "l4_wkup_clkdm" },
-	{ AM4_SMARTREFLEX0_CLKCTRL, NULL, CLKF_SW_SUP, "smartreflex0_fck", "l4_wkup_clkdm" },
-	{ AM4_SMARTREFLEX1_CLKCTRL, NULL, CLKF_SW_SUP, "smartreflex1_fck", "l4_wkup_clkdm" },
-	{ AM4_CONTROL_CLKCTRL, NULL, CLKF_SW_SUP, "sys_clkin_ck", "l4_wkup_clkdm" },
-	{ AM4_GPIO1_CLKCTRL, am4_gpio1_bit_data, CLKF_SW_SUP, "sys_clkin_ck", "l4_wkup_clkdm" },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_reg_data am4_mpu_clkctrl_regs[] __initconst = {
-	{ AM4_MPU_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_mpu_m2_ck" },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_reg_data am4_gfx_l3_clkctrl_regs[] __initconst = {
-	{ AM4_GFX_CLKCTRL, NULL, CLKF_SW_SUP, "gfx_fck_div_ck" },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_reg_data am4_l4_rtc_clkctrl_regs[] __initconst = {
-	{ AM4_RTC_CLKCTRL, NULL, CLKF_SW_SUP, "clk_32768_ck" },
-	{ 0 },
-};
-
-static const char * const am4_usb_otg_ss0_refclk960m_parents[] __initconst = {
-	"dpll_per_clkdcoldo",
-	NULL,
-};
-
-static const struct omap_clkctrl_bit_data am4_usb_otg_ss0_bit_data[] __initconst = {
-	{ 8, TI_CLK_GATE, am4_usb_otg_ss0_refclk960m_parents, NULL },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_bit_data am4_usb_otg_ss1_bit_data[] __initconst = {
-	{ 8, TI_CLK_GATE, am4_usb_otg_ss0_refclk960m_parents, NULL },
-	{ 0 },
-};
-
-static const char * const am4_gpio1_dbclk_parents[] __initconst = {
-	"clkdiv32k_ick",
-	NULL,
-};
-
-static const struct omap_clkctrl_bit_data am4_gpio2_bit_data[] __initconst = {
-	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_bit_data am4_gpio3_bit_data[] __initconst = {
-	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_bit_data am4_gpio4_bit_data[] __initconst = {
-	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_bit_data am4_gpio5_bit_data[] __initconst = {
-	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_bit_data am4_gpio6_bit_data[] __initconst = {
-	{ 8, TI_CLK_GATE, am4_gpio1_dbclk_parents, NULL },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_reg_data am4_l4_per_clkctrl_regs[] __initconst = {
-	{ AM4_L3_MAIN_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM4_AES_CLKCTRL, NULL, CLKF_SW_SUP, "aes0_fck", "l3_clkdm" },
-	{ AM4_DES_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM4_L3_INSTR_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM4_OCMCRAM_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM4_SHAM_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM4_VPFE0_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3s_clkdm" },
-	{ AM4_VPFE1_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3s_clkdm" },
-	{ AM4_TPCC_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM4_TPTC0_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM4_TPTC1_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM4_TPTC2_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM4_L4_HS_CLKCTRL, NULL, CLKF_SW_SUP, "l4hs_gclk", "l3_clkdm" },
-	{ AM4_GPMC_CLKCTRL, NULL, CLKF_SW_SUP, "l3s_gclk", "l3s_clkdm" },
-	{ AM4_MCASP0_CLKCTRL, NULL, CLKF_SW_SUP, "mcasp0_fck", "l3s_clkdm" },
-	{ AM4_MCASP1_CLKCTRL, NULL, CLKF_SW_SUP, "mcasp1_fck", "l3s_clkdm" },
-	{ AM4_MMC3_CLKCTRL, NULL, CLKF_SW_SUP, "mmc_clk", "l3s_clkdm" },
-	{ AM4_QSPI_CLKCTRL, NULL, CLKF_SW_SUP, "l3s_gclk", "l3s_clkdm" },
-	{ AM4_USB_OTG_SS0_CLKCTRL, am4_usb_otg_ss0_bit_data, CLKF_SW_SUP, "l3s_gclk", "l3s_clkdm" },
-	{ AM4_USB_OTG_SS1_CLKCTRL, am4_usb_otg_ss1_bit_data, CLKF_SW_SUP, "l3s_gclk", "l3s_clkdm" },
-	{ AM4_PRUSS_CLKCTRL, NULL, CLKF_SW_SUP, "pruss_ocp_gclk", "pruss_ocp_clkdm" },
-	{ AM4_L4_LS_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_D_CAN0_CLKCTRL, NULL, CLKF_SW_SUP, "dcan0_fck" },
-	{ AM4_D_CAN1_CLKCTRL, NULL, CLKF_SW_SUP, "dcan1_fck" },
-	{ AM4_EPWMSS0_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_EPWMSS1_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_EPWMSS2_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_EPWMSS3_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_EPWMSS4_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_EPWMSS5_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_ELM_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_GPIO2_CLKCTRL, am4_gpio2_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_GPIO3_CLKCTRL, am4_gpio3_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_GPIO4_CLKCTRL, am4_gpio4_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_GPIO5_CLKCTRL, am4_gpio5_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_GPIO6_CLKCTRL, am4_gpio6_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_HDQ1W_CLKCTRL, NULL, CLKF_SW_SUP, "func_12m_clk" },
-	{ AM4_I2C2_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM4_I2C3_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM4_MAILBOX_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_MMC1_CLKCTRL, NULL, CLKF_SW_SUP, "mmc_clk" },
-	{ AM4_MMC2_CLKCTRL, NULL, CLKF_SW_SUP, "mmc_clk" },
-	{ AM4_RNG_CLKCTRL, NULL, CLKF_SW_SUP, "rng_fck" },
-	{ AM4_SPI0_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM4_SPI1_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM4_SPI2_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM4_SPI3_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM4_SPI4_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM4_SPINLOCK_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_TIMER2_CLKCTRL, NULL, CLKF_SW_SUP, "timer2_fck" },
-	{ AM4_TIMER3_CLKCTRL, NULL, CLKF_SW_SUP, "timer3_fck" },
-	{ AM4_TIMER4_CLKCTRL, NULL, CLKF_SW_SUP, "timer4_fck" },
-	{ AM4_TIMER5_CLKCTRL, NULL, CLKF_SW_SUP, "timer5_fck" },
-	{ AM4_TIMER6_CLKCTRL, NULL, CLKF_SW_SUP, "timer6_fck" },
-	{ AM4_TIMER7_CLKCTRL, NULL, CLKF_SW_SUP, "timer7_fck" },
-	{ AM4_TIMER8_CLKCTRL, NULL, CLKF_SW_SUP, "timer8_fck" },
-	{ AM4_TIMER9_CLKCTRL, NULL, CLKF_SW_SUP, "timer9_fck" },
-	{ AM4_TIMER10_CLKCTRL, NULL, CLKF_SW_SUP, "timer10_fck" },
-	{ AM4_TIMER11_CLKCTRL, NULL, CLKF_SW_SUP, "timer11_fck" },
-	{ AM4_UART2_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM4_UART3_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM4_UART4_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM4_UART5_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM4_UART6_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM4_OCP2SCP0_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_OCP2SCP1_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM4_EMIF_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_ddr_m2_ck", "emif_clkdm" },
-	{ AM4_DSS_CORE_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_SET_RATE_PARENT, "disp_clk", "dss_clkdm" },
-	{ AM4_CPGMAC0_CLKCTRL, NULL, CLKF_SW_SUP, "cpsw_125mhz_gclk", "cpsw_125mhz_clkdm" },
-	{ 0 },
-};
-
-const struct omap_clkctrl_data am4_clkctrl_compat_data[] __initconst = {
-	{ 0x44df2820, am4_l4_wkup_clkctrl_regs },
-	{ 0x44df8320, am4_mpu_clkctrl_regs },
-	{ 0x44df8420, am4_gfx_l3_clkctrl_regs },
-	{ 0x44df8520, am4_l4_rtc_clkctrl_regs },
-	{ 0x44df8820, am4_l4_per_clkctrl_regs },
-	{ 0 },
-};
-
-const struct omap_clkctrl_data am438x_clkctrl_compat_data[] __initconst = {
-	{ 0x44df2820, am4_l4_wkup_clkctrl_regs },
-	{ 0x44df8320, am4_mpu_clkctrl_regs },
-	{ 0x44df8420, am4_gfx_l3_clkctrl_regs },
-	{ 0x44df8820, am4_l4_per_clkctrl_regs },
-	{ 0 },
-};
-
-struct ti_dt_clk am43xx_compat_clks[] = {
-	DT_CLK(NULL, "timer_32k_ck", "clkdiv32k_ick"),
-	DT_CLK(NULL, "timer_sys_ck", "sys_clkin_ck"),
-	DT_CLK(NULL, "gpio0_dbclk", "l4_wkup_cm:0348:8"),
-	DT_CLK(NULL, "gpio1_dbclk", "l4_per_cm:0458:8"),
-	DT_CLK(NULL, "gpio2_dbclk", "l4_per_cm:0460:8"),
-	DT_CLK(NULL, "gpio3_dbclk", "l4_per_cm:0468:8"),
-	DT_CLK(NULL, "gpio4_dbclk", "l4_per_cm:0470:8"),
-	DT_CLK(NULL, "gpio5_dbclk", "l4_per_cm:0478:8"),
-	DT_CLK(NULL, "synctimer_32kclk", "l4_wkup_cm:0210:8"),
-	DT_CLK(NULL, "usb_otg_ss0_refclk960m", "l4_per_cm:0240:8"),
-	DT_CLK(NULL, "usb_otg_ss1_refclk960m", "l4_per_cm:0248:8"),
-	{ .node_name = NULL },
-};
diff --git a/drivers/clk/ti/clk-43xx.c b/drivers/clk/ti/clk-43xx.c
--- a/drivers/clk/ti/clk-43xx.c
+++ b/drivers/clk/ti/clk-43xx.c
@@ -282,10 +282,7 @@ int __init am43xx_dt_clk_init(void)
 {
 	struct clk *clk1, *clk2;
 
-	if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT)
-		ti_dt_clocks_register(am43xx_compat_clks);
-	else
-		ti_dt_clocks_register(am43xx_clks);
+	ti_dt_clocks_register(am43xx_clks);
 
 	omap2_clk_disable_autoidle_all();
 
diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -546,19 +546,11 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 		data = am3_clkctrl_data;
 #endif
 #ifdef CONFIG_SOC_AM43XX
-	if (of_machine_is_compatible("ti,am4372")) {
-		if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT)
-			data = am4_clkctrl_compat_data;
-		else
-			data = am4_clkctrl_data;
-	}
+	if (of_machine_is_compatible("ti,am4372"))
+		data = am4_clkctrl_data;
 
-	if (of_machine_is_compatible("ti,am438x")) {
-		if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT)
-			data = am438x_clkctrl_compat_data;
-		else
-			data = am438x_clkctrl_data;
-	}
+	if (of_machine_is_compatible("ti,am438x"))
+		data = am438x_clkctrl_data;
 #endif
 #ifdef CONFIG_SOC_TI81XX
 	if (of_machine_is_compatible("ti,dm814"))
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -201,10 +201,7 @@ extern const struct omap_clkctrl_data am3_clkctrl_data[];
 extern const struct omap_clkctrl_data am3_clkctrl_compat_data[];
 extern struct ti_dt_clk am33xx_compat_clks[];
 extern const struct omap_clkctrl_data am4_clkctrl_data[];
-extern const struct omap_clkctrl_data am4_clkctrl_compat_data[];
-extern struct ti_dt_clk am43xx_compat_clks[];
 extern const struct omap_clkctrl_data am438x_clkctrl_data[];
-extern const struct omap_clkctrl_data am438x_clkctrl_compat_data[];
 extern const struct omap_clkctrl_data dm814_clkctrl_data[];
 extern const struct omap_clkctrl_data dm816_clkctrl_data[];
 
diff --git a/include/dt-bindings/clock/am4.h b/include/dt-bindings/clock/am4.h
--- a/include/dt-bindings/clock/am4.h
+++ b/include/dt-bindings/clock/am4.h
@@ -8,104 +8,6 @@
 #define AM4_CLKCTRL_OFFSET	0x20
 #define AM4_CLKCTRL_INDEX(offset)	((offset) - AM4_CLKCTRL_OFFSET)
 
-/* XXX: Compatibility part begin, remove this once compatibility support is no longer needed */
-
-/* l4_wkup clocks */
-#define AM4_ADC_TSC_CLKCTRL	AM4_CLKCTRL_INDEX(0x120)
-#define AM4_L4_WKUP_CLKCTRL	AM4_CLKCTRL_INDEX(0x220)
-#define AM4_WKUP_M3_CLKCTRL	AM4_CLKCTRL_INDEX(0x228)
-#define AM4_COUNTER_32K_CLKCTRL	AM4_CLKCTRL_INDEX(0x230)
-#define AM4_TIMER1_CLKCTRL	AM4_CLKCTRL_INDEX(0x328)
-#define AM4_WD_TIMER2_CLKCTRL	AM4_CLKCTRL_INDEX(0x338)
-#define AM4_I2C1_CLKCTRL	AM4_CLKCTRL_INDEX(0x340)
-#define AM4_UART1_CLKCTRL	AM4_CLKCTRL_INDEX(0x348)
-#define AM4_SMARTREFLEX0_CLKCTRL	AM4_CLKCTRL_INDEX(0x350)
-#define AM4_SMARTREFLEX1_CLKCTRL	AM4_CLKCTRL_INDEX(0x358)
-#define AM4_CONTROL_CLKCTRL	AM4_CLKCTRL_INDEX(0x360)
-#define AM4_GPIO1_CLKCTRL	AM4_CLKCTRL_INDEX(0x368)
-
-/* mpu clocks */
-#define AM4_MPU_CLKCTRL	AM4_CLKCTRL_INDEX(0x20)
-
-/* gfx_l3 clocks */
-#define AM4_GFX_CLKCTRL	AM4_CLKCTRL_INDEX(0x20)
-
-/* l4_rtc clocks */
-#define AM4_RTC_CLKCTRL	AM4_CLKCTRL_INDEX(0x20)
-
-/* l4_per clocks */
-#define AM4_L3_MAIN_CLKCTRL	AM4_CLKCTRL_INDEX(0x20)
-#define AM4_AES_CLKCTRL	AM4_CLKCTRL_INDEX(0x28)
-#define AM4_DES_CLKCTRL	AM4_CLKCTRL_INDEX(0x30)
-#define AM4_L3_INSTR_CLKCTRL	AM4_CLKCTRL_INDEX(0x40)
-#define AM4_OCMCRAM_CLKCTRL	AM4_CLKCTRL_INDEX(0x50)
-#define AM4_SHAM_CLKCTRL	AM4_CLKCTRL_INDEX(0x58)
-#define AM4_VPFE0_CLKCTRL	AM4_CLKCTRL_INDEX(0x68)
-#define AM4_VPFE1_CLKCTRL	AM4_CLKCTRL_INDEX(0x70)
-#define AM4_TPCC_CLKCTRL	AM4_CLKCTRL_INDEX(0x78)
-#define AM4_TPTC0_CLKCTRL	AM4_CLKCTRL_INDEX(0x80)
-#define AM4_TPTC1_CLKCTRL	AM4_CLKCTRL_INDEX(0x88)
-#define AM4_TPTC2_CLKCTRL	AM4_CLKCTRL_INDEX(0x90)
-#define AM4_L4_HS_CLKCTRL	AM4_CLKCTRL_INDEX(0xa0)
-#define AM4_GPMC_CLKCTRL	AM4_CLKCTRL_INDEX(0x220)
-#define AM4_MCASP0_CLKCTRL	AM4_CLKCTRL_INDEX(0x238)
-#define AM4_MCASP1_CLKCTRL	AM4_CLKCTRL_INDEX(0x240)
-#define AM4_MMC3_CLKCTRL	AM4_CLKCTRL_INDEX(0x248)
-#define AM4_QSPI_CLKCTRL	AM4_CLKCTRL_INDEX(0x258)
-#define AM4_USB_OTG_SS0_CLKCTRL	AM4_CLKCTRL_INDEX(0x260)
-#define AM4_USB_OTG_SS1_CLKCTRL	AM4_CLKCTRL_INDEX(0x268)
-#define AM4_PRUSS_CLKCTRL	AM4_CLKCTRL_INDEX(0x320)
-#define AM4_L4_LS_CLKCTRL	AM4_CLKCTRL_INDEX(0x420)
-#define AM4_D_CAN0_CLKCTRL	AM4_CLKCTRL_INDEX(0x428)
-#define AM4_D_CAN1_CLKCTRL	AM4_CLKCTRL_INDEX(0x430)
-#define AM4_EPWMSS0_CLKCTRL	AM4_CLKCTRL_INDEX(0x438)
-#define AM4_EPWMSS1_CLKCTRL	AM4_CLKCTRL_INDEX(0x440)
-#define AM4_EPWMSS2_CLKCTRL	AM4_CLKCTRL_INDEX(0x448)
-#define AM4_EPWMSS3_CLKCTRL	AM4_CLKCTRL_INDEX(0x450)
-#define AM4_EPWMSS4_CLKCTRL	AM4_CLKCTRL_INDEX(0x458)
-#define AM4_EPWMSS5_CLKCTRL	AM4_CLKCTRL_INDEX(0x460)
-#define AM4_ELM_CLKCTRL	AM4_CLKCTRL_INDEX(0x468)
-#define AM4_GPIO2_CLKCTRL	AM4_CLKCTRL_INDEX(0x478)
-#define AM4_GPIO3_CLKCTRL	AM4_CLKCTRL_INDEX(0x480)
-#define AM4_GPIO4_CLKCTRL	AM4_CLKCTRL_INDEX(0x488)
-#define AM4_GPIO5_CLKCTRL	AM4_CLKCTRL_INDEX(0x490)
-#define AM4_GPIO6_CLKCTRL	AM4_CLKCTRL_INDEX(0x498)
-#define AM4_HDQ1W_CLKCTRL	AM4_CLKCTRL_INDEX(0x4a0)
-#define AM4_I2C2_CLKCTRL	AM4_CLKCTRL_INDEX(0x4a8)
-#define AM4_I2C3_CLKCTRL	AM4_CLKCTRL_INDEX(0x4b0)
-#define AM4_MAILBOX_CLKCTRL	AM4_CLKCTRL_INDEX(0x4b8)
-#define AM4_MMC1_CLKCTRL	AM4_CLKCTRL_INDEX(0x4c0)
-#define AM4_MMC2_CLKCTRL	AM4_CLKCTRL_INDEX(0x4c8)
-#define AM4_RNG_CLKCTRL	AM4_CLKCTRL_INDEX(0x4e0)
-#define AM4_SPI0_CLKCTRL	AM4_CLKCTRL_INDEX(0x500)
-#define AM4_SPI1_CLKCTRL	AM4_CLKCTRL_INDEX(0x508)
-#define AM4_SPI2_CLKCTRL	AM4_CLKCTRL_INDEX(0x510)
-#define AM4_SPI3_CLKCTRL	AM4_CLKCTRL_INDEX(0x518)
-#define AM4_SPI4_CLKCTRL	AM4_CLKCTRL_INDEX(0x520)
-#define AM4_SPINLOCK_CLKCTRL	AM4_CLKCTRL_INDEX(0x528)
-#define AM4_TIMER2_CLKCTRL	AM4_CLKCTRL_INDEX(0x530)
-#define AM4_TIMER3_CLKCTRL	AM4_CLKCTRL_INDEX(0x538)
-#define AM4_TIMER4_CLKCTRL	AM4_CLKCTRL_INDEX(0x540)
-#define AM4_TIMER5_CLKCTRL	AM4_CLKCTRL_INDEX(0x548)
-#define AM4_TIMER6_CLKCTRL	AM4_CLKCTRL_INDEX(0x550)
-#define AM4_TIMER7_CLKCTRL	AM4_CLKCTRL_INDEX(0x558)
-#define AM4_TIMER8_CLKCTRL	AM4_CLKCTRL_INDEX(0x560)
-#define AM4_TIMER9_CLKCTRL	AM4_CLKCTRL_INDEX(0x568)
-#define AM4_TIMER10_CLKCTRL	AM4_CLKCTRL_INDEX(0x570)
-#define AM4_TIMER11_CLKCTRL	AM4_CLKCTRL_INDEX(0x578)
-#define AM4_UART2_CLKCTRL	AM4_CLKCTRL_INDEX(0x580)
-#define AM4_UART3_CLKCTRL	AM4_CLKCTRL_INDEX(0x588)
-#define AM4_UART4_CLKCTRL	AM4_CLKCTRL_INDEX(0x590)
-#define AM4_UART5_CLKCTRL	AM4_CLKCTRL_INDEX(0x598)
-#define AM4_UART6_CLKCTRL	AM4_CLKCTRL_INDEX(0x5a0)
-#define AM4_OCP2SCP0_CLKCTRL	AM4_CLKCTRL_INDEX(0x5b8)
-#define AM4_OCP2SCP1_CLKCTRL	AM4_CLKCTRL_INDEX(0x5c0)
-#define AM4_EMIF_CLKCTRL	AM4_CLKCTRL_INDEX(0x720)
-#define AM4_DSS_CORE_CLKCTRL	AM4_CLKCTRL_INDEX(0xa20)
-#define AM4_CPGMAC0_CLKCTRL	AM4_CLKCTRL_INDEX(0xb20)
-
-/* XXX: Compatibility part end. */
-
 /* l3s_tsc clocks */
 #define AM4_L3S_TSC_CLKCTRL_OFFSET	0x120
 #define AM4_L3S_TSC_CLKCTRL_INDEX(offset)	((offset) - AM4_L3S_TSC_CLKCTRL_OFFSET)
-- 
2.35.1
