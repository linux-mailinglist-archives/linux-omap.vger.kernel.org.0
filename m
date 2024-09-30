Return-Path: <linux-omap+bounces-2272-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC4B98AF1F
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 23:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C08181F20D3C
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 21:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780DF1850B6;
	Mon, 30 Sep 2024 21:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="s4Q4ORwp"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC887DA68;
	Mon, 30 Sep 2024 21:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727731822; cv=none; b=FgGjseiA0yOGQFXpCjxhV8bF7SUY8rmZYSY4kMJ2m0k45WzrOJwG1GNc7smNM0DVYbr++zhhGOe6Op9w81g7MBm/x7oynmi+VL+/PzxBbmi1IY3V5n5LwPXl+LhSHAH+TGVF/iFmX2qsdQWS5uW8ILB7huFo25IRQp5T6NCJvos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727731822; c=relaxed/simple;
	bh=yuxlIaVDvMp8/k0NFNTQ7CE40K7LPseGHTWM6GhGQes=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lPWA0iZNWviPwDIoakmNeIiV0rCOcjG0PViwEVxl1yMT8CMzmQseIEFcgo5u8MqUFqrJTClsaGtZbpG+zvI2wWHSn+T4nR32awglffwZOwLFJSVxngWTEDikf7tgfFRlNJI3JwjxpiQCa/7TcXaRr5Bb9DO8ILc6eZleJsgCsw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=s4Q4ORwp; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1dZWb1PNVq+sPtuRDBvavxNO4hxriJlnruAFNj6hDOM=; b=s4Q4ORwpV33TbAtWKLJsm/AxlF
	3/fzquJKmFLza6bJgqXwD58sWUb0N6ItaXfcGtiNqXKwCo5y1GPavj0Vuid7I+ZxywwRPzS0kLXvv
	oG92uHh0CU99PpLZntK8eeyA5++xmxP9FuDNaIDpCxQXquo2mPevpZJMsWob99N+LilpdEqzvLjVX
	/bWGyFuzqdtK8y9kPwheSf8aJN5rtFRReK4545/dDj2wMoYtGNm9GQE50jhpr6haRsl/cIrzdcm93
	XZdzB0SFXl51/85DOuv8dXirucNrdzWRAgcfSk0A7fQNrRtDhAUBY+MbrdaxwByfsD4p/pbodhlm1
	f5JV2fPA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	khilman@baylibre.com,
	devicetree@vger.kernel.org,
	tony@atomide.com,
	rogerq@kernel.org,
	aaro.koskinen@iki.fi,
	linux-omap@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 3/4] ARM: dts: omap: omap4-epson-embt2ws: add unknown gpio outputs
Date: Mon, 30 Sep 2024 23:30:07 +0200
Message-Id: <20240930213008.159647-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240930213008.159647-1-andreas@kemnade.info>
References: <20240930213008.159647-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set them to the state seen in a running system, initialized
by vendor u-boot or kernel. Add line names where they are defined in the
vendor kernel.
gpio15 resets something in the display, otherwise meaning of the
gpios is not known.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
index cc1b6080bf95..c8205ae89840 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -115,6 +115,65 @@ wl12xx_vmmc: wl12xx-vmmc {
 	};
 };
 
+&gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio1_hog_pins &gpio1wk_hog_pins>;
+
+	lb-reset-hog {
+		gpio-hog;
+		gpios = <9 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "lb_reset";
+	};
+
+	power-en-hog {
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "power_en";
+	};
+
+	panel-power-en-hog {
+		gpio-hog;
+		gpios = <14 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "panel_power_en";
+	};
+
+	blc-r-hog {
+		gpio-hog;
+		gpios = <17 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "blc_r";
+	};
+
+	blc-l-hog {
+		gpio-hog;
+		gpios = <16 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "blc_l";
+	};
+
+	high-hog {
+		gpio-hog;
+		gpios = <15 GPIO_ACTIVE_HIGH /* maybe dsi to dpi chip reset? */
+			 21 GPIO_ACTIVE_HIGH
+			 26 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "unknown-high";
+	};
+
+	low-hog {
+		gpio-hog;
+		gpios = <18 GPIO_ACTIVE_HIGH
+			 19 GPIO_ACTIVE_HIGH
+			 20 GPIO_ACTIVE_HIGH
+			 22 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "unknown-low";
+	};
+};
+
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1_pins>;
@@ -406,6 +465,22 @@ OMAP4_IOPAD(0x56, PIN_INPUT_PULLUP | MUX_MODE3) /* gpio35 */
 		>;
 	};
 
+	gpio1_hog_pins: pinmux-gpio1-hog-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x1b4, PIN_OUTPUT | MUX_MODE3) /* gpio14 */
+			OMAP4_IOPAD(0x1b8, PIN_OUTPUT | MUX_MODE3) /* gpio16 */
+			OMAP4_IOPAD(0x1ba, PIN_OUTPUT | MUX_MODE3) /* gpio17 */
+
+			OMAP4_IOPAD(0x1b6, PIN_OUTPUT | MUX_MODE3) /* gpio15 */
+			OMAP4_IOPAD(0x1bc, PIN_OUTPUT | MUX_MODE3) /* gpio18 */
+			OMAP4_IOPAD(0x1be, PIN_OUTPUT | MUX_MODE3) /* gpio19 */
+			OMAP4_IOPAD(0x1c0, PIN_OUTPUT | MUX_MODE3) /* gpio20 */
+			OMAP4_IOPAD(0x1c2, PIN_OUTPUT | MUX_MODE3) /* gpio21 */
+			OMAP4_IOPAD(0x1c4, PIN_OUTPUT | MUX_MODE3) /* gpio22 */
+			OMAP4_IOPAD(0x1cc, PIN_OUTPUT | MUX_MODE3) /* gpio26 */
+		>;
+	};
+
 	i2c1_pins: pinmux-i2c1-pins {
 		pinctrl-single,pins = <
 			   OMAP4_IOPAD(0x122, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
@@ -527,6 +602,15 @@ OMAP4_IOPAD(0x1c8, PIN_OUTPUT | MUX_MODE3)  /* gpio_24 / WLAN_EN */
 	};
 };
 
+&omap4_pmx_wkup {
+	gpio1wk_hog_pins: pinmux-gpio1wk-hog-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x68, PIN_INPUT_PULLDOWN | MUX_MODE3) /* gpio9 */
+			OMAP4_IOPAD(0x6a, PIN_INPUT | MUX_MODE3) /* gpio10 */
+		>;
+	};
+};
+
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart2_pins &bt_pins>;
-- 
2.39.5


