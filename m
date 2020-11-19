Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB9D2B931D
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:07:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgKSNHg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:07:36 -0500
Received: from muru.com ([72.249.23.125]:48808 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726474AbgKSNHg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:07:36 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5ED2D80C1;
        Thu, 19 Nov 2020 13:07:41 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Roger Quadros <rogerq@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 3/7] ARM: dts: omap4: add remaining PRM instances
Date:   Thu, 19 Nov 2020 15:07:16 +0200
Message-Id: <20201119130720.63140-4-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119130720.63140-1-tony@atomide.com>
References: <20201119130720.63140-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Add remaining PRM instances for the omap4 SoC. Additionally enable the
genpd support for them.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -658,10 +658,17 @@ hdmi: encoder@0 {
 #include "omap44xx-clocks.dtsi"
 
 &prm {
+	prm_mpu: prm@300 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x300 0x100>;
+		#power-domain-cells = <0>;
+	};
+
 	prm_tesla: prm@400 {
 		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
 		reg = <0x400 0x100>;
 		#reset-cells = <1>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_abe: prm@500 {
@@ -670,16 +677,72 @@ prm_abe: prm@500 {
 		#power-domain-cells = <0>;
 	};
 
+	prm_always_on_core: prm@600 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x600 0x100>;
+		#power-domain-cells = <0>;
+	};
+
 	prm_core: prm@700 {
 		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
 		reg = <0x700 0x100>;
 		#reset-cells = <1>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_ivahd: prm@f00 {
 		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
 		reg = <0xf00 0x100>;
 		#reset-cells = <1>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_cam: prm@1000 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1000 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_dss: prm@1100 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1100 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_gfx: prm@1200 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1200 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_l3init: prm@1300 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1300 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_l4per: prm@1400 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1400 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_cefuse: prm@1600 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1600 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_wkup: prm@1700 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1700 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_emu: prm@1900 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1900 0x100>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_device: prm@1b00 {
-- 
2.29.2
