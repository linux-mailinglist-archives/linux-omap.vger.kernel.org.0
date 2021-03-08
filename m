Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92C3330FA3
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhCHNjy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:39:54 -0500
Received: from muru.com ([72.249.23.125]:40886 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhCHNjW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:39:22 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 643748117;
        Mon,  8 Mar 2021 13:40:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 09/12] ARM: dts: Configure simple-pm-bus for omap4 l4_wkup
Date:   Mon,  8 Mar 2021 15:39:07 +0200
Message-Id: <20210308133910.12454-10-tony@atomide.com>
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
 arch/arm/boot/dts/omap4-l4.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -944,7 +944,10 @@ l4_cfg_target_0: target-module@0 {	/* 0x4a300000, ap 67 14.0 */
 };
 
 &l4_wkup {						/* 0x4a300000 */
-	compatible = "ti,omap4-l4-wkup", "simple-bus";
+	compatible = "ti,omap4-l4-wkup", "simple-pm-bus";
+	power-domains = <&prm_wkup>;
+	clocks = <&l4_wkup_clkctrl OMAP4_L4_WKUP_CLKCTRL 0>;
+	clock-names = "fck";
 	reg = <0x4a300000 0x800>,
 	      <0x4a300800 0x800>,
 	      <0x4a301000 0x1000>;
@@ -956,7 +959,7 @@ &l4_wkup {						/* 0x4a300000 */
 		 <0x00020000 0x4a320000 0x010000>;	/* segment 2 */
 
 	segment@0 {					/* 0x4a300000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00000000 0x000800>,	/* ap 0 */
@@ -1062,7 +1065,7 @@ omap4_scm_wkup: scm@c000 {
 	};
 
 	segment@10000 {					/* 0x4a310000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00010000 0x001000>,	/* ap 5 */
@@ -1231,7 +1234,7 @@ omap4_pmx_wkup: pinmux@40 {
 	};
 
 	segment@20000 {					/* 0x4a320000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00006000 0x00026000 0x001000>,	/* ap 13 */
-- 
2.30.1
