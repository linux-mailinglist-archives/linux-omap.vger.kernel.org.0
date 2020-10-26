Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B65298BE6
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769208AbgJZLWn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:22:43 -0400
Received: from muru.com ([72.249.23.125]:46658 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1422405AbgJZLWn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:22:43 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5F0A38196;
        Mon, 26 Oct 2020 11:22:47 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 03/18] ARM: OMAP2+: Drop legacy platform data for am3 control module
Date:   Mon, 26 Oct 2020 13:22:07 +0200
Message-Id: <20201026112222.56894-4-tony@atomide.com>
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

To drop the legacy platform data for am3 control module, we need
to configure the missing functional clock and tag the module to
not idle as platform data also had it configured with
HWMOD_INIT_NO_IDLE.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi           |  3 +++
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 24 ----------------------
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -274,6 +274,9 @@ target-module@10000 {			/* 0x44e10000, ap 22 0c.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x10000 0x4>;
 			reg-names = "rev";
+			clocks = <&l4_wkup_clkctrl AM3_L4_WKUP_CONTROL_CLKCTRL 0>;
+			clock-names = "fck";
+			ti,no-idle;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x00000000 0x00010000 0x00010000>,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -182,21 +182,6 @@ static struct omap_hwmod am33xx_debugss_hwmod = {
 	.opt_clks_cnt	= ARRAY_SIZE(debugss_opt_clks),
 };
 
-static struct omap_hwmod am33xx_control_hwmod = {
-	.name		= "control",
-	.class		= &am33xx_control_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "dpll_core_m4_div2_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM33XX_CM_WKUP_CONTROL_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-
 /*
  * Interfaces
  */
@@ -257,14 +242,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__smartreflex1 = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l4 wkup -> control */
-static struct omap_hwmod_ocp_if am33xx_l4_wkup__control = {
-	.master		= &am33xx_l4_wkup_hwmod,
-	.slave		= &am33xx_control_hwmod,
-	.clk		= "dpll_core_m4_div2_ck",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__emif,
 	&am33xx_mpu__l3_main,
@@ -278,7 +255,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_wkup_m3__l4_wkup,
 	&am33xx_l3_main__debugss,
 	&am33xx_l4_wkup__wkup_m3,
-	&am33xx_l4_wkup__control,
 	&am33xx_l4_wkup__smartreflex0,
 	&am33xx_l4_wkup__smartreflex1,
 	&am33xx_l3_s__gpmc,
-- 
2.29.1
