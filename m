Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78F3B640B35
	for <lists+linux-omap@lfdr.de>; Fri,  2 Dec 2022 17:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbiLBQuQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Dec 2022 11:50:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234156AbiLBQuK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 2 Dec 2022 11:50:10 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2864C773B
        for <linux-omap@vger.kernel.org>; Fri,  2 Dec 2022 08:50:05 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2d07:19c5:4d8b:89d9])
        by xavier.telenet-ops.be with bizsmtp
        id rUpW2800H0ys3B701UpWqU; Fri, 02 Dec 2022 17:50:03 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p19E9-002K60-4e; Fri, 02 Dec 2022 17:49:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p19E8-006Wai-Dt; Fri, 02 Dec 2022 17:49:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Subject: [PATCH 07/11] arm64: dts: freescale: Fix pca954x i2c-mux node names
Date:   Fri,  2 Dec 2022 17:49:22 +0100
Message-Id: <3755a821121c472c9a9fd26a735c87ebb79484a5.1669999298.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669999298.git.geert+renesas@glider.be>
References: <cover.1669999298.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

"make dtbs_check":

    arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: pca9547@77: $nodename:0: 'pca9547@77' does not match '^(i2c-?)?mux'
	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: pca9547@77: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@4' were unexpected)
	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    ...

Fix this by renaming PCA954x nodes to "i2c-mux", to match the I2C bus
multiplexer/switch DT bindings and the Generic Names Recommendation in
the Devicetree Specification.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts    | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts    | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts    | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts    | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts    | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts  | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi   | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi   | 2 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi  | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts    | 4 ++--
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts        | 2 +-
 12 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
index 5a8d85a7d1612d44..bbdf989058ff7795 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
@@ -110,7 +110,7 @@ &esdhc1 {
 &i2c0 {
 	status = "okay";
 
-	pca9547@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9547";
 		reg = <0x77>;
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
index 9b726c2a4842671a..dda27ed7aaf2b15c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
@@ -89,7 +89,7 @@ fpga: board-control@2,0 {
 &i2c0 {
 	status = "okay";
 
-	pca9547@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9547";
 		reg = <0x77>;
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index b2fcbba60d3accdf..3b0ed9305f2bd455 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -88,7 +88,7 @@ &duart1 {
 &i2c0 {
 	status = "okay";
 
-	pca9547@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9547";
 		reg = <0x77>;
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
index 41d8b15f25a540ba..aa52ff73ff9e0272 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
@@ -53,7 +53,7 @@ flash@2 {
 &i2c0 {
 	status = "okay";
 
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9547";
 		reg = <0x77>;
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 1bfbce69cc8b77bb..ee8e932628d17f19 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -136,7 +136,7 @@ mdio2_aquantia_phy: ethernet-phy@0 {
 &i2c0 {
 	status = "okay";
 
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9547";
 		reg = <0x77>;
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index ef6c8967533efa45..d4867d6cf47cdc79 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -245,7 +245,7 @@ rx8035: rtc@32 {
 &i2c3 {
 	status = "okay";
 
-	i2c-switch@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9540";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
index f598669e742fc940..52c5a43b30a0fb22 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
@@ -103,7 +103,7 @@ mdio0_phy15: mdio-phy3@1f {
 
 &i2c0 {
 	status = "okay";
-	pca9547@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9547";
 		reg = <0x77>;
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
index 3d9647b3da147314..537cecb13dd08a0f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
@@ -44,7 +44,7 @@ cpld@3,0 {
 
 &i2c0 {
 	status = "okay";
-	pca9547@75 {
+	i2c-mux@75 {
 		compatible = "nxp,pca9547";
 		reg = <0x75>;
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index afb455210bd07ed6..d32a52ab00a42a28 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -54,7 +54,7 @@ &esdhc1 {
 &i2c0 {
 	status = "okay";
 
-	i2c-switch@77 {
+	i2c-mux@77 {
 		compatible = "nxp,pca9547";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts b/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
index 74c09891600f2525..6357078185eddb44 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
@@ -214,7 +214,7 @@ &i2c3 {
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	i2cmux@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9540";
 		reg = <0x70>;
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts b/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
index 9dda2a1554c32848..8614c18b5998c242 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
@@ -133,7 +133,7 @@ &i2c1 {
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	i2cmux@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c1_pca9546>;
@@ -216,7 +216,7 @@ &i2c4 {
 	pinctrl-0 = <&pinctrl_i2c4>;
 	status = "okay";
 
-	pca9546: i2cmux@70 {
+	pca9546: i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 07d8dd8160f68169..afa883389456ce77 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -61,7 +61,7 @@ &i2c1 {
 	pinctrl-0 = <&pinctrl_lpi2c1 &pinctrl_ioexp_rst>;
 	status = "okay";
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9646", "nxp,pca9546";
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.25.1

