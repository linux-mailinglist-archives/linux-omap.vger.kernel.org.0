Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A245030468B
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 19:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbhAZRYR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 12:24:17 -0500
Received: from muru.com ([72.249.23.125]:53192 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390153AbhAZIbr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 Jan 2021 03:31:47 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0FED78BF8;
        Tue, 26 Jan 2021 08:28:19 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Balaji T K <balajitk@ti.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-pci@vger.kernel.org
Subject: [PATCH 27/27] ARM: OMAP2+: Drop legacy platform data for dra7 hwmod
Date:   Tue, 26 Jan 2021 10:27:16 +0200
Message-Id: <20210126082716.54358-28-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126082716.54358-1-tony@atomide.com>
References: <20210126082716.54358-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe interconnects with simple-pm-bus and genpd.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/Kconfig               |  1 -
 arch/arm/mach-omap2/Makefile              |  1 -
 arch/arm/mach-omap2/io.c                  |  2 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 64 -----------------------
 4 files changed, 68 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_7xx_data.c

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -90,7 +90,6 @@ config SOC_DRA7XX
 	select HAVE_ARM_ARCH_TIMER
 	select IRQ_CROSSBAR
 	select ARM_ERRATA_798181 if SMP
-	select OMAP_HWMOD
 	select OMAP_INTERCONNECT
 	select OMAP_INTERCONNECT_BARRIER
 	select PM_OPP
diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile
@@ -209,7 +209,6 @@ obj-$(CONFIG_ARCH_OMAP3)		+= omap_hwmod_3xxx_data.o
 obj-$(CONFIG_SOC_TI81XX)		+= omap_hwmod_81xx_data.o
 obj-$(CONFIG_ARCH_OMAP4)		+= omap_hwmod_44xx_data.o
 obj-$(CONFIG_SOC_OMAP5)			+= omap_hwmod_54xx_data.o
-obj-$(CONFIG_SOC_DRA7XX)		+= omap_hwmod_7xx_data.o
 
 # OMAP2420 MSDI controller integration support ("MMC")
 obj-$(CONFIG_SOC_OMAP2420)		+= msdi.o
diff --git a/arch/arm/mach-omap2/io.c b/arch/arm/mach-omap2/io.c
--- a/arch/arm/mach-omap2/io.c
+++ b/arch/arm/mach-omap2/io.c
@@ -667,8 +667,6 @@ void __init dra7xx_init_early(void)
 	dra7xxx_check_revision();
 	dra7xx_powerdomains_init();
 	dra7xx_clockdomains_init();
-	dra7xx_hwmod_init();
-	omap_hwmod_init_postsetup();
 	omap_clk_soc_init = dra7xx_dt_clk_init;
 	omap_secure_init();
 }
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
deleted file mode 100644
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ /dev/null
@@ -1,64 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Hardware modules present on the DRA7xx chips
- *
- * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com
- *
- * Paul Walmsley
- * Benoit Cousson
- *
- * This file is automatically generated from the OMAP hardware databases.
- * We respectfully ask that any modifications to this file be coordinated
- * with the public linux-omap@vger.kernel.org mailing list and the
- * authors above to ensure that the autogeneration scripts are kept
- * up-to-date with the file contents.
- */
-
-#include <linux/io.h>
-
-#include "omap_hwmod.h"
-#include "omap_hwmod_common_data.h"
-#include "cm1_7xx.h"
-#include "cm2_7xx.h"
-#include "prm7xx.h"
-#include "soc.h"
-
-/* Base offset for all DRA7XX interrupts external to MPUSS */
-#define DRA7XX_IRQ_GIC_START	32
-
-/*
- * Interfaces
- */
-static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
-	NULL,
-};
-
-/* SoC variant specific hwmod links */
-static struct omap_hwmod_ocp_if *dra72x_hwmod_ocp_ifs[] __initdata = {
-	NULL,
-};
-
-static struct omap_hwmod_ocp_if *rtc_hwmod_ocp_ifs[] __initdata = {
-	NULL,
-};
-
-int __init dra7xx_hwmod_init(void)
-{
-	int ret;
-
-	omap_hwmod_init();
-	ret = omap_hwmod_register_links(dra7xx_hwmod_ocp_ifs);
-
-	if (!ret && soc_is_dra74x()) {
-		ret = omap_hwmod_register_links(rtc_hwmod_ocp_ifs);
-	} else if (!ret && soc_is_dra72x()) {
-		ret = omap_hwmod_register_links(dra72x_hwmod_ocp_ifs);
-		if (!ret && !of_machine_is_compatible("ti,dra718"))
-			ret = omap_hwmod_register_links(rtc_hwmod_ocp_ifs);
-	} else if (!ret && soc_is_dra76x()) {
-		if (!ret && soc_is_dra76x_abz())
-			ret = omap_hwmod_register_links(rtc_hwmod_ocp_ifs);
-	}
-
-	return ret;
-}
-- 
2.30.0
