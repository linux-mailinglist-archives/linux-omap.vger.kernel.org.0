Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC97298BFE
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769258AbgJZLXD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:23:03 -0400
Received: from muru.com ([72.249.23.125]:46726 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1773545AbgJZLXC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:23:02 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A5A3F8196;
        Mon, 26 Oct 2020 11:23:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 14/18] ARM: dts: Use simple-pm-bus for genpd for am3 l4_fast
Date:   Mon, 26 Oct 2020 13:22:18 +0200
Message-Id: <20201026112222.56894-15-tony@atomide.com>
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
 arch/arm/boot/dts/am33xx-l4.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -669,7 +669,10 @@ target-module@46000 {			/* 0x47c46000, ap 25 2c.0 */
 };
 
 &l4_fast {					/* 0x4a000000 */
-	compatible = "ti,am33xx-l4-fast", "simple-bus";
+	compatible = "ti,am33xx-l4-fast", "simple-pm-bus";
+	power-domains = <&prm_per>;
+	clocks = <&l4hs_clkctrl AM3_L4HS_L4_HS_CLKCTRL 0>;
+	clock-names = "fck";
 	reg = <0x4a000000 0x800>,
 	      <0x4a000800 0x800>,
 	      <0x4a001000 0x400>;
@@ -679,7 +682,7 @@ &l4_fast {					/* 0x4a000000 */
 	ranges = <0x00000000 0x4a000000 0x1000000>;	/* segment 0 */
 
 	segment@0 {					/* 0x4a000000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00000000 0x000800>,	/* ap 0 */
-- 
2.29.1
