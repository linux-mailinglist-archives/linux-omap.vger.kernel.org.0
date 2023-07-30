Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA677684F3
	for <lists+linux-omap@lfdr.de>; Sun, 30 Jul 2023 13:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjG3LPk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Jul 2023 07:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjG3LPj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Jul 2023 07:15:39 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72691732
        for <linux-omap@vger.kernel.org>; Sun, 30 Jul 2023 04:15:37 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so10007825a12.1
        for <linux-omap@vger.kernel.org>; Sun, 30 Jul 2023 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690715736; x=1691320536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CqjFX5URJbUfrrTdZyrEEug5A8vm6bGcnmVbC8xjljE=;
        b=rPzDc3C16EVWIkG25gPUWmwcxAo5TDIqqgXDdbLvHHNtLjiHzIs34KdgWcpn7JqDWX
         3ymmhjiGsQQrInpiKf+194QguU3UmiebUzu6IFfTO7k4z3l9EabT9ZW9vWi5Pn+IYtu4
         jhjSCK1u8bPjN1aRQNRnwvXL7qBCKos3BoaigxT0XL+/IpZX6sa3nscmXtRL9LfnsxpN
         mmhgqYkInM1kpvwTyROvcutT50kyHtfkiWTbSfLubthprMKW+B/IAV0Ui9j6dpDmobYR
         NFjstmXP0hqKQIDyBIQhPmEi/GPY3sbriMkpO2+/TPaC+uzMRucbKJrL3jKuGuWtcAMt
         XpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690715736; x=1691320536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqjFX5URJbUfrrTdZyrEEug5A8vm6bGcnmVbC8xjljE=;
        b=Si9XrPi9K4afoXuv2mgRIPK5XsbZQXGpc0ozS1csh2xj9WTBN0eDPqpxU+1rcXT41G
         GTv2ZghDzsi5z9jSt9HEf2fWUorNHTCrkLAzfV5qiNmKBa645EDxA1/LR/OXV1hdpipy
         xf0+k3iRaCll3Pt0DmT/zg6LIGOnxyOocv8xK/k+iheCYfQontF86dT70Eno+vAZgfW3
         AYWa4zeBBIcot1aOW8jZg0E4HELGspA2RrdaPSXjmk1+k4SRkemRlDvIVIfZzd3CBFFP
         czMOyX0qWFsnEl6HhvhbZbyyfT9szvsFal6e7Wz31H67PJYOB8sEYHFMx2DmGv2F8foB
         bmvQ==
X-Gm-Message-State: ABy/qLaBwLKBPE0vHvHhHMfWauKOzPvHKK42MDTxV7bKEqBvBZlHvxnC
        5iotOFuUZbRUSQP7mN4/X5RTnFCXe1w9vg8R46M=
X-Google-Smtp-Source: APBJJlGPAA4Bo1JAxACQe6iWiXcMprc6iRiRKMlXZ3ZjagDjp+syI2qxg1SoQ0UbNRLLC9D5h0hlTQ==
X-Received: by 2002:a17:907:7d8d:b0:99c:572:c0e4 with SMTP id oz13-20020a1709077d8d00b0099c0572c0e4mr2309976ejc.7.1690715736167;
        Sun, 30 Jul 2023 04:15:36 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id q20-20020a1709060e5400b00992b3ea1ee4sm4627694eji.149.2023.07.30.04.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 04:15:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: ti: split interrupts per cells
Date:   Sun, 30 Jul 2023 13:15:33 +0200
Message-Id: <20230730111533.98136-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Each interrupt should be in its own cell.  This is much more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/ti/davinci/da850.dtsi           | 15 +++++----------
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi          | 10 +++++-----
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi          | 12 ++++++------
 arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi |  6 +++---
 4 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/ti/davinci/da850.dtsi b/arch/arm/boot/dts/ti/davinci/da850.dtsi
index e46e4d22db39..afa6268a17d7 100644
--- a/arch/arm/boot/dts/ti/davinci/da850.dtsi
+++ b/arch/arm/boot/dts/ti/davinci/da850.dtsi
@@ -421,7 +421,7 @@ edma0: edma@0 {
 			/* eDMA3 CC0: 0x01c0 0000 - 0x01c0 7fff */
 			reg = <0x0 0x8000>;
 			reg-names = "edma3_cc";
-			interrupts = <11 12>;
+			interrupts = <11>, <12>;
 			interrupt-names = "edma3_ccint", "edma3_ccerrint";
 			#dma-cells = <2>;
 
@@ -447,7 +447,7 @@ edma1: edma@230000 {
 			/* eDMA3 CC1: 0x01e3 0000 - 0x01e3 7fff */
 			reg = <0x230000 0x8000>;
 			reg-names = "edma3_cc";
-			interrupts = <93 94>;
+			interrupts = <93>, <94>;
 			interrupt-names = "edma3_ccint", "edma3_ccerrint";
 			#dma-cells = <2>;
 
@@ -494,8 +494,7 @@ serial2: serial@10d000 {
 		rtc0: rtc@23000 {
 			compatible = "ti,da830-rtc";
 			reg = <0x23000 0x1000>;
-			interrupts = <19
-				      19>;
+			interrupts = <19>, <19>;
 			clocks = <&pll0_auxclk>;
 			clock-names = "int-clk";
 			status = "disabled";
@@ -725,11 +724,7 @@ eth0: ethernet@220000 {
 			ti,davinci-ctrl-ram-offset = <0>;
 			ti,davinci-ctrl-ram-size = <0x2000>;
 			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <33
-					34
-					35
-					36
-					>;
+			interrupts = <33>, <34>, <35>,<36>;
 			clocks = <&psc1 5>;
 			power-domains = <&psc1 5>;
 			status = "disabled";
@@ -748,7 +743,7 @@ gpio: gpio@226000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			reg = <0x226000 0x1000>;
-			interrupts = <42 43 44 45 46 47 48 49 50>;
+			interrupts = <42>, <43>, <44>, <45>, <46>, <47>, <48>, <49>, <50>;
 			ti,ngpio = <144>;
 			ti,davinci-gpio-unbanked = <0>;
 			clocks = <&psc1 3>;
diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index 7e50fe633d8a..d6a143abae5f 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -455,8 +455,8 @@ target-module@3e000 {			/* 0x44e3e000, ap 35 60.0 */
 			rtc: rtc@0 {
 				compatible = "ti,am3352-rtc", "ti,da830-rtc";
 				reg = <0x0 0x1000>;
-				interrupts = <75
-					      76>;
+				interrupts = <75>,
+					     <76>;
 			};
 		};
 
@@ -739,7 +739,7 @@ mac: ethernet@0 {
 				 * c0_tx_pend
 				 * c0_misc_pend
 				 */
-				interrupts = <40 41 42 43>;
+				interrupts = <40>, <41>, <42>, <43>;
 				ranges = <0 0 0x8000>;
 				syscon = <&scm_conf>;
 				status = "disabled";
@@ -779,7 +779,7 @@ mac_sw: switch@0 {
 				syscon = <&scm_conf>;
 				status = "disabled";
 
-				interrupts = <40 41 42 43>;
+				interrupts = <40>, <41>, <42>, <43>;
 				interrupt-names = "rx_thresh", "rx", "tx", "misc";
 
 				ethernet-ports {
@@ -899,7 +899,7 @@ pruss_mii_rt: mii-rt@32000 {
 				pruss_intc: interrupt-controller@20000 {
 					compatible = "ti,pruss-intc";
 					reg = <0x20000 0x2000>;
-					interrupts = <20 21 22 23 24 25 26 27>;
+					interrupts = <20>, <21>, <22>, <23>, <24>, <25>, <26>, <27>;
 					interrupt-names = "host_intr0", "host_intr1",
 							  "host_intr2", "host_intr3",
 							  "host_intr4", "host_intr5",
diff --git a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
index 415210b034ef..824b9415ebbe 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
@@ -442,8 +442,8 @@ rtc: rtc@0 {
 				compatible = "ti,am4372-rtc", "ti,am3352-rtc",
 					     "ti,da830-rtc";
 				reg = <0x0 0x1000>;
-				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH
-					      GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk_32768_ck>;
 				clock-names = "int-clk";
 				system-power-controller;
@@ -549,10 +549,10 @@ mac_sw: switch@0 {
 				syscon = <&scm_conf>;
 				status = "disabled";
 
-				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH
-					      GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH
-					      GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH
-					      GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "rx_thresh", "rx", "tx", "misc";
 
 				ethernet-ports {
diff --git a/arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi b/arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi
index 6f46f1ecf1e5..8946b5580cd9 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi
@@ -415,9 +415,9 @@ rtc {
 
 		gpadc: gpadc {
 			compatible = "ti,palmas-gpadc";
-			interrupts = <18 0
-				      16 0
-				      17 0>;
+			interrupts = <18 0>,
+				     <16 0>,
+				     <17 0>;
 			#io-channel-cells = <1>;
 			ti,channel0-current-microamp = <5>;
 			ti,channel3-current-microamp = <10>;
-- 
2.34.1

