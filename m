Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71EAC11B9FB
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 18:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730612AbfLKRUa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 12:20:30 -0500
Received: from muru.com ([72.249.23.125]:45658 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730823AbfLKRU3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 12:20:29 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EBA9B80FA;
        Wed, 11 Dec 2019 17:21:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Suman Anna <s-anna@ti.com>,
        Keerthy <j-keerthy@ti.com>, "Andrew F. Davis" <afd@ti.com>,
        Franklin S Cooper Jr <fcooper@ti.com>,
        Jyri Sarha <jsarha@ti.com>, Roger Quadros <rogerq@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCH 05/16] ARM: OMAP2+: Drop legacy platform data for omap5 spinlock
Date:   Wed, 11 Dec 2019 09:20:03 -0800
Message-Id: <20191211172014.35201-6-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191211172014.35201-1-tony@atomide.com>
References: <20191211172014.35201-1-tony@atomide.com>
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

Cc: Suman Anna <s-anna@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 43 ----------------------
 2 files changed, 44 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -627,7 +627,6 @@ mbox_dsp: mbox_dsp {
 
 		target-module@76000 {			/* 0x4a0f6000, ap 27 0c.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "spinlock";
 			reg = <0x76000 0x4>,
 			      <0x76010 0x4>,
 			      <0x76014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -684,40 +684,6 @@ static struct omap_hwmod omap54xx_mpu_hwmod = {
 	},
 };
 
-/*
- * 'spinlock' class
- * spinlock provides hardware assistance for synchronizing the processes
- * running on multiple processors
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_spinlock_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_CLOCKACTIVITY |
-			   SYSC_HAS_ENAWAKEUP | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap54xx_spinlock_hwmod_class = {
-	.name	= "spinlock",
-	.sysc	= &omap54xx_spinlock_sysc,
-};
-
-/* spinlock */
-static struct omap_hwmod omap54xx_spinlock_hwmod = {
-	.name		= "spinlock",
-	.class		= &omap54xx_spinlock_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4CFG_SPINLOCK_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4CFG_SPINLOCK_CONTEXT_OFFSET,
-		},
-	},
-};
 
 /*
  * 'ocp2scp' class
@@ -1262,14 +1228,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_cfg__mpu = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> spinlock */
-static struct omap_hwmod_ocp_if omap54xx_l4_cfg__spinlock = {
-	.master		= &omap54xx_l4_cfg_hwmod,
-	.slave		= &omap54xx_spinlock_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> ocp2scp1 */
 static struct omap_hwmod_ocp_if omap54xx_l4_cfg__ocp2scp1 = {
 	.master		= &omap54xx_l4_cfg_hwmod,
@@ -1341,7 +1299,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_2__mmu_ipu,
 	&omap54xx_l4_wkup__kbd,
 	&omap54xx_l4_cfg__mpu,
-	&omap54xx_l4_cfg__spinlock,
 	&omap54xx_l4_cfg__ocp2scp1,
 	&omap54xx_l4_wkup__timer1,
 	&omap54xx_l4_cfg__usb_host_hs,
-- 
2.24.1
