Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C02330FAA
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhCHNjz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:39:55 -0500
Received: from muru.com ([72.249.23.125]:40892 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230194AbhCHNjY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:39:24 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6554A8117;
        Mon,  8 Mar 2021 13:40:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 11/12] ARM: dts: Configure simple-pm-bus for omap4 l4_cfg
Date:   Mon,  8 Mar 2021 15:39:09 +0200
Message-Id: <20210308133910.12454-12-tony@atomide.com>
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
 arch/arm/boot/dts/omap4-l4.dtsi | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 &l4_cfg {						/* 0x4a000000 */
-	compatible = "ti,omap4-l4-cfg", "simple-bus";
+	compatible = "ti,omap4-l4-cfg", "simple-pm-bus";
+	power-domains = <&prm_core>;
+	clocks = <&l4_cfg_clkctrl OMAP4_L4_CFG_CLKCTRL 0>;
+	clock-names = "fck";
 	reg = <0x4a000000 0x800>,
 	      <0x4a000800 0x800>,
 	      <0x4a001000 0x1000>;
@@ -16,7 +19,7 @@ &l4_cfg {						/* 0x4a000000 */
 		 <0x00300000 0x4a300000 0x080000>;	/* segment 6 */
 
 	segment@0 {					/* 0x4a000000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00000000 0x000800>,	/* ap 0 */
@@ -347,7 +350,7 @@ mmu_dsp: mmu@0 {
 	};
 
 	segment@80000 {					/* 0x4a080000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00059000 0x000d9000 0x001000>,	/* ap 13 */
@@ -639,7 +642,7 @@ hwspinlock: spinlock@0 {
 	};
 
 	segment@100000 {					/* 0x4a100000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00100000 0x001000>,	/* ap 21 */
@@ -741,13 +744,13 @@ target-module@a000 {			/* 0x4a10a000, ap 65 50.0 */
 	};
 
 	segment@180000 {					/* 0x4a180000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 	};
 
 	segment@200000 {					/* 0x4a200000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0001e000 0x0021e000 0x001000>,	/* ap 31 */
@@ -903,13 +906,13 @@ target-module@2a000 {			/* 0x4a22a000, ap 57 48.0 */
 	};
 
 	segment@280000 {					/* 0x4a280000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 	};
 
 	l4_cfg_segment_300000: segment@300000 {			/* 0x4a300000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00300000 0x020000>,	/* ap 67 */
-- 
2.30.1
