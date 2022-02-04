Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8864A955E
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 09:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357152AbiBDIoA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 03:44:00 -0500
Received: from muru.com ([72.249.23.125]:46446 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1357149AbiBDIoA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 03:44:00 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8126880F0;
        Fri,  4 Feb 2022 08:43:42 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 2/5] ARM: dts: Drop custom clkctrl compatible and update omap4 l4per
Date:   Fri,  4 Feb 2022 10:43:36 +0200
Message-Id: <20220204084339.12341-3-tony@atomide.com>
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
 arch/arm/boot/dts/omap44xx-clocks.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/omap44xx-clocks.dtsi b/arch/arm/boot/dts/omap44xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap44xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap44xx-clocks.dtsi
@@ -1424,7 +1424,7 @@ l3_init_clkctrl: clk@20 {
 		};
 	};
 
-	l4_per_cm: l4_per_cm@1400 {
+	l4_per_cm: clock@1400 {
 		compatible = "ti,omap4-cm";
 		clock-output-names = "l4_per_cm";
 		reg = <0x1400 0x200>;
@@ -1433,13 +1433,15 @@ l4_per_cm: l4_per_cm@1400 {
 		ranges = <0 0x1400 0x200>;
 
 		l4_per_clkctrl: clock@20 {
-			compatible = "ti,clkctrl-l4-per", "ti,clkctrl";
+			compatible = "ti,clkctrl";
+			clock-output-names = "l4_per_clkctrl";
 			reg = <0x20 0x144>;
 			#clock-cells = <2>;
 		};
 
 		l4_secure_clkctrl: clock@1a0 {
-			compatible = "ti,clkctrl-l4-secure", "ti,clkctrl";
+			compatible = "ti,clkctrl";
+			clock-output-names = "l4_secure_clkctrl";
 			reg = <0x1a0 0x3c>;
 			#clock-cells = <2>;
 		};
-- 
2.35.1
