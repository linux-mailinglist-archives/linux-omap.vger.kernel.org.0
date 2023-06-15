Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA72731C04
	for <lists+linux-omap@lfdr.de>; Thu, 15 Jun 2023 16:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344031AbjFOO7B (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Jun 2023 10:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343944AbjFOO6u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Jun 2023 10:58:50 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848E02971;
        Thu, 15 Jun 2023 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686841127; x=1718377127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yx6jzFIcRMaWyt112vudHuPwBtrRMgqZ1jAyYQMYwi4=;
  b=Jnwwo/ZlTaiMIWjNbsIwhJLK0G7hk5NaqGfcyfz6OQEJ+S+TKO4OOT9z
   TYW1gFzlJRihAZwrSaUrvUtsaJHgFSDnhPyWBkcv8IUjrBh5pR22DfqYj
   rl6CqT7rBynw+cr6QsV/iBf/xl7p6tZyd+cP1Tg7H+zXBCmGmnMF8c4lI
   86h3kVt5+FhTTZS5YX5466xeH1z8QL3mf+ZWzbKcIXurHozNN+9l3BGde
   CwSdPqOJE9f+5Rhz6EG3ZSq6FnyeTwNySB5cCzl6w60FwRMPUtzAnp+rX
   kt032EY0p/eFykRjqvEWDF3nA4ZBb/jp2IgkwDmsAnQtYmCJoc1mabPTv
   g==;
X-IronPort-AV: E=Sophos;i="6.00,245,1681164000"; 
   d="scan'208";a="31453608"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jun 2023 16:58:39 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0304D280084;
        Thu, 15 Jun 2023 16:58:38 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 3/3] arm64: dts: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date:   Thu, 15 Jun 2023 16:58:38 +0200
Message-Id: <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com>
References: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use id-gpios and vbus-gpios instead.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
---
Changes in v2:
* Added Heiko's A-b for rockchip
* Added Matthias' R-b for mediatek

 arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi            | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts       | 2 +-
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts                   | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts                   | 2 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts                      | 2 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts                   | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts              | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts          | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts            | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts                | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts          | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts         | 2 +-
 arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts    | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi        | 2 +-
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts               | 2 +-
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi     | 4 ++--
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts           | 2 +-
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts           | 2 +-
 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi                 | 2 +-
 23 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
index 5dbec71747c3b..61c2a63efc6db 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
@@ -109,7 +109,7 @@ extcon_usb0: extcon-usb0 {
 		compatible = "linux,extcon-usb-gpio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usb0_extcon>;
-		id-gpio = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
index d4ae7a3efff87..9e53b214abc85 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
@@ -24,7 +24,7 @@ extcon_usbotg: extcon-usbotg0 {
 		compatible = "linux,extcon-usb-gpio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbcon0>;
-		id-gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
 	};
 
 	pcie0_refclk: pcie0-refclk {
diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
index fffdb7bbf889e..0c38f7b517637 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
@@ -43,12 +43,12 @@ cpus_fixed_vproc1: regulator-vproc-buck1 {
 
 	extcon_usb: extcon_iddig {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pio 12 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pio 12 GPIO_ACTIVE_HIGH>;
 	};
 
 	extcon_usb1: extcon_iddig1 {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pio 14 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pio 14 GPIO_ACTIVE_HIGH>;
 	};
 
 	usb_p0_vbus: regulator-usb-p0-vbus {
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 5122963d8743a..607d65ddba9ec 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -41,7 +41,7 @@ hdmi_connector_in: endpoint {
 
 	extcon_usb: extcon_iddig {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pio 16 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pio 16 GPIO_ACTIVE_HIGH>;
 	};
 
 	usb_p1_vbus: regulator@0 {
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index f3d65a6061949..301e5d27ab862 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -77,7 +77,7 @@ usb2513 {
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 121 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 537547b97459b..7fed59a33ae96 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -99,14 +99,14 @@ button {
 
 	usb2_id: usb2-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pmi8994_gpios 6 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pmi8994_gpios 6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb2_vbus_det_gpio>;
 	};
 
 	usb3_id: usb3-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pm8994_gpios 22 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pm8994_gpios 22 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb3_vbus_det_gpio>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
index 5ad49fe999dba..84723c9b73b4a 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
@@ -48,7 +48,7 @@ button-volume-up {
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 1c43f3d6a0b4b..47da738661bf8 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -52,7 +52,7 @@ led-0 {
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 69 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 69 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts b/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
index f4dbc515c47ad..4aeeee24cedca 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
@@ -75,7 +75,7 @@ led-green {
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&usb_id_default>;
 		pinctrl-names = "default";
 	};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
index 4239c8fda11b4..484e488a5eca3 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
@@ -80,7 +80,7 @@ led-2 {
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
index 9757182fba3e6..d73294af1a068 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
@@ -68,7 +68,7 @@ led-0 {
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
index c94d36b386517..8e238976ab1ce 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
@@ -56,7 +56,7 @@ button-volume-up {
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
index 8613cf93dac58..cabb202391d66 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
@@ -32,7 +32,7 @@ chosen {
 
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&usb_id_default>;
 		pinctrl-names = "default";
 	};
diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
index 4a0645db0ae14..6374c5f53d9a1 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
@@ -24,5 +24,5 @@ &usb_detect {
 };
 
 &usb3_id {
-	id-gpio = <&tlmm 24 GPIO_ACTIVE_LOW>;
+	id-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index b4b770a9277dc..d55e4075040ff 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -71,7 +71,7 @@ panel_tvdd: tvdd-regulator {
 
 	usb3_id: usb3-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 25 GPIO_ACTIVE_LOW>;
+		id-gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_detect>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
index b35e2d9f428c1..b6a214bea70f5 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -31,7 +31,7 @@ aliases {
 	 */
 	extcon_usb: extcon-usb {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 38 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
 	};
 
 	gpio-hall-sensors {
diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
index 687e96068cb2b..876c6921ddf07 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -89,8 +89,8 @@ vph_pwr: vph-pwr-regulator {
 
 	extcon_usb: extcon-usb {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 38 GPIO_ACTIVE_HIGH>;
-		vbus-gpio = <&tlmm 128 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
+		vbus-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cc_dir_default &usb_detect_en>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index 0b23d5bb3f26c..2ed39d402d3f6 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -43,7 +43,7 @@ key-volup {
 	 */
 	extcon_usb: extcon-usb {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
 	};
 
 	hdmi-out {
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 3033723fc6ff3..87d0293c728d8 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -150,7 +150,7 @@ cont_splash_mem: splash@9d400000 {
 	 */
 	extcon_usb: extcon-usb {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 8fb2d17887424..3c47410ba94c0 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -85,7 +85,7 @@ framebuffer_mem: memory@9d400000 {
 	 */
 	extcon_usb: extcon-usb {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
index 9f8a9ef398a26..9353b9b622f6e 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
@@ -42,7 +42,7 @@ framebuffer0: framebuffer@5c000000 {
 
 	extcon_usb: extcon-usb {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index a7f4aeae9c1a5..1b06617ba34a9 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -63,7 +63,7 @@ cmdline_mem: memory@ffd00000 {
 
 	extcon_usb: usb-id {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index aa3e21bd6c8f4..20e3f41efe97f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -27,7 +27,7 @@ module_led: led-0 {
 
 	extcon_usb3: extcon-usb3 {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb3_id>;
 	};
-- 
2.34.1

