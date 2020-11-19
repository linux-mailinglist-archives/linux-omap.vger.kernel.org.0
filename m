Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA422B9368
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgKSNNM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:13:12 -0500
Received: from muru.com ([72.249.23.125]:48878 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727734AbgKSNNM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:13:12 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id F32E380F5;
        Thu, 19 Nov 2020 13:13:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Roger Quadros <rogerq@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 3/8] ARM: dts: dra7: add remaining PRM instances
Date:   Thu, 19 Nov 2020 15:12:54 +0200
Message-Id: <20201119131259.63829-4-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119131259.63829-1-tony@atomide.com>
References: <20201119131259.63829-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Add remaining PRM instances for the dra7 SoC. Additionally enable the
genpd support for them.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7.dtsi | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -1031,53 +1031,129 @@ &iva_crit {
 #include "dra7xx-clocks.dtsi"
 
 &prm {
+	prm_mpu: prm@300 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x300 0x100>;
+		#power-domain-cells = <0>;
+	};
+
 	prm_dsp1: prm@400 {
 		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
 		reg = <0x400 0x100>;
 		#reset-cells = <1>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_ipu: prm@500 {
 		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
 		reg = <0x500 0x100>;
 		#reset-cells = <1>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_coreaon: prm@628 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x628 0xd8>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_core: prm@700 {
 		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
 		reg = <0x700 0x100>;
 		#reset-cells = <1>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_iva: prm@f00 {
 		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
 		reg = <0xf00 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_cam: prm@1000 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1000 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_dss: prm@1100 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1100 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_gpu: prm@1200 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1200 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_l3init: prm@1300 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1300 0x100>;
+		#reset-cells = <1>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_l4per: prm@1400 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1400 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_custefuse: prm@1600 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1600 0x100>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_wkupaon: prm@1724 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1724 0x100>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_dsp2: prm@1b00 {
 		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
 		reg = <0x1b00 0x40>;
 		#reset-cells = <1>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_eve1: prm@1b40 {
 		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
 		reg = <0x1b40 0x40>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_eve2: prm@1b80 {
 		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
 		reg = <0x1b80 0x40>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_eve3: prm@1bc0 {
 		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
 		reg = <0x1bc0 0x40>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_eve4: prm@1c00 {
 		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
 		reg = <0x1c00 0x60>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_rtc: prm@1c60 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1c60 0x20>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_vpe: prm@1c80 {
+		compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1c80 0x80>;
+		#power-domain-cells = <0>;
 	};
 };
 
-- 
2.29.2
