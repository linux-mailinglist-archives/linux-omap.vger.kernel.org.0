Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF994A80B2
	for <lists+linux-omap@lfdr.de>; Thu,  3 Feb 2022 09:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349646AbiBCI4f (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Feb 2022 03:56:35 -0500
Received: from muru.com ([72.249.23.125]:45854 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349628AbiBCI4d (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Feb 2022 03:56:33 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 050708150;
        Thu,  3 Feb 2022 08:56:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/3] clk: ti: Drop legacy compatibility clocks for am3
Date:   Thu,  3 Feb 2022 10:56:16 +0200
Message-Id: <20220203085618.16043-2-tony@atomide.com>
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
 drivers/clk/ti/clk-33xx-compat.c | 218 -------------------------------
 drivers/clk/ti/clk-33xx.c        |   5 +-
 drivers/clk/ti/clkctrl.c         |   8 +-
 include/dt-bindings/clock/am3.h  |  93 -------------
 5 files changed, 4 insertions(+), 323 deletions(-)
 delete mode 100644 drivers/clk/ti/clk-33xx-compat.c

diff --git a/drivers/clk/ti/Makefile b/drivers/clk/ti/Makefile
--- a/drivers/clk/ti/Makefile
+++ b/drivers/clk/ti/Makefile
@@ -6,8 +6,7 @@ clk-common				= dpll.o composite.o divider.o gate.o \
 					  fixed-factor.o mux.o apll.o \
 					  clkt_dpll.o clkt_iclk.o clkt_dflt.o \
 					  clkctrl.o
-obj-$(CONFIG_SOC_AM33XX)		+= $(clk-common) clk-33xx.o dpll3xxx.o \
-					  clk-33xx-compat.o
+obj-$(CONFIG_SOC_AM33XX)		+= $(clk-common) clk-33xx.o dpll3xxx.o
 obj-$(CONFIG_SOC_TI81XX)		+= $(clk-common) fapll.o clk-814x.o clk-816x.o
 obj-$(CONFIG_ARCH_OMAP2)		+= $(clk-common) interface.o clk-2xxx.o
 obj-$(CONFIG_ARCH_OMAP3)		+= $(clk-common) interface.o \
diff --git a/drivers/clk/ti/clk-33xx-compat.c b/drivers/clk/ti/clk-33xx-compat.c
deleted file mode 100644
--- a/drivers/clk/ti/clk-33xx-compat.c
+++ /dev/null
@@ -1,218 +0,0 @@
-/*
- * AM33XX Clock init
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
-#include <dt-bindings/clock/am3.h>
-
-#include "clock.h"
-
-static const char * const am3_gpio1_dbclk_parents[] __initconst = {
-	"l4_per_cm:clk:0138:0",
-	NULL,
-};
-
-static const struct omap_clkctrl_bit_data am3_gpio2_bit_data[] __initconst = {
-	{ 18, TI_CLK_GATE, am3_gpio1_dbclk_parents, NULL },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_bit_data am3_gpio3_bit_data[] __initconst = {
-	{ 18, TI_CLK_GATE, am3_gpio1_dbclk_parents, NULL },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_bit_data am3_gpio4_bit_data[] __initconst = {
-	{ 18, TI_CLK_GATE, am3_gpio1_dbclk_parents, NULL },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_reg_data am3_l4_per_clkctrl_regs[] __initconst = {
-	{ AM3_CPGMAC0_CLKCTRL, NULL, CLKF_SW_SUP, "cpsw_125mhz_gclk", "cpsw_125mhz_clkdm" },
-	{ AM3_LCDC_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_SET_RATE_PARENT, "lcd_gclk", "lcdc_clkdm" },
-	{ AM3_USB_OTG_HS_CLKCTRL, NULL, CLKF_SW_SUP, "usbotg_fck", "l3s_clkdm" },
-	{ AM3_TPTC0_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM3_EMIF_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_ddr_m2_div2_ck", "l3_clkdm" },
-	{ AM3_OCMCRAM_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM3_GPMC_CLKCTRL, NULL, CLKF_SW_SUP, "l3s_gclk", "l3s_clkdm" },
-	{ AM3_MCASP0_CLKCTRL, NULL, CLKF_SW_SUP, "mcasp0_fck", "l3s_clkdm" },
-	{ AM3_UART6_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM3_MMC1_CLKCTRL, NULL, CLKF_SW_SUP, "mmc_clk" },
-	{ AM3_ELM_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM3_I2C3_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM3_I2C2_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM3_SPI0_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM3_SPI1_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM3_L4_LS_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM3_MCASP1_CLKCTRL, NULL, CLKF_SW_SUP, "mcasp1_fck", "l3s_clkdm" },
-	{ AM3_UART2_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM3_UART3_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM3_UART4_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM3_UART5_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_ck" },
-	{ AM3_TIMER7_CLKCTRL, NULL, CLKF_SW_SUP, "timer7_fck" },
-	{ AM3_TIMER2_CLKCTRL, NULL, CLKF_SW_SUP, "timer2_fck" },
-	{ AM3_TIMER3_CLKCTRL, NULL, CLKF_SW_SUP, "timer3_fck" },
-	{ AM3_TIMER4_CLKCTRL, NULL, CLKF_SW_SUP, "timer4_fck" },
-	{ AM3_RNG_CLKCTRL, NULL, CLKF_SW_SUP, "rng_fck" },
-	{ AM3_AES_CLKCTRL, NULL, CLKF_SW_SUP, "aes0_fck", "l3_clkdm" },
-	{ AM3_SHAM_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM3_GPIO2_CLKCTRL, am3_gpio2_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM3_GPIO3_CLKCTRL, am3_gpio3_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM3_GPIO4_CLKCTRL, am3_gpio4_bit_data, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM3_TPCC_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM3_D_CAN0_CLKCTRL, NULL, CLKF_SW_SUP, "dcan0_fck" },
-	{ AM3_D_CAN1_CLKCTRL, NULL, CLKF_SW_SUP, "dcan1_fck" },
-	{ AM3_EPWMSS1_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM3_EPWMSS0_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM3_EPWMSS2_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM3_L3_INSTR_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM3_L3_MAIN_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM3_PRUSS_CLKCTRL, NULL, CLKF_SW_SUP, "pruss_ocp_gclk", "pruss_ocp_clkdm" },
-	{ AM3_TIMER5_CLKCTRL, NULL, CLKF_SW_SUP, "timer5_fck" },
-	{ AM3_TIMER6_CLKCTRL, NULL, CLKF_SW_SUP, "timer6_fck" },
-	{ AM3_MMC2_CLKCTRL, NULL, CLKF_SW_SUP, "mmc_clk" },
-	{ AM3_MMC3_CLKCTRL, NULL, CLKF_SW_SUP, "mmc_clk", "l3s_clkdm" },
-	{ AM3_TPTC1_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM3_TPTC2_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
-	{ AM3_SPINLOCK_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM3_MAILBOX_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM3_L4_HS_CLKCTRL, NULL, CLKF_SW_SUP, "l4hs_gclk", "l4hs_clkdm" },
-	{ AM3_OCPWP_CLKCTRL, NULL, CLKF_SW_SUP, "l4ls_gclk" },
-	{ AM3_CLKDIV32K_CLKCTRL, NULL, CLKF_SW_SUP, "clkdiv32k_ck", "clk_24mhz_clkdm" },
-	{ 0 },
-};
-
-static const char * const am3_gpio0_dbclk_parents[] __initconst = {
-	"gpio0_dbclk_mux_ck",
-	NULL,
-};
-
-static const struct omap_clkctrl_bit_data am3_gpio1_bit_data[] __initconst = {
-	{ 18, TI_CLK_GATE, am3_gpio0_dbclk_parents, NULL },
-	{ 0 },
-};
-
-static const char * const am3_dbg_sysclk_ck_parents[] __initconst = {
-	"sys_clkin_ck",
-	NULL,
-};
-
-static const char * const am3_trace_pmd_clk_mux_ck_parents[] __initconst = {
-	"l4_wkup_cm:clk:0010:19",
-	"l4_wkup_cm:clk:0010:30",
-	NULL,
-};
-
-static const char * const am3_trace_clk_div_ck_parents[] __initconst = {
-	"l4_wkup_cm:clk:0010:20",
-	NULL,
-};
-
-static const struct omap_clkctrl_div_data am3_trace_clk_div_ck_data __initconst = {
-	.max_div = 64,
-	.flags = CLK_DIVIDER_POWER_OF_TWO,
-};
-
-static const char * const am3_stm_clk_div_ck_parents[] __initconst = {
-	"l4_wkup_cm:clk:0010:22",
-	NULL,
-};
-
-static const struct omap_clkctrl_div_data am3_stm_clk_div_ck_data __initconst = {
-	.max_div = 64,
-	.flags = CLK_DIVIDER_POWER_OF_TWO,
-};
-
-static const char * const am3_dbg_clka_ck_parents[] __initconst = {
-	"dpll_core_m4_ck",
-	NULL,
-};
-
-static const struct omap_clkctrl_bit_data am3_debugss_bit_data[] __initconst = {
-	{ 19, TI_CLK_GATE, am3_dbg_sysclk_ck_parents, NULL },
-	{ 20, TI_CLK_MUX, am3_trace_pmd_clk_mux_ck_parents, NULL },
-	{ 22, TI_CLK_MUX, am3_trace_pmd_clk_mux_ck_parents, NULL },
-	{ 24, TI_CLK_DIVIDER, am3_trace_clk_div_ck_parents, &am3_trace_clk_div_ck_data },
-	{ 27, TI_CLK_DIVIDER, am3_stm_clk_div_ck_parents, &am3_stm_clk_div_ck_data },
-	{ 30, TI_CLK_GATE, am3_dbg_clka_ck_parents, NULL },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_reg_data am3_l4_wkup_clkctrl_regs[] __initconst = {
-	{ AM3_CONTROL_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
-	{ AM3_GPIO1_CLKCTRL, am3_gpio1_bit_data, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
-	{ AM3_L4_WKUP_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_core_m4_div2_ck" },
-	{ AM3_DEBUGSS_CLKCTRL, am3_debugss_bit_data, CLKF_SW_SUP, "l4_wkup_cm:clk:0010:24", "l3_aon_clkdm" },
-	{ AM3_WKUP_M3_CLKCTRL, NULL, CLKF_NO_IDLEST, "dpll_core_m4_div2_ck", "l4_wkup_aon_clkdm" },
-	{ AM3_UART1_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_wkupdm_ck" },
-	{ AM3_I2C1_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_per_m2_div4_wkupdm_ck" },
-	{ AM3_ADC_TSC_CLKCTRL, NULL, CLKF_SW_SUP, "adc_tsc_fck" },
-	{ AM3_SMARTREFLEX0_CLKCTRL, NULL, CLKF_SW_SUP, "smartreflex0_fck" },
-	{ AM3_TIMER1_CLKCTRL, NULL, CLKF_SW_SUP, "timer1_fck" },
-	{ AM3_SMARTREFLEX1_CLKCTRL, NULL, CLKF_SW_SUP, "smartreflex1_fck" },
-	{ AM3_WD_TIMER2_CLKCTRL, NULL, CLKF_SW_SUP, "wdt1_fck" },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_reg_data am3_mpu_clkctrl_regs[] __initconst = {
-	{ AM3_MPU_CLKCTRL, NULL, CLKF_SW_SUP, "dpll_mpu_m2_ck" },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_reg_data am3_l4_rtc_clkctrl_regs[] __initconst = {
-	{ AM3_RTC_CLKCTRL, NULL, CLKF_SW_SUP, "clk_32768_ck" },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_reg_data am3_gfx_l3_clkctrl_regs[] __initconst = {
-	{ AM3_GFX_CLKCTRL, NULL, CLKF_SW_SUP, "gfx_fck_div_ck" },
-	{ 0 },
-};
-
-static const struct omap_clkctrl_reg_data am3_l4_cefuse_clkctrl_regs[] __initconst = {
-	{ AM3_CEFUSE_CLKCTRL, NULL, CLKF_SW_SUP, "sys_clkin_ck" },
-	{ 0 },
-};
-
-const struct omap_clkctrl_data am3_clkctrl_compat_data[] __initconst = {
-	{ 0x44e00014, am3_l4_per_clkctrl_regs },
-	{ 0x44e00404, am3_l4_wkup_clkctrl_regs },
-	{ 0x44e00604, am3_mpu_clkctrl_regs },
-	{ 0x44e00800, am3_l4_rtc_clkctrl_regs },
-	{ 0x44e00904, am3_gfx_l3_clkctrl_regs },
-	{ 0x44e00a20, am3_l4_cefuse_clkctrl_regs },
-	{ 0 },
-};
-
-struct ti_dt_clk am33xx_compat_clks[] = {
-	DT_CLK(NULL, "timer_32k_ck", "l4_per_cm:0138:0"),
-	DT_CLK(NULL, "timer_sys_ck", "sys_clkin_ck"),
-	DT_CLK(NULL, "clkdiv32k_ick", "l4_per_cm:0138:0"),
-	DT_CLK(NULL, "dbg_clka_ck", "l4_wkup_cm:0010:30"),
-	DT_CLK(NULL, "dbg_sysclk_ck", "l4_wkup_cm:0010:19"),
-	DT_CLK(NULL, "gpio0_dbclk", "l4_wkup_cm:0004:18"),
-	DT_CLK(NULL, "gpio1_dbclk", "l4_per_cm:0098:18"),
-	DT_CLK(NULL, "gpio2_dbclk", "l4_per_cm:009c:18"),
-	DT_CLK(NULL, "gpio3_dbclk", "l4_per_cm:00a0:18"),
-	DT_CLK(NULL, "stm_clk_div_ck", "l4_wkup_cm:0010:27"),
-	DT_CLK(NULL, "stm_pmd_clock_mux_ck", "l4_wkup_cm:0010:22"),
-	DT_CLK(NULL, "trace_clk_div_ck", "l4_wkup_cm:0010:24"),
-	DT_CLK(NULL, "trace_pmd_clk_mux_ck", "l4_wkup_cm:0010:20"),
-	{ .node_name = NULL },
-};
diff --git a/drivers/clk/ti/clk-33xx.c b/drivers/clk/ti/clk-33xx.c
--- a/drivers/clk/ti/clk-33xx.c
+++ b/drivers/clk/ti/clk-33xx.c
@@ -279,10 +279,7 @@ int __init am33xx_dt_clk_init(void)
 {
 	struct clk *clk1, *clk2;
 
-	if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT)
-		ti_dt_clocks_register(am33xx_compat_clks);
-	else
-		ti_dt_clocks_register(am33xx_clks);
+	ti_dt_clocks_register(am33xx_clks);
 
 	omap2_clk_disable_autoidle_all();
 
diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -542,12 +542,8 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 		soc_mask = CLKF_SOC_DRA76;
 #endif
 #ifdef CONFIG_SOC_AM33XX
-	if (of_machine_is_compatible("ti,am33xx")) {
-		if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT)
-			data = am3_clkctrl_compat_data;
-		else
-			data = am3_clkctrl_data;
-	}
+	if (of_machine_is_compatible("ti,am33xx"))
+		data = am3_clkctrl_data;
 #endif
 #ifdef CONFIG_SOC_AM43XX
 	if (of_machine_is_compatible("ti,am4372")) {
diff --git a/include/dt-bindings/clock/am3.h b/include/dt-bindings/clock/am3.h
--- a/include/dt-bindings/clock/am3.h
+++ b/include/dt-bindings/clock/am3.h
@@ -8,99 +8,6 @@
 #define AM3_CLKCTRL_OFFSET	0x0
 #define AM3_CLKCTRL_INDEX(offset)	((offset) - AM3_CLKCTRL_OFFSET)
 
-/* XXX: Compatibility part begin, remove this once compatibility support is no longer needed */
-
-/* l4_per clocks */
-#define AM3_L4_PER_CLKCTRL_OFFSET	0x14
-#define AM3_L4_PER_CLKCTRL_INDEX(offset)	((offset) - AM3_L4_PER_CLKCTRL_OFFSET)
-#define AM3_CPGMAC0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x14)
-#define AM3_LCDC_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x18)
-#define AM3_USB_OTG_HS_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x1c)
-#define AM3_TPTC0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x24)
-#define AM3_EMIF_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x28)
-#define AM3_OCMCRAM_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x2c)
-#define AM3_GPMC_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x30)
-#define AM3_MCASP0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x34)
-#define AM3_UART6_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x38)
-#define AM3_MMC1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x3c)
-#define AM3_ELM_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x40)
-#define AM3_I2C3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x44)
-#define AM3_I2C2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x48)
-#define AM3_SPI0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x4c)
-#define AM3_SPI1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x50)
-#define AM3_L4_LS_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x60)
-#define AM3_MCASP1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x68)
-#define AM3_UART2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x6c)
-#define AM3_UART3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x70)
-#define AM3_UART4_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x74)
-#define AM3_UART5_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x78)
-#define AM3_TIMER7_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x7c)
-#define AM3_TIMER2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x80)
-#define AM3_TIMER3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x84)
-#define AM3_TIMER4_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x88)
-#define AM3_RNG_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x90)
-#define AM3_AES_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x94)
-#define AM3_SHAM_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xa0)
-#define AM3_GPIO2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xac)
-#define AM3_GPIO3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb0)
-#define AM3_GPIO4_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xb4)
-#define AM3_TPCC_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xbc)
-#define AM3_D_CAN0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xc0)
-#define AM3_D_CAN1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xc4)
-#define AM3_EPWMSS1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xcc)
-#define AM3_EPWMSS0_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xd4)
-#define AM3_EPWMSS2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xd8)
-#define AM3_L3_INSTR_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xdc)
-#define AM3_L3_MAIN_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xe0)
-#define AM3_PRUSS_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xe8)
-#define AM3_TIMER5_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xec)
-#define AM3_TIMER6_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xf0)
-#define AM3_MMC2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xf4)
-#define AM3_MMC3_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xf8)
-#define AM3_TPTC1_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0xfc)
-#define AM3_TPTC2_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x100)
-#define AM3_SPINLOCK_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x10c)
-#define AM3_MAILBOX_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x110)
-#define AM3_L4_HS_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x120)
-#define AM3_OCPWP_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x130)
-#define AM3_CLKDIV32K_CLKCTRL	AM3_L4_PER_CLKCTRL_INDEX(0x14c)
-
-/* l4_wkup clocks */
-#define AM3_L4_WKUP_CLKCTRL_OFFSET	0x4
-#define AM3_L4_WKUP_CLKCTRL_INDEX(offset)	((offset) - AM3_L4_WKUP_CLKCTRL_OFFSET)
-#define AM3_CONTROL_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x4)
-#define AM3_GPIO1_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x8)
-#define AM3_L4_WKUP_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xc)
-#define AM3_DEBUGSS_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0x14)
-#define AM3_WKUP_M3_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xb0)
-#define AM3_UART1_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xb4)
-#define AM3_I2C1_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xb8)
-#define AM3_ADC_TSC_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xbc)
-#define AM3_SMARTREFLEX0_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xc0)
-#define AM3_TIMER1_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xc4)
-#define AM3_SMARTREFLEX1_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xc8)
-#define AM3_WD_TIMER2_CLKCTRL	AM3_L4_WKUP_CLKCTRL_INDEX(0xd4)
-
-/* mpu clocks */
-#define AM3_MPU_CLKCTRL_OFFSET	0x4
-#define AM3_MPU_CLKCTRL_INDEX(offset)	((offset) - AM3_MPU_CLKCTRL_OFFSET)
-#define AM3_MPU_CLKCTRL	AM3_MPU_CLKCTRL_INDEX(0x4)
-
-/* l4_rtc clocks */
-#define AM3_RTC_CLKCTRL	AM3_CLKCTRL_INDEX(0x0)
-
-/* gfx_l3 clocks */
-#define AM3_GFX_L3_CLKCTRL_OFFSET	0x4
-#define AM3_GFX_L3_CLKCTRL_INDEX(offset)	((offset) - AM3_GFX_L3_CLKCTRL_OFFSET)
-#define AM3_GFX_CLKCTRL	AM3_GFX_L3_CLKCTRL_INDEX(0x4)
-
-/* l4_cefuse clocks */
-#define AM3_L4_CEFUSE_CLKCTRL_OFFSET	0x20
-#define AM3_L4_CEFUSE_CLKCTRL_INDEX(offset)	((offset) - AM3_L4_CEFUSE_CLKCTRL_OFFSET)
-#define AM3_CEFUSE_CLKCTRL	AM3_L4_CEFUSE_CLKCTRL_INDEX(0x20)
-
-/* XXX: Compatibility part end */
-
 /* l4ls clocks */
 #define AM3_L4LS_CLKCTRL_OFFSET	0x38
 #define AM3_L4LS_CLKCTRL_INDEX(offset)	((offset) - AM3_L4LS_CLKCTRL_OFFSET)
-- 
2.35.1
