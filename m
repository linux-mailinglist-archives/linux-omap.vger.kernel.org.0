Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557F3298C00
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773548AbgJZLXE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:23:04 -0400
Received: from muru.com ([72.249.23.125]:46730 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1773545AbgJZLXE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:23:04 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5A66E80AA;
        Mon, 26 Oct 2020 11:23:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 15/18] ARM: dts: Use simple-pm-bus for genpd for am3 l4_per
Date:   Mon, 26 Oct 2020 13:22:19 +0200
Message-Id: <20201026112222.56894-16-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026112222.56894-1-tony@atomide.com>
References: <20201026112222.56894-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now enable simple-pm-bus to use genpd.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -851,7 +851,10 @@ target-module@3000 {			/* 0x4b143000, ap 6 04.0 */
 };
 
 &l4_per {						/* 0x48000000 */
-	compatible = "ti,am33xx-l4-per", "simple-bus";
+	compatible = "ti,am33xx-l4-per", "simple-pm-bus";
+	power-domains = <&prm_per>;
+	clocks = <&l4ls_clkctrl AM3_L4LS_L4_LS_CLKCTRL 0>;
+	clock-names = "fck";
 	reg = <0x48000000 0x800>,
 	      <0x48000800 0x800>,
 	      <0x48001000 0x400>,
@@ -869,7 +872,7 @@ &l4_per {						/* 0x48000000 */
 		 <0x46400000 0x46400000 0x400000>;	/* l3 data port */
 
 	segment@0 {					/* 0x48000000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00000000 0x000800>,	/* ap 0 */
@@ -1480,7 +1483,7 @@ target-module@cc000 {			/* 0x480cc000, ap 89 0e.0 */
 	};
 
 	segment@100000 {					/* 0x48100000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0008c000 0x0018c000 0x001000>,	/* ap 42 */
@@ -1864,7 +1867,7 @@ mmc2: mmc@0 {
 	};
 
 	segment@200000 {					/* 0x48200000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00200000 0x010000>;
@@ -1888,7 +1891,7 @@ mpu@0 {
 	};
 
 	segment@300000 {					/* 0x48300000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00300000 0x001000>,	/* ap 66 */
-- 
2.29.1
