Return-Path: <linux-omap+bounces-1919-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC13954F4B
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2024 18:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87071B2424A
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2024 16:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059001C0DF1;
	Fri, 16 Aug 2024 16:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoohLSej"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B1C1C0DDE;
	Fri, 16 Aug 2024 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723826841; cv=none; b=ev9KhMCRK9tB2PR8pCMbaAD7YUXUQhSAZXJ0rUNivxUqSdcLlRI3ff6bZJJNyhpNu04hBTRgp/fNCQ8ZErR2GIfcvSa++Qhk71WvpDGE/1aILH0wa6JYQAoeU5PJ23N0MECEkkWmfwpgm9SQi6SlNo7tCvaELSu185Fbb0dD+24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723826841; c=relaxed/simple;
	bh=A6oWteJWQa5GtSXtODjFY7Q4z1r0QCJglaW5zy61s0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WpH/3tt7hSYImFL586xxIkMToJzaZVJ+Ay3Y2XqCEnX7uMih4owfL47EA8iXYx5VmslIN6898C/Qf8IOLqvRYZyGyXx8YNcaIXUmBKYQM/RAYAYQ91VyfVkZQ2diHlkejp4XFg/Tg0HYP9d/q6vEuaTDsMdH7yVisrsP92Hp/+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoohLSej; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0189EC32782;
	Fri, 16 Aug 2024 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723826841;
	bh=A6oWteJWQa5GtSXtODjFY7Q4z1r0QCJglaW5zy61s0o=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=KoohLSej1xWd5axmAddF0CcCFedUQ4037oeZEkpn8Mw0x2JLW6JcqhFZerArLVRhH
	 XXJLMh4gX0j2P1zpaFrYcEKu+gzmBXNUIvVWeKzqiEfAxAOCmWAnkclhGom4ap4RVu
	 YMcQ285bja9rFlxBBKn3acVJgRxWZIF+920zWwiTfbS+JI66B3roV7ez1OQAOVMB14
	 +MokmHn4OGzsMjv31YplPSUV/HMXL5pRMt0yoTyoh0uupMkYnRYbUdI1u3kJSqUxsK
	 YUmvZ+D8v6vBpxw6OtiKJqvDA762HFWgJuugaaV4c9fy41Ihwk30dqqdk7wwLrWnFb
	 GYQhGMeYBdgMQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Mark Jackson <mpfj@newflow.co.uk>,
	Tony Lindgren <tony@atomide.com>,
	Michal Simek <michal.simek@amd.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-omap@vger.kernel.org
Subject: [PATCH v2] ARM: dts: Fix undocumented LM75 compatible nodes
Date: Fri, 16 Aug 2024 10:47:14 -0600
Message-ID: <20240816164717.1585629-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"lm75" without any vendor is undocumented. It works with the Linux
kernel since the I2C subsystem will do matches of the compatible string
without a vendor prefix to the i2c_device_id and/or driver name.

Mostly replace "lm75" with "national,lm75" as that's the original part
vendor and the compatible which matches what "lm75" matched with. In a
couple of cases the node name or compatible gives a clue to the actual
part and vendor and a more specific compatible can be used. In these
cases, it does change the variant the kernel picks.

"nct75" is an OnSemi part which is compatible with TI TMP75C based on
a comparison of the OnSemi NCT75 datasheet and configuration the Linux
driver uses. Adding an OnSemi compatible would be an ABI change.

"nxp,lm75" is most likely an NXP part. Alexander Stein says the i.MX53
boards are a NXP LM75A as well. NXP makes a LM75A and LM75B. Both are
11-bit resolution and 100ms sample time. The "national,lm75a" is
9-bit, so "national,lm75b" is the closest match for both NXP variants.

While we're here, fix the node names to use the generic name
"temperature-sensor".

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Kevin Hilman <khilman@baylibre.com> # am335x-nano.dts
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers, Please take this directly for v6.12.

v2:
 - Also use "national,lm75b" on i.MX53 boards.
---
 .../aspeed/aspeed-bmc-facebook-greatlakes.dts |  2 +-
 .../socfpga/socfpga_cyclone5_vining_fpga.dts  |  4 +--
 .../dts/marvell/armada-385-clearfog-gtr.dtsi  |  8 ++---
 .../boot/dts/nuvoton/nuvoton-npcm730-kudo.dts | 32 +++++++++----------
 .../boot/dts/nuvoton/nuvoton-npcm750-evb.dts  |  6 ++--
 arch/arm/boot/dts/nxp/imx/imx53-mba53.dts     |  4 +--
 arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi   |  4 +--
 .../dts/nxp/lpc/lpc4357-ea4357-devkit.dts     |  4 +--
 .../boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts  |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  2 +-
 .../boot/dts/xilinx/zynq-zturn-common.dtsi    |  4 +--
 11 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
index 998598c15fd0..49914a4a179f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
@@ -201,7 +201,7 @@ eeprom@54 {
 &i2c12 {
 	status = "okay";
 	temperature-sensor@4f {
-		compatible = "lm75";
+		compatible = "national,lm75";
 		reg = <0x4f>;
 	};
 };
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts
index 65f390bf8975..84f39dec3c42 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts
@@ -130,8 +130,8 @@ gpio: pca9557@1f {
 		#gpio-cells = <2>;
 	};
 
-	temp: lm75@48 {
-		compatible = "lm75";
+	temp: temperature-sensor@48 {
+		compatible = "national,lm75";
 		reg = <0x48>;
 	};
 
diff --git a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
index f3a3cb6ac311..8208c6a9627a 100644
--- a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
@@ -423,14 +423,14 @@ &i2c0 {
 	status = "okay";
 
 	/* U26 temperature sensor placed near SoC */
-	temp1: nct75@4c {
-		compatible = "lm75";
+	temp1: temperature-sensor@4c {
+		compatible = "ti,tmp75c";
 		reg = <0x4c>;
 	};
 
 	/* U27 temperature sensor placed near RTC battery */
-	temp2: nct75@4d {
-		compatible = "lm75";
+	temp2: temperature-sensor@4d {
+		compatible = "ti,tmp75c";
 		reg = <0x4d>;
 	};
 
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
index 1f07ba382910..886a87dfcd0d 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
@@ -531,8 +531,8 @@ i2c@4 {
 			reg = <4>;
 
 			// INLET1_T
-			lm75@5c {
-				compatible = "ti,lm75";
+			temperature-sensor@5c {
+				compatible = "national,lm75";
 				reg = <0x5c>;
 			};
 		};
@@ -543,8 +543,8 @@ i2c@5 {
 			reg = <5>;
 
 			// OUTLET1_T
-			lm75@5c {
-				compatible = "ti,lm75";
+			temperature-sensor@5c {
+				compatible = "national,lm75";
 				reg = <0x5c>;
 			};
 		};
@@ -555,8 +555,8 @@ i2c@6 {
 			reg = <6>;
 
 			// OUTLET2_T
-			lm75@5c {
-				compatible = "ti,lm75";
+			temperature-sensor@5c {
+				compatible = "national,lm75";
 				reg = <0x5c>;
 			};
 		};
@@ -567,8 +567,8 @@ i2c@7 {
 			reg = <7>;
 
 			// OUTLET3_T
-			lm75@5c {
-				compatible = "ti,lm75";
+			temperature-sensor@5c {
+				compatible = "national,lm75";
 				reg = <0x5c>;
 			};
 		};
@@ -697,8 +697,8 @@ i2c@3 {
 			reg = <3>;
 
 			// M2_ZONE_T
-			lm75@28 {
-				compatible = "ti,lm75";
+			temperature-sensor@28 {
+				compatible = "national,lm75";
 				reg = <0x28>;
 			};
 		};
@@ -709,8 +709,8 @@ i2c@4 {
 			reg = <4>;
 
 			// BATT_ZONE_T
-			lm75@29 {
-				compatible = "ti,lm75";
+			temperature-sensor@29 {
+				compatible = "national,lm75";
 				reg = <0x29>;
 			};
 		};
@@ -721,8 +721,8 @@ i2c@5 {
 			reg = <5>;
 
 			// NBM1_ZONE_T
-			lm75@28 {
-				compatible = "ti,lm75";
+			temperature-sensor@28 {
+				compatible = "national,lm75";
 				reg = <0x28>;
 			};
 		};
@@ -732,8 +732,8 @@ i2c@6 {
 			reg = <6>;
 
 			// NBM2_ZONE_T
-			lm75@29 {
-				compatible = "ti,lm75";
+			temperature-sensor@29 {
+				compatible = "national,lm75";
 				reg = <0x29>;
 			};
 		};
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts
index f53d45fa1de8..bcdcb30c7bf6 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts
@@ -198,7 +198,7 @@ &i2c0 {
 	clock-frequency = <100000>;
 	status = "okay";
 	lm75@48 {
-		compatible = "lm75";
+		compatible = "national,lm75";
 		reg = <0x48>;
 		status = "okay";
 	};
@@ -208,8 +208,8 @@ lm75@48 {
 &i2c1 {
 	clock-frequency = <100000>;
 	status = "okay";
-	lm75@48 {
-		compatible = "lm75";
+	temperature-sensor@48 {
+		compatible = "national,lm75";
 		reg = <0x48>;
 		status = "okay";
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
index 2117de872703..0d336cbdb451 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
@@ -175,8 +175,8 @@ expander: pca9554@20 {
 		gpio-controller;
 	};
 
-	sensor2: lm75@49 {
-		compatible = "lm75";
+	sensor2: temperature-sensor@49 {
+		compatible = "national,lm75b";
 		reg = <0x49>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi
index b2d7271d1d24..c34ee84bd716 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi
@@ -254,8 +254,8 @@ pmic: mc34708@8 {
 		interrupts = <6 4>; /* PATA_DATA6, active high */
 	};
 
-	sensor1: lm75@48 {
-		compatible = "lm75";
+	sensor1: temperature-sensor@48 {
+		compatible = "national,lm75b";
 		reg = <0x48>;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts b/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
index 224f80a4a31d..4aefbc01dfc0 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
@@ -482,8 +482,8 @@ mma7455@1d {
 		reg = <0x1d>;
 	};
 
-	lm75@48 {
-		compatible = "nxp,lm75";
+	temperature-sensor@48 {
+		compatible = "national,lm75b";
 		reg = <0x48>;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
index 1f84654df50c..846afb8ccbf1 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
@@ -511,7 +511,7 @@ &i2c1 {
 	clock-frequency = <400000>;
 
 	sensor@49 {
-		compatible = "lm75";
+		compatible = "national,lm75";
 		reg = <0x49>;
 	};
 
diff --git a/arch/arm/boot/dts/ti/omap/am335x-nano.dts b/arch/arm/boot/dts/ti/omap/am335x-nano.dts
index 26b5510cb3d1..56929059f5af 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-nano.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-nano.dts
@@ -231,7 +231,7 @@ tps: tps@24 {
 	};
 
 	temperature-sensor@48 {
-		compatible = "lm75";
+		compatible = "national,lm75";
 		reg = <0x48>;
 	};
 
diff --git a/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi b/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
index dfb1fbafe3aa..33b02e05ce82 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
+++ b/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
@@ -97,9 +97,9 @@ &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	stlm75@49 {
+	temperature-sensor@49 {
 		status = "okay";
-		compatible = "lm75";
+		compatible = "st,stlm75";
 		reg = <0x49>;
 	};
 
-- 
2.43.0


