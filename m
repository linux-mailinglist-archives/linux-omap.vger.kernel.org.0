Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE789330FAC
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbhCHNjz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:39:55 -0500
Received: from muru.com ([72.249.23.125]:40880 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230525AbhCHNjV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:39:21 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6801780D4;
        Mon,  8 Mar 2021 13:40:03 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 08/12] ARM: dts: Move omap4 l3-noc to a separate node
Date:   Mon,  8 Mar 2021 15:39:06 +0200
Message-Id: <20210308133910.12454-9-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308133910.12454-1-tony@atomide.com>
References: <20210308133910.12454-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In preparation for probing l3 with simple-pm-bus and genpd, we must move
l3 noc to a separate node. This is to prevent omap_l3_noc.c driver from
claiming the whole l3 instance before simple-pm-bus has a chance to probe.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -107,16 +107,20 @@ wakeupgen: interrupt-controller@48281000 {
 	 * hierarchy.
 	 */
 	ocp {
-		compatible = "ti,omap4-l3-noc", "simple-bus";
+		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
 		ti,hwmods = "l3_main_1", "l3_main_2", "l3_main_3";
-		reg = <0x44000000 0x1000>,
-		      <0x44800000 0x2000>,
-		      <0x45000000 0x1000>;
-		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+
+		l3-noc@44000000 {
+			compatible = "ti,omap4-l3-noc";
+			reg = <0x44000000 0x1000>,
+			      <0x44800000 0x2000>,
+			      <0x45000000 0x1000>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+		};
 
 		l4_wkup: interconnect@4a300000 {
 		};
-- 
2.30.1
