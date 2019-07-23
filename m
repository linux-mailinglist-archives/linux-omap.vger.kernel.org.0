Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D324E712DF
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 09:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388343AbfGWH3a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 03:29:30 -0400
Received: from muru.com ([72.249.23.125]:55574 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729058AbfGWH3a (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Jul 2019 03:29:30 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9ACD3808C;
        Tue, 23 Jul 2019 07:29:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, David Lechner <david@lechnology.com>
Subject: [PATCH] ARM: dts: Fix incomplete dts data for am3 and am4 mmc
Date:   Tue, 23 Jul 2019 00:29:23 -0700
Message-Id: <20190723072923.23750-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 4e27f752ab8c ("ARM: OMAP2+: Drop mmc platform data for am330x and
am43xx") dropped legacy mmc platform data for am3 and am4, but missed the
fact that we never updated the dts files for mmc3 that is directly on l3
interconnect instead of l4 interconnect. This leads to a situation with
no legacy platform data and incomplete dts data.

Let's update the mmc instances on l3 interconnect to probe properly with
ti-sysc interconnect target module driver to make mmc3 work again. Let's
still keep legacy "ti,hwmods" property around for v5.2 kernel and only
drop it later on.

Note that there is no need to use property status = "disabled" for mmc3.
The default for dts is enabled, and runtime PM will idle unused instances
just fine.

Fixes: 4e27f752ab8c ("ARM: OMAP2+: Drop mmc platform data for am330x and am43xx")
Reported-by: David Lechner <david@lechnology.com>
Tested-by: David Lechner <david@lechnology.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 32 ++++++++++++++++++++++++++------
 arch/arm/boot/dts/am4372.dtsi | 32 ++++++++++++++++++++++++++------
 2 files changed, 52 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -234,13 +234,33 @@
 			interrupt-names = "edma3_tcerrint";
 		};
 
-		mmc3: mmc@47810000 {
-			compatible = "ti,omap4-hsmmc";
+		target-module@47810000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "mmc3";
-			ti,needs-special-reset;
-			interrupts = <29>;
-			reg = <0x47810000 0x1000>;
-			status = "disabled";
+			reg = <0x478102fc 0x4>,
+			      <0x47810110 0x4>,
+			      <0x47810114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&l3s_clkctrl AM3_L3S_MMC3_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x47810000 0x1000>;
+
+			mmc3: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				ti,needs-special-reset;
+				interrupts = <29>;
+				reg = <0x0 0x1000>;
+			};
 		};
 
 		usb: usb@47400000 {
diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -228,13 +228,33 @@
 			interrupt-names = "edma3_tcerrint";
 		};
 
-		mmc3: mmc@47810000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x47810000 0x1000>;
+		target-module@47810000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "mmc3";
-			ti,needs-special-reset;
-			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
+			reg = <0x478102fc 0x4>,
+			      <0x47810110 0x4>,
+			      <0x47810114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&l3s_clkctrl AM4_L3S_MMC3_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x47810000 0x1000>;
+
+			mmc3: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				ti,needs-special-reset;
+				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x0 0x1000>;
+			};
 		};
 
 		sham: sham@53100000 {
-- 
2.21.0
