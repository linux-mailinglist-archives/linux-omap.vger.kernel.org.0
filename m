Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFCBFFF74C
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 03:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfKQClr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Nov 2019 21:41:47 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49122 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfKQClr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Nov 2019 21:41:47 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id E8B7728F769
Received: by earth.universe (Postfix, from userid 1000)
        id BF1003C0C83; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [RFCv1 11/42] ARM: dts: omap: add channel to DSI panels
Date:   Sun, 17 Nov 2019 03:39:57 +0100
Message-Id: <20191117024028.2233-12-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The standard binding for DSI requires, that the channel number
of the panel is encoded in DT. This adds the channel number in
all OMAP3-5 boards, in preparation for using common infrastructure.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../devicetree/bindings/display/panel/panel-dsi-cm.txt      | 4 +++-
 arch/arm/boot/dts/omap3-n950.dts                            | 3 ++-
 arch/arm/boot/dts/omap3.dtsi                                | 3 +++
 arch/arm/boot/dts/omap4-droid4-xt894.dts                    | 3 ++-
 arch/arm/boot/dts/omap4-sdp.dts                             | 6 ++++--
 arch/arm/boot/dts/omap4.dtsi                                | 6 ++++++
 arch/arm/boot/dts/omap5.dtsi                                | 6 ++++++
 7 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
index dce48eb9db57..f92d5c9adfc5 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
+++ b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
@@ -3,6 +3,7 @@ Generic MIPI DSI Command Mode Panel
 
 Required properties:
 - compatible: "panel-dsi-cm"
+- reg: DSI channel number
 
 Optional properties:
 - label: a symbolic name for the panel
@@ -15,9 +16,10 @@ Required nodes:
 Example
 -------
 
-lcd0: display {
+lcd0: panel@0 {
 	compatible = "tpo,taal", "panel-dsi-cm";
 	label = "lcd0";
+	reg = <0>;
 
 	reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
 
diff --git a/arch/arm/boot/dts/omap3-n950.dts b/arch/arm/boot/dts/omap3-n950.dts
index 9886bf8b90ab..d1dfafde351e 100644
--- a/arch/arm/boot/dts/omap3-n950.dts
+++ b/arch/arm/boot/dts/omap3-n950.dts
@@ -225,8 +225,9 @@
 		};
 	};
 
-	lcd0: display {
+	lcd0: panel@0 {
 		compatible = "nokia,himalaya", "panel-dsi-cm";
+		reg = <0>;
 		label = "lcd0";
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index 4043ecb38016..b872b933f2cb 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -771,6 +771,9 @@
 				ti,hwmods = "dss_dsi1";
 				clocks = <&dss1_alwon_fck>, <&dss2_alwon_fck>;
 				clock-names = "fck", "sys_clk";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
 			};
 
 			rfbi: encoder@48050800 {
diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
index a40fe8d49da6..6af0a9288940 100644
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -202,8 +202,9 @@
 		};
 	};
 
-	lcd0: display {
+	lcd0: panel@0 {
 		compatible = "panel-dsi-cm";
+		reg = <0>;
 		label = "lcd0";
 		vddi-supply = <&lcd_regulator>;
 		reset-gpios = <&gpio4 5 GPIO_ACTIVE_HIGH>;	/* gpio101 */
diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
index 91480ac1f328..8a8307517dab 100644
--- a/arch/arm/boot/dts/omap4-sdp.dts
+++ b/arch/arm/boot/dts/omap4-sdp.dts
@@ -662,8 +662,9 @@
 		};
 	};
 
-	lcd0: display {
+	lcd0: panel@0 {
 		compatible = "tpo,taal", "panel-dsi-cm";
+		reg = <0>;
 		label = "lcd0";
 
 		reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;	/* 102 */
@@ -687,8 +688,9 @@
 		};
 	};
 
-	lcd1: display {
+	lcd1: panel@0 {
 		compatible = "tpo,taal", "panel-dsi-cm";
+		reg = <0>;
 		label = "lcd1";
 
 		reset-gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;	/* 104 */
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 7cc95bc1598b..a0807cd90eff 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -403,6 +403,9 @@
 				clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
 					 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
 				clock-names = "fck", "sys_clk";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
 			};
 
 			dsi2: encoder@58005000 {
@@ -417,6 +420,9 @@
 				clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
 					 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
 				clock-names = "fck", "sys_clk";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
 			};
 
 			hdmi: encoder@58006000 {
diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index 1fb7937638f0..05fd27a1f42e 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -321,6 +321,9 @@
 				clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
 					 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
 				clock-names = "fck", "sys_clk";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
 			};
 
 			dsi2: encoder@58005000 {
@@ -335,6 +338,9 @@
 				clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
 					 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
 				clock-names = "fck", "sys_clk";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
 			};
 
 			hdmi: encoder@58060000 {
-- 
2.24.0

