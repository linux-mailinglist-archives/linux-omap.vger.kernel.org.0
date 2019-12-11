Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A64FA11BC99
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 20:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbfLKTM0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 14:12:26 -0500
Received: from muru.com ([72.249.23.125]:45860 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfLKTM0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 14:12:26 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 17A4A81A8;
        Wed, 11 Dec 2019 19:13:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Benoit Parrot <bparrot@ti.com>, Bin Liu <b-liu@ti.com>,
        Keerthy <j-keerthy@ti.com>, Roger Quadros <rogerq@ti.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 10/13] ARM: OMAP2+: Drop legacy platform data for omap5 kbd
Date:   Wed, 11 Dec 2019 11:12:03 -0800
Message-Id: <20191211191206.12190-11-tony@atomide.com>
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
 arch/arm/boot/dts/omap5-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 42 ----------------------
 2 files changed, 43 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -2363,7 +2363,6 @@ timer1: timer@0 {
 
 		target-module@c000 {			/* 0x4ae1c000, ap 11 1c.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "kbd";
 			reg = <0xc000 0x4>,
 			      <0xc010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -559,39 +559,6 @@ static struct omap_hwmod omap54xx_emif2_hwmod = {
 	},
 };
 
-/*
- * 'kbd' class
- * keyboard controller
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_kbd_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_EMUFREE | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap54xx_kbd_hwmod_class = {
-	.name	= "kbd",
-	.sysc	= &omap54xx_kbd_sysc,
-};
-
-/* kbd */
-static struct omap_hwmod omap54xx_kbd_hwmod = {
-	.name		= "kbd",
-	.class		= &omap54xx_kbd_hwmod_class,
-	.clkdm_name	= "wkupaon_clkdm",
-	.main_clk	= "sys_32k_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_WKUPAON_KBD_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_WKUPAON_KBD_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 
 
@@ -1147,14 +1114,6 @@ static struct omap_hwmod_ocp_if omap54xx_mpu__emif2 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_wkup -> kbd */
-static struct omap_hwmod_ocp_if omap54xx_l4_wkup__kbd = {
-	.master		= &omap54xx_l4_wkup_hwmod,
-	.slave		= &omap54xx_kbd_hwmod,
-	.clk		= "wkupaon_iclk_mux",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> mpu */
 static struct omap_hwmod_ocp_if omap54xx_l4_cfg__mpu = {
 	.master		= &omap54xx_l4_cfg_hwmod,
@@ -1224,7 +1183,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_mpu__emif1,
 	&omap54xx_mpu__emif2,
 	&omap54xx_l3_main_2__mmu_ipu,
-	&omap54xx_l4_wkup__kbd,
 	&omap54xx_l4_cfg__mpu,
 	&omap54xx_l4_wkup__timer1,
 	&omap54xx_l4_cfg__usb_host_hs,
-- 
2.24.1
