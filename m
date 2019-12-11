Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 353BB11BC9D
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 20:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbfLKTMa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 14:12:30 -0500
Received: from muru.com ([72.249.23.125]:45882 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfLKTMa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 14:12:30 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 87A5F81A8;
        Wed, 11 Dec 2019 19:13:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Benoit Parrot <bparrot@ti.com>, Bin Liu <b-liu@ti.com>,
        Keerthy <j-keerthy@ti.com>, Roger Quadros <rogerq@ti.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 13/13] ARM: OMAP2+: Drop legacy platform data for omap4 fdif
Date:   Wed, 11 Dec 2019 11:12:06 -0800
Message-Id: <20191211191206.12190-14-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191211191206.12190-1-tony@atomide.com>
References: <20191211191206.12190-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

As we're just dropping data, and the early platform data init
is based on the custom ti,hwmods property, we want to drop both
the platform data and ti,hwmods property in a single patch.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 62 ----------------------
 2 files changed, 63 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -715,7 +715,6 @@ target-module@8000 {			/* 0x4a108000, ap 63 62.0 */
 
 		target-module@a000 {			/* 0x4a10a000, ap 65 50.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "fdif";
 			reg = <0xa000 0x4>,
 			      <0xa010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -752,50 +752,6 @@ static struct omap_hwmod omap44xx_emif2_hwmod = {
 	},
 };
 
-/*
- * 'fdif' class
- * face detection hw accelerator module
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_fdif_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	/*
-	 * FDIF needs 100 OCP clk cycles delay after a softreset before
-	 * accessing sysconfig again.
-	 * The lowest frequency at the moment for L3 bus is 100 MHz, so
-	 * 1usec delay is needed. Add an x2 margin to be safe (2 usecs).
-	 *
-	 * TODO: Indicate errata when available.
-	 */
-	.srst_udelay	= 2,
-	.sysc_flags	= (SYSC_HAS_MIDLEMODE | SYSC_HAS_RESET_STATUS |
-			   SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   MSTANDBY_FORCE | MSTANDBY_NO | MSTANDBY_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap44xx_fdif_hwmod_class = {
-	.name	= "fdif",
-	.sysc	= &omap44xx_fdif_sysc,
-};
-
-/* fdif */
-static struct omap_hwmod omap44xx_fdif_hwmod = {
-	.name		= "fdif",
-	.class		= &omap44xx_fdif_hwmod_class,
-	.clkdm_name	= "iss_clkdm",
-	.main_clk	= "fdif_fck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_CAM_FDIF_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_CAM_FDIF_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /*
  * 'gpmc' class
  * general purpose memory controller
@@ -1474,14 +1430,6 @@ static struct omap_hwmod_ocp_if omap44xx_dma_system__l3_main_2 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* fdif -> l3_main_2 */
-static struct omap_hwmod_ocp_if omap44xx_fdif__l3_main_2 = {
-	.master		= &omap44xx_fdif_hwmod,
-	.slave		= &omap44xx_l3_main_2_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* ipu -> l3_main_2 */
 static struct omap_hwmod_ocp_if omap44xx_ipu__l3_main_2 = {
 	.master		= &omap44xx_ipu_hwmod,
@@ -1818,14 +1766,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_per__dss_venc = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l4_cfg -> fdif */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__fdif = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_fdif_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_2 -> gpmc */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_2__gpmc = {
 	.master		= &omap44xx_l3_main_2_hwmod,
@@ -1983,7 +1923,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_mpu__l3_main_1,
 	&omap44xx_debugss__l3_main_2,
 	&omap44xx_dma_system__l3_main_2,
-	&omap44xx_fdif__l3_main_2,
 	&omap44xx_ipu__l3_main_2,
 	&omap44xx_iss__l3_main_2,
 	&omap44xx_iva__l3_main_2,
@@ -2026,7 +1965,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_per__dss_rfbi,
 	&omap44xx_l3_main_2__dss_venc,
 	&omap44xx_l4_per__dss_venc,
-	&omap44xx_l4_cfg__fdif,
 	&omap44xx_l3_main_2__gpmc,
 	&omap44xx_l3_main_2__ipu,
 	&omap44xx_l3_main_2__iss,
-- 
2.24.1
