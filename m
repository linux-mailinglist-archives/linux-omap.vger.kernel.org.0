Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCD84A9563
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 09:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357160AbiBDIoE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 03:44:04 -0500
Received: from muru.com ([72.249.23.125]:46456 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1357149AbiBDIoD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 03:44:03 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B0A8580F0;
        Fri,  4 Feb 2022 08:43:45 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 4/5] ARM: dts: Drop custom clkctrl compatible and update omap5 l4per
Date:   Fri,  4 Feb 2022 10:43:38 +0200
Message-Id: <20220204084339.12341-5-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204084339.12341-1-tony@atomide.com>
References: <20220204084339.12341-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now use the clock-output-names and don't need custom compatible
values for each clkctrl instance. And we can use a generic name also for
the clock manager instance.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap54xx-clocks.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/omap54xx-clocks.dtsi b/arch/arm/boot/dts/omap54xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap54xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap54xx-clocks.dtsi
@@ -1260,7 +1260,7 @@ l3instr_clkctrl: clk@20 {
 		};
 	};
 
-	l4per_cm: l4per_cm@1000 {
+	l4per_cm: clock@1000 {
 		compatible = "ti,omap4-cm";
 		clock-output-names = "l4per_cm";
 		reg = <0x1000 0x200>;
@@ -1269,13 +1269,15 @@ l4per_cm: l4per_cm@1000 {
 		ranges = <0 0x1000 0x200>;
 
 		l4per_clkctrl: clock@20 {
-			compatible = "ti,clkctrl-l4per", "ti,clkctrl";
+			compatible = "ti,clkctrl";
+			clock-output-names = "l4per_clkctrl";
 			reg = <0x20 0x15c>;
 			#clock-cells = <2>;
 		};
 
 		l4sec_clkctrl: clock@1a0 {
-			compatible = "ti,clkctrl-l4sec", "ti,clkctrl";
+			compatible = "ti,clkctrl";
+			clock-output-names = "l4sec_clkctrl";
 			reg = <0x1a0 0x3c>;
 			#clock-cells = <2>;
 		};
-- 
2.35.1
