Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43804303D48
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 13:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391866AbhAZMmQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 07:42:16 -0500
Received: from muru.com ([72.249.23.125]:53460 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391884AbhAZMlr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 Jan 2021 07:41:47 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 99F3789E4;
        Tue, 26 Jan 2021 12:40:45 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-pci@vger.kernel.org
Subject: [PATCH 14/15] ARM: dts: Configure simple-pm-bus for dra7 l4_cfg
Date:   Tue, 26 Jan 2021 14:40:03 +0200
Message-Id: <20210126124004.52550-15-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126124004.52550-1-tony@atomide.com>
References: <20210126124004.52550-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe interconnects with device tree only configuration using
simple-pm-bus and genpd.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1,5 +1,8 @@
 &l4_cfg {						/* 0x4a000000 */
-	compatible = "ti,dra7-l4-cfg", "simple-bus";
+	compatible = "ti,dra7-l4-cfg", "simple-pm-bus";
+	power-domains = <&prm_coreaon>;
+	clocks = <&l4cfg_clkctrl DRA7_L4CFG_L4_CFG_CLKCTRL 0>;
+	clock-names = "fck";
 	reg = <0x4a000000 0x800>,
 	      <0x4a000800 0x800>,
 	      <0x4a001000 0x1000>;
@@ -11,7 +14,7 @@ &l4_cfg {						/* 0x4a000000 */
 		 <0x00200000 0x4a200000 0x100000>;	/* segment 2 */
 
 	segment@0 {					/* 0x4a000000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 0x00000000 0x000800>,	/* ap 0 */
@@ -493,7 +496,7 @@ hwspinlock: spinlock@0 {
 	};
 
 	segment@100000 {					/* 0x4a100000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00002000 0x00102000 0x001000>,	/* ap 27 */
@@ -812,7 +815,7 @@ target-module@87000 {			/* 0x4a187000, ap 75 74.0 */
 	};
 
 	segment@200000 {					/* 0x4a200000 */
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00018000 0x00218000 0x001000>,	/* ap 43 */
-- 
2.30.0
