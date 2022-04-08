Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72C3D4F9074
	for <lists+linux-omap@lfdr.de>; Fri,  8 Apr 2022 10:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbiDHIOb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Apr 2022 04:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbiDHIOZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Apr 2022 04:14:25 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2DC1A52B17;
        Fri,  8 Apr 2022 01:12:22 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 26291807E;
        Fri,  8 Apr 2022 08:09:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] ARM: dts: Drop unused ti,am4372-timer compatible
Date:   Fri,  8 Apr 2022 11:12:16 +0300
Message-Id: <20220408081216.57146-1-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Drop unused (and undocumented) ti,am4372-timer related compatible
properties to avoid dtb warnings when updating the binding to yaml.

The dual-mode timer instances on am43 are compatible with the am3
timers.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am437x-l4.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -361,7 +361,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x31000 0x1000>;
 
 			timer1: timer@0 {
-				compatible = "ti,am4372-timer-1ms","ti,am335x-timer-1ms";
+				compatible = "ti,am335x-timer-1ms";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-alwon;
@@ -906,7 +906,7 @@ timer2_target: target-module@40000 {	/* 0x48040000, ap 18 1e.0 */
 			ranges = <0x0 0x40000 0x1000>;
 
 			timer2: timer@0  {
-				compatible = "ti,am4372-timer","ti,am335x-timer";
+				compatible = "ti,am335x-timer";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&timer2_fck>;
@@ -933,7 +933,7 @@ target-module@42000 {			/* 0x48042000, ap 20 24.0 */
 			ranges = <0x0 0x42000 0x1000>;
 
 			timer3: timer@0 {
-				compatible = "ti,am4372-timer","ti,am335x-timer";
+				compatible = "ti,am335x-timer";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
@@ -959,7 +959,7 @@ target-module@44000 {			/* 0x48044000, ap 22 26.0 */
 			ranges = <0x0 0x44000 0x1000>;
 
 			timer4: timer@0 {
-				compatible = "ti,am4372-timer","ti,am335x-timer";
+				compatible = "ti,am335x-timer";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
@@ -986,7 +986,7 @@ target-module@46000 {			/* 0x48046000, ap 24 28.0 */
 			ranges = <0x0 0x46000 0x1000>;
 
 			timer5: timer@0 {
-				compatible = "ti,am4372-timer","ti,am335x-timer";
+				compatible = "ti,am335x-timer";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
@@ -1013,7 +1013,7 @@ target-module@48000 {			/* 0x48048000, ap 26 1a.0 */
 			ranges = <0x0 0x48000 0x1000>;
 
 			timer6: timer@0 {
-				compatible = "ti,am4372-timer","ti,am335x-timer";
+				compatible = "ti,am335x-timer";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
@@ -1040,7 +1040,7 @@ target-module@4a000 {			/* 0x4804a000, ap 71 48.0 */
 			ranges = <0x0 0x4a000 0x1000>;
 
 			timer7: timer@0 {
-				compatible = "ti,am4372-timer","ti,am335x-timer";
+				compatible = "ti,am335x-timer";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
 				ti,timer-pwm;
@@ -1549,7 +1549,7 @@ target-module@c1000 {			/* 0x481c1000, ap 94 68.0 */
 			ranges = <0x0 0xc1000 0x1000>;
 
 			timer8: timer@0 {
-				compatible = "ti,am4372-timer","ti,am335x-timer";
+				compatible = "ti,am335x-timer";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
@@ -2263,7 +2263,7 @@ target-module@3d000 {			/* 0x4833d000, ap 102 6e.0 */
 			ranges = <0x0 0x3d000 0x1000>;
 
 			timer9: timer@0 {
-				compatible = "ti,am4372-timer","ti,am335x-timer";
+				compatible = "ti,am335x-timer";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
@@ -2289,7 +2289,7 @@ target-module@3f000 {			/* 0x4833f000, ap 104 5c.0 */
 			ranges = <0x0 0x3f000 0x1000>;
 
 			timer10: timer@0 {
-				compatible = "ti,am4372-timer","ti,am335x-timer";
+				compatible = "ti,am335x-timer";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
@@ -2315,7 +2315,7 @@ target-module@41000 {			/* 0x48341000, ap 106 76.0 */
 			ranges = <0x0 0x41000 0x1000>;
 
 			timer11: timer@0 {
-				compatible = "ti,am4372-timer","ti,am335x-timer";
+				compatible = "ti,am335x-timer";
 				reg = <0x0 0x400>;
 				interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
-- 
2.35.1
