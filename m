Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29C40298BF1
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769413AbgJZLWy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:22:54 -0400
Received: from muru.com ([72.249.23.125]:46694 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1422405AbgJZLWy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:22:54 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0C4E880AA;
        Mon, 26 Oct 2020 11:22:57 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Suman Anna <s-anna@ti.com>, Roger Quadros <rogerq@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 09/18] ARM: OMAP2+: Drop legacy platform data for am3 emif
Date:   Mon, 26 Oct 2020 13:22:13 +0200
Message-Id: <20201026112222.56894-10-tony@atomide.com>
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

Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx.dtsi              | 24 +++++++++++++++-------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 24 ----------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -479,14 +479,24 @@ pm_sram_data: pm-data-sram@1000 {
 			};
 		};
 
-		emif: emif@4c000000 {
-			compatible = "ti,emif-am3352";
-			reg = <0x4c000000 0x1000000>;
-			ti,hwmods = "emif";
-			interrupts = <101>;
-			sram = <&pm_sram_code
-				&pm_sram_data>;
+		target-module@4c000000 {
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
+			reg = <0x4c000000 0x4>;
+			reg-names = "rev";
+			clocks = <&l3_clkctrl AM3_L3_EMIF_CLKCTRL 0>;
+			clock-names = "fck";
 			ti,no-idle;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x4c000000 0x1000000>;
+
+			emif: emif@0 {
+				compatible = "ti,emif-am3352";
+				reg = <0 0x1000000>;
+				interrupts = <101>;
+				sram = <&pm_sram_code
+					&pm_sram_data>;
+			};
 		};
 
 		target-module@50000000 {
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -27,21 +27,6 @@
  * IP blocks
  */
 
-/* emif */
-static struct omap_hwmod am33xx_emif_hwmod = {
-	.name		= "emif",
-	.class		= &am33xx_emif_hwmod_class,
-	.clkdm_name	= "l3_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "dpll_ddr_m2_div2_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM33XX_CM_PER_EMIF_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /* l4_hs */
 static struct omap_hwmod am33xx_l4_hs_hwmod = {
 	.name		= "l4_hs",
@@ -133,14 +118,6 @@ static struct omap_hwmod am33xx_ocpwp_hwmod = {
  * Interfaces
  */
 
-/* l3 main -> emif */
-static struct omap_hwmod_ocp_if am33xx_l3_main__emif = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am33xx_emif_hwmod,
-	.clk		= "dpll_core_m4_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3 main -> l4 hs */
 static struct omap_hwmod_ocp_if am33xx_l3_main__l4_hs = {
 	.master		= &am33xx_l3_main_hwmod,
@@ -166,7 +143,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__smartreflex1 = {
 };
 
 static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
-	&am33xx_l3_main__emif,
 	&am33xx_mpu__l3_main,
 	&am33xx_mpu__prcm,
 	&am33xx_l3_s__l4_ls,
-- 
2.29.1
