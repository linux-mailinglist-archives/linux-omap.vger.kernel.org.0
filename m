Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25B28119F27
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfLJXR1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:17:27 -0500
Received: from muru.com ([72.249.23.125]:45028 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfLJXR1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:17:27 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D8A568385;
        Tue, 10 Dec 2019 23:18:05 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 01/14] ARM: dts: Configure interconnect target module for am3 sham
Date:   Tue, 10 Dec 2019 15:17:09 -0800
Message-Id: <20191210231722.44215-2-tony@atomide.com>
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

I could not find any documentation for the sysc register on this one,
but it seems to work just fine with "ti,sysc-omap3-sham" compatible
style configuration.

Cc: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -439,13 +439,33 @@ gpmc: gpmc@50000000 {
 			status = "disabled";
 		};
 
-		sham: sham@53100000 {
-			compatible = "ti,omap4-sham";
+		sham_target: target-module@53100000 {
+			compatible = "ti,sysc-omap3-sham", "ti,sysc";
 			ti,hwmods = "sham";
-			reg = <0x53100000 0x200>;
-			interrupts = <109>;
-			dmas = <&edma 36 0>;
-			dma-names = "rx";
+			reg = <0x53100100 0x4>,
+			      <0x53100110 0x4>,
+			      <0x53100114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			/* Domains (P, C): per_pwrdm, l3_clkdm */
+			clocks = <&l3_clkctrl AM3_L3_SHAM_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x53100000 0x1000>;
+
+			sham: sham@0 {
+				compatible = "ti,omap4-sham";
+				reg = <0 0x200>;
+				interrupts = <109>;
+				dmas = <&edma 36 0>;
+				dma-names = "rx";
+			};
 		};
 
 		aes: aes@53500000 {
-- 
2.24.0
