Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B27298BFC
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773542AbgJZLXC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:23:02 -0400
Received: from muru.com ([72.249.23.125]:46718 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1773545AbgJZLXB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:23:01 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E8EF480AA;
        Mon, 26 Oct 2020 11:23:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 13/18] ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup
Date:   Mon, 26 Oct 2020 13:22:17 +0200
Message-Id: <20201026112222.56894-14-tony@atomide.com>
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
 arch/arm/boot/dts/am33xx-l4.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1,5 +1,8 @@
 &l4_wkup {						/* 0x44c00000 */
-	compatible = "ti,am33xx-l4-wkup", "simple-bus";
+	compatible = "ti,am33xx-l4-wkup", "simple-pm-bus";
+	power-domains = <&prm_wkup>;
+	clocks = <&l4_wkup_clkctrl AM3_L4_WKUP_L4_WKUP_CLKCTRL 0>;
+	clock-names = "fck";
 	reg = <0x44c00000 0x800>,
 	      <0x44c00800 0x800>,
 	      <0x44c01000 0x400>,
@@ -12,7 +15,7 @@ &l4_wkup {						/* 0x44c00000 */
 		 <0x00200000 0x44e00000 0x100000>;	/* segment 2 */
 
 	segment@0 {					/* 0x44c00000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00000000 0x000800>,	/* ap 0 */
@@ -22,7 +25,7 @@ segment@0 {					/* 0x44c00000 */
 	};
 
 	segment@100000 {					/* 0x44d00000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00100000 0x004000>,	/* ap 4 */
@@ -54,7 +57,7 @@ wkup_m3: cpu@0 {
 	};
 
 	segment@200000 {					/* 0x44e00000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00200000 0x002000>,	/* ap 8 */
-- 
2.29.1
