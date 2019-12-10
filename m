Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C88BB119F34
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfLJXRe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:17:34 -0500
Received: from muru.com ([72.249.23.125]:45060 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfLJXRd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:17:33 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B30028385;
        Tue, 10 Dec 2019 23:18:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 07/14] ARM: dts: Configure interconnect target module for am4 des
Date:   Tue, 10 Dec 2019 15:17:15 -0800
Message-Id: <20191210231722.44215-8-tony@atomide.com>
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
 arch/arm/boot/dts/am4372.dtsi | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -316,14 +316,35 @@ aes: aes@0 {
 			};
 		};
 
-		des: des@53701000 {
-			compatible = "ti,omap4-des";
+		des_target: target-module@53701000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "des";
-			reg = <0x53701000 0xa0>;
-			interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&edma 34 0>,
-				<&edma 33 0>;
-			dma-names = "tx", "rx";
+			reg = <0x53701030 0x4>,
+			      <0x53701034 0x4>,
+			      <0x53701038 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			ti,syss-mask = <1>;
+			/* Domains (P, C): per_pwrdm, l3_clkdm */
+			clocks = <&l3_clkctrl AM4_L3_DES_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x53701000 0x1000>;
+
+			des: des@0 {
+				compatible = "ti,omap4-des";
+				reg = <0 0xa0>;
+				interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&edma 34 0>,
+				       <&edma 33 0>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		gpmc: gpmc@50000000 {
-- 
2.24.0
