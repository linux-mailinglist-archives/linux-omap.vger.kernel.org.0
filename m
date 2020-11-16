Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5073E2B4283
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729596AbgKPLUL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:11 -0500
Received: from muru.com ([72.249.23.125]:48428 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727228AbgKPLUK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:10 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DABDC8196;
        Mon, 16 Nov 2020 11:20:15 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 03/17] ARM: dts: am43xx: add remaining PRM instances
Date:   Mon, 16 Nov 2020 13:19:25 +0200
Message-Id: <20201116111939.21405-4-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116111939.21405-1-tony@atomide.com>
References: <20201116111939.21405-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Add remaining PRM instances for the am43xx SoC. Additionally enable the
genpd support for them.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -548,6 +548,12 @@ target-module@56000000 {
 #include "am43xx-clocks.dtsi"
 
 &prcm {
+	prm_mpu: prm@300 {
+		compatible = "ti,am4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x300 0x100>;
+		#power-domain-cells = <0>;
+	};
+
 	prm_gfx: prm@400 {
 		compatible = "ti,am4-prm-inst", "ti,omap-prm-inst";
 		reg = <0x400 0x100>;
@@ -555,16 +561,36 @@ prm_gfx: prm@400 {
 		#reset-cells = <1>;
 	};
 
+	prm_rtc: prm@500 {
+		compatible = "ti,am4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x500 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_tamper: prm@600 {
+		compatible = "ti,am4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x600 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_cefuse: prm@700 {
+		compatible = "ti,am4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x700 0x100>;
+		#power-domain-cells = <0>;
+	};
+
 	prm_per: prm@800 {
 		compatible = "ti,am4-prm-inst", "ti,omap-prm-inst";
 		reg = <0x800 0x100>;
 		#reset-cells = <1>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_wkup: prm@2000 {
 		compatible = "ti,am4-prm-inst", "ti,omap-prm-inst";
 		reg = <0x2000 0x100>;
 		#reset-cells = <1>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_device: prm@4000 {
-- 
2.29.2
