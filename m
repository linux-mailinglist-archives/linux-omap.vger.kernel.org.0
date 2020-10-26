Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADFAD298BE1
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1768325AbgJZLWk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:22:40 -0400
Received: from muru.com ([72.249.23.125]:46648 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1422405AbgJZLWk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:22:40 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BB3A18196;
        Mon, 26 Oct 2020 11:22:43 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>, Roger Quadros <rogerq@ti.com>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 01/18] ARM: dts: am33xx: add remaining PRM instances
Date:   Mon, 26 Oct 2020 13:22:05 +0200
Message-Id: <20201026112222.56894-2-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026112222.56894-1-tony@atomide.com>
References: <20201026112222.56894-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Add remaining PRM instances for the am33xx SoC. Additionally, enable the
genpd support for them.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
[tony@atomide.com: fixed a typo for #power-domain-cells]
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -601,12 +601,20 @@ prm_per: prm@c00 {
 		compatible = "ti,am3-prm-inst", "ti,omap-prm-inst";
 		reg = <0xc00 0x100>;
 		#reset-cells = <1>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_wkup: prm@d00 {
 		compatible = "ti,am3-prm-inst", "ti,omap-prm-inst";
 		reg = <0xd00 0x100>;
 		#reset-cells = <1>;
+		#power-domain-cells = <0>;
+	};
+
+	prm_mpu: prm@e00 {
+		compatible = "ti,am3-prm-inst", "ti,omap-prm-inst";
+		reg = <0xe00 0x100>;
+		#power-domain-cells = <0>;
 	};
 
 	prm_device: prm@f00 {
@@ -615,12 +623,24 @@ prm_device: prm@f00 {
 		#reset-cells = <1>;
 	};
 
+	prm_rtc: prm@1000 {
+		compatible = "ti,am3-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1000 0x100>;
+		#power-domain-cells = <0>;
+	};
+
 	prm_gfx: prm@1100 {
 		compatible = "ti,am3-prm-inst", "ti,omap-prm-inst";
 		reg = <0x1100 0x100>;
 		#power-domain-cells = <0>;
 		#reset-cells = <1>;
 	};
+
+	prm_cefuse: prm@1200 {
+		compatible = "ti,am3-prm-inst", "ti,omap-prm-inst";
+		reg = <0x1200 0x100>;
+		#power-domain-cells = <0>;
+	};
 };
 
 /* Preferred always-on timer for clocksource */
-- 
2.29.1
