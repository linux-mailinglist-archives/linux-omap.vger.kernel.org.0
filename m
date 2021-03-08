Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 491523311C2
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 16:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbhCHPL7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 10:11:59 -0500
Received: from muru.com ([72.249.23.125]:40988 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231293AbhCHPLv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 10:11:51 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 09FBE80D4;
        Mon,  8 Mar 2021 15:12:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 02/11] ARM: dts: Configure interconnect target module for omap5 emif
Date:   Mon,  8 Mar 2021 17:11:34 +0200
Message-Id: <20210308151143.27793-3-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308151143.27793-1-tony@atomide.com>
References: <20210308151143.27793-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with device tree only configuration using
ti-sysc interconnect target module driver. Let's configure the
module, but keep the legacy "ti,hwmods" property to avoid new boot
time warnings. The legacy property will be removed in later patches
together with the legacy platform data.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5.dtsi | 62 ++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -266,28 +266,50 @@ dmm@0 {
 			};
 		};
 
-		emif1: emif@4c000000 {
-			compatible	= "ti,emif-4d5";
-			ti,hwmods	= "emif1";
-			ti,no-idle-on-init;
-			phy-type	= <2>; /* DDR PHY type: Intelli PHY */
-			reg = <0x4c000000 0x400>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
-			hw-caps-read-idle-ctrl;
-			hw-caps-ll-interface;
-			hw-caps-temp-alert;
+		target-module@4c000000 {
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
+			ti,hwmods = "emif1";
+			reg = <0x4c000000 0x4>;
+			reg-names = "rev";
+			clocks = <&emif_clkctrl OMAP5_EMIF1_CLKCTRL 0>;
+			clock-names = "fck";
+			ti,no-idle;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x4c000000 0x1000000>;
+
+			emif1: emif@0 {
+				compatible = "ti,emif-4d5";
+				reg = <0 0x400>;
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				phy-type = <2>; /* DDR PHY type: Intelli PHY */
+				hw-caps-read-idle-ctrl;
+				hw-caps-ll-interface;
+				hw-caps-temp-alert;
+			};
 		};
 
-		emif2: emif@4d000000 {
-			compatible	= "ti,emif-4d5";
-			ti,hwmods	= "emif2";
-			ti,no-idle-on-init;
-			phy-type	= <2>; /* DDR PHY type: Intelli PHY */
-			reg = <0x4d000000 0x400>;
-			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
-			hw-caps-read-idle-ctrl;
-			hw-caps-ll-interface;
-			hw-caps-temp-alert;
+		target-module@4d000000 {
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
+			ti,hwmods = "emif2";
+			reg = <0x4d000000 0x4>;
+			reg-names = "rev";
+			clocks = <&emif_clkctrl OMAP5_EMIF2_CLKCTRL 0>;
+			clock-names = "fck";
+			ti,no-idle;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x4d000000 0x1000000>;
+
+			emif2: emif@0 {
+				compatible = "ti,emif-4d5";
+				reg = <0 0x400>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+				phy-type = <2>; /* DDR PHY type: Intelli PHY */
+				hw-caps-read-idle-ctrl;
+				hw-caps-ll-interface;
+				hw-caps-temp-alert;
+			};
 		};
 
 		aes1_target: target-module@4b501000 {
-- 
2.30.1
