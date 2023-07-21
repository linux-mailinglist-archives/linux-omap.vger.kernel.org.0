Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84F0975C142
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jul 2023 10:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjGUIT6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Jul 2023 04:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjGUIT5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Jul 2023 04:19:57 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49215ED;
        Fri, 21 Jul 2023 01:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1689927595; x=1721463595;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pNttBeZZhZdP5VWzICYQ/ABTkjg95x/HctL8gjTLrOU=;
  b=BQy3zmLdmD3LYsimm9u+T8AL33gsuUaIhD5CljTUcURqETfTR64MihhH
   aqH9i0CpALWK6aMp5YjveabYC+Gg6ObyyirWLLNd2unVD17OmvjBeBsnl
   N5VldQbyojOKL8kmXXIE/mye0UuZ6lv1gRrYL941ILWO8wlZVQ6r9KTn6
   JZW9sFJJjaSQ4UQ/ReBEtjm/TTJyT5RIjeGSfrZQvHJQppXxwc6m1olNP
   EZIYkA0+y8DfUZnqUEbzqdVxK5qlfRS0FDjujw3LNJDFDUK9MLrFEKmHq
   e3S+zCHcusy0d219/5v4FlXvC0MCnaqSNb07j6VJ+sNG34jKLiAdu8y24
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,220,1684792800"; 
   d="scan'208";a="32048265"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2023 10:19:53 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5B690280078;
        Fri, 21 Jul 2023 10:19:53 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH v3 1/2] ARM: dts: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date:   Fri, 21 Jul 2023 10:19:47 +0200
Message-Id: <20230721081948.1185360-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use id-gpios and vbus-gpios instead.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Rebased to next-20230721
* Split from bindings patch

 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi       | 2 +-
 arch/arm/boot/dts/ti/omap/am571x-idk.dts          | 4 ++--
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts | 2 +-
 arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi  | 4 ++--
 arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi    | 4 ++--
 arch/arm/boot/dts/ti/omap/dra71-evm.dts           | 4 ++--
 arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi   | 4 ++--
 arch/arm/boot/dts/ti/omap/dra76-evm.dts           | 4 ++--
 9 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index 570995707504..11d9c7a2dacb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -26,7 +26,7 @@ backlight: backlight {
 
 	extcon_usbc_det: usbc-det {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&gpio7 12 GPIO_ACTIVE_HIGH>; /* SODIMM 137 / USBC_DET */
+		id-gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>; /* SODIMM 137 / USBC_DET */
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbc_det>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 104580d51d74..9fe51884af79 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -29,7 +29,7 @@ chosen {
 
 	extcon_usbc_det: usbc-det {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&gpio7 14 GPIO_ACTIVE_HIGH>; /* SODIMM 137 / USBC_DET */
+		id-gpios = <&gpio7 14 GPIO_ACTIVE_HIGH>; /* SODIMM 137 / USBC_DET */
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbc_det>;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/am571x-idk.dts b/arch/arm/boot/dts/ti/omap/am571x-idk.dts
index 48425020281a..322cf79d22e9 100644
--- a/arch/arm/boot/dts/ti/omap/am571x-idk.dts
+++ b/arch/arm/boot/dts/ti/omap/am571x-idk.dts
@@ -168,8 +168,8 @@ blue3-led {
 };
 
 &extcon_usb2 {
-	id-gpio = <&gpio5 7 GPIO_ACTIVE_HIGH>;
-	vbus-gpio = <&gpio7 22 GPIO_ACTIVE_HIGH>;
+	id-gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&gpio7 22 GPIO_ACTIVE_HIGH>;
 };
 
 &sn65hvs882 {
diff --git a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
index 149cfafb90bf..c5272302eb11 100644
--- a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
@@ -197,7 +197,7 @@ brcmf_pwrseq: brcmf_pwrseq {
 	extcon_usb1: extcon_usb1 {
 		compatible = "linux,extcon-usb-gpio";
 		ti,enable-id-detection;
-		id-gpio = <&gpio3 13 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi b/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi
index 1d66278c3a72..3fca84819dc0 100644
--- a/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi
@@ -169,8 +169,8 @@ blue3-led {
 };
 
 &extcon_usb2 {
-	id-gpio = <&gpio3 16 GPIO_ACTIVE_HIGH>;
-	vbus-gpio = <&gpio3 26 GPIO_ACTIVE_HIGH>;
+	id-gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>;
 };
 
 &sn65hvs882 {
diff --git a/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi b/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi
index 4cdffd6db740..ed5199d7acd8 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi
@@ -15,12 +15,12 @@ chosen {
 
 	extcon_usb1: extcon_usb1 {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
 	};
 
 	extcon_usb2: extcon_usb2 {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
 	};
 
 	sound0: sound0 {
diff --git a/arch/arm/boot/dts/ti/omap/dra71-evm.dts b/arch/arm/boot/dts/ti/omap/dra71-evm.dts
index a64364443031..f747ac56eb92 100644
--- a/arch/arm/boot/dts/ti/omap/dra71-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dra71-evm.dts
@@ -293,11 +293,11 @@ &hdmi {
 };
 
 &extcon_usb1 {
-	vbus-gpio = <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
 };
 
 &extcon_usb2 {
-	vbus-gpio = <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
 };
 
 &ipu2 {
diff --git a/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi b/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
index 31ab0c60ca75..f8151c61488e 100644
--- a/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
@@ -96,12 +96,12 @@ evm_3v3_sd: fixedregulator-sd {
 
 	extcon_usb1: extcon_usb1 {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
 	};
 
 	extcon_usb2: extcon_usb2 {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
 	};
 
 	hdmi0: connector {
diff --git a/arch/arm/boot/dts/ti/omap/dra76-evm.dts b/arch/arm/boot/dts/ti/omap/dra76-evm.dts
index 57868ac60d29..cf9c3d35b049 100644
--- a/arch/arm/boot/dts/ti/omap/dra76-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dra76-evm.dts
@@ -533,11 +533,11 @@ &pcie1_ep {
 };
 
 &extcon_usb1 {
-	vbus-gpio = <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
 };
 
 &extcon_usb2 {
-	vbus-gpio = <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
 };
 
 &m_can0 {
-- 
2.34.1

