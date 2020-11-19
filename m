Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487692B936B
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbgKSNNP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:13:15 -0500
Received: from muru.com ([72.249.23.125]:48884 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727757AbgKSNNO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:13:14 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4A76380C1;
        Thu, 19 Nov 2020 13:13:19 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Suman Anna <s-anna@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Roger Quadros <rogerq@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 4/8] ARM: dts: Configure interconnect target module for dra7 iva
Date:   Thu, 19 Nov 2020 15:12:55 +0200
Message-Id: <20201119131259.63829-5-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119131259.63829-1-tony@atomide.com>
References: <20201119131259.63829-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with device tree only configuration using
ti-sysc interconnect target module driver.

Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7.dtsi          | 27 +++++++++++++++++++++++++++
 arch/arm/boot/dts/dra7xx-clocks.dtsi | 14 ++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -962,6 +962,32 @@ sham: sham@0 {
 			};
 		};
 
+		iva_hd_target: target-module@5a000000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x5a05a400 0x4>,
+			      <0x5a05a410 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			power-domains = <&prm_iva>;
+			resets = <&prm_iva 2>;
+			reset-names = "rstctrl";
+			clocks = <&iva_clkctrl DRA7_IVA_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x5a000000 0x5a000000 0x1000000>,
+				 <0x5b000000 0x5b000000 0x1000000>;
+
+			iva {
+				compatible = "ti,ivahd";
+			};
+		};
+
 		opp_supply_mpu: opp-supply@4a003b20 {
 			compatible = "ti,omap5-opp-supply";
 			reg = <0x4a003b20 0xc>;
@@ -1067,6 +1093,7 @@ prm_core: prm@700 {
 	prm_iva: prm@f00 {
 		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
 		reg = <0xf00 0x100>;
+		#reset-cells = <1>;
 		#power-domain-cells = <0>;
 	};
 
diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
--- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
@@ -1726,6 +1726,20 @@ l3instr_clkctrl: l3instr-clkctrl@20 {
 		};
 	};
 
+	iva_cm: iva-cm@f00 {
+		compatible = "ti,omap4-cm";
+		reg = <0xf00 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0xf00 0x100>;
+
+		iva_clkctrl: iva-clkctrl@20 {
+			compatible = "ti,clkctrl";
+			reg = <0x20 0xc>;
+			#clock-cells = <2>;
+		};
+	};
+
 	cam_cm: cam-cm@1000 {
 		compatible = "ti,omap4-cm";
 		reg = <0x1000 0x100>;
-- 
2.29.2
