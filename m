Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9757D119EA8
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2019 23:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbfLJWyo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 17:54:44 -0500
Received: from muru.com ([72.249.23.125]:45004 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727349AbfLJWyo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 17:54:44 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 889C783BD;
        Tue, 10 Dec 2019 22:55:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 5/6] ARM: OMAP2+: Drop legacy platform data for omap4 sham
Date:   Tue, 10 Dec 2019 14:54:32 -0800
Message-Id: <20191210225433.2720-6-tony@atomide.com>
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
 arch/arm/boot/dts/omap4.dtsi               |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 35 ----------------------
 2 files changed, 36 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -326,7 +326,6 @@ aes2: aes@0 {
 
 		sham_target: target-module@4b100000 {
 			compatible = "ti,sysc-omap3-sham", "ti,sysc";
-			ti,hwmods = "sham";
 			reg = <0x4b100100 0x4>,
 			      <0x4b100110 0x4>,
 			      <0x4b100114 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -777,32 +777,6 @@ static struct omap_hwmod omap44xx_dss_venc_hwmod = {
 	.opt_clks_cnt	= ARRAY_SIZE(dss_venc_opt_clks),
 };
 
-/* sha0 HIB2 (the 'P' (public) device) */
-static struct omap_hwmod_class_sysconfig omap44xx_sha0_sysc = {
-	.rev_offs	= 0x100,
-	.sysc_offs	= 0x110,
-	.syss_offs	= 0x114,
-	.sysc_flags	= SYSS_HAS_RESET_STATUS,
-};
-
-static struct omap_hwmod_class omap44xx_sha0_hwmod_class = {
-	.name		= "sham",
-	.sysc		= &omap44xx_sha0_sysc,
-};
-
-static struct omap_hwmod omap44xx_sha0_hwmod = {
-	.name		= "sham",
-	.class		= &omap44xx_sha0_hwmod_class,
-	.clkdm_name	= "l4_secure_clkdm",
-	.main_clk	= "l3_div_ck",
-	.prcm		= {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L4SEC_SHA2MD51_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L4SEC_SHA2MD51_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 /*
  * 'elm' class
@@ -2545,14 +2519,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_per__dss_venc = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l3_main_2 -> sham */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__sha0 = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_sha0_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_per -> elm */
 static struct omap_hwmod_ocp_if omap44xx_l4_per__elm = {
 	.master		= &omap44xx_l4_per_hwmod,
@@ -2986,7 +2952,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_mpu__emif1,
 	&omap44xx_mpu__emif2,
 	&omap44xx_l3_main_2__des,
-	&omap44xx_l3_main_2__sha0,
 	NULL,
 };
 
-- 
2.24.0
