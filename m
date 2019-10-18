Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38700DCB61
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 18:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409095AbfJRQch (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 12:32:37 -0400
Received: from muru.com ([72.249.23.125]:38126 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409049AbfJRQcg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Oct 2019 12:32:36 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2BB1F8168;
        Fri, 18 Oct 2019 16:33:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 04/10] ARM: OMAP2+: Drop legacy platform data for dra7 hdq1w
Date:   Fri, 18 Oct 2019 09:32:14 -0700
Message-Id: <20191018163220.3504-5-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018163220.3504-1-tony@atomide.com>
References: <20191018163220.3504-1-tony@atomide.com>
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
 arch/arm/boot/dts/dra7-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 43 -----------------------
 2 files changed, 44 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -2089,7 +2089,6 @@
 
 		target-module@b2000 {			/* 0x480b2000, ap 37 52.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "hdq1w";
 			reg = <0xb2000 0x4>,
 			      <0xb2014 0x4>,
 			      <0xb2018 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -771,41 +771,7 @@ static struct omap_hwmod dra7xx_gpmc_hwmod = {
 	},
 };
 
-/*
- * 'hdq1w' class
- *
- */
-
-static struct omap_hwmod_class_sysconfig dra7xx_hdq1w_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0014,
-	.syss_offs	= 0x0018,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_SOFTRESET |
-			   SYSS_HAS_RESET_STATUS),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class dra7xx_hdq1w_hwmod_class = {
-	.name	= "hdq1w",
-	.sysc	= &dra7xx_hdq1w_sysc,
-};
 
-/* hdq1w */
-
-static struct omap_hwmod dra7xx_hdq1w_hwmod = {
-	.name		= "hdq1w",
-	.class		= &dra7xx_hdq1w_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.flags		= HWMOD_INIT_NO_RESET,
-	.main_clk	= "func_12m_fclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER_HDQ1W_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER_HDQ1W_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 /*
  * 'mpu' class
@@ -1864,14 +1830,6 @@ static struct omap_hwmod_ocp_if dra7xx_l3_main_1__gpmc = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_per1 -> hdq1w */
-static struct omap_hwmod_ocp_if dra7xx_l4_per1__hdq1w = {
-	.master		= &dra7xx_l4_per1_hwmod,
-	.slave		= &dra7xx_hdq1w_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> mpu */
 static struct omap_hwmod_ocp_if dra7xx_l4_cfg__mpu = {
 	.master		= &dra7xx_l4_cfg_hwmod,
@@ -2237,7 +2195,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l3_main_1__sha0,
 	&dra7xx_l4_per1__elm,
 	&dra7xx_l3_main_1__gpmc,
-	&dra7xx_l4_per1__hdq1w,
 	&dra7xx_l4_cfg__mpu,
 	&dra7xx_l4_cfg__ocp2scp1,
 	&dra7xx_l4_cfg__ocp2scp3,
-- 
2.23.0
