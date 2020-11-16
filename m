Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD99A2B4298
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729705AbgKPLU1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:27 -0500
Received: from muru.com ([72.249.23.125]:48480 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729595AbgKPLU1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:27 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DC2F080C8;
        Mon, 16 Nov 2020 11:20:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Suman Anna <s-anna@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 10/17] ARM: OMAP2+: Drop legacy platform data for am4 ocmcram
Date:   Mon, 16 Nov 2020 13:19:32 +0200
Message-Id: <20201116111939.21405-11-tony@atomide.com>
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

Note that we need to use "ti,no-idle" here.

Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi                 | 36 ++++++++++++-------
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  7 ----
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 19 ----------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  1 -
 4 files changed, 23 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -503,23 +503,33 @@ qspi: spi@0 {
 			};
 		};
 
-		ocmcram: sram@40300000 {
-			compatible = "mmio-sram";
-			reg = <0x40300000 0x40000>; /* 256k */
-			ranges = <0x0 0x40300000 0x40000>;
+		target-module@40300000 {
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
+			clocks = <&l3_clkctrl AM4_L3_OCMCRAM_CLKCTRL 0>;
+			clock-names = "fck";
+			ti,no-idle;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			ranges = <0 0x40300000 0x40000>;
 
-			pm_sram_code: pm-code-sram@0 {
-				compatible = "ti,sram";
-				reg = <0x0 0x1000>;
-				protect-exec;
-			};
+			ocmcram: sram@0 {
+				compatible = "mmio-sram";
+				reg = <0 0x40000>; /* 256k */
+				ranges = <0 0 0x40000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
 
-			pm_sram_data: pm-data-sram@1000 {
-				compatible = "ti,sram";
-				reg = <0x1000 0x1000>;
-				pool;
+				pm_sram_code: pm-code-sram@0 {
+					compatible = "ti,sram";
+					reg = <0x0 0x1000>;
+					protect-exec;
+				};
+
+				pm_sram_data: pm-data-sram@1000 {
+					compatible = "ti,sram";
+					reg = <0x1000 0x1000>;
+					pool;
+				};
 			};
 		};
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -73,10 +73,3 @@ struct omap_hwmod_ocp_if am33xx_l3_s__l3_main = {
 	.clk		= "l3s_gclk",
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
-
-/* l3 main -> ocmc */
-struct omap_hwmod_ocp_if am33xx_l3_main__ocmc = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am33xx_ocmcram_hwmod,
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -139,24 +139,6 @@ struct omap_hwmod am33xx_prcm_hwmod = {
 	.clkdm_name	= "l4_wkup_clkdm",
 };
 
-/* ocmcram */
-static struct omap_hwmod_class am33xx_ocmcram_hwmod_class = {
-	.name = "ocmcram",
-};
-
-struct omap_hwmod am33xx_ocmcram_hwmod = {
-	.name		= "ocmcram",
-	.class		= &am33xx_ocmcram_hwmod_class,
-	.clkdm_name	= "l3_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "l3_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /* 'smartreflex' class */
 static struct omap_hwmod_class am33xx_smartreflex_hwmod_class = {
 	.name		= "smartreflex",
@@ -215,7 +197,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_l4_wkup_hwmod, AM43XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_main_hwmod, AM43XX_CM_PER_L3_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mpu_hwmod , AM43XX_CM_MPU_MPU_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_ocmcram_hwmod , AM43XX_CM_PER_OCMCRAM_CLKCTRL_OFFSET);
 }
 
 void omap_hwmod_am43xx_reg(void)
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -68,7 +68,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_s__l3_main,
 	&am43xx_l4_wkup__smartreflex0,
 	&am43xx_l4_wkup__smartreflex1,
-	&am33xx_l3_main__ocmc,
 	NULL,
 };
 
-- 
2.29.2
