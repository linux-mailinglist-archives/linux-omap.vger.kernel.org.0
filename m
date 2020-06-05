Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB82F1F02C8
	for <lists+linux-omap@lfdr.de>; Sat,  6 Jun 2020 00:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgFEWN7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Jun 2020 18:13:59 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44742 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728157AbgFEWN5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Jun 2020 18:13:57 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 055MDsSV057449;
        Fri, 5 Jun 2020 17:13:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591395234;
        bh=11Q7E+lw4j1rNv1CKwvvk5jfXb6C/P02EK/54lLzR3U=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fVDjOhFomDuJOzKrwh4s3uhqUM5ItgvesEFIkYIixSxKLGG7wWVly/lfaIAUAew0U
         lbV2qTHvOItygB6ZhjF0sLR/ZKp0jVAkKRcCEL/z0vQdahUc2Ow6XxPQYNgY38yz7Z
         bFRjZ41+ioYZrxCuIPcVKNlQFepglO6iHTvfgoO8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 055MDs9B019160;
        Fri, 5 Jun 2020 17:13:54 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Jun
 2020 17:13:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Jun 2020 17:13:54 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 055MDsaV120104;
        Fri, 5 Jun 2020 17:13:54 -0500
Received: from localhost ([10.250.70.56])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 055MDr5q005507;
        Fri, 5 Jun 2020 17:13:53 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/2] ARM: dts: dra7: Fix timer nodes properly for timer_sys_ck clocks
Date:   Fri, 5 Jun 2020 17:13:46 -0500
Message-ID: <20200605221347.15735-2-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200605221347.15735-1-s-anna@ti.com>
References: <20200605221347.15735-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The commit 5390130f3b28 ("ARM: dts: dra7: add timer_sys_ck entries
for IPU/DSP timers") was added to allow the OMAP clocksource timer
driver to use the clock aliases when reconfiguring the parent clock
source for the timer functional clocks after the timer_sys_ck clock
aliases got cleaned up in commit a8202cd5174d ("clk: ti: dra7: drop
unnecessary clock aliases").

The above patch however has missed adding the entries for couple of
timers (14, 15 and 16), and also added erroneously in the parent
ti-sysc nodes for couple of clocks (timers 4, 5 and 6). Fix these
properly, so that any of these timers can be used with OMAP remoteproc
IPU and DSP devices. The always-on timers 1 and 12 are not expected
to use this clock source, so they are not modified.

Fixes: 5390130f3b28 ("ARM: dts: dra7: add timer_sys_ck entries for IPU/DSP timers")
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index 62ca89551219..0c6f26605506 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1207,9 +1207,8 @@ target-module@36000 {			/* 0x48036000, ap 9 4e.0 */
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
 			/* Domains (P, C): l4per_pwrdm, l4per_clkdm */
-			clocks = <&l4per_clkctrl DRA7_L4PER_TIMER4_CLKCTRL 0>,
-				 <&timer_sys_clk_div>;
-			clock-names = "fck", "timer_sys_ck";
+			clocks = <&l4per_clkctrl DRA7_L4PER_TIMER4_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x36000 0x1000>;
@@ -3352,8 +3351,8 @@ target-module@20000 {			/* 0x48820000, ap 5 08.0 */
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
 			/* Domains (P, C): ipu_pwrdm, ipu_clkdm */
-			clocks = <&ipu_clkctrl DRA7_IPU_TIMER5_CLKCTRL 0>, <&timer_sys_clk_div>;
-			clock-names = "fck", "timer_sys_ck";
+			clocks = <&ipu_clkctrl DRA7_IPU_TIMER5_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x20000 0x1000>;
@@ -3361,8 +3360,8 @@ target-module@20000 {			/* 0x48820000, ap 5 08.0 */
 			timer5: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&ipu_clkctrl DRA7_IPU_TIMER5_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&ipu_clkctrl DRA7_IPU_TIMER5_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -3379,9 +3378,8 @@ target-module@22000 {			/* 0x48822000, ap 7 24.0 */
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
 			/* Domains (P, C): ipu_pwrdm, ipu_clkdm */
-			clocks = <&ipu_clkctrl DRA7_IPU_TIMER6_CLKCTRL 0>,
-				 <&timer_sys_clk_div>;
-			clock-names = "fck", "timer_sys_ck";
+			clocks = <&ipu_clkctrl DRA7_IPU_TIMER6_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x22000 0x1000>;
@@ -3389,8 +3387,8 @@ target-module@22000 {			/* 0x48822000, ap 7 24.0 */
 			timer6: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&ipu_clkctrl DRA7_IPU_TIMER6_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&ipu_clkctrl DRA7_IPU_TIMER6_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -3498,8 +3496,8 @@ target-module@2a000 {			/* 0x4882a000, ap 15 10.0 */
 			timer14: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER14_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER14_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
 			};
@@ -3526,8 +3524,8 @@ target-module@2c000 {			/* 0x4882c000, ap 17 02.0 */
 			timer15: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER15_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER15_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
 			};
@@ -3554,8 +3552,8 @@ target-module@2e000 {			/* 0x4882e000, ap 19 14.0 */
 			timer16: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER16_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER16_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
 			};
-- 
2.26.0

