Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C376F119EA9
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2019 23:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfLJWyp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 17:54:45 -0500
Received: from muru.com ([72.249.23.125]:45010 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727453AbfLJWyp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 17:54:45 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AC4028385;
        Tue, 10 Dec 2019 22:55:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 6/6] ARM: OMAP2+: Drop legacy platform data for omap4 des
Date:   Tue, 10 Dec 2019 14:54:33 -0800
Message-Id: <20191210225433.2720-7-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225433.2720-1-tony@atomide.com>
References: <20191210225433.2720-1-tony@atomide.com>
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

Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 38 ----------------------
 2 files changed, 39 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -2187,7 +2187,6 @@ target-module@a4000 {			/* 0x480a4000, ap 59 34.0 */
 
 		des_target: target-module@a5000 {	/* 0x480a5000 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "des";
 			reg = <0xa5030 0x4>,
 			      <0xa5034 0x4>,
 			      <0xa5038 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -858,43 +858,6 @@ static struct omap_hwmod omap44xx_emif2_hwmod = {
 	},
 };
 
-
-/*
- * 'des' class for DES3DES module
- */
-static struct omap_hwmod_class_sysconfig omap44xx_des_sysc = {
-	.rev_offs	= 0x30,
-	.sysc_offs	= 0x34,
-	.syss_offs	= 0x38,
-	.sysc_flags	= SYSS_HAS_RESET_STATUS,
-};
-
-static struct omap_hwmod_class omap44xx_des_hwmod_class = {
-	.name		= "des",
-	.sysc		= &omap44xx_des_sysc,
-};
-
-static struct omap_hwmod omap44xx_des_hwmod = {
-	.name		= "des",
-	.class		= &omap44xx_des_hwmod_class,
-	.clkdm_name	= "l4_secure_clkdm",
-	.main_clk	= "l3_div_ck",
-	.prcm		= {
-		.omap4	= {
-			.context_offs	= OMAP4_RM_L4SEC_DES3DES_CONTEXT_OFFSET,
-			.clkctrl_offs	= OMAP4_CM_L4SEC_DES3DES_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__des = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_des_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /*
  * 'fdif' class
  * face detection hw accelerator module
@@ -2951,7 +2914,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_cfg__usb_tll_hs,
 	&omap44xx_mpu__emif1,
 	&omap44xx_mpu__emif2,
-	&omap44xx_l3_main_2__des,
 	NULL,
 };
 
-- 
2.24.0
