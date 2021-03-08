Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCCD3311C9
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 16:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbhCHPMC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 10:12:02 -0500
Received: from muru.com ([72.249.23.125]:41000 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231300AbhCHPLy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 10:11:54 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1873A8117;
        Mon,  8 Mar 2021 15:12:35 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 05/11] ARM: dts: Configure interconnect target module for omap5 sata
Date:   Mon,  8 Mar 2021 17:11:37 +0200
Message-Id: <20210308151143.27793-6-tony@atomide.com>
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
module, but keep the legacy "ti,hwmods" peroperty to avoid new boot
time warnings. The legacy property will be removed in later patches
together with the legacy platform data.

Note that the old sysc register offset is wrong, the real offset is at
0x1100 as listed in TRM for SATA_SYSCONFIG register. Looks like we've been
happily using sata on the bootloader configured sysconfig register and
nobody noticed. Also the old register range for SATAMAC_wrapper registers
is wrong at 7 while it should be 8. But that too seems harmless.

There is also an L3 parent interconnect range that we don't seem to be
using. That can be added as needed later on.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5-l4.dtsi | 28 +++++++++++++++++++++++++---
 arch/arm/boot/dts/omap5.dtsi    | 12 ------------
 2 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -691,11 +691,33 @@ target-module@a000 {			/* 0x4a10a000, ap 63 22.0 */
 		};
 
 		target-module@40000 {			/* 0x4a140000, ap 101 16.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
-			#address-cells = <1>;
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x400fc 4>,
+			      <0x41100 4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			power-domains = <&prm_l3init>;
+			clocks = <&l3init_clkctrl OMAP5_SATA_CLKCTRL 0>;
+			clock-names = "fck";
 			#size-cells = <1>;
+			#address-cells = <1>;
 			ranges = <0x0 0x40000 0x10000>;
+
+			sata: sata@0 {
+				compatible = "snps,dwc-ahci";
+				reg = <0 0x1100>, <0x1100 0x8>;
+				interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&sata_phy>;
+				phy-names = "sata-phy";
+				clocks = <&l3init_clkctrl OMAP5_SATA_CLKCTRL 8>;
+				ports-implemented = <0x1>;
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -428,18 +428,6 @@ bandgap: bandgap@4a0021e0 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		/* OCP2SCP3 */
-		sata: sata@4a141100 {
-			compatible = "snps,dwc-ahci";
-			reg = <0x4a140000 0x1100>, <0x4a141100 0x7>;
-			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&sata_phy>;
-			phy-names = "sata-phy";
-			clocks = <&l3init_clkctrl OMAP5_SATA_CLKCTRL 8>;
-			ti,hwmods = "sata";
-			ports-implemented = <0x1>;
-		};
-
 		target-module@56000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x5600fe00 0x4>,
-- 
2.30.1
