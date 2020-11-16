Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436482B42A0
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbgKPLUd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:33 -0500
Received: from muru.com ([72.249.23.125]:48506 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729595AbgKPLUd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:33 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 88479813D;
        Mon, 16 Nov 2020 11:20:38 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 13/17] ARM: dts: Use simple-pm-bus for genpd for am4 l4_fast
Date:   Mon, 16 Nov 2020 13:19:35 +0200
Message-Id: <20201116111939.21405-14-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116111939.21405-1-tony@atomide.com>
References: <20201116111939.21405-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now enable simple-pm-bus to use genpd.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am437x-l4.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -492,7 +492,10 @@ target-module@88000 {			/* 0x44e88000, ap 38 12.0 */
 };
 
 &l4_fast {					/* 0x4a000000 */
-	compatible = "ti,am4-l4-fast", "simple-bus";
+	compatible = "ti,am4-l4-fast", "simple-pm-bus";
+	power-domains = <&prm_per>;
+	clocks = <&l3_clkctrl AM4_L3_L4_HS_CLKCTRL 0>;
+	clock-names = "fck";
 	reg = <0x4a000000 0x800>,
 	      <0x4a000800 0x800>,
 	      <0x4a001000 0x400>;
@@ -502,7 +505,7 @@ &l4_fast {					/* 0x4a000000 */
 	ranges = <0x00000000 0x4a000000 0x1000000>;	/* segment 0 */
 
 	segment@0 {					/* 0x4a000000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00000000 0x000800>,	/* ap 0 */
-- 
2.29.2
