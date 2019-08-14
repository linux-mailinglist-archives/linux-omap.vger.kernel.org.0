Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 676388D41F
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 15:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727694AbfHNNCw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 09:02:52 -0400
Received: from muru.com ([72.249.23.125]:57580 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbfHNNCv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Aug 2019 09:02:51 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DE18680C8;
        Wed, 14 Aug 2019 13:03:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 4/5] ARM: OMAP2+: Drop legacy platform data for omap4 d2d
Date:   Wed, 14 Aug 2019 06:02:39 -0700
Message-Id: <20190814130240.56202-5-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814130240.56202-1-tony@atomide.com>
References: <20190814130240.56202-1-tony@atomide.com>
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
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 32 ----------------------
 1 file changed, 32 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -274,29 +274,6 @@ static struct omap_hwmod omap44xx_aess_hwmod = {
 	},
 };
 
-/*
- * 'c2c' class
- * chip 2 chip interface used to plug the ape soc (omap) with an external modem
- * soc
- */
-
-static struct omap_hwmod_class omap44xx_c2c_hwmod_class = {
-	.name	= "c2c",
-};
-
-/* c2c */
-static struct omap_hwmod omap44xx_c2c_hwmod = {
-	.name		= "c2c",
-	.class		= &omap44xx_c2c_hwmod_class,
-	.clkdm_name	= "d2d_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_D2D_SAD2D_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_D2D_SAD2D_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * 'counter' class
  * 32-bit ordinary counter, clocked by the falling edge of the 32 khz clock
@@ -2732,14 +2709,6 @@ static struct omap_hwmod_ocp_if __maybe_unused omap44xx_l4_abe__aess_dma = {
 	.user		= OCP_USER_SDMA,
 };
 
-/* l3_main_2 -> c2c */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__c2c = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_c2c_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_wkup -> counter_32k */
 static struct omap_hwmod_ocp_if omap44xx_l4_wkup__counter_32k = {
 	.master		= &omap44xx_l4_wkup_hwmod,
@@ -3394,7 +3363,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_cfg__ocp_wp_noc,
 	&omap44xx_l4_abe__aess,
 	&omap44xx_l4_abe__aess_dma,
-	&omap44xx_l3_main_2__c2c,
 	&omap44xx_l4_wkup__counter_32k,
 	&omap44xx_l4_cfg__ctrl_module_core,
 	&omap44xx_l4_cfg__ctrl_module_pad_core,
-- 
2.21.0
