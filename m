Return-Path: <linux-omap+bounces-3931-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0145AE15AF
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 10:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEC2F3A3DB5
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 08:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CB52367B3;
	Fri, 20 Jun 2025 08:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WBXF9GUG"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1107F235361;
	Fri, 20 Jun 2025 08:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407371; cv=none; b=HrWOZUQ2RWNCnr4fdz5lnZhCVmOu0ipDapvKc+urRuWq8dAu9Ehk3XDlQ1onhviqIwT1WJuV4Hd01C9+EW0X0mrBDYBWfNYXwmec8vg4TY+ybbHej9MqfFYXiEF/scnC2unigX3eLfrIFBvBae18ISrr21UU3SAX8KDMtKTgn2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407371; c=relaxed/simple;
	bh=UYanJxc4ymkCIyOkylyXXJpODUoPU0nVceX7gZ9Hm24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aL+5HEttm3Eaj1dK9TwRMEe0rWhTYboCAf25LQ18QSIydkansL8gXN8HE4DGiv5BAKm85d51rtazabGSQOg1meAoReSDB1l6VfKV5jo5gMd1A3otJ2aXI9IoMmabViKxLI36r0IT9hMWdCx05BylvdHRlYiI32fcpaApk9P3DeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WBXF9GUG; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6954843423;
	Fri, 20 Jun 2025 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750407366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZm1o6+egkUCw/+uFtfcUYBozL8JD2074TeBrjrjeRI=;
	b=WBXF9GUGCT7g1dy0nhcpo2SpuqQN6i/s23zX+d+ikqh0MpUuaXzLezau7cqW2nytG9m+ZZ
	KjO+Q4cbA6cW3NcAa9L5nTwq2LagYMkcJhDawz9tC3/V2+JydN4G9T+ZgR2dH+xzzcdrqV
	kRLSd3Iq/VWGHDcqntc9GEBsEQhp8IqkZFn1tIAl+jvPnSK81z30Vgi+JXApB8ooa+1RAm
	OHW52OKcB16ounHnKceEJP1M0MZAu24OWgdqtcPVl26pDnpW630bek0U5qLOKyEfHEOXDD
	ws/9cVbN9cVGRpqExXpsXYK7sXPPk7PBRvsp3jdYZ/v/c3Qv+9eW9GSw/6cRCw==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri, 20 Jun 2025 10:15:54 +0200
Subject: [PATCH v5 3/5] arm: dts: omap: Add support for BeagleBone Green
 Eco board
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-bbg-v5-3-84f9b9a2e3a8@bootlin.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
In-Reply-To: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>
Cc: Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-dd21f
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehmrghrtgdrmhhurhhphhihsehsrghntghlohhuugdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepphhrrghnvggvthhhsehtihdrtghomhdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhrhidrm
 hgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhho
X-GND-Sasl: kory.maincent@bootlin.com

SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
(BBG). It has minor differences from the BBG, such as a different PMIC,
a different Ethernet PHY, and a larger eMMC.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v4:
- Forgot to change the model description to "Seeed Studio" instead of "ti".

Changes in v3:
- Move the omap.yaml binding change in another patch.

Changes in v2:
- Used generic pmic node name.
- Add regulator prefix to fixed regulator node name.
- Add the compatible to omap.yaml binding
---
 arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 169 +++++++++++++++++++++
 2 files changed, 170 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index 95c68135dd0c..1aef60eef671 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -93,6 +93,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-boneblue.dtb \
 	am335x-bonegreen.dtb \
 	am335x-bonegreen-wireless.dtb \
+	am335x-bonegreen-eco.dtb \
 	am335x-chiliboard.dtb \
 	am335x-cm-t335.dtb \
 	am335x-evm.dtb \
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
new file mode 100644
index 000000000000..d21118cdb6c2
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Bootlin
+ */
+/dts-v1/;
+
+#include "am33xx.dtsi"
+#include "am335x-bone-common.dtsi"
+#include "am335x-bonegreen-common.dtsi"
+#include <dt-bindings/net/ti-dp83867.h>
+
+/ {
+	model = "Seeed Studio BeagleBone Green Eco";
+	compatible = "seeed,am335x-bone-green-eco", "ti,am33xx";
+
+	cpus {
+		cpu@0 {
+			cpu0-supply = <&buck1>;
+		};
+	};
+
+	sys_5v: regulator-sys-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "sys_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	v3v3: regulator-v3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "v3v3";
+		regulator-always-on;
+	};
+};
+
+&usb0 {
+	interrupts-extended = <&intc 18>;
+	interrupt-names = "mc";
+};
+
+&baseboard_eeprom {
+	vcc-supply = <&v3v3>;
+};
+
+&i2c0 {
+	/delete-node/ pmic@24;
+
+	tps65214: pmic@30 {
+		compatible = "ti,tps65214";
+		reg = <0x30>;
+		buck1-supply = <&sys_5v>;
+		buck2-supply = <&sys_5v>;
+		buck3-supply = <&sys_5v>;
+		ldo1-supply = <&sys_5v>;
+		ldo2-supply = <&sys_5v>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <7>;
+		pinctrl-0 = <&pmic_irq_pins_default>;
+
+		regulators {
+			buck1: buck1 {
+				regulator-name = "vdd_mpu";
+				regulator-min-microvolt = <925000>;
+				regulator-max-microvolt = <1298500>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck2: buck2 {
+				regulator-name = "vdd_core";
+				regulator-min-microvolt = <925000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck3: buck3 {
+				regulator-name = "vdds_ddr";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+			};
+
+			ldo1_reg: ldo1 {
+				regulator-name = "vdd_1v8_1";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: ldo2 {
+				regulator-name = "vdd_1v8_2";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&cpsw_port1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&dp83867_0>;
+	ti,dual-emac-pvid = <1>;
+};
+
+&mac_sw {
+	pinctrl-0 = <&cpsw_b_default>;
+	pinctrl-1 = <&cpsw_b_sleep>;
+};
+
+&davinci_mdio_sw {
+	/delete-node/ ethernet-phy@0;
+
+	dp83867_0: ethernet-phy@0 {
+		reg = <0>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_8_B_NIB>;
+		ti,min-output-impedance;
+		ti,dp83867-rxctrl-strap-quirk;
+	};
+};
+
+&am33xx_pinmux {
+	cpsw_b_default: cpsw-b-default-pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_EN, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_DV, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_CLK, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_CLK, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD0, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD1, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD2, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD3, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD0, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD1, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD2, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT_PULLDOWN, MUX_MODE2)
+		>;
+	};
+
+	cpsw_b_sleep: cpsw-b-sleep-pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_EN, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_DV, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_CLK, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_CLK, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD0, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD1, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD2, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD3, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD0, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD1, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD2, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	pmic_irq_pins_default: pmic-irq-default-pins {
+		pinctrl-single,pins = <
+			AM33XX_IOPAD(AM335X_PIN_NNMI, PIN_INPUT_PULLUP | MUX_MODE0)
+		>;
+	};
+};

-- 
2.43.0


