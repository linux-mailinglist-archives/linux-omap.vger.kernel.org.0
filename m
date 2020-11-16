Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFB32B42A9
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729723AbgKPLUk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:40 -0500
Received: from muru.com ([72.249.23.125]:48528 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729595AbgKPLUk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:40 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 05A5980C8;
        Mon, 16 Nov 2020 11:20:44 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 16/17] ARM: dts: Use simple-pm-bus for genpd for am4 l3
Date:   Mon, 16 Nov 2020 13:19:38 +0200
Message-Id: <20201116111939.21405-17-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116111939.21405-1-tony@atomide.com>
References: <20201116111939.21405-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now enable simple-pm-bus to use genpd.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -155,11 +155,13 @@ cache-controller@48242000 {
 	};
 
 	ocp@44000000 {
-		compatible = "ti,am4372-l3-noc", "simple-bus";
+		compatible = "simple-pm-bus";
+		power-domains = <&prm_per>;
+		clocks = <&l3_clkctrl AM4_L3_L3_MAIN_CLKCTRL 0>;
+		clock-names = "fck";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		ti,hwmods = "l3_main";
 		ti,no-idle;
 
 		l3-noc@44000000 {
-- 
2.29.2
