Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8646330F9A
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhCHNjZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:39:25 -0500
Received: from muru.com ([72.249.23.125]:40864 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230476AbhCHNjR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:39:17 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 21DF280D4;
        Mon,  8 Mar 2021 13:39:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 04/12] ARM: dts: Configure interconnect target module for omap4 emif
Date:   Mon,  8 Mar 2021 15:39:02 +0200
Message-Id: <20210308133910.12454-5-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308133910.12454-1-tony@atomide.com>
References: <20210308133910.12454-1-tony@atomide.com>
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
 arch/arm/boot/dts/omap4.dtsi | 58 +++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -282,28 +282,50 @@ dmm@0 {
 			};
 		};
 
-		emif1: emif@4c000000 {
-			compatible = "ti,emif-4d";
-			reg = <0x4c000000 0x100>;
-			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+		target-module@4c000000 {
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
 			ti,hwmods = "emif1";
-			ti,no-idle-on-init;
-			phy-type = <1>;
-			hw-caps-read-idle-ctrl;
-			hw-caps-ll-interface;
-			hw-caps-temp-alert;
+			reg = <0x4c000000 0x4>;
+			reg-names = "rev";
+			clocks = <&l3_emif_clkctrl OMAP4_EMIF1_CLKCTRL 0>;
+			clock-names = "fck";
+			ti,no-idle;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x4c000000 0x1000000>;
+
+			emif1: emif@0 {
+				compatible = "ti,emif-4d";
+				reg = <0 0x100>;
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				phy-type = <1>;
+				hw-caps-read-idle-ctrl;
+				hw-caps-ll-interface;
+				hw-caps-temp-alert;
+			};
 		};
 
-		emif2: emif@4d000000 {
-			compatible = "ti,emif-4d";
-			reg = <0x4d000000 0x100>;
-			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+		target-module@4d000000 {
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
 			ti,hwmods = "emif2";
-			ti,no-idle-on-init;
-			phy-type = <1>;
-			hw-caps-read-idle-ctrl;
-			hw-caps-ll-interface;
-			hw-caps-temp-alert;
+			reg = <0x4d000000 0x4>;
+			reg-names = "rev";
+			clocks = <&l3_emif_clkctrl OMAP4_EMIF2_CLKCTRL 0>;
+			clock-names = "fck";
+			ti,no-idle;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x4d000000 0x1000000>;
+
+			emif2: emif@0 {
+				compatible = "ti,emif-4d";
+				reg = <0 0x100>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+				phy-type = <1>;
+				hw-caps-read-idle-ctrl;
+				hw-caps-ll-interface;
+				hw-caps-temp-alert;
+			};
 		};
 
 		dsp: dsp {
-- 
2.30.1
