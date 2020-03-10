Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFE31806CD
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 19:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbgCJSfY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 14:35:24 -0400
Received: from muru.com ([72.249.23.125]:59650 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727556AbgCJSfY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Mar 2020 14:35:24 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E2B12812F;
        Tue, 10 Mar 2020 18:36:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 08/10] ARM: dts: Configure interconnect target module for dm814x tptc3
Date:   Tue, 10 Mar 2020 11:35:02 -0700
Message-Id: <20200310183504.65358-9-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310183504.65358-1-tony@atomide.com>
References: <20200310183504.65358-1-tony@atomide.com>
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

Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dm814x.dtsi | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/dm814x.dtsi b/arch/arm/boot/dts/dm814x.dtsi
--- a/arch/arm/boot/dts/dm814x.dtsi
+++ b/arch/arm/boot/dts/dm814x.dtsi
@@ -621,12 +621,28 @@ edma_tptc2: dma@0 {
 			};
 		};
 
-		edma_tptc3: tptc@49b00000 {
-			compatible = "ti,edma3-tptc";
+		target-module@49b00000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
 			ti,hwmods = "tptc3";
-			reg =	<0x49b00000 0x100000>;
-			interrupts = <115>;
-			interrupt-names = "edma3_tcerrint";
+			reg = <0x49b00000 0x4>,
+			      <0x49b00010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&alwon_clkctrl DM814_TPTC3_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x49b00000 0x100000>;
+
+			edma_tptc3: dma@0 {
+				compatible = "ti,edma3-tptc";
+				reg = <0 0x100000>;
+				interrupts = <115>;
+				interrupt-names = "edma3_tcerrint";
+			};
 		};
 
 		/* See TRM "Table 1-318. L4HS Instance Summary" */
-- 
2.25.1
