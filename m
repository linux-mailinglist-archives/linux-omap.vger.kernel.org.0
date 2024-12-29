Return-Path: <linux-omap+bounces-2921-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30B49FE0CC
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2024 00:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAE127A1044
	for <lists+linux-omap@lfdr.de>; Sun, 29 Dec 2024 23:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9D319B3EE;
	Sun, 29 Dec 2024 23:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="GQftgAD9"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E52EC147;
	Sun, 29 Dec 2024 23:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735513295; cv=none; b=dkxT2eMdADTFS9mER3Qp/wKiJrdlcSyYZJJhKSpqCL6BdgyEBUFSJUvyHgKiQ29+K+78POqi0k3bThfOnH0FG8lTf7YmCvp8Be8OK+7x0lmACsP8/SolY7aVAaatPrY0OVliyQjbyQn15Qv1W0jd5ncPRs09g2ao2keTYwgWyzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735513295; c=relaxed/simple;
	bh=EOFemFTpkCTmOdM08EmZeDolCDDqXmXOLeBZxjDNQU4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fzrT01iOhKbFeZy3NCIXDWZdu8B27oZPqF9Gh+XTfSsHbgsPoclPQxX4QybmHA1CP84w/5hXEcqbD0uiTumFPPWTGfcsjTbWY9dzj+3QO4l5lle0K4YB7IKPZCyRRINnNha+uC74Gpi3zMnJHjgLQ2DZ2D2dLqD+phnA3/EVwXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=GQftgAD9; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=RWFIWvZf9YSfcXmJnHyBcE4IPXxvzWqpy1dD2oC7RBM=; b=GQftgAD9YxQGHCvaSW2Ezlv7nd
	x6Wt6XyehbBlRtHgpEnrDTegts8tVBw8SvtHaFzUNxnCQu6ZP66sgi12JYH9sJJH8ehzEWdNVo5rc
	vtJWl0atQHYC8bDaf5Pea1KjrshgZNWoLOQBzwNMFfZCJjS4RG7UNcl+g5rqcx3J3e3txJCGuMXTX
	2Dd5ifKba3jj+5uss4jhhNkXF/d0PWCoxo6+g7y7UqUpEFd2XNPhm+u7auMxGuSjHq1ie4EAgyIVS
	+RPVmHqmDEodxADJA+e0AP58xZha45U2UB19LebloQC3TTGsxwyhkhi/IOc3enq8CmDwPlRRyLYzS
	0YHu8xbg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 2/2] ARM: dts: omap4: panda: cleanup bluetooth
Date: Mon, 30 Dec 2024 00:01:25 +0100
Message-Id: <20241229230125.85787-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241229230125.85787-1-andreas@kemnade.info>
References: <20241229230125.85787-1-andreas@kemnade.info>
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
---
 .../boot/dts/ti/omap/omap4-panda-common.dtsi  | 30 +++++++++++++++--
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts  | 32 -------------------
 2 files changed, 28 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
index c860b590142a..c048ab9af053 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
@@ -368,9 +368,7 @@ OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
 	wl12xx_gpio: wl12xx-gpio-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 */
-			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 */
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
+			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)	  /* BTEN */
+			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3) /* BTWAKEUP */
+		>;
+	};
+
+	uart2_pins: uart2-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x118, PIN_INPUT_PULLUP | MUX_MODE0)  /* uart2_cts - HCI */
+			OMAP4_IOPAD(0x11a, PIN_OUTPUT | MUX_MODE0)	  /* uart2_rts */
+			OMAP4_IOPAD(0x11c, PIN_INPUT_PULLUP | MUX_MODE0)  /* uart2_rx */
+			OMAP4_IOPAD(0x11e, PIN_OUTPUT | MUX_MODE0)	  /* uart2_tx */
+		>;
+	};
 };
 
 &omap4_pmx_wkup {
@@ -531,8 +545,20 @@ &twl_usb_comparator {
 };
 
 &uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+
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


