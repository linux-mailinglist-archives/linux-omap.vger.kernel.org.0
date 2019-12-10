Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAC08119EA0
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2019 23:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfLJWyj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 17:54:39 -0500
Received: from muru.com ([72.249.23.125]:44984 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727349AbfLJWyj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 17:54:39 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1D95F8385;
        Tue, 10 Dec 2019 22:55:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 1/6] ARM: dts: Configure interconnect target module for omap4 sham
Date:   Tue, 10 Dec 2019 14:54:28 -0800
Message-Id: <20191210225433.2720-2-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225433.2720-1-tony@atomide.com>
References: <20191210225433.2720-1-tony@atomide.com>
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

Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -293,13 +293,33 @@ des: des@480a5000 {
 			dma-names = "tx", "rx";
 		};
 
-		sham: sham@4b100000 {
-			compatible = "ti,omap4-sham";
+		sham_target: target-module@4b100000 {
+			compatible = "ti,sysc-omap3-sham", "ti,sysc";
 			ti,hwmods = "sham";
-			reg = <0x4b100000 0x300>;
-			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&sdma 119>;
-			dma-names = "rx";
+			reg = <0x4b100100 0x4>,
+			      <0x4b100110 0x4>,
+			      <0x4b100114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			/* Domains (P, C): l4per_pwrdm, l4_secure_clkdm */
+			clocks = <&l4_secure_clkctrl OMAP4_SHA2MD5_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x4b100000 0x1000>;
+
+			sham: sham@0 {
+				compatible = "ti,omap4-sham";
+				reg = <0 0x300>;
+				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&sdma 119>;
+				dma-names = "rx";
+			};
 		};
 
 		abb_mpu: regulator-abb-mpu {
-- 
2.24.0
