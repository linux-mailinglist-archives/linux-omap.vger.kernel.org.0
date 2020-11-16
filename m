Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435282B428E
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgKPLUX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:23 -0500
Received: from muru.com ([72.249.23.125]:48458 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729682AbgKPLUU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:20 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DED3580C8;
        Mon, 16 Nov 2020 11:20:24 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Suman Anna <s-anna@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 07/17] ARM: dts: Configure interconnect target module for am4 wkup_m3
Date:   Mon, 16 Nov 2020 13:19:29 +0200
Message-Id: <20201116111939.21405-8-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116111939.21405-1-tony@atomide.com>
References: <20201116111939.21405-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with device tree only configuration using
ti-sysc interconnect target module driver.

Note that we no longer need ti,no-reset-on-init as the rstctrl resets
are properly handled by the reset driver and claimed by the RTC driver.
And we need to squash together the module ranges for driver compability.

Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi    |  8 --------
 arch/arm/boot/dts/am437x-l4.dtsi | 27 +++++++++++++++++----------
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -173,14 +173,6 @@ ocp@44000000 {
 			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 
 		l4_wkup: interconnect@44c00000 {
-			wkup_m3: wkup_m3@100000 {
-				compatible = "ti,am4372-wkup-m3";
-				reg = <0x100000 0x4000>,
-				      <0x180000	0x2000>;
-				reg-names = "umem", "dmem";
-				ti,hwmods = "wkup_m3";
-				ti,pm-firmware = "am335x-pm-firmware.elf";
-			};
 		};
 		l4_per: interconnect@48000000 {
 		};
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -32,19 +32,26 @@ segment@100000 {					/* 0x44d00000 */
 			 <0x000f0000 0x001f0000 0x010000>;	/* ap 8 */
 
 		target-module@0 {			/* 0x44d00000, ap 4 28.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "wkup_m3";
+			reg = <0x0 0x4>;
+			reg-names = "rev";
+			clocks = <&l4_wkup_aon_clkctrl AM4_L4_WKUP_AON_WKUP_M3_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0x0 0x0 0x4000>;
-		};
+			ranges = <0x00000000 0x00000000 0x4000>,
+				 <0x00080000 0x00080000 0x2000>;
 
-		target-module@80000 {			/* 0x44d80000, ap 6 10.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x0 0x80000 0x2000>;
+			wkup_m3: cpu@0 {
+				compatible = "ti,am4372-wkup-m3";
+				reg = <0x00000000 0x4000>,
+				      <0x00080000 0x2000>;
+				reg-names = "umem", "dmem";
+				resets = <&prm_wkup 3>;
+				reset-names = "rstctrl";
+				ti,pm-firmware = "am335x-pm-firmware.elf";
+			};
 		};
 
 		target-module@f0000 {			/* 0x44df0000, ap 8 58.0 */
-- 
2.29.2
