Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025DF21AB60
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 01:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgGIXUJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 19:20:09 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34582 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgGIXUI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jul 2020 19:20:08 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069NK3aE053728;
        Thu, 9 Jul 2020 18:20:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594336803;
        bh=bj6nkinvxoUBEjdlWJZuVGG0GefCFyrmKPpAuJeavTc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=YDfq/PKytLFJRXryu9Ga+CbOjFfCBU4OF2i2KTEzETIPvlxnZRW4CGS2Qf66ziQuL
         soAcyv4iUOc2fg2ilND/xv7hdCl+ZL63wSmc0E/BwZSrMhe5XiXIkyCLi2qY9kl/1N
         8Eb9OpCgfhMBgEJFuDNnCPUfH/HLiU0/9aP5AA9I=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NK3HK098998;
        Thu, 9 Jul 2020 18:20:03 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 18:20:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 18:20:02 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NK2PF118701;
        Thu, 9 Jul 2020 18:20:02 -0500
Received: from localhost ([10.250.34.57])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 069NK2d5124356;
        Thu, 9 Jul 2020 18:20:02 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 01/13] ARM: dts: omap4: Add timer_sys_ck clocks for timers
Date:   Thu, 9 Jul 2020 18:19:42 -0500
Message-ID: <20200709231954.1973-2-s-anna@ti.com>
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

The commit 1c7de9f27a65 ("clk: ti: omap4: cleanup unnecessary clock
aliases") has cleaned up all timer_sys_ck clock aliases and retained
only the timer_32k_ck clock alias. The OMAP clocksource timer driver
though still uses this clock alias when reconfiguring the parent
clock source for the timer functional clocks, so add these clocks
to all the timer nodes.

This is required by the OMAP remoteproc driver to successfully
acquire a timer and configure the source clock to be driven from
timer_sys_ck clock.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi | 20 ++++++++++-------
 arch/arm/boot/dts/omap4-l4.dtsi     | 35 +++++++++++++++++------------
 2 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
index a6feb201c569..b2cf5f41e222 100644
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -333,8 +333,9 @@ timer5: timer@0 {
 				compatible = "ti,omap4430-timer";
 				reg = <0x00000000 0x80>,
 				      <0x49038000 0x80>;
-				clocks = <&abe_clkctrl OMAP4_TIMER5_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&abe_clkctrl OMAP4_TIMER5_CLKCTRL 24>,
+					 <&syc_clk_div_ck>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-dsp;
 			};
@@ -363,8 +364,9 @@ timer6: timer@0 {
 				compatible = "ti,omap4430-timer";
 				reg = <0x00000000 0x80>,
 				      <0x4903a000 0x80>;
-				clocks = <&abe_clkctrl OMAP4_TIMER6_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&abe_clkctrl OMAP4_TIMER6_CLKCTRL 24>,
+					 <&syc_clk_div_ck>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-dsp;
 			};
@@ -393,8 +395,9 @@ timer7: timer@0 {
 				compatible = "ti,omap4430-timer";
 				reg = <0x00000000 0x80>,
 				      <0x4903c000 0x80>;
-				clocks = <&abe_clkctrl OMAP4_TIMER7_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&abe_clkctrl OMAP4_TIMER7_CLKCTRL 24>,
+					 <&syc_clk_div_ck>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-dsp;
 			};
@@ -423,8 +426,9 @@ timer8: timer@0 {
 				compatible = "ti,omap4430-timer";
 				reg = <0x00000000 0x80>,
 				      <0x4903e000 0x80>;
-				clocks = <&abe_clkctrl OMAP4_TIMER8_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&abe_clkctrl OMAP4_TIMER8_CLKCTRL 24>,
+					 <&syc_clk_div_ck>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
 				ti,timer-dsp;
diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
index fcc52121ff09..bf90a683d7b8 100644
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -1163,8 +1163,9 @@ SYSC_OMAP2_SOFTRESET |
 			timer1: timer@0 {
 				compatible = "ti,omap3430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4_wkup_clkctrl OMAP4_TIMER1_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4_wkup_clkctrl OMAP4_TIMER1_CLKCTRL 24>,
+					 <&sys_clkin_ck>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-alwon;
 			};
@@ -1439,8 +1440,9 @@ SYSC_OMAP2_SOFTRESET |
 			timer2: timer@0 {
 				compatible = "ti,omap3430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4_per_clkctrl OMAP4_TIMER2_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4_per_clkctrl OMAP4_TIMER2_CLKCTRL 24>,
+					 <&sys_clkin_ck>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -1466,8 +1468,9 @@ target-module@34000 {			/* 0x48034000, ap 7 04.0 */
 			timer3: timer@0 {
 				compatible = "ti,omap4430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4_per_clkctrl OMAP4_TIMER3_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4_per_clkctrl OMAP4_TIMER3_CLKCTRL 24>,
+					 <&sys_clkin_ck>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -1493,8 +1496,9 @@ target-module@36000 {			/* 0x48036000, ap 9 0e.0 */
 			timer4: timer@0 {
 				compatible = "ti,omap4430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4_per_clkctrl OMAP4_TIMER4_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4_per_clkctrl OMAP4_TIMER4_CLKCTRL 24>,
+					 <&sys_clkin_ck>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -1520,8 +1524,9 @@ target-module@3e000 {			/* 0x4803e000, ap 11 08.0 */
 			timer9: timer@0 {
 				compatible = "ti,omap4430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4_per_clkctrl OMAP4_TIMER9_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4_per_clkctrl OMAP4_TIMER9_CLKCTRL 24>,
+					 <&sys_clkin_ck>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
 			};
@@ -1954,8 +1959,9 @@ SYSC_OMAP2_SOFTRESET |
 			timer10: timer@0 {
 				compatible = "ti,omap3430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4_per_clkctrl OMAP4_TIMER10_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4_per_clkctrl OMAP4_TIMER10_CLKCTRL 24>,
+					 <&sys_clkin_ck>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
 			};
@@ -1982,8 +1988,9 @@ target-module@88000 {			/* 0x48088000, ap 45 2e.0 */
 			timer11: timer@0 {
 				compatible = "ti,omap4430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4_per_clkctrl OMAP4_TIMER11_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4_per_clkctrl OMAP4_TIMER11_CLKCTRL 24>,
+					 <&sys_clkin_ck>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
 			};
-- 
2.26.0

