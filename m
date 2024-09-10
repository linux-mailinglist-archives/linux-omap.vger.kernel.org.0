Return-Path: <linux-omap+bounces-2180-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC6E97453D
	for <lists+linux-omap@lfdr.de>; Wed, 11 Sep 2024 00:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 616351C2580E
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 22:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77E01AC427;
	Tue, 10 Sep 2024 21:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfCBUiqF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4706C1ABEAA;
	Tue, 10 Sep 2024 21:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726005586; cv=none; b=Cyhr0q/5BYOYGEwgeRbKaLgKjTxLgdKVyikggdaWbrdzTLSy4Od5KfvaPgdLLJIuCK+IcMko09JsPwD7KnvvV2sPKoHL6s1v0nXG5UwqEkBCJ4lnu8vb0m9rZR24b19wJkzKicZwVtSL50ciZMV99jwH+daewMtl2Uq2Z9hmq8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726005586; c=relaxed/simple;
	bh=VwCDaZjuEXoZ4k8UgcSfawz5FRZnTPYFAGEXBTr/1K0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jZ/f2qoeyj1r6T0lYFroPPNYHR0iHUimU4WGT40gjK/5HqEruU0fiwjvOqbt+0VdEuiQSMvkCveUrNyX8DyHWKoMhK/XJLj6NPU7JeHbpVVgrdoXy0PJg8w/3R+CXhcoEodwpsAsit+kLHxSoam5kYgPEPtfK7M+qXRVSy70Byc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pfCBUiqF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D65C4CEC3;
	Tue, 10 Sep 2024 21:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726005585;
	bh=VwCDaZjuEXoZ4k8UgcSfawz5FRZnTPYFAGEXBTr/1K0=;
	h=From:To:Cc:Subject:Date:From;
	b=pfCBUiqF2tWnc8Oa97lv0K5t1G8JNZQ1HdpRk1Vd4n2oTpxHqNti+rSkZLpB6Me9V
	 RIYAMFwM+BeIHhTCwUDSiSIk/FHM/gzWP6vNhaVEEPqNTmF6OjjqLYI3T6OKjYuFly
	 n97q8n+vQ0Q8udNIcwuULaAXrZntV2BfesIMQGHxEw2AnGpO0cnYs7AEAd3+Z0SBog
	 st2EWLdcQyioh7quMeNnlooafz1fV3gJi9pWcTE7DgJVg4buQa2J6z+qM+25Jm9YhA
	 Gw/xO2bEj/qnbyPmyqt3+K7KtRBeQdXhhF+8m0mvYEH2N+zsPBdDBdDPG35hURQO4s
	 KuaV82chdf27w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: ti/omap: Fix at24 EEPROM node names
Date: Tue, 10 Sep 2024 16:59:38 -0500
Message-ID: <20240910215942.824137-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

at24.yaml defines the node name for at24 EEPROMs as 'eeprom'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi       |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  | 10 +++++-----
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |  6 +++---
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |  2 +-
 arch/arm/boot/dts/ti/omap/am3874-iceboard.dts      |  8 ++++----
 arch/arm/boot/dts/ti/omap/am437x-cm-t43.dts        |  2 +-
 arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts       |  2 +-
 arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dts       |  2 +-
 arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts        |  2 +-
 arch/arm/boot/dts/ti/omap/am43x-epos-evm.dts       |  2 +-
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts  |  2 +-
 arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dts     |  2 +-
 arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-cm-t3x.dtsi        |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi         |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi        |  2 +-
 arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts         |  2 +-
 arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dts        |  2 +-
 19 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
index a4beb718559c..5bedb34b1c92 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
@@ -251,7 +251,7 @@ tps: tps@2d {
 		pinctrl-0 = <&tps65910_pins>;
 	};
 
-	at24@50 {
+	eeprom@50 {
 		compatible = "atmel,24c02";
 		pagesize = <8>;
 		reg = <0x50>;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
index 2d0216840ff5..751148271293 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
@@ -216,7 +216,7 @@ tps: tps@24 {
 		reg = <0x24>;
 	};
 
-	baseboard_eeprom: baseboard_eeprom@50 {
+	baseboard_eeprom: eeprom@50 {
 		compatible = "atmel,24c256";
 		reg = <0x50>;
 		vcc-supply = <&ldo4_reg>;
@@ -236,7 +236,7 @@ &i2c2 {
 	status = "okay";
 	clock-frequency = <100000>;
 
-	cape_eeprom0: cape_eeprom0@54 {
+	cape_eeprom0: eeprom@54 {
 		compatible = "atmel,24c256";
 		reg = <0x54>;
 		#address-cells = <1>;
@@ -246,7 +246,7 @@ cape0_data: cape_data@0 {
 		};
 	};
 
-	cape_eeprom1: cape_eeprom1@55 {
+	cape_eeprom1: eeprom@55 {
 		compatible = "atmel,24c256";
 		reg = <0x55>;
 		#address-cells = <1>;
@@ -256,7 +256,7 @@ cape1_data: cape_data@0 {
 		};
 	};
 
-	cape_eeprom2: cape_eeprom2@56 {
+	cape_eeprom2: eeprom@56 {
 		compatible = "atmel,24c256";
 		reg = <0x56>;
 		#address-cells = <1>;
@@ -266,7 +266,7 @@ cape2_data: cape_data@0 {
 		};
 	};
 
-	cape_eeprom3: cape_eeprom3@57 {
+	cape_eeprom3: eeprom@57 {
 		compatible = "atmel,24c256";
 		reg = <0x57>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
index 801399702547..7baa2b4e6d3b 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
@@ -313,7 +313,7 @@ &usb1 {
 };
 
 &i2c0 {
-	baseboard_eeprom: baseboard_eeprom@50 {
+	baseboard_eeprom: eeprom@50 {
 		compatible = "atmel,24c256";
 		reg = <0x50>;
 
diff --git a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
index 17574d0d0525..ded19e24e666 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
@@ -289,7 +289,7 @@ tps: tps@2d {
 		reg = <0x2d>;
 	};
 
-	m2_eeprom: m2_eeprom@50 {
+	m2_eeprom: eeprom@50 {
 		compatible = "atmel,24c256";
 		reg = <0x50>;
 		status = "okay";
@@ -303,12 +303,12 @@ &i2c1 {
 	status = "okay";
 	clock-frequency = <100000>;
 
-	board_24aa025e48: board_24aa025e48@50 {
+	board_24aa025e48: eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
 	};
 
-	backplane_24aa025e48: backplane_24aa025e48@53 {
+	backplane_24aa025e48: eeprom@53 {
 		compatible = "atmel,24c02";
 		reg = <0x53>;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/am335x-shc.dts b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
index 9297cb1efcd4..597482822608 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-shc.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
@@ -169,7 +169,7 @@ tps: tps@24 {
 		reg = <0x24>;
 	};
 
-	at24@50 {
+	eeprom@50 {
 		compatible = "atmel,24c32";
 		pagesize = <32>;
 		reg = <0x50>;
diff --git a/arch/arm/boot/dts/ti/omap/am3874-iceboard.dts b/arch/arm/boot/dts/ti/omap/am3874-iceboard.dts
index ac082e83a9a2..bbb9200a1f26 100644
--- a/arch/arm/boot/dts/ti/omap/am3874-iceboard.dts
+++ b/arch/arm/boot/dts/ti/omap/am3874-iceboard.dts
@@ -249,8 +249,8 @@ u59: pca9575@23 {
 			tmp100@4c { compatible = "ti,tmp100"; reg = <0x4c>; };
 
 			/* EEPROM bank and serial number are treated as separate devices */
-			at24c01@57 { compatible = "atmel,24c01"; reg = <0x57>; };
-			at24cs01@5f { compatible = "atmel,24cs01"; reg = <0x5f>; };
+			eeprom@57 { compatible = "atmel,24c01"; reg = <0x57>; };
+			eeprom@5f { compatible = "atmel,24cs01"; reg = <0x5f>; };
 		};
 	};
 };
@@ -270,8 +270,8 @@ i2c@6 {
 			multi-master;
 
 			/* All backplanes should have this -- it's how we know they're there. */
-			at24c08@54 { compatible="atmel,24c08"; reg=<0x54>; };
-			at24cs08@5c { compatible="atmel,24cs08"; reg=<0x5c>; };
+			eeprom@54 { compatible="atmel,24c08"; reg=<0x54>; };
+			eeprom@5c { compatible="atmel,24cs08"; reg=<0x5c>; };
 
 			/* 16 slot backplane */
 			tmp421@4d { compatible="ti,tmp421"; reg=<0x4d>; };
diff --git a/arch/arm/boot/dts/ti/omap/am437x-cm-t43.dts b/arch/arm/boot/dts/ti/omap/am437x-cm-t43.dts
index 172516a7667e..e06fc30091c8 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-cm-t43.dts
+++ b/arch/arm/boot/dts/ti/omap/am437x-cm-t43.dts
@@ -254,7 +254,7 @@ ldo1: regulator-ldo1 {
 		};
 	};
 
-	eeprom_module: at24@50 {
+	eeprom_module: eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
 		pagesize = <16>;
diff --git a/arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts b/arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts
index 00682ce7e14c..826f687c368a 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts
@@ -333,7 +333,7 @@ &i2c0 {
 	pinctrl-1 = <&i2c0_pins_sleep>;
 	clock-frequency = <400000>;
 
-	at24@50 {
+	eeprom@50 {
 		compatible = "atmel,24c256";
 		pagesize = <64>;
 		reg = <0x50>;
diff --git a/arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dts b/arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dts
index 5ec57dcb0659..73badf80b4ff 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dts
+++ b/arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dts
@@ -112,7 +112,7 @@ pca9555: pca9555@20 {
 		#gpio-cells = <2>;
 	};
 
-	eeprom_base: at24@50 {
+	eeprom_base: eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
 		pagesize = <16>;
diff --git a/arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts b/arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts
index 9c97006ffd5b..4700f9879d2d 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts
@@ -570,7 +570,7 @@ power-button {
 		};
 	};
 
-	at24@50 {
+	eeprom@50 {
 		compatible = "atmel,24c256";
 		pagesize = <64>;
 		reg = <0x50>;
diff --git a/arch/arm/boot/dts/ti/omap/am43x-epos-evm.dts b/arch/arm/boot/dts/ti/omap/am43x-epos-evm.dts
index 9193a4cfba78..4ac94be8d000 100644
--- a/arch/arm/boot/dts/ti/omap/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/am43x-epos-evm.dts
@@ -651,7 +651,7 @@ ldo1: regulator-ldo1 {
 		};
 	};
 
-	at24@50 {
+	eeprom@50 {
 		compatible = "atmel,24c256";
 		pagesize = <64>;
 		reg = <0x50>;
diff --git a/arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts b/arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts
index d6e3152b02f7..3dd898955e76 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts
+++ b/arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts
@@ -429,7 +429,7 @@ rtc0: rtc@56 {
 		reg = <0x56>;
 	};
 
-	eeprom_module: atmel@50 {
+	eeprom_module: eeprom@50 {
 		compatible = "atmel,24c08";
 		reg = <0x50>;
 		pagesize = <16>;
diff --git a/arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dts b/arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dts
index 64675f4edb60..41bef36c5554 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dts
+++ b/arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dts
@@ -105,7 +105,7 @@ &i2c5 {
 	pinctrl-0 = <&i2c5_pins_default>;
 	clock-frequency = <400000>;
 
-	eeprom_base: atmel@54 {
+	eeprom_base: eeprom@54 {
 		compatible = "atmel,24c08";
 		reg = <0x54>;
 		pagesize = <16>;
diff --git a/arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi b/arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi
index 227699890890..c70b40a2b712 100644
--- a/arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi
+++ b/arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi
@@ -103,7 +103,7 @@ &i2c3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c3_pins>;
 	clock-frequency = <400000>;
-	at24@50 {
+	eeprom@50 {
 		compatible = "atmel,24c64";
 		readonly;
 		reg = <0x50>;
diff --git a/arch/arm/boot/dts/ti/omap/omap3-cm-t3x.dtsi b/arch/arm/boot/dts/ti/omap/omap3-cm-t3x.dtsi
index 950a29f9b4a0..cd13826d033d 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-cm-t3x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-cm-t3x.dtsi
@@ -190,7 +190,7 @@ &i2c1 {
 
 	clock-frequency = <400000>;
 
-	at24@50 {
+	eeprom@50 {
 		compatible = "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x50>;
diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
index 3661340009e7..2ee3ddd64020 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
@@ -601,7 +601,7 @@ tsc2007@48 {
 	};
 
 	/* RFID EEPROM */
-	m24lr64@50 {
+	eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi b/arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi
index 6730c749d5ea..da80d7b7d4b1 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi
@@ -89,7 +89,7 @@ &i2c3 {
 
 	clock-frequency = <400000>;
 
-	at24@50 {
+	eeprom@50 {
 		compatible = "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x50>;
diff --git a/arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts b/arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts
index 6767382996ab..2fd8111de903 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts
+++ b/arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts
@@ -413,7 +413,7 @@ &i2c1 {
 
 	clock-frequency = <400000>;
 
-	at24@50 {
+	eeprom@50 {
 		compatible = "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x50>;
diff --git a/arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dts b/arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dts
index 02716fb796bd..7ae60dc198f3 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dts
+++ b/arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dts
@@ -44,7 +44,7 @@ &i2c4 {
 
 	clock-frequency = <400000>;
 
-	at24@50 {
+	eeprom@50 {
 		compatible = "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x50>;
-- 
2.45.2


