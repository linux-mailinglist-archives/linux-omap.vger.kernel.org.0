Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3788298BF2
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773378AbgJZLW4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:22:56 -0400
Received: from muru.com ([72.249.23.125]:46702 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1422405AbgJZLWz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:22:55 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BF7CB8196;
        Mon, 26 Oct 2020 11:22:59 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Suman Anna <s-anna@ti.com>, Roger Quadros <rogerq@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 10/18] ARM: OMAP2+: Drop legacy platform data for am3 ocmcram
Date:   Mon, 26 Oct 2020 13:22:14 +0200
Message-Id: <20201026112222.56894-11-tony@atomide.com>
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

Note that we need to use "ti,no-idle" here.

Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx.dtsi                 | 36 ++++++++++++-------
 .../omap_hwmod_33xx_43xx_ipblock_data.c       |  1 -
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  1 -
 3 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -459,23 +459,33 @@ cppi41dma: dma-controller@2000 {
 			};
 		};
 
-		ocmcram: sram@40300000 {
-			compatible = "mmio-sram";
-			reg = <0x40300000 0x10000>; /* 64k */
-			ranges = <0x0 0x40300000 0x10000>;
+		target-module@40300000 {
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
+			clocks = <&l3_clkctrl AM3_L3_OCMCRAM_CLKCTRL 0>;
+			clock-names = "fck";
+			ti,no-idle;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			ranges = <0 0x40300000 0x10000>;
 
-			pm_sram_code: pm-code-sram@0 {
-				compatible = "ti,sram";
-				reg = <0x0 0x1000>;
-				protect-exec;
-			};
+			ocmcram: sram@0 {
+				compatible = "mmio-sram";
+				reg = <0 0x10000>; /* 64k */
+				ranges = <0 0 0x10000>;
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
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -229,7 +229,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_l3_main_hwmod, AM33XX_CM_PER_L3_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mpu_hwmod , AM33XX_CM_MPU_MPU_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_instr_hwmod , AM33XX_CM_PER_L3_INSTR_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_ocmcram_hwmod , AM33XX_CM_PER_OCMCRAM_CLKCTRL_OFFSET);
 }
 
 void omap_hwmod_am33xx_reg(void)
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -153,7 +153,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_s__l3_main,
 	&am33xx_l4_wkup__smartreflex0,
 	&am33xx_l4_wkup__smartreflex1,
-	&am33xx_l3_main__ocmc,
 	NULL,
 };
 
-- 
2.29.1
