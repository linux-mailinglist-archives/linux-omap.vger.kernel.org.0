Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 995A54F8B48
	for <lists+linux-omap@lfdr.de>; Fri,  8 Apr 2022 02:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbiDGWxM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Apr 2022 18:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbiDGWxL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Apr 2022 18:53:11 -0400
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D9511864B;
        Thu,  7 Apr 2022 15:51:09 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id k25-20020a056830151900b005b25d8588dbso4924974otp.4;
        Thu, 07 Apr 2022 15:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Iyq/ySqnNcpA1SmKPqHUlu1t9ONi5yGKorm7jYXHrI=;
        b=mrkffnkJdE34JnrnL2bRW5Fy/6KJgyKN7mFMVADnbuowodAT00Q/0gzW5dAiMCCFm5
         1O02NKGFxCdG9FYCfiFc6IxCh5G2dfGT55pDFZi1r6VVDUMT5q4fjXXuMvJi7bkh7EQo
         FYwqHkhXzk4NjOkhEhQXxTUkCzK9OS8LcQiekCaXjGMkLyFE3EQiuqgsg8PN0I3n1QkX
         IveVC9FgitKFUDK2Fs6gJNFNVHxMuDD1fJVBffPjAzdRFFt450PKu1t32JE4EYnlSL5a
         3M5K7DqiKxwtxK5waR+nhh+VfYxuAy3PT+nQEABTTNqAZIl7RoCS8ht4oxwOngVPcPU5
         mVtA==
X-Gm-Message-State: AOAM530qq48yvo+ULpzossaFs42a0IeXzLG1JI5xhSSGV4AeT6iiU27M
        Tx+UVl5ATxqxbB0ZyTtl/A==
X-Google-Smtp-Source: ABdhPJxIQn9UQyb2mvfpCWRQISx5uWJHlcnDpiZ1+T8/LMvMks1GjET2QcDeL3rtiUsS/mzexB+/9A==
X-Received: by 2002:a9d:7dd8:0:b0:5b2:29e1:d46a with SMTP id k24-20020a9d7dd8000000b005b229e1d46amr5681467otn.106.1649371869235;
        Thu, 07 Apr 2022 15:51:09 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id u22-20020a4ae696000000b0032158ab4ce9sm7760668oot.26.2022.04.07.15.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 15:51:08 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     soc@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] ARM: dts: Fix more boolean properties with values
Date:   Thu,  7 Apr 2022 17:51:07 -0500
Message-Id: <20220407225107.2175958-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Boolean properties in DT are present or not present and don't take a value.
A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
matter.

It may have been intended that 0 values are false, but there is no change
in behavior with this patch.

Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: "Benoît Cousson" <bcousson@baylibre.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-omap@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/at91-sam9_l9260.dts            | 2 +-
 arch/arm/boot/dts/imx28-ts4600.dts               | 2 +-
 arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi | 4 ++--
 arch/arm/boot/dts/qcom-ipq8064.dtsi              | 8 ++++----
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sam9_l9260.dts b/arch/arm/boot/dts/at91-sam9_l9260.dts
index 1e2a28c2f365..2fb51b9aca2a 100644
--- a/arch/arm/boot/dts/at91-sam9_l9260.dts
+++ b/arch/arm/boot/dts/at91-sam9_l9260.dts
@@ -101,7 +101,7 @@ pinctrl_board_mmc0: mmc0-board {
 		nand0: nand@40000000 {
 			nand-bus-width = <8>;
 			nand-ecc-mode = "soft";
-			nand-on-flash-bbt = <1>;
+			nand-on-flash-bbt;
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/imx28-ts4600.dts b/arch/arm/boot/dts/imx28-ts4600.dts
index 097ec35c62d8..0d58da1c0cc5 100644
--- a/arch/arm/boot/dts/imx28-ts4600.dts
+++ b/arch/arm/boot/dts/imx28-ts4600.dts
@@ -26,7 +26,7 @@ ssp0: spi@80010000 {
 				pinctrl-0 = <&mmc0_4bit_pins_a
 					     &mmc0_sck_cfg
 					     &en_sd_pwr>;
-				broken-cd = <1>;
+				broken-cd;
 				bus-width = <4>;
 				vmmc-supply = <&reg_vddio_sd0>;
 				status = "okay";
diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
index b4664ab00256..d3da8b1b473b 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
@@ -118,8 +118,8 @@ usb@6,0 {
 		gpmc,device-width = <2>;
 		gpmc,wait-pin = <0>;
 		gpmc,burst-length = <4>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 		gpmc,cs-on-ns = <0>;
 		gpmc,cs-rd-off-ns = <45>;
 		gpmc,cs-wr-off-ns = <45>;
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 996f4458d9fc..8cb04aa8ed2f 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -972,7 +972,7 @@ gmac0: ethernet@37000000 {
 
 			snps,axi-config = <&stmmac_axi_setup>;
 			snps,pbl = <32>;
-			snps,aal = <1>;
+			snps,aal;
 
 			qcom,nss-common = <&nss_common>;
 			qcom,qsgmii-csr = <&qsgmii_csr>;
@@ -996,7 +996,7 @@ gmac1: ethernet@37200000 {
 
 			snps,axi-config = <&stmmac_axi_setup>;
 			snps,pbl = <32>;
-			snps,aal = <1>;
+			snps,aal;
 
 			qcom,nss-common = <&nss_common>;
 			qcom,qsgmii-csr = <&qsgmii_csr>;
@@ -1020,7 +1020,7 @@ gmac2: ethernet@37400000 {
 
 			snps,axi-config = <&stmmac_axi_setup>;
 			snps,pbl = <32>;
-			snps,aal = <1>;
+			snps,aal;
 
 			qcom,nss-common = <&nss_common>;
 			qcom,qsgmii-csr = <&qsgmii_csr>;
@@ -1044,7 +1044,7 @@ gmac3: ethernet@37600000 {
 
 			snps,axi-config = <&stmmac_axi_setup>;
 			snps,pbl = <32>;
-			snps,aal = <1>;
+			snps,aal;
 
 			qcom,nss-common = <&nss_common>;
 			qcom,qsgmii-csr = <&qsgmii_csr>;
-- 
2.32.0

