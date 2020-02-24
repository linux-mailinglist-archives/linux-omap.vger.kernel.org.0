Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9BFE16B19F
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbgBXVKN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:13 -0500
Received: from muru.com ([72.249.23.125]:57150 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726722AbgBXVKN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:13 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C7A4281BA;
        Mon, 24 Feb 2020 21:10:57 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 04/23] ARM: dts: Configure interconnect target module for omap4 venc
Date:   Mon, 24 Feb 2020 13:09:40 -0800
Message-Id: <20200224210959.56146-5-tony@atomide.com>
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

We must now also configure sys_clk for reset to complete, the top
level module only keeps optional clocks enabled for it's own reset.

Cc: Jyri Sarha <jsarha@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -506,13 +506,23 @@ rfbi: encoder@0  {
 					};
 				};
 
-				venc: encoder@3000 {
-					compatible = "ti,omap4-venc";
-					reg = <0x3000 0x1000>;
-					status = "disabled";
-					ti,hwmods = "dss_venc";
-					clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 11>;
-					clock-names = "fck";
+				target-module@3000 {
+					compatible = "ti,sysc-omap2", "ti,sysc";
+					reg = <0x3000 0x4>;
+					reg-names = "rev";
+					clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
+					clock-names = "sys_clk";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0 0x3000 0x1000>;
+
+					venc: encoder@0 {
+						compatible = "ti,omap4-venc";
+						reg = <0 0x1000>;
+						status = "disabled";
+						clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 11>;
+						clock-names = "fck";
+					};
 				};
 
 				dsi1: encoder@4000 {
-- 
2.25.1
