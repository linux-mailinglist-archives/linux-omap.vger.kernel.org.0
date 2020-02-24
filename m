Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9974F16B1B1
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgBXVKa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:30 -0500
Received: from muru.com ([72.249.23.125]:57234 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727822AbgBXVKa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:30 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AB4758162;
        Mon, 24 Feb 2020 21:11:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keerthy <j-keerthy@ti.com>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 13/23] ARM: dts: Configure interconnect target module for omap5 dsi2
Date:   Mon, 24 Feb 2020 13:09:49 -0800
Message-Id: <20200224210959.56146-14-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200224210959.56146-1-tony@atomide.com>
References: <20200224210959.56146-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with device tree only configuration using
ti-sysc interconnect target module driver. Let's configure the
module and drop "ti,hwmods" peroperty as this module is a child node
of dispc and has no dependencies to to legacy platform data.

Cc: Jyri Sarha <jsarha@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5.dtsi | 41 +++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -409,18 +409,35 @@ dsi1: encoder@0 {
 					};
 				};
 
-				dsi2: encoder@9000 {
-					compatible = "ti,omap5-dsi";
-					reg = <0x9000 0x200>,
-					      <0x9200 0x40>,
-					      <0x9300 0x40>;
-					reg-names = "proto", "phy", "pll";
-					interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
-					status = "disabled";
-					ti,hwmods = "dss_dsi2";
-					clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
-						 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
-					clock-names = "fck", "sys_clk";
+				target-module@9000 {
+					compatible = "ti,sysc-omap2", "ti,sysc";
+					reg = <0x9000 0x4>,
+					      <0x9010 0x4>,
+					      <0x9014 0x4>;
+					reg-names = "rev", "sysc", "syss";
+					ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+							<SYSC_IDLE_NO>,
+							<SYSC_IDLE_SMART>;
+					ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+							 SYSC_OMAP2_ENAWAKEUP |
+							 SYSC_OMAP2_SOFTRESET |
+							 SYSC_OMAP2_AUTOIDLE)>;
+					ti,syss-mask = <1>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0 0x9000 0x1000>;
+
+					dsi2: encoder@0 {
+						compatible = "ti,omap5-dsi";
+						reg = <0 0x200>,
+						      <0x200 0x40>,
+						      <0x300 0x40>;
+						reg-names = "proto", "phy", "pll";
+						interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+						status = "disabled";
+						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
+						clock-names = "fck";
+					};
 				};
 
 				hdmi: encoder@40000 {
-- 
2.25.1
