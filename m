Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12A22B9320
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgKSNHi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:07:38 -0500
Received: from muru.com ([72.249.23.125]:48818 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727214AbgKSNHi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:07:38 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AF8A380F5;
        Thu, 19 Nov 2020 13:07:43 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Roger Quadros <rogerq@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 4/7] ARM: dts: Configure power domain for omap4 dss
Date:   Thu, 19 Nov 2020 15:07:17 +0200
Message-Id: <20201119130720.63140-5-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119130720.63140-1-tony@atomide.com>
References: <20201119130720.63140-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This allows shutting down dss domain when the screen blanks.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -445,6 +445,7 @@ target-module@58000000 {
 			      <0x58000014 4>;
 			reg-names = "rev", "syss";
 			ti,syss-mask = <1>;
+			power-domains = <&prm_dss>;
 			clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 0>,
 				 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 9>,
 				 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>,
@@ -745,6 +746,12 @@ prm_emu: prm@1900 {
 		#power-domain-cells = <0>;
 	};
 
+	prm_dss: prm@1100 {
+		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1100 0x40>;
+		#power-domain-cells = <0>;
+	};
+
 	prm_device: prm@1b00 {
 		compatible = "ti,omap4-prm-inst", "ti,omap-prm-inst";
 		reg = <0x1b00 0x40>;
-- 
2.29.2
