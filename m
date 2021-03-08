Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572383311CF
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 16:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhCHPME (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 10:12:04 -0500
Received: from muru.com ([72.249.23.125]:41012 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231325AbhCHPL5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 10:11:57 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2603580D4;
        Mon,  8 Mar 2021 15:12:38 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 08/11] ARM: dts: Configure simple-pm-bus for omap5 l4_wkup
Date:   Mon,  8 Mar 2021 17:11:40 +0200
Message-Id: <20210308151143.27793-9-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308151143.27793-1-tony@atomide.com>
References: <20210308151143.27793-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe interconnects with device tree only configuration using
simple-pm-bus and genpd.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5-l4.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -2177,7 +2177,10 @@ segment@200000 {					/* 0x48200000 */
 };
 
 &l4_wkup {						/* 0x4ae00000 */
-	compatible = "ti,omap5-l4-wkup", "simple-bus";
+	compatible = "ti,omap5-l4-wkup", "simple-pm-bus";
+	power-domains = <&prm_wkupaon>;
+	clocks = <&wkupaon_clkctrl OMAP5_L4_WKUP_CLKCTRL 0>;
+	clock-names = "fck";
 	reg = <0x4ae00000 0x800>,
 	      <0x4ae00800 0x800>,
 	      <0x4ae01000 0x1000>;
@@ -2189,7 +2192,7 @@ &l4_wkup {						/* 0x4ae00000 */
 		 <0x00020000 0x4ae20000 0x010000>;	/* segment 2 */
 
 	segment@0 {					/* 0x4ae00000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00000000 0x000800>,	/* ap 0 */
@@ -2318,7 +2321,7 @@ scm_wkup_pad_conf_clocks: clocks@0 {
 	};
 
 	segment@10000 {					/* 0x4ae10000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00010000 0x001000>,	/* ap 5 */
@@ -2445,7 +2448,7 @@ keypad: keypad@0 {
 	};
 
 	segment@20000 {					/* 0x4ae20000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00006000 0x00026000 0x001000>,	/* ap 13 */
-- 
2.30.1
