Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0C0223C82
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jul 2020 15:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgGQNZ4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Jul 2020 09:25:56 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:56803 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbgGQNZ4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Jul 2020 09:25:56 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0DDAB1C000C;
        Fri, 17 Jul 2020 13:25:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
        ARCHITECTURE), Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Subject: [PATCH 07/13] dt-bindings: media: ov5640: Remove clock-lanes
Date:   Fri, 17 Jul 2020 15:28:53 +0200
Message-Id: <20200717132859.237120-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The ov5640 does not support routing the clock signal to a different
lane, and the property has value fixed to 0.

Remove the property from the bindings and update its users
accordingly.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 6 ------
 arch/arm/boot/dts/dra72-evm-common.dtsi                 | 1 -
 arch/arm/boot/dts/dra76-evm.dts                         | 1 -
 arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi           | 1 -
 arch/arm/boot/dts/imx6qdl-icore.dtsi                    | 1 -
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi                | 1 -
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi                  | 1 -
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi               | 1 -
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts          | 1 -
 9 files changed, 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
index 8fd54575a1db..5e1662e848bd 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
@@ -76,9 +76,6 @@ properties:
           bus-type:
             enum: [4, 5]

-          clock-lanes:
-            const: 0
-
           data-lanes:
             description: |
               Should be set to <1> or <1 2> (one or two CSI-2 lanes supported).
@@ -125,7 +122,6 @@ properties:
                 required:
                   - remote-endpoint
                   - bus-type
-                  - clock-lanes
                   - data-lanes

           - if:
@@ -134,7 +130,6 @@ properties:
                   const: 5
             then:
               properties:
-                clock-lanes: false
                 data-lanes: false
               required:
                 - remote-endpoint
@@ -182,7 +177,6 @@ examples:
                 ov5640_to_mipi_csi2: endpoint {
                     remote-endpoint = <&mipi_csi2_from_ov5640>;
                     bus-type = <4>;
-                    clock-lanes = <0>;
                     data-lanes = <1 2>;
                 };
             };
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index aba7eb55525d..b5b31dc927d4 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -288,7 +288,6 @@ port {
 			csi2_cam0: endpoint {
 				remote-endpoint = <&csi2_phy0>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index ddf16e65ec7f..6fcb96abc41d 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -421,7 +421,6 @@ port {
 			csi2_cam0: endpoint {
 				remote-endpoint = <&csi2_phy0>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
diff --git a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
index dd5765778e87..a12d80a2403e 100644
--- a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
+++ b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
@@ -275,7 +275,6 @@ port {
 			ov5640_to_mipi_csi2: endpoint {
 				remote-endpoint = <&mipi_csi2_in>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
diff --git a/arch/arm/boot/dts/imx6qdl-icore.dtsi b/arch/arm/boot/dts/imx6qdl-icore.dtsi
index 2b1f275b8cc4..05bd332f527b 100644
--- a/arch/arm/boot/dts/imx6qdl-icore.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-icore.dtsi
@@ -214,7 +214,6 @@ port {
 			ov5640_to_mipi_csi2: endpoint {
 				remote-endpoint = <&mipi_csi2_in>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
diff --git a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
index 5752abb48e68..5eb7fbf33069 100644
--- a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
@@ -383,7 +383,6 @@ port {
 			ov5640_to_mipi_csi2: endpoint {
 				remote-endpoint = <&mipi_csi2_in>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
index 990f4cc345da..02f78b46a8fd 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -314,7 +314,6 @@ port {
 			ov5640_to_mipi_csi2: endpoint {
 				remote-endpoint = <&mipi_csi2_in>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 5c79ad5e7b5d..8c24fd468a22 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -628,7 +628,6 @@ camera_rear@3b {
 		port {
 			ov5640_ep: endpoint {
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 				remote-endpoint = <&csiphy0_ep>;
 			};
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 33f4eceffbe5..dd6a636ba3af 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -255,7 +255,6 @@ port {
 			csi2_cam0: endpoint {
 				remote-endpoint = <&csi2_phy0>;
 				bus-type = <4>;
-				clock-lanes = <0>;
 				data-lanes = <1 2>;
 			};
 		};
--
2.27.0

