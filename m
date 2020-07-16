Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE0222232B
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jul 2020 14:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgGPM5p (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jul 2020 08:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728893AbgGPM5m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jul 2020 08:57:42 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89F7C08C5CE;
        Thu, 16 Jul 2020 05:57:41 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 32A1E2A55F8
Received: by jupiter.universe (Postfix, from userid 1000)
        id C54D0480102; Thu, 16 Jul 2020 14:57:37 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Merlijn Wajer <merlijn@wizzup.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 2/4] ARM: dts: omap: add channel to DSI panels
Date:   Thu, 16 Jul 2020 14:57:31 +0200
Message-Id: <20200716125733.83654-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716125733.83654-1-sebastian.reichel@collabora.com>
References: <20200716125733.83654-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The standard binding for DSI requires that the channel number
of the panel is encoded in DT. This adds the channel number in
all OMAP3-5 boards in preparation for using common infrastructure.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 3 ++-
 arch/arm/boot/dts/omap3-n950.dts                | 3 ++-
 arch/arm/boot/dts/omap3.dtsi                    | 3 +++
 arch/arm/boot/dts/omap4-sdp.dts                 | 6 ++++--
 arch/arm/boot/dts/omap4.dtsi                    | 6 ++++++
 arch/arm/boot/dts/omap5.dtsi                    | 6 ++++++
 6 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
index 06fbffa81636..4ffe461c3808 100644
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -207,8 +207,9 @@ dsi1_out_ep: endpoint {
 		};
 	};
 
-	lcd0: display {
+	lcd0: panel@0 {
 		compatible = "panel-dsi-cm";
+		reg = <0>;
 		label = "lcd0";
 		vddi-supply = <&lcd_regulator>;
 		reset-gpios = <&gpio4 5 GPIO_ACTIVE_HIGH>;	/* gpio101 */
diff --git a/arch/arm/boot/dts/omap3-n950.dts b/arch/arm/boot/dts/omap3-n950.dts
index 31d47a1fad84..80cf4e1177da 100644
--- a/arch/arm/boot/dts/omap3-n950.dts
+++ b/arch/arm/boot/dts/omap3-n950.dts
@@ -225,8 +225,9 @@ dsi_out_ep: endpoint {
 		};
 	};
 
-	lcd0: display {
+	lcd0: panel@0 {
 		compatible = "nokia,himalaya", "panel-dsi-cm";
+		reg = <0>;
 		label = "lcd0";
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index 1296d0643943..0ebbb6c11f04 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -898,6 +898,9 @@ dsi: encoder@4804fc00 {
 				ti,hwmods = "dss_dsi1";
 				clocks = <&dss1_alwon_fck>, <&dss2_alwon_fck>;
 				clock-names = "fck", "sys_clk";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
 			};
 
 			rfbi: encoder@48050800 {
diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
index 91480ac1f328..8a8307517dab 100644
--- a/arch/arm/boot/dts/omap4-sdp.dts
+++ b/arch/arm/boot/dts/omap4-sdp.dts
@@ -662,8 +662,9 @@ dsi1_out_ep: endpoint {
 		};
 	};
 
-	lcd0: display {
+	lcd0: panel@0 {
 		compatible = "tpo,taal", "panel-dsi-cm";
+		reg = <0>;
 		label = "lcd0";
 
 		reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;	/* 102 */
@@ -687,8 +688,9 @@ dsi2_out_ep: endpoint {
 		};
 	};
 
-	lcd1: display {
+	lcd1: panel@0 {
 		compatible = "tpo,taal", "panel-dsi-cm";
+		reg = <0>;
 		label = "lcd1";
 
 		reset-gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;	/* 104 */
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 4400f5f8e099..c5b426616443 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -551,6 +551,9 @@ dsi1: encoder@0 {
 						clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
 							 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
 						clock-names = "fck", "sys_clk";
+
+						#address-cells = <1>;
+						#size-cells = <0>;
 					};
 				};
 
@@ -583,6 +586,9 @@ dsi2: encoder@0 {
 						clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
 						         <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
 						clock-names = "fck", "sys_clk";
+
+						#address-cells = <1>;
+						#size-cells = <0>;
 					};
 				};
 
diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index fb889c5b00c9..0855c0a4050f 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -491,6 +491,9 @@ dsi1: encoder@0 {
 						status = "disabled";
 						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
 						clock-names = "fck";
+
+						#address-cells = <1>;
+						#size-cells = <0>;
 					};
 				};
 
@@ -522,6 +525,9 @@ dsi2: encoder@0 {
 						status = "disabled";
 						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
 						clock-names = "fck";
+
+						#address-cells = <1>;
+						#size-cells = <0>;
 					};
 				};
 
-- 
2.27.0

