Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90652F7599
	for <lists+linux-omap@lfdr.de>; Fri, 15 Jan 2021 10:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbhAOJhx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Jan 2021 04:37:53 -0500
Received: from muru.com ([72.249.23.125]:44976 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728906AbhAOJhw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Jan 2021 04:37:52 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DCFEE805C;
        Fri, 15 Jan 2021 09:37:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCHv2] ARM: OMAP2+: Fix booting for am335x after moving to simple-pm-bus
Date:   Fri, 15 Jan 2021 11:37:15 +0200
Message-Id: <20210115093715.62228-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We now depend on SIMPLE_PM_BUS for probing devices. While we have it
selected in omap2plus_defconfig, custom configs can fail if it's missing.

As SIMPLE_PM_BUS depends on OF and PM, we must now select PM in Kconfig.
We have already OF selected by ARCH_MULTIPLATFORM.

Let's also drop the earlier PM dependency entries as suggested by
Geert Uytterhoeven <geert@linux-m68k.org>.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Fixes: 5a230524f879 ("ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/Kconfig | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -13,10 +13,9 @@ config ARCH_OMAP3
 	bool "TI OMAP3"
 	depends on ARCH_MULTI_V7
 	select ARCH_OMAP2PLUS
-	select ARM_CPU_SUSPEND if PM
+	select ARM_CPU_SUSPEND
 	select OMAP_INTERCONNECT
-	select PM_OPP if PM
-	select PM if CPU_IDLE
+	select PM_OPP
 	select SOC_HAS_OMAP2_SDRC
 	select ARM_ERRATA_430973
 
@@ -25,7 +24,7 @@ config ARCH_OMAP4
 	depends on ARCH_MULTI_V7
 	select ARCH_OMAP2PLUS
 	select ARCH_NEEDS_CPU_IDLE_COUPLED if SMP
-	select ARM_CPU_SUSPEND if PM
+	select ARM_CPU_SUSPEND
 	select ARM_ERRATA_720789
 	select ARM_GIC
 	select HAVE_ARM_SCU if SMP
@@ -34,7 +33,7 @@ config ARCH_OMAP4
 	select OMAP_INTERCONNECT_BARRIER
 	select PL310_ERRATA_588369 if CACHE_L2X0
 	select PL310_ERRATA_727915 if CACHE_L2X0
-	select PM_OPP if PM
+	select PM_OPP
 	select PM if CPU_IDLE
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_775420
@@ -44,21 +43,21 @@ config SOC_OMAP5
 	bool "TI OMAP5"
 	depends on ARCH_MULTI_V7
 	select ARCH_OMAP2PLUS
-	select ARM_CPU_SUSPEND if PM
+	select ARM_CPU_SUSPEND
 	select ARM_GIC
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_ARCH_TIMER
 	select ARM_ERRATA_798181 if SMP
 	select OMAP_INTERCONNECT
 	select OMAP_INTERCONNECT_BARRIER
-	select PM_OPP if PM
+	select PM_OPP
 	select ZONE_DMA if ARM_LPAE
 
 config SOC_AM33XX
 	bool "TI AM33XX"
 	depends on ARCH_MULTI_V7
 	select ARCH_OMAP2PLUS
-	select ARM_CPU_SUSPEND if PM
+	select ARM_CPU_SUSPEND
 
 config SOC_AM43XX
 	bool "TI AM43x"
@@ -72,13 +71,13 @@ config SOC_AM43XX
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_775420
 	select OMAP_INTERCONNECT
-	select ARM_CPU_SUSPEND if PM
+	select ARM_CPU_SUSPEND
 
 config SOC_DRA7XX
 	bool "TI DRA7XX"
 	depends on ARCH_MULTI_V7
 	select ARCH_OMAP2PLUS
-	select ARM_CPU_SUSPEND if PM
+	select ARM_CPU_SUSPEND
 	select ARM_GIC
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_ARCH_TIMER
@@ -86,7 +85,7 @@ config SOC_DRA7XX
 	select ARM_ERRATA_798181 if SMP
 	select OMAP_INTERCONNECT
 	select OMAP_INTERCONNECT_BARRIER
-	select PM_OPP if PM
+	select PM_OPP
 	select ZONE_DMA if ARM_LPAE
 	select PINCTRL_TI_IODELAY if OF && PINCTRL
 
@@ -105,9 +104,11 @@ config ARCH_OMAP2PLUS
 	select OMAP_DM_TIMER
 	select OMAP_GPMC
 	select PINCTRL
-	select PM_GENERIC_DOMAINS if PM
-	select PM_GENERIC_DOMAINS_OF if PM
+	select PM
+	select PM_GENERIC_DOMAINS
+	select PM_GENERIC_DOMAINS_OF
 	select RESET_CONTROLLER
+	select SIMPLE_PM_BUS
 	select SOC_BUS
 	select TI_SYSC
 	select OMAP_IRQCHIP
@@ -133,7 +134,6 @@ config ARCH_OMAP2PLUS_TYPICAL
 	select I2C_OMAP
 	select MENELAUS if ARCH_OMAP2
 	select NEON if CPU_V7
-	select PM
 	select REGULATOR
 	select REGULATOR_FIXED_VOLTAGE
 	select TWL4030_CORE if ARCH_OMAP3 || ARCH_OMAP4
-- 
2.30.0
