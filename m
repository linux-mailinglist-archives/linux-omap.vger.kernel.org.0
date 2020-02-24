Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD3616B1BB
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgBXVKl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:41 -0500
Received: from muru.com ([72.249.23.125]:57280 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727703AbgBXVKl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:41 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2362C81B7;
        Mon, 24 Feb 2020 21:11:25 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keerthy <j-keerthy@ti.com>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 18/23] ARM: dts: Configure interconnect target module for dra7 hdmi
Date:   Mon, 24 Feb 2020 13:09:54 -0800
Message-Id: <20200224210959.56146-19-tony@atomide.com>
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
 arch/arm/boot/dts/dra7.dtsi | 47 +++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -767,21 +767,38 @@ dispc@0 {
 					};
 				};
 
-				hdmi: encoder@40000 {
-					compatible = "ti,dra7-hdmi";
-					reg = <0x40000 0x200>,
-					      <0x40200 0x80>,
-					      <0x40300 0x80>,
-					      <0x60000 0x19000>;
-					reg-names = "wp", "pll", "phy", "core";
-					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-					status = "disabled";
-					ti,hwmods = "dss_hdmi";
-					clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
-						 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>;
-					clock-names = "fck", "sys_clk";
-					dmas = <&sdma_xbar 76>;
-					dma-names = "audio_tx";
+				target-module@40000 {
+					compatible = "ti,sysc-omap4", "ti,sysc";
+					reg = <0x40000 0x4>,
+					      <0x40010 0x4>;
+					reg-names = "rev", "sysc";
+					ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+							<SYSC_IDLE_NO>,
+							<SYSC_IDLE_SMART>,
+							<SYSC_IDLE_SMART_WKUP>;
+					ti,sysc-mask = <(SYSC_OMAP4_SOFTRESET)>;
+					clocks = <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 9>,
+						 <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 8>;
+					clock-names = "fck", "dss_clk";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0 0x40000 0x40000>;
+
+					hdmi: encoder@0 {
+						compatible = "ti,dra7-hdmi";
+						reg = <0 0x200>,
+						      <0x200 0x80>,
+						      <0x300 0x80>,
+						      <0x20000 0x19000>;
+						reg-names = "wp", "pll", "phy", "core";
+						interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+						status = "disabled";
+						clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
+							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>;
+						clock-names = "fck", "sys_clk";
+						dmas = <&sdma_xbar 76>;
+						dma-names = "audio_tx";
+					};
 				};
 			};
 		};
-- 
2.25.1
