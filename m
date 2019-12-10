Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 440D7119F36
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbfLJXRf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:17:35 -0500
Received: from muru.com ([72.249.23.125]:45066 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfLJXRf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:17:35 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A95778387;
        Tue, 10 Dec 2019 23:18:13 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 08/14] ARM: dts: Configure interconnect target module for dra7 des
Date:   Tue, 10 Dec 2019 15:17:16 -0800
Message-Id: <20191210231722.44215-9-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210231722.44215-1-tony@atomide.com>
References: <20191210231722.44215-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with device tree only configuration using
ti-sysc interconnect target module driver. Let's configure the
module, but keep the legacy "ti,hwmods" peroperty to avoid new boot
time warnings. The legacy property will be removed in later patches
together with the legacy platform data.

Cc: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 32 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/dra7.dtsi    | 11 -----------
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -2044,6 +2044,38 @@ target-module@a4000 {			/* 0x480a4000, ap 57 42.0 */
 				 <0x00001000 0x000a5000 0x00001000>;
 		};
 
+		des_target: target-module@a5000 {	/* 0x480a5000 */
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			ti,hwmods = "des";
+			reg = <0xa5030 0x4>,
+			      <0xa5034 0x4>,
+			      <0xa5038 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			ti,syss-mask = <1>;
+			/* Domains (P, C): l4per_pwrdm, l4sec_clkdm */
+			clocks = <&l4sec_clkctrl DRA7_L4SEC_DES_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0xa5000 0x00001000>;
+
+			des: des@0 {
+				compatible = "ti,omap4-des";
+				reg = <0 0xa0>;
+				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&sdma_xbar 117>, <&sdma_xbar 116>;
+				dma-names = "tx", "rx";
+				clocks = <&l3_iclk_div>;
+				clock-names = "fck";
+			};
+		};
+
 		target-module@a8000 {			/* 0x480a8000, ap 59 1a.0 */
 			compatible = "ti,sysc";
 			status = "disabled";
diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -716,17 +716,6 @@ aes2: aes@0 {
 			};
 		};
 
-		des: des@480a5000 {
-			compatible = "ti,omap4-des";
-			ti,hwmods = "des";
-			reg = <0x480a5000 0xa0>;
-			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&sdma_xbar 117>, <&sdma_xbar 116>;
-			dma-names = "tx", "rx";
-			clocks = <&l3_iclk_div>;
-			clock-names = "fck";
-		};
-
 		sham_target: target-module@4b101000 {
 			compatible = "ti,sysc-omap3-sham", "ti,sysc";
 			ti,hwmods = "sham";
-- 
2.24.0
