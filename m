Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097D02B42A4
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbgKPLUg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:36 -0500
Received: from muru.com ([72.249.23.125]:48512 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729595AbgKPLUf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:35 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AEC1F80C8;
        Mon, 16 Nov 2020 11:20:40 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 14/17] ARM: dts: Use simple-pm-bus for genpd for am4 l4_per
Date:   Mon, 16 Nov 2020 13:19:36 +0200
Message-Id: <20201116111939.21405-15-tony@atomide.com>
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
 arch/arm/boot/dts/am437x-l4.dtsi | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -610,7 +610,10 @@ target-module@400000 {			/* 0x4a400000, ap 5 08.0 */
 };
 
 &l4_per {					/* 0x48000000 */
-	compatible = "ti,am4-l4-per", "simple-bus";
+	compatible = "ti,am4-l4-per", "simple-pm-bus";
+	power-domains = <&prm_per>;
+	clocks = <&l4ls_clkctrl AM4_L4LS_L4_LS_CLKCTRL 0>;
+	clock-names = "fck";
 	reg = <0x48000000 0x800>,
 	      <0x48000800 0x800>,
 	      <0x48001000 0x400>,
@@ -628,7 +631,7 @@ &l4_per {					/* 0x48000000 */
 		 <0x46400000 0x46400000 0x400000>;	/* l3 data port */
 
 	segment@0 {					/* 0x48000000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00000000 0x000800>,	/* ap 0 */
@@ -1203,7 +1206,7 @@ hwspinlock: spinlock@0 {
 	};
 
 	segment@100000 {					/* 0x48100000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0008c000 0x0018c000 0x001000>,	/* ap 34 */
@@ -1634,7 +1637,7 @@ mmc2: mmc@0 {
 	};
 
 	segment@200000 {					/* 0x48200000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00200000 0x010000>;
@@ -1658,7 +1661,7 @@ mpu@0 {
 	};
 
 	segment@300000 {					/* 0x48300000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00300000 0x001000>,	/* ap 56 */
-- 
2.29.2
