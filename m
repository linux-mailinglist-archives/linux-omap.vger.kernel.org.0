Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2FC330FAD
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbhCHNjz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:39:55 -0500
Received: from muru.com ([72.249.23.125]:40888 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhCHNjX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:39:23 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 61ABE80D4;
        Mon,  8 Mar 2021 13:40:05 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 10/12] ARM: dts: Configure simple-pm-bus for omap4 l4_per
Date:   Mon,  8 Mar 2021 15:39:08 +0200
Message-Id: <20210308133910.12454-11-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308133910.12454-1-tony@atomide.com>
References: <20210308133910.12454-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe interconnects with device tree only configuration using
simple-pm-bus and genpd.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -1287,7 +1287,10 @@ target-module@6000 {			/* 0x4a326000, ap 13 28.0 */
 };
 
 &l4_per {						/* 0x48000000 */
-	compatible = "ti,omap4-l4-per", "simple-bus";
+	compatible = "ti,omap4-l4-per", "simple-pm-bus";
+	power-domains = <&prm_l4per>;
+	clocks = <&l4_per_clkctrl OMAP4_L4_PER_CLKCTRL 0>;
+	clock-names = "fck";
 	reg = <0x48000000 0x800>,
 	      <0x48000800 0x800>,
 	      <0x48001000 0x400>,
@@ -1301,7 +1304,7 @@ &l4_per {						/* 0x48000000 */
 		 <0x00200000 0x48200000 0x200000>;	/* segment 1 */
 
 	segment@0 {					/* 0x48000000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00000000 0x000800>,	/* ap 0 */
@@ -2440,7 +2443,7 @@ mmc5: mmc@0 {
 	};
 
 	segment@200000 {					/* 0x48200000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00150000 0x00350000 0x001000>,	/* ap 77 */
-- 
2.30.1
