Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032A1303E16
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 14:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391993AbhAZMyr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 07:54:47 -0500
Received: from muru.com ([72.249.23.125]:53484 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403985AbhAZMuZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 Jan 2021 07:50:25 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D6BB381A3;
        Tue, 26 Jan 2021 12:49:48 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 02/12] ARM: OMAP2+: Drop legacy platform data for dra7 qspi
Date:   Tue, 26 Jan 2021 14:49:27 +0200
Message-Id: <20210126124937.52994-3-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126124937.52994-1-tony@atomide.com>
References: <20210126124937.52994-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts data.
Let's drop the related platform data and custom ti,hwmods dts property.

As we're just dropping data, and the early platform data init is based on
the custom ti,hwmods property, we want to drop both the platform data and
ti,hwmods property in a single patch.

Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7.dtsi               |  1 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 43 -----------------------
 2 files changed, 44 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -770,7 +770,6 @@ abb_gpu: regulator-abb-gpu {
 
 		target-module@4b300000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "qspi";
 			reg = <0x4b300000 0x4>,
 			      <0x4b300010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -266,40 +266,6 @@ static struct omap_hwmod dra7xx_mpu_hwmod = {
 	},
 };
 
-/*
- * 'qspi' class
- *
- */
-
-static struct omap_hwmod_class_sysconfig dra7xx_qspi_sysc = {
-	.rev_offs	= 0,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE,
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class dra7xx_qspi_hwmod_class = {
-	.name	= "qspi",
-	.sysc	= &dra7xx_qspi_sysc,
-};
-
-/* qspi */
-static struct omap_hwmod dra7xx_qspi_hwmod = {
-	.name		= "qspi",
-	.class		= &dra7xx_qspi_hwmod_class,
-	.clkdm_name	= "l4per2_clkdm",
-	.main_clk	= "qspi_gfclk_div",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER2_QSPI_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER2_QSPI_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /*
  * 'sata' class
  *
@@ -501,14 +467,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_cfg__mpu = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_1 -> qspi */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__qspi = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_qspi_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> sata */
 static struct omap_hwmod_ocp_if dra7xx_l4_cfg__sata = {
 	.master		= &dra7xx_l4_cfg_hwmod,
@@ -565,7 +523,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l3_main_1__bb2d,
 	&dra7xx_l4_wkup__ctrl_module_wkup,
 	&dra7xx_l4_cfg__mpu,
-	&dra7xx_l3_main_1__qspi,
 	&dra7xx_l4_cfg__sata,
 	&dra7xx_l3_main_1__vcp1,
 	&dra7xx_l4_per2__vcp1,
-- 
2.30.0
