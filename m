Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76305298BE9
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772394AbgJZLWr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:22:47 -0400
Received: from muru.com ([72.249.23.125]:46670 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1422405AbgJZLWr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:22:47 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E9AFD80AA;
        Mon, 26 Oct 2020 11:22:50 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Suman Anna <s-anna@ti.com>, Roger Quadros <rogerq@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 05/18] ARM: dts: Configure interconnect target module for am3 wkup_m3
Date:   Mon, 26 Oct 2020 13:22:09 +0200
Message-Id: <20201026112222.56894-6-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026112222.56894-1-tony@atomide.com>
References: <20201026112222.56894-1-tony@atomide.com>
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
 arch/arm/boot/dts/am33xx-l4.dtsi | 23 ++++++++++++++---------
 arch/arm/boot/dts/am33xx.dtsi    |  8 --------
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -32,20 +32,25 @@ segment@100000 {					/* 0x44d00000 */
 
 		target-module@0 {			/* 0x44d00000, ap 4 28.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "wkup_m3";
 			reg = <0x0 0x4>;
 			reg-names = "rev";
+			clocks = <&l4_wkup_aon_clkctrl AM3_L4_WKUP_AON_WKUP_M3_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0x0 0x0 0x4000>;
-			status = "disabled";
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
+				compatible = "ti,am3352-wkup-m3";
+				reg = <0x00000000 0x4000>,
+				      <0x00080000 0x2000>;
+				reg-names = "umem", "dmem";
+				resets = <&prm_wkup 3>;
+				reset-names = "rstctrl";
+				ti,pm-firmware = "am335x-pm-firmware.elf";
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -180,14 +180,6 @@ ocp: ocp {
 		ti,hwmods = "l3_main";
 
 		l4_wkup: interconnect@44c00000 {
-			wkup_m3: wkup_m3@100000 {
-				compatible = "ti,am3352-wkup-m3";
-				reg = <0x100000 0x4000>,
-				      <0x180000 0x2000>;
-				reg-names = "umem", "dmem";
-				ti,hwmods = "wkup_m3";
-				ti,pm-firmware = "am335x-pm-firmware.elf";
-			};
 		};
 		l4_per: interconnect@48000000 {
 		};
-- 
2.29.1
