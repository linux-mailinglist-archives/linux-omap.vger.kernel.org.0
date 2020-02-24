Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEAD16B1AB
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgBXVK0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:26 -0500
Received: from muru.com ([72.249.23.125]:57208 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727822AbgBXVKZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:25 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D1FE28162;
        Mon, 24 Feb 2020 21:11:09 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keerthy <j-keerthy@ti.com>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 10/23] ARM: dts: Configure interconnect target module for omap5 dispc
Date:   Mon, 24 Feb 2020 13:09:46 -0800
Message-Id: <20200224210959.56146-11-tony@atomide.com>
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

Cc: Jyri Sarha <jsarha@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5.dtsi | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -318,13 +318,37 @@ dss: dss@0 {
 				#size-cells = <1>;
 				ranges = <0 0 0x1000000>;
 
-				dispc@1000 {
-					compatible = "ti,omap5-dispc";
-					reg = <0x1000 0x1000>;
-					interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+				target-module@1000 {
+					compatible = "ti,sysc-omap2", "ti,sysc";
 					ti,hwmods = "dss_dispc";
+					reg = <0x1000 0x4>,
+					      <0x1010 0x4>,
+					      <0x1014 0x4>;
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
 					clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
 					clock-names = "fck";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0 0x1000 0x1000>;
+
+					dispc@0 {
+						compatible = "ti,omap5-dispc";
+						reg = <0 0x1000>;
+						interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
+						clock-names = "fck";
+					};
 				};
 
 				rfbi: encoder@2000  {
-- 
2.25.1
