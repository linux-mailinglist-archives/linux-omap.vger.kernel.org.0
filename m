Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC426119EA6
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2019 23:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbfLJWym (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 17:54:42 -0500
Received: from muru.com ([72.249.23.125]:44998 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727349AbfLJWym (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 17:54:42 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 48ACF820B;
        Tue, 10 Dec 2019 22:55:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 4/6] ARM: OMAP2+: Drop legacy platform data for omap4 aes
Date:   Tue, 10 Dec 2019 14:54:31 -0800
Message-Id: <20191210225433.2720-5-tony@atomide.com>
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
 arch/arm/boot/dts/omap4.dtsi               |  2 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 62 ----------------------
 2 files changed, 64 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -268,7 +268,6 @@ emif2: emif@4d000000 {
 
 		aes1_target: target-module@4b501000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "aes1";
 			reg = <0x4b501080 0x4>,
 			      <0x4b501084 0x4>,
 			      <0x4b501088 0x4>;
@@ -298,7 +297,6 @@ aes1: aes@0 {
 
 		aes2_target: target-module@4b701000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "aes2";
 			reg = <0x4b701080 0x4>,
 			      <0x4b701084 0x4>,
 			      <0x4b701088 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -884,66 +884,6 @@ static struct omap_hwmod omap44xx_emif2_hwmod = {
 	},
 };
 
-/*
-    Crypto modules AES0/1 belong to:
-	PD_L4_PER power domain
-	CD_L4_SEC clock domain
-	On the L3, the AES modules are mapped to
-	L3_CLK2: Peripherals and multimedia sub clock domain
-*/
-static struct omap_hwmod_class_sysconfig omap44xx_aes_sysc = {
-	.rev_offs	= 0x80,
-	.sysc_offs	= 0x84,
-	.syss_offs	= 0x88,
-	.sysc_flags	= SYSS_HAS_RESET_STATUS,
-};
-
-static struct omap_hwmod_class omap44xx_aes_hwmod_class = {
-	.name		= "aes",
-	.sysc		= &omap44xx_aes_sysc,
-};
-
-static struct omap_hwmod omap44xx_aes1_hwmod = {
-	.name		= "aes1",
-	.class		= &omap44xx_aes_hwmod_class,
-	.clkdm_name	= "l4_secure_clkdm",
-	.main_clk	= "l3_div_ck",
-	.prcm		= {
-		.omap4	= {
-			.context_offs	= OMAP4_RM_L4SEC_AES1_CONTEXT_OFFSET,
-			.clkctrl_offs	= OMAP4_CM_L4SEC_AES1_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__aes1 = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_aes1_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-static struct omap_hwmod omap44xx_aes2_hwmod = {
-	.name		= "aes2",
-	.class		= &omap44xx_aes_hwmod_class,
-	.clkdm_name	= "l4_secure_clkdm",
-	.main_clk	= "l3_div_ck",
-	.prcm		= {
-		.omap4	= {
-			.context_offs	= OMAP4_RM_L4SEC_AES2_CONTEXT_OFFSET,
-			.clkctrl_offs	= OMAP4_CM_L4SEC_AES2_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__aes2 = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_aes2_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
 
 /*
  * 'des' class for DES3DES module
@@ -3045,8 +2985,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_cfg__usb_tll_hs,
 	&omap44xx_mpu__emif1,
 	&omap44xx_mpu__emif2,
-	&omap44xx_l3_main_2__aes1,
-	&omap44xx_l3_main_2__aes2,
 	&omap44xx_l3_main_2__des,
 	&omap44xx_l3_main_2__sha0,
 	NULL,
-- 
2.24.0
