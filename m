Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA58F1B7918
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgDXPNJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:13:09 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41496 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbgDXPNJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 11:13:09 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03OFCx27044746;
        Fri, 24 Apr 2020 10:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587741179;
        bh=MYAT0Aa9owA9g0FLmyO6mDeC8O5iim+uAuNm5Ll70/Y=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JFjqIn+JkAU1mcr0d2656JN/0AiDfEJbgH05Ofr7ulJxwG2M2tzjsF6P7RPQBqwOY
         vlvkhEHaLbOmRnxls9QU96crxLDi4JbathM5AOjpIZyB7j1J5hlkpFwmXh2oCMNzLS
         2FwjFEj+mM8lbmtn6u2VQqFxYzOuMlvE7OAdjIJY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03OFCxqD006407
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Apr 2020 10:12:59 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Apr 2020 10:12:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Apr 2020 10:12:59 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03OFCu79122378;
        Fri, 24 Apr 2020 10:12:58 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <s-anna@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 01/17] ARM: dts: dra7: add timer_sys_ck entries for IPU/DSP timers
Date:   Fri, 24 Apr 2020 18:12:28 +0300
Message-ID: <20200424151244.3225-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424151244.3225-1-t-kristo@ti.com>
References: <20200424151244.3225-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With this, the clocksource driver can setup the timers properly.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 50 ++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index 2119a78e9c15..1abd455cf15a 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1163,8 +1163,8 @@
 			timer2: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER2_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER2_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -1191,8 +1191,8 @@
 			timer3: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER3_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER3_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -1210,8 +1210,9 @@
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
 			/* Domains (P, C): l4per_pwrdm, l4per_clkdm */
-			clocks = <&l4per_clkctrl DRA7_L4PER_TIMER4_CLKCTRL 0>;
-			clock-names = "fck";
+			clocks = <&l4per_clkctrl DRA7_L4PER_TIMER4_CLKCTRL 0>,
+				 <&timer_sys_clk_div>;
+			clock-names = "fck", "timer_sys_ck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x36000 0x1000>;
@@ -1219,8 +1220,8 @@
 			timer4: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER4_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER4_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -1246,8 +1247,8 @@
 			timer9: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER9_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER9_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -1853,8 +1854,8 @@
 			timer10: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER10_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER10_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -1880,8 +1881,8 @@
 			timer11: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER11_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per_clkctrl DRA7_L4PER_TIMER11_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -3354,8 +3355,8 @@
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
 			/* Domains (P, C): ipu_pwrdm, ipu_clkdm */
-			clocks = <&ipu_clkctrl DRA7_IPU_TIMER5_CLKCTRL 0>;
-			clock-names = "fck";
+			clocks = <&ipu_clkctrl DRA7_IPU_TIMER5_CLKCTRL 0>, <&timer_sys_clk_div>;
+			clock-names = "fck", "timer_sys_ck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x20000 0x1000>;
@@ -3381,8 +3382,9 @@
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
 			/* Domains (P, C): ipu_pwrdm, ipu_clkdm */
-			clocks = <&ipu_clkctrl DRA7_IPU_TIMER6_CLKCTRL 0>;
-			clock-names = "fck";
+			clocks = <&ipu_clkctrl DRA7_IPU_TIMER6_CLKCTRL 0>,
+				 <&timer_sys_clk_div>;
+			clock-names = "fck", "timer_sys_ck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x22000 0x1000>;
@@ -3417,8 +3419,8 @@
 			timer7: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&ipu_clkctrl DRA7_IPU_TIMER7_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&ipu_clkctrl DRA7_IPU_TIMER7_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -3444,8 +3446,8 @@
 			timer8: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&ipu_clkctrl DRA7_IPU_TIMER8_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&ipu_clkctrl DRA7_IPU_TIMER8_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -3471,8 +3473,8 @@
 			timer13: timer@0 {
 				compatible = "ti,omap5430-timer";
 				reg = <0x0 0x80>;
-				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER13_CLKCTRL 24>;
-				clock-names = "fck";
+				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER13_CLKCTRL 24>, <&timer_sys_clk_div>;
+				clock-names = "fck", "timer_sys_ck";
 				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
 			};
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
