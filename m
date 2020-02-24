Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 112CA16B1C7
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgBXVKs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:48 -0500
Received: from muru.com ([72.249.23.125]:57326 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727459AbgBXVKs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:48 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 58C208162;
        Mon, 24 Feb 2020 21:11:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 22/23] ARM: dts: Configure interconnect target module for am437x rfbi
Date:   Mon, 24 Feb 2020 13:09:58 -0800
Message-Id: <20200224210959.56146-23-tony@atomide.com>
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
Cc: Keerthy <j-keerthy@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am437x-l4.dtsi | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -2185,13 +2185,31 @@ dispc: dispc@0 {
 					};
 				};
 
-				rfbi: rfbi@800 {
-					compatible = "ti,omap3-rfbi";
-					reg = <0x800 0x100>;
-					ti,hwmods = "dss_rfbi";
-					clocks = <&disp_clk>;
+				target-module@800 {
+					compatible = "ti,sysc-omap2", "ti,sysc";
+					reg = <0x800 0x4>,
+					      <0x810 0x4>,
+					      <0x814 0x4>;
+					reg-names = "rev", "sysc", "syss";
+					ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+							<SYSC_IDLE_NO>,
+							<SYSC_IDLE_SMART>;
+					ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
+							 SYSC_OMAP2_AUTOIDLE)>;
+					ti,syss-mask = <1>;
+					clocks = <&dss_clkctrl AM4_DSS_DSS_CORE_CLKCTRL 0>;
 					clock-names = "fck";
-					status = "disabled";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0 0x800 0x400>;
+
+					rfbi: rfbi@0 {
+						compatible = "ti,omap3-rfbi";
+						reg = <0 0x100>;
+						clocks = <&dss_clkctrl AM4_DSS_DSS_CORE_CLKCTRL 0>;
+						clock-names = "fck";
+						status = "disabled";
+					};
 				};
 			};
 		};
-- 
2.25.1
