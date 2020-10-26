Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9609B298C07
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773545AbgJZLXL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:23:11 -0400
Received: from muru.com ([72.249.23.125]:46748 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1773555AbgJZLXK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:23:10 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8F83F80AA;
        Mon, 26 Oct 2020 11:23:13 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 18/18] ARM: OMAP2+: Build hwmod related code as needed
Date:   Mon, 26 Oct 2020 13:22:22 +0200
Message-Id: <20201026112222.56894-19-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026112222.56894-1-tony@atomide.com>
References: <20201026112222.56894-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If we have only am3 selected, there's no need to build the
hwmod related code as we are probing devices with device tree
data.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/Kconfig        |  9 +++++++++
 arch/arm/mach-omap2/Makefile       | 13 ++++++-------
 arch/arm/mach-omap2/pdata-quirks.c | 12 +++++++-----
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -2,11 +2,15 @@
 menu "TI OMAP/AM/DM/DRA Family"
 	depends on ARCH_MULTI_V6 || ARCH_MULTI_V7
 
+config OMAP_HWMOD
+	bool
+
 config ARCH_OMAP2
 	bool "TI OMAP2"
 	depends on ARCH_MULTI_V6
 	select ARCH_OMAP2PLUS
 	select CPU_V6
+	select OMAP_HWMOD
 	select SOC_HAS_OMAP2_SDRC
 
 config ARCH_OMAP3
@@ -14,6 +18,7 @@ config ARCH_OMAP3
 	depends on ARCH_MULTI_V7
 	select ARCH_OMAP2PLUS
 	select ARM_CPU_SUSPEND if PM
+	select OMAP_HWMOD
 	select OMAP_INTERCONNECT
 	select PM_OPP if PM
 	select PM if CPU_IDLE
@@ -30,6 +35,7 @@ config ARCH_OMAP4
 	select ARM_GIC
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
+	select OMAP_HWMOD
 	select OMAP_INTERCONNECT
 	select OMAP_INTERCONNECT_BARRIER
 	select PL310_ERRATA_588369 if CACHE_L2X0
@@ -49,6 +55,7 @@ config SOC_OMAP5
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_ARCH_TIMER
 	select ARM_ERRATA_798181 if SMP
+	select OMAP_HWMOD
 	select OMAP_INTERCONNECT
 	select OMAP_INTERCONNECT_BARRIER
 	select PM_OPP if PM
@@ -71,6 +78,7 @@ config SOC_AM43XX
 	select HAVE_ARM_TWD
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_775420
+	select OMAP_HWMOD
 	select OMAP_INTERCONNECT
 	select ARM_CPU_SUSPEND if PM
 
@@ -84,6 +92,7 @@ config SOC_DRA7XX
 	select HAVE_ARM_ARCH_TIMER
 	select IRQ_CROSSBAR
 	select ARM_ERRATA_798181 if SMP
+	select OMAP_HWMOD
 	select OMAP_INTERCONNECT
 	select OMAP_INTERCONNECT_BARRIER
 	select PM_OPP if PM
diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile
@@ -8,18 +8,20 @@ ccflags-y := -I$(srctree)/$(src)/include \
 
 # Common support
 obj-y := id.o io.o control.o devices.o fb.o pm.o \
-	 common.o dma.o wd_timer.o display.o i2c.o hdq1w.o omap_hwmod.o \
-	 omap_device.o omap-headsmp.o sram.o
+	 common.o dma.o omap-headsmp.o sram.o
 
 hwmod-common				= omap_hwmod.o omap_hwmod_reset.o \
-					  omap_hwmod_common_data.o
+					  omap_hwmod_common_data.o \
+					  omap_hwmod_common_ipblock_data.o \
+					  omap_device.o display.o hdq1w.o \
+					  i2c.o wd_timer.o
 clock-common				= clock.o
 secure-common				= omap-smc.o omap-secure.o
 
 obj-$(CONFIG_ARCH_OMAP2) += $(omap-2-3-common) $(hwmod-common)
 obj-$(CONFIG_ARCH_OMAP3) += $(omap-2-3-common) $(hwmod-common) $(secure-common)
 obj-$(CONFIG_ARCH_OMAP4) += $(hwmod-common) $(secure-common)
-obj-$(CONFIG_SOC_AM33XX) += $(hwmod-common) $(secure-common)
+obj-$(CONFIG_SOC_AM33XX) += $(secure-common)
 obj-$(CONFIG_SOC_OMAP5)  += $(hwmod-common) $(secure-common)
 obj-$(CONFIG_SOC_AM43XX) += $(hwmod-common) $(secure-common)
 obj-$(CONFIG_SOC_DRA7XX) += $(hwmod-common) $(secure-common)
@@ -194,7 +196,6 @@ obj-$(CONFIG_SOC_OMAP2420)		+= opp2420_data.o
 obj-$(CONFIG_SOC_OMAP2430)		+= opp2430_data.o
 
 # hwmod data
-obj-y					+= omap_hwmod_common_ipblock_data.o
 obj-$(CONFIG_SOC_OMAP2420)		+= omap_hwmod_2xxx_ipblock_data.o
 obj-$(CONFIG_SOC_OMAP2420)		+= omap_hwmod_2xxx_3xxx_ipblock_data.o
 obj-$(CONFIG_SOC_OMAP2420)		+= omap_hwmod_2xxx_interconnect_data.o
@@ -205,8 +206,6 @@ obj-$(CONFIG_SOC_OMAP2430)		+= omap_hwmod_2xxx_interconnect_data.o
 obj-$(CONFIG_SOC_OMAP2430)		+= omap_hwmod_2430_data.o
 obj-$(CONFIG_ARCH_OMAP3)		+= omap_hwmod_2xxx_3xxx_ipblock_data.o
 obj-$(CONFIG_ARCH_OMAP3)		+= omap_hwmod_3xxx_data.o
-obj-$(CONFIG_SOC_AM33XX)		+= omap_hwmod_33xx_43xx_interconnect_data.o
-obj-$(CONFIG_SOC_AM33XX)		+= omap_hwmod_33xx_43xx_ipblock_data.o
 obj-$(CONFIG_SOC_AM43XX)		+= omap_hwmod_43xx_data.o
 obj-$(CONFIG_SOC_AM43XX)		+= omap_hwmod_33xx_43xx_interconnect_data.o
 obj-$(CONFIG_SOC_AM43XX)		+= omap_hwmod_33xx_43xx_ipblock_data.o
diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -94,6 +94,7 @@ static void __init hsmmc2_internal_input_clk(void)
 	omap_ctrl_writel(reg, OMAP343X_CONTROL_DEVCONF1);
 }
 
+#ifdef CONFIG_OMAP_HWMOD
 static struct iommu_platform_data omap3_iommu_pdata = {
 	.reset_name = "mmu",
 	.assert_reset = omap_device_assert_hardreset,
@@ -106,6 +107,7 @@ static struct iommu_platform_data omap3_iommu_isp_pdata = {
 	.device_enable = omap_device_enable,
 	.device_idle = omap_device_idle,
 };
+#endif
 
 static int omap3_sbc_t3730_twl_callback(struct device *dev,
 					   unsigned gpio,
@@ -272,7 +274,7 @@ static void __init omap3_pandora_legacy_init(void)
 }
 #endif /* CONFIG_ARCH_OMAP3 */
 
-#if defined(CONFIG_SOC_AM33XX) || defined(CONFIG_SOC_AM43XX)
+#if defined(CONFIG_SOC_AM43XX)
 static struct wkup_m3_platform_data wkup_m3_data = {
 	.reset_name = "wkup_m3",
 	.assert_reset = omap_device_assert_hardreset,
@@ -370,6 +372,7 @@ static void ti_sysc_clkdm_allow_idle(struct device *dev,
 		clkdm_allow_idle(cookie->clkdm);
 }
 
+#ifdef CONFIG_OMAP_HWMOD
 static int ti_sysc_enable_module(struct device *dev,
 				 const struct ti_sysc_cookie *cookie)
 {
@@ -396,6 +399,7 @@ static int ti_sysc_shutdown_module(struct device *dev,
 
 	return omap_hwmod_shutdown(cookie->data);
 }
+#endif	/* CONFIG_OMAP_HWMOD */
 
 static bool ti_sysc_soc_type_gp(void)
 {
@@ -410,10 +414,12 @@ static struct ti_sysc_platform_data ti_sysc_pdata = {
 	.init_clockdomain = ti_sysc_clkdm_init,
 	.clkdm_deny_idle = ti_sysc_clkdm_deny_idle,
 	.clkdm_allow_idle = ti_sysc_clkdm_allow_idle,
+#ifdef CONFIG_OMAP_HWMOD
 	.init_module = omap_hwmod_init_module,
 	.enable_module = ti_sysc_enable_module,
 	.idle_module = ti_sysc_idle_module,
 	.shutdown_module = ti_sysc_shutdown_module,
+#endif
 };
 
 static struct pcs_pdata pcs_pdata;
@@ -501,10 +507,6 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
 	OF_DEV_AUXDATA("ti,omap3-mcbsp", 0x49024000, "49024000.mcbsp", &mcbsp_pdata),
 #endif
 #endif
-#ifdef CONFIG_SOC_AM33XX
-	OF_DEV_AUXDATA("ti,am3352-wkup-m3", 0x44d00000, "44d00000.wkup_m3",
-		       &wkup_m3_data),
-#endif
 #ifdef CONFIG_SOC_AM43XX
 	OF_DEV_AUXDATA("ti,am4372-wkup-m3", 0x44d00000, "44d00000.wkup_m3",
 		       &wkup_m3_data),
-- 
2.29.1
