Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354D646F1EC
	for <lists+linux-omap@lfdr.de>; Thu,  9 Dec 2021 18:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242987AbhLIRdr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Dec 2021 12:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242968AbhLIRdr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Dec 2021 12:33:47 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6BBBC061746;
        Thu,  9 Dec 2021 09:30:13 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d9so10976819wrw.4;
        Thu, 09 Dec 2021 09:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v/OOoi3SmexEsu6wx5v8tEWhhsw2vNL3yCuakv1MHRQ=;
        b=iNBC+9Iod7E1Z7aIofR98DHqPx7qrzbItF/+Ue/aDZIfopvmfTFy1DZyoYogZibrFX
         yXjNKIHcMNL2hwTewS5LZKWthbq1LIgts7TyjIvrkaf3mKIlwTUxH4n3nffxhbAtDout
         yxHMdFIQpInfOCqU4DsC8SQ3omRmaXqbfs65raYOeFR/pJm8BRYqqACdHSSR0rpgpWBu
         k308y2CA1FSEq+0s/LiF4pWYRqiMuP5fe1rMVnsk5YUtNZ2OIBgHOeJ3a50BMPEqXC5G
         V2nMnguSaJcKJK/uJMqMKKEHzC1ZEkEzmQg3Jr+8WnQY8huzuTjAmaii8lZDXo3oyKaS
         RI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v/OOoi3SmexEsu6wx5v8tEWhhsw2vNL3yCuakv1MHRQ=;
        b=rg6wSjqgGSFJNNoTrrNvMci1RG6UwPMrWHpbWaa562qNmuTq+ZgFLN4aKTHdEy9rHL
         RjsRsySw6cZuzme5gld7GXQH/sag9IO/YMDax42cIh6P/GZ1urCxBWT1kb40GlD1nn6t
         o1thbzVBtoaCBwIqpD2Vhc07/TTlPU1tuRNh11vJ4Bb8Sw71fgObHbgbTVXis4kVGOzC
         IbETXk3jrQ8d/NhXMvxEbVUULj75m/Cxzp+RE6pNpDyit1dX7LQ5uAdjYPQQhxqmuq5W
         oKGxkDaFBu5XJV2dNmCD5ZeQYE9Um3qlFbMkb+vtBvl9pGODSiclZhPHulGsGyk1Z3Yj
         IjiA==
X-Gm-Message-State: AOAM532zLVQ2bJ5UFUOwilZsA2fF4iHWyc4TSukxkGCnxf1s6vgWoiC6
        gxblMiq97KNPu91IdilqWUg=
X-Google-Smtp-Source: ABdhPJy3Dw6JhZlTIC3VpksDXRSio5Dn+L8aoonIVGqISxVTbi0QyphXCqfQa3s9BiA/uT5AGz5ggA==
X-Received: by 2002:a5d:4ccc:: with SMTP id c12mr8103683wrt.453.1639071012171;
        Thu, 09 Dec 2021 09:30:12 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id g5sm418009wri.45.2021.12.09.09.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:30:11 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: Remove unsupported properties for STMPE MFD
Date:   Thu,  9 Dec 2021 18:30:09 +0100
Message-Id: <20211209173009.618162-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Some users of the STMPE MFD bindings use unsupported properties such as
"id", "blocks" and "irq-trigger". These look like they may have been
under discussion at some point but never made it into the bindings that
were accepted upstream.

Remove these unknown properties from the device trees to avoid errors
during validation against the DT schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/am5729-beagleboneai.dts  | 3 ---
 arch/arm/boot/dts/exynos4412-p4note.dtsi   | 1 -
 arch/arm/boot/dts/imx53-m53.dtsi           | 3 ---
 arch/arm/boot/dts/imx6q-novena.dts         | 3 ---
 arch/arm/boot/dts/imx6qdl-apalis.dtsi      | 3 ---
 arch/arm/boot/dts/imx6qdl-colibri.dtsi     | 3 ---
 arch/arm/boot/dts/spear1310-evb.dts        | 1 -
 arch/arm/boot/dts/spear1340-evb.dts        | 2 --
 arch/arm/boot/dts/spear320-hmi.dts         | 3 ---
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi | 3 ---
 arch/arm/boot/dts/tegra30-apalis.dtsi      | 3 ---
 arch/arm/boot/dts/tegra30-colibri.dtsi     | 3 ---
 12 files changed, 31 deletions(-)

diff --git a/arch/arm/boot/dts/am5729-beagleboneai.dts b/arch/arm/boot/dts/am5729-beagleboneai.dts
index 149cfafb90bf..ab5b2e3b2b65 100644
--- a/arch/arm/boot/dts/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/am5729-beagleboneai.dts
@@ -416,9 +416,6 @@ stmpe811@41 {
 		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&gpio2>;
 		interrupt-controller;
-		id = <0>;
-		blocks = <0x5>;
-		irq-trigger = <0x1>;
 		st,mod-12b = <1>; /* 12-bit ADC */
 		st,ref-sel = <0>; /* internal ADC reference */
 		st,adc-freq = <1>; /* 3.25 MHz ADC clock speed */
diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
index 22c3086e0076..8f5fbb4125b7 100644
--- a/arch/arm/boot/dts/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
@@ -169,7 +169,6 @@ adc@41 {
 			interrupt-parent = <&gpx0>;
 			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-controller;
-			irq-trigger = <0x1>;
 			st,adc-freq = <3>;
 			st,mod-12b = <1>;
 			st,ref-sel = <0>;
diff --git a/arch/arm/boot/dts/imx53-m53.dtsi b/arch/arm/boot/dts/imx53-m53.dtsi
index fe5e0d308e99..e5c43cb6f784 100644
--- a/arch/arm/boot/dts/imx53-m53.dtsi
+++ b/arch/arm/boot/dts/imx53-m53.dtsi
@@ -49,11 +49,8 @@ &i2c2 {
 	touchscreen@41 {
 		compatible = "st,stmpe610";
 		reg = <0x41>;
-		id = <0>;
-		blocks = <0x5>;
 		interrupts = <6 0x0>;
 		interrupt-parent = <&gpio7>;
-		irq-trigger = <0x1>;
 
 		stmpe_touchscreen {
 			compatible = "st,stmpe-ts";
diff --git a/arch/arm/boot/dts/imx6q-novena.dts b/arch/arm/boot/dts/imx6q-novena.dts
index 225cf6b7a7a4..448a09369e18 100644
--- a/arch/arm/boot/dts/imx6q-novena.dts
+++ b/arch/arm/boot/dts/imx6q-novena.dts
@@ -280,9 +280,6 @@ touch: stmpe811@44 {
 		compatible = "st,stmpe811";
 		reg = <0x44>;
 		irq-gpio = <&gpio5 13 GPIO_ACTIVE_HIGH>;
-		id = <0>;
-		blocks = <0x5>;
-		irq-trigger = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_stmpe_novena>;
 		vio-supply = <&reg_3p3v>;
diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
index ed2739e39085..5e36fc7015cd 100644
--- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
@@ -301,9 +301,6 @@ stmpe811@41 {
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&gpio4>;
 		interrupt-controller;
-		id = <0>;
-		blocks = <0x5>;
-		irq-trigger = <0x1>;
 		/* 3.25 MHz ADC clock speed */
 		st,adc-freq = <1>;
 		/* 12-bit ADC */
diff --git a/arch/arm/boot/dts/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
index 4e2a309c93fa..c2f3cb633ac8 100644
--- a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
@@ -246,9 +246,6 @@ stmpe811@41 {
 		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&gpio6>;
 		interrupt-controller;
-		id = <0>;
-		blocks = <0x5>;
-		irq-trigger = <0x1>;
 		/* 3.25 MHz ADC clock speed */
 		st,adc-freq = <1>;
 		/* 12-bit ADC */
diff --git a/arch/arm/boot/dts/spear1310-evb.dts b/arch/arm/boot/dts/spear1310-evb.dts
index 8fcb6be6e7c7..29a26995c82e 100644
--- a/arch/arm/boot/dts/spear1310-evb.dts
+++ b/arch/arm/boot/dts/spear1310-evb.dts
@@ -363,7 +363,6 @@ stmpe610@0 {
 					pl022,duplex = <0>;
 					interrupts = <6 0x4>;
 					interrupt-parent = <&gpio1>;
-					irq-trigger = <0x2>;
 
 					stmpe_touchscreen {
 						compatible = "st,stmpe-ts";
diff --git a/arch/arm/boot/dts/spear1340-evb.dts b/arch/arm/boot/dts/spear1340-evb.dts
index f70ff56d4542..58136577a6a1 100644
--- a/arch/arm/boot/dts/spear1340-evb.dts
+++ b/arch/arm/boot/dts/spear1340-evb.dts
@@ -319,7 +319,6 @@ stmpe801@41 {
 					reg = <0x41>;
 					interrupts = <4 0x4>;
 					interrupt-parent = <&gpio0>;
-					irq-trigger = <0x2>;
 
 					stmpegpio: stmpe_gpio {
 						compatible = "st,stmpe-gpio";
@@ -472,7 +471,6 @@ stmpe610@1 {
 					pl022,duplex = <0>;
 					interrupts = <100 0>;
 					interrupt-parent = <&gpiopinctrl>;
-					irq-trigger = <0x2>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
diff --git a/arch/arm/boot/dts/spear320-hmi.dts b/arch/arm/boot/dts/spear320-hmi.dts
index 367ba48aac3e..f522c5cca4e9 100644
--- a/arch/arm/boot/dts/spear320-hmi.dts
+++ b/arch/arm/boot/dts/spear320-hmi.dts
@@ -237,9 +237,6 @@ stmpe811@41 {
 					reg = <0x41>;
 					irq-over-gpio;
 					irq-gpios = <&gpiopinctrl 29 0x4>;
-					id = <0>;
-					blocks = <0x5>;
-					irq-trigger = <0x1>;
 
 					stmpegpio: stmpe-gpio {
 						compatible = "stmpe,gpio";
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
index 6a3a72f81c44..e4e17c0e01fd 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
@@ -992,9 +992,6 @@ touchscreen@41 {
 			reg = <0x41>;
 			irq-gpio = <&gpio TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;
 			interrupt-controller;
-			id = <0>;
-			blocks = <0x5>;
-			irq-trigger = <0x1>;
 			/* 3.25 MHz ADC clock speed */
 			st,adc-freq = <1>;
 			/* 12-bit ADC */
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index b2ac51fb15b1..28e7d445c076 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -975,9 +975,6 @@ touchscreen@41 {
 			reg = <0x41>;
 			irq-gpio = <&gpio TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;
 			interrupt-controller;
-			id = <0>;
-			blocks = <0x5>;
-			irq-trigger = <0x1>;
 			/* 3.25 MHz ADC clock speed */
 			st,adc-freq = <1>;
 			/* 12-bit ADC */
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 413e35215804..88b7f2925e9e 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -844,9 +844,6 @@ touchscreen@41 {
 			reg = <0x41>;
 			irq-gpio = <&gpio TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;
 			interrupt-controller;
-			id = <0>;
-			blocks = <0x5>;
-			irq-trigger = <0x1>;
 			/* 3.25 MHz ADC clock speed */
 			st,adc-freq = <1>;
 			/* 12-bit ADC */
-- 
2.34.1

