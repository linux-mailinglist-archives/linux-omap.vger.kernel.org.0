Return-Path: <linux-omap+bounces-3616-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C345DA9DF26
	for <lists+linux-omap@lfdr.de>; Sun, 27 Apr 2025 07:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D40435A626A
	for <lists+linux-omap@lfdr.de>; Sun, 27 Apr 2025 05:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FB72253BB;
	Sun, 27 Apr 2025 05:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="qwR6rJAo"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F457E9;
	Sun, 27 Apr 2025 05:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745731667; cv=none; b=Qp1LtAzQ/PteSe2gnuWGe2/z819sDuMID2Jcu565SpR8vz0Gi/ZJznOsmKJxsOm8JHtORgg3DtsjPOnAonXBjRf5rIzDF6hiQ5lKrly1ghlYL4szix4UvlEN9MYcF44+YD995cGDqlILU+o49xrlVqyW+mkmXOC26VocgO3EP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745731667; c=relaxed/simple;
	bh=WEEMvuLtd7p4Qgk0tAoa2kXnjk6i2SW6sYj7Ivqq/+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j6qySmYuO/DbtpmfuI89xs4JO5YeUQgNTn4cs/aiBFIuKQg9mULzPifeMeIvlyGPrM1dnh65XBUcwBHxsK09YSoeIC3zjfNAq2muKd2FQMrs6zMEgVW91ugo5X+2Ijp53vKn8Y/VKMP2Cw8K4BnhiUemREHYHjEX8dCbw01yTXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=qwR6rJAo; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9frzizwkt26vlquYFfrv5FcyPYNaWUMutJpHPozBbhQ=; b=qwR6rJAokchwAAsw8fJ4WtZxj6
	PYWWozpbZJwpmrxRNfN2+nQ6Gz+mmPfJVUBREZ/TxB8A0pmjk+CJUHYsmqEYsXrorLevkXuB7vC3r
	affRQpHq/CytoZ38KSGex7QBZ3VrcRTDXqb59as3L1BlPGxcxrLV/Ke1YVy7bdti7lbeUO0mIU0LM
	6R5/YUXW89Iwaf8mdzqRGQXVSa69gekSDdzENXd7KDagpjKDgV0vnMZ2HMlpaxOSR40JWpnu7JVHM
	YffJC7wafilU5dH5DeSX3uCg2ATLP603LaXaTfMknrbn/hhG2px4iu6ZdOMJtx2DK7YDVWyqYm8Xg
	iRFavy4A==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Roger Quadros <rogerq@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 2/2] ARM: dts: omap4: panda: cleanup bluetooth
Date: Sun, 27 Apr 2025 07:27:35 +0200
Message-Id: <20250427052735.88133-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250427052735.88133-1-andreas@kemnade.info>
References: <20250427052735.88133-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bluetooth is available on the other Panda board versions, too, so move
stuff to common and specify the needed clock properly.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
---
 .../boot/dts/ti/omap/omap4-panda-common.dtsi  | 31 ++++++++++++++++--
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts  | 32 -------------------
 2 files changed, 28 insertions(+), 35 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
index c860b590142a..05c871d31d7b 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
@@ -367,10 +367,8 @@ OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
 	 */
 	wl12xx_gpio: wl12xx-gpio-pins {
 		pinctrl-single,pins = <
-			OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 */
-			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 */
+			OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 - WLAN_EN */
 			OMAP4_IOPAD(0x070, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a24.gpio_48 */
-			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a25.gpio_49 */
 		>;
 	};
 
@@ -393,6 +391,22 @@ button_pins: button-pins {
 			OMAP4_IOPAD(0x114, PIN_INPUT_PULLUP | MUX_MODE3)	/* gpio_121 */
 		>;
 	};
+
+	bt_pins: bt-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)	  /* gpmc_a22.gpio_46 - BTEN */
+			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3) /* gpmc_a25.gpio_49 - BTWAKEUP */
+		>;
+	};
+
+	uart2_pins: uart2-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x118, PIN_INPUT_PULLUP | MUX_MODE0)  /* uart2_cts.uart2_cts - HCI */
+			OMAP4_IOPAD(0x11a, PIN_OUTPUT | MUX_MODE0)	  /* uart2_rts.uart2_rts */
+			OMAP4_IOPAD(0x11c, PIN_INPUT_PULLUP | MUX_MODE0)  /* uart2_rx.uart2_rx */
+			OMAP4_IOPAD(0x11e, PIN_OUTPUT | MUX_MODE0)	  /* uart2_tx.uart2_tx */
+		>;
+	};
 };
 
 &omap4_pmx_wkup {
@@ -531,8 +545,19 @@ &twl_usb_comparator {
 };
 
 &uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
 	interrupts-extended = <&wakeupgen GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH
 			       &omap4_pmx_core OMAP4_UART2_RX>;
+
+	bluetooth {
+		compatible = "ti,wl1271-st";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_pins>;
+		enable-gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>;	/* GPIO_46 */
+		clocks = <&twl 0>;
+		clock-names = "ext_clock";
+	};
 };
 
 &uart3 {
diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts b/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
index fe7b156d10ed..a933fe560834 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
@@ -49,22 +49,6 @@ button_pins: button-pins {
 			OMAP4_IOPAD(0x0fc, PIN_INPUT_PULLUP | MUX_MODE3) /* gpio_113 */
 		>;
 	};
-
-	bt_pins: bt-pins {
-		pinctrl-single,pins = <
-			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 - BTEN */
-			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a25.gpio_49 - BTWAKEUP */
-		>;
-	};
-
-	uart2_pins: uart2-pins {
-		pinctrl-single,pins = <
-			OMAP4_IOPAD(0x118, PIN_INPUT_PULLUP | MUX_MODE0)	/* uart2_cts.uart2_cts - HCI */
-			OMAP4_IOPAD(0x11a, PIN_OUTPUT | MUX_MODE0)		/* uart2_rts.uart2_rts */
-			OMAP4_IOPAD(0x11c, PIN_INPUT_PULLUP | MUX_MODE0)	/* uart2_rx.uart2_rx */
-			OMAP4_IOPAD(0x11e, PIN_OUTPUT | MUX_MODE0)		/* uart2_tx.uart2_tx */
-		>;
-	};
 };
 
 &led_wkgpio_pins {
@@ -96,19 +80,3 @@ buttonS2 {
 &gpio1_target {
 	 ti,no-reset-on-init;
 };
-
-&wl12xx_gpio {
-	pinctrl-single,pins = <
-		OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 */
-		OMAP4_IOPAD(0x070, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a24.gpio_48 */
-	>;
-};
-
-&uart2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart2_pins &bt_pins>;
-	bluetooth: tiwi {
-		compatible = "ti,wl1271-st";
-		enable-gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>;	/* GPIO_46 */
-	};
-};
-- 
2.39.5


