Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E77D16B1CE
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbgBXVKx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:53 -0500
Received: from muru.com ([72.249.23.125]:57316 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728022AbgBXVKq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:46 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B86088030;
        Mon, 24 Feb 2020 21:11:30 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 21/23] ARM: dts: Configure interconnect target module for am437x dispc
Date:   Mon, 24 Feb 2020 13:09:57 -0800
Message-Id: <20200224210959.56146-22-tony@atomide.com>
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
module, but keep the legacy "ti,hwmods" peroperty until the child
devices are probing with ti-sysc interconnect driver.

Note that we also fix a harmless typo for the node name, it's
dispc@400, not dispc@4000.

Cc: Jyri Sarha <jsarha@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am437x-l4.dtsi | 36 ++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -2150,15 +2150,39 @@ dss: dss@0 {
 					 <0x00000c00 0x00000c00 0x00000400>,
 					 <0x00001000 0x00001000 0x00001000>;
 
-				dispc: dispc@4000 {
-					compatible = "ti,omap3-dispc";
-					reg = <0x400 0x400>;
-					interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+				target-module@400 {
+					compatible = "ti,sysc-omap2", "ti,sysc";
 					ti,hwmods = "dss_dispc";
-					clocks = <&disp_clk>;
+					reg = <0x400 0x4>,
+					      <0x410 0x4>,
+					      <0x414 0x4>;
+					reg-names = "rev", "sysc", "syss";
+					ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+							<SYSC_IDLE_NO>,
+							<SYSC_IDLE_SMART>;
+					ti,sysc-midle = <SYSC_IDLE_FORCE>,
+							<SYSC_IDLE_NO>,
+							<SYSC_IDLE_SMART>;
+					ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+							 SYSC_OMAP2_ENAWAKEUP |
+							 SYSC_OMAP2_SOFTRESET |
+							 SYSC_OMAP2_AUTOIDLE)>;
+					ti,syss-mask = <1>;
+					clocks = <&dss_clkctrl AM4_DSS_DSS_CORE_CLKCTRL 0>;
 					clock-names = "fck";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0 0x400 0x400>;
 
-					max-memory-bandwidth = <230000000>;
+					dispc: dispc@0 {
+						compatible = "ti,omap3-dispc";
+						reg = <0 0x400>;
+						interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+						clocks = <&disp_clk>;
+						clock-names = "fck";
+
+						max-memory-bandwidth = <230000000>;
+					};
 				};
 
 				rfbi: rfbi@800 {
-- 
2.25.1
