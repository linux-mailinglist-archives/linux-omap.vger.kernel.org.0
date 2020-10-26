Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C4C298BFA
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773330AbgJZLXB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:23:01 -0400
Received: from muru.com ([72.249.23.125]:46708 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1422405AbgJZLW5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:22:57 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7572D80AA;
        Mon, 26 Oct 2020 11:23:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 11/18] ARM: OMAP2+: Drop legacy platform data for am3 instr
Date:   Mon, 26 Oct 2020 13:22:15 +0200
Message-Id: <20201026112222.56894-12-tony@atomide.com>
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
 arch/arm/boot/dts/am33xx.dtsi                 | 20 +++++++++++++------
 .../omap_hwmod_33xx_43xx_ipblock_data.c       |  1 -
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  1 -
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -146,17 +146,25 @@ oppnitro-1000000000 {
 
 	target-module@4b000000 {
 		compatible = "ti,sysc-omap4-simple", "ti,sysc";
-		clocks = <&l3_aon_clkctrl AM3_L3_AON_DEBUGSS_CLKCTRL 0>;
+		clocks = <&l3_clkctrl AM3_L3_L3_INSTR_CLKCTRL 0>;
 		clock-names = "fck";
+		ti,no-idle;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x4b000000 0x1000000>;
 
-		pmu@0 {
-			compatible = "arm,cortex-a8-pmu";
-			interrupts = <3>;
-			reg = <0 0x1000000>;
-			ti,hwmods = "debugss";
+		target-module@140000 {
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
+			clocks = <&l3_aon_clkctrl AM3_L3_AON_DEBUGSS_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x140000 0xec0000>;
+
+			pmu@0 {
+				compatible = "arm,cortex-a8-pmu";
+				interrupts = <3>;
+			};
 		};
 	};
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -246,7 +246,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_l4_wkup_hwmod, AM43XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_main_hwmod, AM43XX_CM_PER_L3_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mpu_hwmod , AM43XX_CM_MPU_MPU_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_l3_instr_hwmod , AM43XX_CM_PER_L3_INSTR_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_ocmcram_hwmod , AM43XX_CM_PER_OCMCRAM_CLKCTRL_OFFSET);
 }
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -149,7 +149,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_s__l4_wkup,
 	&am33xx_l3_main__l4_hs,
 	&am33xx_l3_main__l3_s,
-	&am33xx_l3_main__l3_instr,
 	&am33xx_l3_s__l3_main,
 	&am33xx_l4_wkup__smartreflex0,
 	&am33xx_l4_wkup__smartreflex1,
-- 
2.29.1
