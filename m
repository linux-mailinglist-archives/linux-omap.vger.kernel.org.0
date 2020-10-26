Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3865F298BEF
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772728AbgJZLWw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:22:52 -0400
Received: from muru.com ([72.249.23.125]:46688 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1422405AbgJZLWw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:22:52 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4F16E81A0;
        Mon, 26 Oct 2020 11:22:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 08/18] ARM: OMAP2+: Drop legacy platform data for am3 debugss
Date:   Mon, 26 Oct 2020 13:22:12 +0200
Message-Id: <20201026112222.56894-9-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026112222.56894-1-tony@atomide.com>
References: <20201026112222.56894-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx.dtsi              | 19 ++++++++---
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 37 ----------------------
 2 files changed, 14 insertions(+), 42 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -144,11 +144,20 @@ oppnitro-1000000000 {
 		};
 	};
 
-	pmu@4b000000 {
-		compatible = "arm,cortex-a8-pmu";
-		interrupts = <3>;
-		reg = <0x4b000000 0x1000000>;
-		ti,hwmods = "debugss";
+	target-module@4b000000 {
+		compatible = "ti,sysc-omap4-simple", "ti,sysc";
+		clocks = <&l3_aon_clkctrl AM3_L3_AON_DEBUGSS_CLKCTRL 0>;
+		clock-names = "fck";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x4b000000 0x1000000>;
+
+		pmu@0 {
+			compatible = "arm,cortex-a8-pmu";
+			interrupts = <3>;
+			reg = <0 0x1000000>;
+			ti,hwmods = "debugss";
+		};
 	};
 
 	/*
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -129,34 +129,6 @@ static struct omap_hwmod am33xx_ocpwp_hwmod = {
 };
 #endif
 
-/*
- * 'debugss' class
- * debug sub system
- */
-static struct omap_hwmod_opt_clk debugss_opt_clks[] = {
-	{ .role = "dbg_sysclk", .clk = "dbg_sysclk_ck" },
-	{ .role = "dbg_clka", .clk = "dbg_clka_ck" },
-};
-
-static struct omap_hwmod_class am33xx_debugss_hwmod_class = {
-	.name		= "debugss",
-};
-
-static struct omap_hwmod am33xx_debugss_hwmod = {
-	.name		= "debugss",
-	.class		= &am33xx_debugss_hwmod_class,
-	.clkdm_name	= "l3_aon_clkdm",
-	.main_clk	= "trace_clk_div_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM33XX_CM_WKUP_DEBUGSS_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= debugss_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(debugss_opt_clks),
-};
-
 /*
  * Interfaces
  */
@@ -177,14 +149,6 @@ static struct omap_hwmod_ocp_if am33xx_l3_main__l4_hs = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main -> debugss */
-static struct omap_hwmod_ocp_if am33xx_l3_main__debugss = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am33xx_debugss_hwmod,
-	.clk		= "dpll_core_m4_ck",
-	.user		= OCP_USER_MPU,
-};
-
 /* l4 wkup -> smartreflex0 */
 static struct omap_hwmod_ocp_if am33xx_l4_wkup__smartreflex0 = {
 	.master		= &am33xx_l4_wkup_hwmod,
@@ -211,7 +175,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__l3_s,
 	&am33xx_l3_main__l3_instr,
 	&am33xx_l3_s__l3_main,
-	&am33xx_l3_main__debugss,
 	&am33xx_l4_wkup__smartreflex0,
 	&am33xx_l4_wkup__smartreflex1,
 	&am33xx_l3_main__ocmc,
-- 
2.29.1
