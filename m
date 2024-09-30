Return-Path: <linux-omap+bounces-2275-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE9698AF27
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 23:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1FA328186B
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 21:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E76187347;
	Mon, 30 Sep 2024 21:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="1zyNN3mD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D99183CD5;
	Mon, 30 Sep 2024 21:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727731823; cv=none; b=byGHrsjv1B1wYVlChHhvi40A4Fnyxh2ZQIhfhdn2rt47c5XUsk6pP6fWTNme8A7dV4laio+Q4oJMcwK5CZd5KZYseDwy7Aea08dL+wW+3Fb0s/2JZMBIT6fhQk1Yn3n8NtLY4R0QbUWd9qwYa+xF6zriQfA43FF/6w7skfgiwqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727731823; c=relaxed/simple;
	bh=chJF96EQTYi+2IDiOsUwdarpqXGcEerFPEo55MbeF2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z9xl8ZfIdUQ1QJPibr6CtUCf8V3XTtEzHRC0cHDiaX/KbleBf72EZLXfv4tGTfUz16OAfW501K6aE3m+kyz4yqzMTGrE75jXgrtChsihZ0sCC9vc1AsxvXdjLuA3Upk1ul4xqvxaECXdpxEoLFOqO7lw6oyzgFk8hxH2LbwLq1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=1zyNN3mD; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GpYfCdHY+59pQoYcWwzCJVXiybRiDrhJ8jLcZU5UCqY=; b=1zyNN3mDstmgiVkogZ9GaSMBUM
	CJNbyPiMlKoUaMbTQW6OSOddFsYIKBOBvpTIIs30tZsnFndxPl7QErSIqJxD5HfLdxm8GXCkUDqso
	Ax1mVlmlBFa2i/aZragMiz0+R974PtFE/4ZuAJvQOB/HMBohd8THhiljJwaCb00NNnVcu7HKT2tXn
	OWi5vxkwfV4YCQWEryFlxCtpZuptWon/9EBjkrXKKr4NjSqd14ICmIxkqkcqbYxY0ku6GYMys9OaS
	T3hN+ZAu2DJnrQRwX4uD8rznmOTNc/l9N1KCgGUV7pqywD3mUq5uqrL6jEfcSnfgO+xrLRBDf54Zo
	p4w2c3GA==;
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
Subject: [PATCH 1/4] ARM: dts: omap: omap4-epson-embt2ws: define GPIO regulators
Date: Mon, 30 Sep 2024 23:30:05 +0200
Message-Id: <20240930213008.159647-2-andreas@kemnade.info>
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

To properly have things running after cold boot, define
GPIO regulators. Naming is based on board file.

In the vendor kernel they are enabled in a function
called bt2ws_dcdc_init() if the system is not booted just
to charge the battery.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
index 339e52ba3614..d6b0abba19f6 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -29,6 +29,42 @@ backlight-right {
 		power-supply = <&unknown_supply>;
 	};
 
+	cb_v18: cb-v18 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&cb_v18_pins>;
+		compatible = "regulator-fixed";
+		regulator-name = "cb_v18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	cb_v33: cb-v33 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&cb_v33_pins>;
+		compatible = "regulator-fixed";
+		regulator-name = "cb_v33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		gpio = <&gpio6 30 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	cb-v50 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&cb_v50_pins>;
+		compatible = "regulator-fixed";
+		regulator-name = "cb_v50";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		gpio = <&gpio6 31 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	chosen {
 		stdout-path = &uart3;
 	};
@@ -46,6 +82,19 @@ key-lock {
 		};
 	};
 
+	lb_v50: lb-v50 {
+		/* required for many things at the head (probably indirectly) */
+		pinctrl-names = "default";
+		pinctrl-0 = <&lb_v50_pins>;
+		compatible = "regulator-fixed";
+		regulator-name = "lb_v50";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		gpio = <&gpio1 27 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	unknown_supply: unknown-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "unknown";
@@ -336,6 +385,24 @@ OMAP4_IOPAD(0x1ca, PIN_OUTPUT | MUX_MODE3) /* gpio25 */
 		>;
 	};
 
+	cb_v18_pins: pinmux-cb-v18-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x1d0, PIN_OUTPUT | MUX_MODE3) /* gpio28 */
+		>;
+	};
+
+	cb_v33_pins: pinmux-cb-v33-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x1d2, PIN_OUTPUT | MUX_MODE3) /* gpio190 */
+		>;
+	};
+
+	cb_v50_pins: pinmux-cb-v50-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x1d4, PIN_OUTPUT | MUX_MODE3) /* gpio191 */
+		>;
+	};
+
 	gpio_keys_pins: pinmux-gpio-key-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x56, PIN_INPUT_PULLUP | MUX_MODE3) /* gpio35 */
@@ -387,6 +454,12 @@ OMAP4_IOPAD(0x005c, PIN_OUTPUT | MUX_MODE1)
 		>;
 	};
 
+	lb_v50_pins: pinmux-lb-v50-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x1ce, PIN_OUTPUT | MUX_MODE3) /* gpio27 */
+		>;
+	};
+
 	mcbsp2_pins: pinmux-mcbsp2-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0f6, PIN_INPUT | MUX_MODE0)       /* abe_mcbsp2_clkx */
-- 
2.39.5


