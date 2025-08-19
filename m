Return-Path: <linux-omap+bounces-4264-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E358B2C553
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 15:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90A5F1B62BFC
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 13:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD092343D63;
	Tue, 19 Aug 2025 13:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P1k3+kn0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E69341AB1
	for <linux-omap@vger.kernel.org>; Tue, 19 Aug 2025 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609426; cv=none; b=mNxA/UBwjYxNuuOXETD++AVdIFMVDaGE/6Wcar2OUAKkX5aFOkIuibgaUfi/ExKFO/GIOEMJAJ3470nEGIdaL2McBKlhk6QVn/i8fD3AGf7ZrNls6t6zz8XRiwo8ScsxyzGZ6yC7sUIIvRoTzJNV+TxoIBAQEh4p2lZ7PPJPy94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609426; c=relaxed/simple;
	bh=Bv5YvXCKD3sEHEy0whZr2Io0hZSRL3WFhERlKx2wLwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tzoBFu10Sf0vSIPARPOR9LtnBkhSPG/mn6pWWvzOi/B31DsYBuS1dI0HLtvSCwGMS0lkBwMPBEaqUhzIm09l3twxfTpVC5giE6US5JlSclTr1iPr/sQOMgOKIWzRjvz/C+zvWMU9xYOl/ryGx+d7UFvcCGUeECSzwYy6dqmLKTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P1k3+kn0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb74bef86so95620166b.1
        for <linux-omap@vger.kernel.org>; Tue, 19 Aug 2025 06:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609422; x=1756214222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6oO7UcbifjANg6+xucVaaqaXrh56H+LhtGLaKseBvw=;
        b=P1k3+kn0RBqtbZyKscH8ADyrGx5Q6C0aYF8ugFLjlV9HKjoYXDBOoYz1T6NA2qydOt
         T+qBRA9W6zrWksQ56L3ittyn4suvV0eRebkVY+UmEPeRntx9MrG/A/0ZCEdA52eS/mxi
         BovblY1CNVvpAmssEN0Skomvrg6fgUla+SPeDxIHc216tmT+p5Sk7HjB6jSKxIynFN5u
         jPmdrqAXrAvKYuiItY+mKLXn+GZ4ERztBx+rGvo+kSvO4V1G0EmCPQ5jart/uffwM6OB
         +2J4dHF4RWfnJ/nTyp5Tn7XhzjHtknPD31Eg5j+zht+Ec75xaK9uH/dqpHLTQIRuWVBa
         HJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609422; x=1756214222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6oO7UcbifjANg6+xucVaaqaXrh56H+LhtGLaKseBvw=;
        b=tZFMvluJqY+uL7ub5ZtFVuE3Jp+nloShTU3iKBKGMl8s3HPDrxHVJ4Z2bpbeqxkNOZ
         FFRxYf3Q/u2ucMMrthjgy1d74Aw0oM3dyrQ2FN8uOhvDd0bS0qZAPydjuHyrRRBkmlOm
         hVIdIkehTf5xyHLOqDKL/3j/EfNuAKVFqfaCQ1mdE1lqRxQTahIOSuz8av4/wxnPzXKP
         +hhjdkZdqZc1fjv/7Aa2l6LNtsZHOXwRqgvjq1aFdM8zKzB06UNCraCGgoXuEz8W8Q8W
         TkoINoeDUgsfsC5XKxXiFErrscEMMYIcyVlaDVKLS2UX4MtMNW5B8QHf3UKpuFV+Qiax
         DF6g==
X-Forwarded-Encrypted: i=1; AJvYcCVS4YiZalQLh+HW3IRxN0drhvueqhaF4gfr1fnA3Qqvi3XRBkkXFnOBBoZfmFa/+t+eZY5t76ttqhJD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7U2i/hRX4lmmuM0wqD1uGjY0fzQdRewwRX/MvoSJlAwRjuNpj
	rA5mnefedxgJPzqc8Aiama76wdY484faAS4nhKe1iYnnOxtSjVkDgxEMFgdKPcVFKjI=
X-Gm-Gg: ASbGncsLoneBbuVP6mH0AD9BlvX1a1S4qBlmp7S1/+DDEQP5dJXDLfDUEt0BNJgNvGY
	7AEx14fzOZVGk8Cn3qibUDXXkzF3yht3jb71JHWhZ8pzRGG0kP48WKhuRNpoX+w8sh46/N07zvM
	PwJWv+ZWW55Y9YXfuaRXzzf4C5ivYTPzd+leQvOyXp2/P9iL68jL63M+1WpVGkQURr8eKkHCYl5
	yPPUmsxHYpJRIjCypVoz91VQSep2glN5Bpp/vRDP/KAJ8VR5sXOOFVoWDGlHyuz7ybv1r+KMC0o
	KLGt4Z9SwseNyAiTHypdUH3hAr1OP02JpxfA8nhxytNzkVUjOcCqIsT9FXgWVRuJFluYUwOb/QO
	Onclnj6JzbeY0wfXtUxRWdlS2WsTGd0n11w==
X-Google-Smtp-Source: AGHT+IGaketc/mPE71H8qiCvBINl3fociuyFe3ipXPvm1yAjoe0EVAgQ2XFvCAAR1jGETap8sm+eBw==
X-Received: by 2002:a17:906:7950:b0:ae6:c555:8dbb with SMTP id a640c23a62f3a-afddd27def9mr115923766b.11.1755609422428;
        Tue, 19 Aug 2025 06:17:02 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfccea7sm1005948066b.67.2025.08.19.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:17:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] ARM: dts: omap: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:16:54 +0200
Message-ID: <20250819131651.86569-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
References: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7662; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Bv5YvXCKD3sEHEy0whZr2Io0hZSRL3WFhERlKx2wLwU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHlF76yqVlEVRvjTp0YREvGTF65iZZhqrfmTG
 /V2v+Osfu+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5RQAKCRDBN2bmhouD
 18zkD/0b7To2OAux7kXNWZ0VpydPAqbeALF9fgzHu5S3KK3o/ZQaQHxG3PmYzpjFL6qQ307zjwm
 R8f7LLrAqmAooYWAwoYgINpYiTUYYMh54xnEX/CT2Wc2nOnL/aSXTbxEyYjTwEN2Yl/VES+eWrw
 T3Sd503fc+5F4R0VKeiaB/Uu07yRmzfq2w6FjUQyRTqZNMEsPYMGKFZXx2x08e+7ZM66iduIveP
 8GbePPzAhbvGY49Z0wKwk/TRlxHD2gKJ5Qpa9KrQuk2eed/ngZyNVnihl87Z69TJM/zrUmToFsb
 4ydwV95vDLSiWZkOfqQgLhZp2Dti9+NX6WmEKW9DPnzzGSGd2e7zqJSskf19W/zrmvEMVir6DmC
 dn2i3I5jVQ83I2G5ZhGNw02fqE0t5RXlzN9I0VgW7ek1pESp4TwgnXKYU+BBxl5rtHZgW0MzjFG
 XGlnUy6H02swqSkpxUHJE0dKMOTZMVzfXFcQFPWyvHa8dbWPMxKwnvYcYMV+4ZS5xh9g0mB4h95
 pWpo7nqCAgauIXxzxoc10WMrsAsPv6mQAehS2KOD4j9O4DwOt/Wdp44Ht8fJjnv801xQ5bzraQB
 4u7oieQ7VL4S8XCVjsRzusJCbvOe0WISbUDG0U9p7CN30wRAS2wxxOu8sGSstUFHeRBAtwI+Pbs 9TkZ8loMeH+tnqg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../arm/boot/dts/ti/omap/am335x-myirtech-myd.dts |  4 ++--
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts        |  2 +-
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi         |  8 ++++----
 arch/arm/boot/dts/ti/omap/am33xx.dtsi            |  8 ++++----
 .../dts/ti/omap/am57xx-beagle-x15-common.dtsi    |  2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi           | 14 +++++++-------
 arch/arm/boot/dts/ti/omap/dra71-evm.dts          | 16 ++++++++--------
 .../dts/ti/omap/omap3-devkit8000-common.dtsi     |  4 ++--
 arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dts    |  4 ++--
 9 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
index fd91a3c01a63..06a352f98b22 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
@@ -143,7 +143,7 @@ &i2c1 {
 
 	sgtl5000: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
-		reg =<0xa>;
+		reg = <0xa>;
 		clocks = <&clk12m>;
 		micbias-resistor-k-ohms = <4>;
 		micbias-voltage-m-volts = <2250>;
@@ -155,7 +155,7 @@ sgtl5000: sgtl5000@a {
 
 	tda9988: tda9988@70 {
 		compatible = "nxp,tda998x";
-		reg =<0x70>;
+		reg = <0x70>;
 		audio-ports = <TDA998x_I2S 1>;
 
 		#sound-dai-cells = <0>;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
index 757ebd96b3f0..f3524e5ee43e 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
@@ -109,7 +109,7 @@ clocks {
 		audio_mclk_fixed: oscillator@0 {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-			clock-frequency  = <24576000>;	/* 24.576MHz */
+			clock-frequency = <24576000>;	/* 24.576MHz */
 		};
 
 		audio_mclk: audio_mclk_gate@0 {
diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index d6a143abae5f..f502216ecf38 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -1457,10 +1457,10 @@ SYSC_OMAP2_SOFTRESET |
 
 			gpio1: gpio@0 {
 				compatible = "ti,omap4-gpio";
-				gpio-ranges =   <&am33xx_pinmux  0  0  8>,
-						<&am33xx_pinmux  8 90  4>,
-						<&am33xx_pinmux 12 12 16>,
-						<&am33xx_pinmux 28 30  4>;
+				gpio-ranges = <&am33xx_pinmux  0  0  8>,
+					      <&am33xx_pinmux  8 90  4>,
+					      <&am33xx_pinmux 12 12 16>,
+					      <&am33xx_pinmux 28 30  4>;
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
diff --git a/arch/arm/boot/dts/ti/omap/am33xx.dtsi b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
index 0614ffdc1578..43ec2a95f4bb 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
@@ -461,10 +461,10 @@ &cppi41dma 26 1 &cppi41dma 27 1
 
 			cppi41dma: dma-controller@2000 {
 				compatible = "ti,am3359-cppi41";
-				reg =  <0x0000 0x1000>,
-				       <0x2000 0x1000>,
-				       <0x3000 0x1000>,
-				       <0x4000 0x4000>;
+				reg = <0x0000 0x1000>,
+				      <0x2000 0x1000>,
+				      <0x3000 0x1000>,
+				      <0x4000 0x4000>;
 				reg-names = "glue", "controller", "scheduler", "queuemgr";
 				interrupts = <17>;
 				interrupt-names = "glue";
diff --git a/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi
index 994e69ab38d7..87b61a98d5e9 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi
@@ -149,7 +149,7 @@ led3 {
 	gpio_fan: gpio_fan {
 		/* Based on 5v 500mA AFB02505HHB */
 		compatible = "gpio-fan";
-		gpios =  <&tps659038_gpio 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&tps659038_gpio 2 GPIO_ACTIVE_HIGH>;
 		gpio-fan,speed-map = <0     0>,
 				     <13000 1>;
 		#cooling-cells = <2>;
diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
index ba7fdaae9c6e..c9282f57ffa5 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
@@ -267,8 +267,8 @@ usb2_phy1: phy@4000 {
 					syscon-phy-power = <&scm_conf 0x300>;
 					clocks = <&usb_phy1_always_on_clk32k>,
 						 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS1_CLKCTRL 8>;
-					clock-names =	"wkupclk",
-							"refclk";
+					clock-names = "wkupclk",
+						      "refclk";
 					#phy-cells = <0>;
 				};
 
@@ -279,8 +279,8 @@ usb2_phy2: phy@5000 {
 					syscon-phy-power = <&scm_conf 0xe74>;
 					clocks = <&usb_phy2_always_on_clk32k>,
 						 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS2_CLKCTRL 8>;
-					clock-names =	"wkupclk",
-							"refclk";
+					clock-names = "wkupclk",
+						      "refclk";
 					#phy-cells = <0>;
 				};
 
@@ -294,9 +294,9 @@ usb3_phy1: phy@4400 {
 					clocks = <&usb_phy3_always_on_clk32k>,
 						 <&sys_clkin1>,
 						 <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS1_CLKCTRL 8>;
-					clock-names =	"wkupclk",
-							"sysclk",
-							"refclk";
+					clock-names = "wkupclk",
+						      "sysclk",
+						      "refclk";
 					#phy-cells = <0>;
 				};
 			};
diff --git a/arch/arm/boot/dts/ti/omap/dra71-evm.dts b/arch/arm/boot/dts/ti/omap/dra71-evm.dts
index f747ac56eb92..1d2df8128cfe 100644
--- a/arch/arm/boot/dts/ti/omap/dra71-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dra71-evm.dts
@@ -83,10 +83,10 @@ lp8733: lp8733@60 {
 		compatible = "ti,lp8733";
 		reg = <0x60>;
 
-		buck0-in-supply =<&vsys_3v3>;
-		buck1-in-supply =<&vsys_3v3>;
-		ldo0-in-supply =<&evm_5v0>;
-		ldo1-in-supply =<&evm_5v0>;
+		buck0-in-supply = <&vsys_3v3>;
+		buck1-in-supply = <&vsys_3v3>;
+		ldo0-in-supply = <&evm_5v0>;
+		ldo1-in-supply = <&evm_5v0>;
 
 		lp8733_regulators: regulators {
 			lp8733_buck0_reg: buck0 {
@@ -131,10 +131,10 @@ lp8732: lp8732@61 {
 		compatible = "ti,lp8732";
 		reg = <0x61>;
 
-		buck0-in-supply =<&vsys_3v3>;
-		buck1-in-supply =<&vsys_3v3>;
-		ldo0-in-supply =<&vsys_3v3>;
-		ldo1-in-supply =<&vsys_3v3>;
+		buck0-in-supply = <&vsys_3v3>;
+		buck1-in-supply = <&vsys_3v3>;
+		ldo0-in-supply = <&vsys_3v3>;
+		ldo1-in-supply = <&vsys_3v3>;
 
 		lp8732_regulators: regulators {
 			lp8732_buck0_reg: buck0 {
diff --git a/arch/arm/boot/dts/ti/omap/omap3-devkit8000-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-devkit8000-common.dtsi
index 07d5894ebb74..910e3b54f530 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-devkit8000-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-devkit8000-common.dtsi
@@ -275,8 +275,8 @@ filesystem@680000 {
 
 	ethernet@6,0 {
 		compatible = "davicom,dm9000";
-		reg =  <6 0x000 2>,
-		       <6 0x400 2>; /* CS6, offset 0 and 0x400, IO size 2 */
+		reg = <6 0x000 2>,
+		      <6 0x400 2>; /* CS6, offset 0 and 0x400, IO size 2 */
 		bank-width = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dts b/arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dts
index 07bec48dc441..959fdeeb769e 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dts
@@ -57,8 +57,8 @@ &mmc1_pins
 		&mmc1_aux_pins
 	>;
 
-	wp-gpios =  <&gpio2 27 GPIO_ACTIVE_HIGH>; /* gpio_59  */
-	cd-gpios =  <&gpio5 16 GPIO_ACTIVE_HIGH>; /* gpio_144 */
+	wp-gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>; /* gpio_59  */
+	cd-gpios = <&gpio5 16 GPIO_ACTIVE_HIGH>; /* gpio_144 */
 };
 
 &dss {
-- 
2.48.1


