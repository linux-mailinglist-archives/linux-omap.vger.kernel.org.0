Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 730AD21AB6D
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 01:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgGIXUO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 19:20:14 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47042 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgGIXUN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jul 2020 19:20:13 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069NK4r7038453;
        Thu, 9 Jul 2020 18:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594336804;
        bh=c0U/6UXwkjm96QgVwEXr+Y99qTURmUnIxiiCuECGvik=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=qsqkk/y7uOV3in98PC1/xYuP038z7MhEE6m0wjq3v8BEqWU2xLPWJCFxWAwRW9dFt
         YYqL44+lgodeAhBSV5bYznK9BSX3/77m5kX5nZWj/eaRBsbBEJVDAPsdmfc3YU1Utw
         TpfhX3qYKdYOQ9nuf3uENGagEUoylp9qP5N4Ot8w=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 069NK4Yo011912
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Jul 2020 18:20:04 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 18:20:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 18:20:04 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NK4B3119019;
        Thu, 9 Jul 2020 18:20:04 -0500
Received: from localhost ([10.250.34.57])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 069NK3qT124367;
        Thu, 9 Jul 2020 18:20:03 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 02/13] ARM: dts: omap5: Add timer_sys_ck clocks for timers
Date:   Thu, 9 Jul 2020 18:19:43 -0500
Message-ID: <20200709231954.1973-3-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200709231954.1973-1-s-anna@ti.com>
References: <20200709231954.1973-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The commit d41e53040926 ("clk: ti: omap5: cleanup unnecessary clock
aliases") has cleaned up all timer_sys_ck clock aliases and retained
only the timer_32k_ck clock alias. The OMAP clocksource timer driver
though still uses this clock alias when reconfiguring the parent
clock source for the timer functional clocks, so add these clocks
to all the timer nodes except for the always-on timers 1 and 12.

This is required by the OMAP remoteproc driver to successfully
acquire a timer and configure the source clock to be driven from
timer_sys_ck clock.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap5-l4-abe.dtsi | 20 ++++++++++-------
 arch/arm/boot/dts/omap5-l4.dtsi     | 35 +++++++++++++++++------------
 2 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4-abe.dtsi b/arch/arm/boot/dts/omap5-l4-abe.dtsi
index bafd6adf9f45..25b7fce8de2d 100644
--- a/arch/arm/boot/dts/omap5-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap5-l4-abe.dtsi
@@ -298,8 +298,9 @@ timer5: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>,
 				      <0x49038000 0x80>;
-				clocks = <&abe_clkctrl OMAP5_TIMER5_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&abe_clkctrl OMAP5_TIMER5_CLKCTRL 24>,
+					 <&dss_syc_gfclk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-dsp;
 				ti,timer-pwm;
@@ -329,8 +330,9 @@ timer6: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>,
 				      <0x4903a000 0x80>;
-				clocks = <&abe_clkctrl OMAP5_TIMER6_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&abe_clkctrl OMAP5_TIMER6_CLKCTRL 24>,
+					 <&dss_syc_gfclk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-dsp;
 				ti,timer-pwm;
@@ -360,8 +362,9 @@ timer7: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>,
 				      <0x4903c000 0x80>;
-				clocks = <&abe_clkctrl OMAP5_TIMER7_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&abe_clkctrl OMAP5_TIMER7_CLKCTRL 24>,
+					 <&dss_syc_gfclk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-dsp;
 			};
@@ -390,8 +393,9 @@ timer8: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>,
 				      <0x4903e000 0x80>;
-				clocks = <&abe_clkctrl OMAP5_TIMER8_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&abe_clkctrl OMAP5_TIMER8_CLKCTRL 24>,
+					 <&dss_syc_gfclk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-dsp;
 				ti,timer-pwm;
diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
index 5217805bf126..683394d1e4d6 100644
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -1082,8 +1082,9 @@ target-module@32000 {			/* 0x48032000, ap 5 3e.0 */
 			timer2: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per_clkctrl OMAP5_TIMER2_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per_clkctrl OMAP5_TIMER2_CLKCTRL 24>,
+					 <&sys_clkin>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -1109,8 +1110,9 @@ target-module@34000 {			/* 0x48034000, ap 7 46.0 */
 			timer3: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per_clkctrl OMAP5_TIMER3_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per_clkctrl OMAP5_TIMER3_CLKCTRL 24>,
+					 <&sys_clkin>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -1136,8 +1138,9 @@ target-module@36000 {			/* 0x48036000, ap 9 4e.0 */
 			timer4: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per_clkctrl OMAP5_TIMER4_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per_clkctrl OMAP5_TIMER4_CLKCTRL 24>,
+					 <&sys_clkin>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -1163,8 +1166,9 @@ target-module@3e000 {			/* 0x4803e000, ap 11 56.0 */
 			timer9: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per_clkctrl OMAP5_TIMER9_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per_clkctrl OMAP5_TIMER9_CLKCTRL 24>,
+					 <&sys_clkin>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
 			};
@@ -1730,8 +1734,9 @@ target-module@86000 {			/* 0x48086000, ap 41 5e.0 */
 			timer10: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per_clkctrl OMAP5_TIMER10_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per_clkctrl OMAP5_TIMER10_CLKCTRL 24>,
+					 <&sys_clkin>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
 			};
@@ -1758,8 +1763,9 @@ target-module@88000 {			/* 0x48088000, ap 43 66.0 */
 			timer11: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per_clkctrl OMAP5_TIMER11_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per_clkctrl OMAP5_TIMER11_CLKCTRL 24>,
+					 <&sys_clkin>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
 			};
@@ -2387,8 +2393,9 @@ timer1_target: target-module@8000 {	/* 0x4ae18000, ap 9 18.0 */
 			timer1: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&wkupaon_clkctrl OMAP5_TIMER1_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&wkupaon_clkctrl OMAP5_TIMER1_CLKCTRL 24>,
+					 <&sys_clkin>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-alwon;
 			};
-- 
2.26.0

