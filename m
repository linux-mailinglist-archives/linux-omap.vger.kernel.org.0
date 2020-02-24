Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2372916B1A5
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbgBXVKT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:19 -0500
Received: from muru.com ([72.249.23.125]:57174 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726722AbgBXVKT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:19 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A564E8162;
        Mon, 24 Feb 2020 21:11:02 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 07/23] ARM: dts: Configure interconnect target module for omap4 hdmi
Date:   Mon, 24 Feb 2020 13:09:43 -0800
Message-Id: <20200224210959.56146-8-tony@atomide.com>
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

Note that we must disable smart idle modes for HDMI audio like we've
done with the legacy platform data. And HDMI needs both hdmi clock
and dss clock to operate.

Cc: Jyri Sarha <jsarha@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 47 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -589,21 +589,40 @@ dsi2: encoder@0 {
 					};
 				};
 
-				hdmi: encoder@6000 {
-					compatible = "ti,omap4-hdmi";
-					reg = <0x6000 0x200>,
-					      <0x6200 0x100>,
-					      <0x6300 0x100>,
-					      <0x6400 0x1000>;
-					reg-names = "wp", "pll", "phy", "core";
-					interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-					status = "disabled";
-					ti,hwmods = "dss_hdmi";
+				target-module@6000 {
+					compatible = "ti,sysc-omap4", "ti,sysc";
+					reg = <0x6000 0x4>,
+					      <0x6010 0x4>;
+					reg-names = "rev", "sysc";
+					/*
+					 * Has SYSC_IDLE_SMART and SYSC_IDLE_SMART_WKUP
+					 * but HDMI audio will fail with them.
+					 */
+					ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+							<SYSC_IDLE_NO>;
+					ti,sysc-mask = <(SYSC_OMAP4_SOFTRESET)>;
 					clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 9>,
-						 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
-					clock-names = "fck", "sys_clk";
-					dmas = <&sdma 76>;
-					dma-names = "audio_tx";
+						 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>;
+					clock-names = "fck", "dss_clk";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0 0x6000 0x2000>;
+
+					hdmi: encoder@0 {
+					compatible = "ti,omap4-hdmi";
+						reg = <0 0x200>,
+						      <0x200 0x100>,
+						      <0x300 0x100>,
+						      <0x400 0x1000>;
+						reg-names = "wp", "pll", "phy", "core";
+						interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+						status = "disabled";
+						clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 9>,
+						         <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
+						clock-names = "fck", "sys_clk";
+						dmas = <&sdma 76>;
+						dma-names = "audio_tx";
+					};
 				};
 			};
 		};
-- 
2.25.1
