Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 967D9119F30
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfLJXRb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:17:31 -0500
Received: from muru.com ([72.249.23.125]:45048 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfLJXRb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:17:31 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 453938387;
        Tue, 10 Dec 2019 23:18:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 05/14] ARM: dts: Configure interconnect target module for am4 aes
Date:   Tue, 10 Dec 2019 15:17:13 -0800
Message-Id: <20191210231722.44215-6-tony@atomide.com>
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
@@ -285,14 +285,35 @@ sham: sham@0 {
 			};
 		};
 
-		aes: aes@53501000 {
-			compatible = "ti,omap4-aes";
+		aes_target: target-module@53501000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "aes";
-			reg = <0x53501000 0xa0>;
-			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&edma 6 0>,
-				<&edma 5 0>;
-			dma-names = "tx", "rx";
+			reg = <0x53501080 0x4>,
+			      <0x53501084 0x4>,
+			      <0x53501088 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			ti,syss-mask = <1>;
+			/* Domains (P, C): per_pwrdm, l3_clkdm */
+			clocks = <&l3_clkctrl AM4_L3_AES_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x53501000 0x1000>;
+
+			aes: aes@0 {
+				compatible = "ti,omap4-aes";
+				reg = <0 0xa0>;
+				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&edma 6 0>,
+				      <&edma 5 0>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		des: des@53701000 {
-- 
2.24.0
