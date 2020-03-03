Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 966E1178567
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 23:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbgCCWPp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 17:15:45 -0500
Received: from muru.com ([72.249.23.125]:58692 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726809AbgCCWPp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Mar 2020 17:15:45 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BA83480EE;
        Tue,  3 Mar 2020 22:16:30 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 07/14] ARM: dts: Configure interconnect target module for am4 tptc0
Date:   Tue,  3 Mar 2020 14:15:21 -0800
Message-Id: <20200303221528.49099-8-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303221528.49099-1-tony@atomide.com>
References: <20200303221528.49099-1-tony@atomide.com>
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

Let's also correct the custom node name to use generic node name dma.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -215,12 +215,28 @@ edma: dma@0 {
 			};
 		};
 
-		edma_tptc0: tptc@49800000 {
-			compatible = "ti,edma3-tptc";
+		target-module@49800000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
 			ti,hwmods = "tptc0";
-			reg =	<0x49800000 0x100000>;
-			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "edma3_tcerrint";
+			reg = <0x49800000 0x4>,
+			      <0x49800010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&l3_clkctrl AM4_L3_TPTC0_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x49800000 0x100000>;
+
+			edma_tptc0: dma@0 {
+				compatible = "ti,edma3-tptc";
+				reg = <0 0x100000>;
+				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "edma3_tcerrint";
+			};
 		};
 
 		edma_tptc1: tptc@49900000 {
-- 
2.25.1
