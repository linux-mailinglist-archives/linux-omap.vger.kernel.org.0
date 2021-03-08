Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50114330FD7
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhCHNq4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:46:56 -0500
Received: from muru.com ([72.249.23.125]:40920 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229646AbhCHNqg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:46:36 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 773198199;
        Mon,  8 Mar 2021 13:47:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/11] ARM: OMAP2+: Drop legacy platform data for omap4 dmm
Date:   Mon,  8 Mar 2021 15:46:19 +0200
Message-Id: <20210308134627.13056-4-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308134627.13056-1-tony@atomide.com>
References: <20210308134627.13056-1-tony@atomide.com>
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

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi               |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 39 ----------------------
 2 files changed, 40 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -287,7 +287,6 @@ target-module@4012c000 {
 
 		target-module@4e000000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "dmm";
 			reg = <0x4e000000 0x4>,
 			      <0x4e000010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -33,27 +33,6 @@
  * IP blocks
  */
 
-/*
- * 'dmm' class
- * instance(s): dmm
- */
-static struct omap_hwmod_class omap44xx_dmm_hwmod_class = {
-	.name	= "dmm",
-};
-
-/* dmm */
-static struct omap_hwmod omap44xx_dmm_hwmod = {
-	.name		= "dmm",
-	.class		= &omap44xx_dmm_hwmod_class,
-	.clkdm_name	= "l3_emif_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_MEMIF_DMM_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_MEMIF_DMM_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * 'l3' class
  * instance(s): l3_instr, l3_main_1, l3_main_2, l3_main_3
@@ -440,22 +419,6 @@ static struct omap_hwmod omap44xx_sl2if_hwmod = {
  * interfaces
  */
 
-/* l3_main_1 -> dmm */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_1__dmm = {
-	.master		= &omap44xx_l3_main_1_hwmod,
-	.slave		= &omap44xx_dmm_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_SDMA,
-};
-
-/* mpu -> dmm */
-static struct omap_hwmod_ocp_if omap44xx_mpu__dmm = {
-	.master		= &omap44xx_mpu_hwmod,
-	.slave		= &omap44xx_dmm_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3_main_3 -> l3_instr */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_3__l3_instr = {
 	.master		= &omap44xx_l3_main_3_hwmod,
@@ -665,8 +628,6 @@ static struct omap_hwmod_ocp_if omap44xx_mpu__emif2 = {
 };
 
 static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
-	&omap44xx_l3_main_1__dmm,
-	&omap44xx_mpu__dmm,
 	&omap44xx_l3_main_3__l3_instr,
 	&omap44xx_ocp_wp_noc__l3_instr,
 	&omap44xx_l3_main_2__l3_main_1,
-- 
2.30.1
