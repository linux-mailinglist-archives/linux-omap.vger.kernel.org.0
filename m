Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A9530467B
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 19:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbhAZRXW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 12:23:22 -0500
Received: from muru.com ([72.249.23.125]:53174 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729034AbhAZIaZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 Jan 2021 03:30:25 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B8FAA8A33;
        Tue, 26 Jan 2021 08:27:44 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Balaji T K <balajitk@ti.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-pci@vger.kernel.org
Subject: [PATCH 10/27] ARM: dts: Configure simple-pm-bus for dra7 l4_wkup
Date:   Tue, 26 Jan 2021 10:26:59 +0200
Message-Id: <20210126082716.54358-11-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126082716.54358-1-tony@atomide.com>
References: <20210126082716.54358-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe interconnects with device tree only configuration using
simple-pm-bus and genpd.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -4228,7 +4228,10 @@ vpe: vpe@0 {
 };
 
 &l4_wkup {						/* 0x4ae00000 */
-	compatible = "ti,dra7-l4-wkup", "simple-bus";
+	compatible = "ti,dra7-l4-wkup", "simple-pm-bus";
+	power-domains = <&prm_wkupaon>;
+	clocks = <&wkupaon_clkctrl DRA7_WKUPAON_L4_WKUP_CLKCTRL 0>;
+	clock-names = "fck";
 	reg = <0x4ae00000 0x800>,
 	      <0x4ae00800 0x800>,
 	      <0x4ae01000 0x1000>;
@@ -4241,7 +4244,7 @@ &l4_wkup {						/* 0x4ae00000 */
 		 <0x00030000 0x4ae30000 0x010000>;	/* segment 3 */
 
 	segment@0 {					/* 0x4ae00000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00000000 0x000800>,	/* ap 0 */
@@ -4318,7 +4321,7 @@ scm_wkup: scm_conf@0 {
 	};
 
 	segment@10000 {					/* 0x4ae10000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00010000 0x001000>,	/* ap 5 */
@@ -4428,7 +4431,7 @@ target-module@c000 {			/* 0x4ae1c000, ap 11 38.0 */
 	};
 
 	segment@20000 {					/* 0x4ae20000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00006000 0x00026000 0x001000>,	/* ap 13 */
@@ -4534,7 +4537,7 @@ target-module@f000 {			/* 0x4ae2f000, ap 32 58.0 */
 	};
 
 	segment@30000 {					/* 0x4ae30000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0000c000 0x0003c000 0x002000>,	/* ap 30 */
-- 
2.30.0
