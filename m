Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077EB2B4289
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729625AbgKPLUP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:15 -0500
Received: from muru.com ([72.249.23.125]:48440 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727228AbgKPLUP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:15 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 69F7B80C8;
        Mon, 16 Nov 2020 11:20:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 05/17] ARM: OMAP2+: Drop legacy platform data for am4 control module
Date:   Mon, 16 Nov 2020 13:19:27 +0200
Message-Id: <20201116111939.21405-6-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116111939.21405-1-tony@atomide.com>
References: <20201116111939.21405-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

To drop the legacy platform data for am3 control module, we need
to configure the missing functional clock and tag the module to
not idle as platform data also had it configured with
HWMOD_INIT_NO_IDLE.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am437x-l4.dtsi              |  3 +++
 .../omap_hwmod_33xx_43xx_ipblock_data.c       |  7 ------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    | 22 -------------------
 3 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -265,6 +265,9 @@ target-module@10000 {			/* 0x44e10000, ap 22 0c.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x10000 0x4>;
 			reg-names = "rev";
+			clocks = <&l4_wkup_clkctrl AM4_L4_WKUP_CONTROL_CLKCTRL 0>;
+			clock-names = "fck";
+			ti,no-idle;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x10000 0x10000>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -211,13 +211,6 @@ struct omap_hwmod am33xx_smartreflex1_hwmod = {
 	},
 };
 
-/*
- * 'control' module class
- */
-struct omap_hwmod_class am33xx_control_hwmod_class = {
-	.name		= "control",
-};
-
 static void omap_hwmod_am33xx_clkctrl(void)
 {
 	CLKCTRL(am33xx_smartreflex0_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -71,20 +71,6 @@ static struct omap_hwmod am43xx_wkup_m3_hwmod = {
 	.rst_lines_cnt	= ARRAY_SIZE(am33xx_wkup_m3_resets),
 };
 
-static struct omap_hwmod am43xx_control_hwmod = {
-	.name		= "control",
-	.class		= &am33xx_control_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "sys_clkin_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM43XX_CM_WKUP_CONTROL_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /* Interfaces */
 static struct omap_hwmod_ocp_if am43xx_l3_main__emif = {
 	.master		= &am33xx_l3_main_hwmod,
@@ -128,13 +114,6 @@ static struct omap_hwmod_ocp_if am43xx_l4_wkup__smartreflex1 = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod_ocp_if am43xx_l4_wkup__control = {
-	.master		= &am33xx_l4_wkup_hwmod,
-	.slave		= &am43xx_control_hwmod,
-	.clk		= "sys_clkin_ck",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_mpu__l3_main,
 	&am33xx_mpu__prcm,
@@ -147,7 +126,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am43xx_l3_main__emif,
 	&am43xx_wkup_m3__l4_wkup,
 	&am43xx_l4_wkup__wkup_m3,
-	&am43xx_l4_wkup__control,
 	&am43xx_l4_wkup__smartreflex0,
 	&am43xx_l4_wkup__smartreflex1,
 	&am33xx_l3_main__ocmc,
-- 
2.29.2
