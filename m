Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE07B331201
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 16:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbhCHPTd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 10:19:33 -0500
Received: from muru.com ([72.249.23.125]:41038 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231308AbhCHPT0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 10:19:26 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6124C8117;
        Mon,  8 Mar 2021 15:20:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/9] ARM: OMAP2+: Drop legacy platform data for omap5 dmm
Date:   Mon,  8 Mar 2021 17:19:03 +0200
Message-Id: <20210308151911.43203-2-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308151911.43203-1-tony@atomide.com>
References: <20210308151911.43203-1-tony@atomide.com>
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
 arch/arm/boot/dts/omap5.dtsi               |  1 -
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 30 ----------------------
 2 files changed, 31 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -279,7 +279,6 @@ ipu: ipu@55020000 {
 
 		target-module@4e000000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "dmm";
 			reg = <0x4e000000 0x4>,
 			      <0x4e000010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -30,27 +30,6 @@
  * IP blocks
  */
 
-/*
- * 'dmm' class
- * instance(s): dmm
- */
-static struct omap_hwmod_class omap54xx_dmm_hwmod_class = {
-	.name	= "dmm",
-};
-
-/* dmm */
-static struct omap_hwmod omap54xx_dmm_hwmod = {
-	.name		= "dmm",
-	.class		= &omap54xx_dmm_hwmod_class,
-	.clkdm_name	= "emif_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_EMIF_DMM_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_EMIF_DMM_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * 'l3' class
  * instance(s): l3_instr, l3_main_1, l3_main_2, l3_main_3
@@ -302,14 +281,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_cfg__sata = {
  * Interfaces
  */
 
-/* l3_main_1 -> dmm */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_1__dmm = {
-	.master		= &omap54xx_l3_main_1_hwmod,
-	.slave		= &omap54xx_dmm_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_SDMA,
-};
-
 /* l3_main_3 -> l3_instr */
 static struct omap_hwmod_ocp_if omap54xx_l3_main_3__l3_instr = {
 	.master		= &omap54xx_l3_main_3_hwmod,
@@ -439,7 +410,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_cfg__mpu = {
 };
 
 static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
-	&omap54xx_l3_main_1__dmm,
 	&omap54xx_l3_main_3__l3_instr,
 	&omap54xx_l3_main_2__l3_main_1,
 	&omap54xx_l4_cfg__l3_main_1,
-- 
2.30.1
