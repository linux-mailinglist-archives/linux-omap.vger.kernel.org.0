Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA741298BF8
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772787AbgJZLXA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:23:00 -0400
Received: from muru.com ([72.249.23.125]:46712 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1773330AbgJZLW7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:22:59 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3A1938196;
        Mon, 26 Oct 2020 11:23:03 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 12/18] ARM: OMAP2+: Drop legacy platform data for am3 mpuss
Date:   Mon, 26 Oct 2020 13:22:16 +0200
Message-Id: <20201026112222.56894-13-tony@atomide.com>
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

As we're just dropping data, and the early platform data init
is based on the custom ti,hwmods property, we want to drop both
the platform data and ti,hwmods property in a single patch.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi               | 18 ++++++++++++++++++
 arch/arm/boot/dts/am33xx.dtsi                  |  6 ------
 .../omap_hwmod_33xx_43xx_ipblock_data.c        |  1 -
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c     |  2 --
 4 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1861,6 +1861,24 @@ segment@200000 {					/* 0x48200000 */
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
+		ranges = <0x00000000 0x00200000 0x010000>;
+
+		target-module@0 {
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
+			power-domains = <&prm_mpu>;
+			clocks = <&mpu_clkctrl AM3_MPU_MPU_CLKCTRL 0>;
+			clock-names = "fck";
+			ti,no-idle;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x10000>;
+
+			mpu@0 {
+				compatible = "ti,omap3-mpu";
+				pm-sram = <&pm_sram_code
+					   &pm_sram_data>;
+			};
+		};
 	};
 
 	segment@300000 {					/* 0x48300000 */
diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -174,12 +174,6 @@ pmu@0 {
 	 */
 	soc {
 		compatible = "ti,omap-infra";
-		mpu {
-			compatible = "ti,omap3-mpu";
-			ti,hwmods = "mpu";
-			pm-sram = <&pm_sram_code
-				   &pm_sram_data>;
-		};
 	};
 
 	/*
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -227,7 +227,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_l4_ls_hwmod, AM33XX_CM_PER_L4LS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_wkup_hwmod, AM33XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_main_hwmod, AM33XX_CM_PER_L3_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_mpu_hwmod , AM33XX_CM_MPU_MPU_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_instr_hwmod , AM33XX_CM_PER_L3_INSTR_CLKCTRL_OFFSET);
 }
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -143,8 +143,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__smartreflex1 = {
 };
 
 static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
-	&am33xx_mpu__l3_main,
-	&am33xx_mpu__prcm,
 	&am33xx_l3_s__l4_ls,
 	&am33xx_l3_s__l4_wkup,
 	&am33xx_l3_main__l4_hs,
-- 
2.29.1
