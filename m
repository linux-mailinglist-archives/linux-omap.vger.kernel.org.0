Return-Path: <linux-omap+bounces-2385-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CD79985FA
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 14:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0F142830E2
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 12:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145F31C689F;
	Thu, 10 Oct 2024 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="fUk3Cqs1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FE61C57AD;
	Thu, 10 Oct 2024 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728563408; cv=none; b=Ayjq5Ptkj7T7USSNoLNT696QtUCWcorY37MaXGNv3gXArcJYhCay9lCHgOgE03iguSyFtxbNXhd/pU+0LXWZoekmZ+ZHxjGs/E0Kz3Y6DtshD7hS4JX2b2A0HU9aWhKztN50a+5tkG5HZWgDPv0uxxdcoVGPmRXS3jRoyaaenuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728563408; c=relaxed/simple;
	bh=zIsf5wBtJEcRsHHarX8fdw1tTc6HKm1kV19ptcg4D9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jZoA91nI8YUPmR8S639beGQJkpw1VDGTcsqCG2VNvrsjN5w9bvLBFkfUsz5+nBcVWjXVgWFAZ2hna/SsKl9P/CDlYZnX+H2bD296vjYqgKadTLS8+g5FHh60qf53cEaOrjZp57V8XZJZS+VaNE+Nnv5ehwDg/gnrEExzXjDa6Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=fUk3Cqs1; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WoXNrrK9utFPkWsdOWLdvgndBfH4FnI9f6ttIiYO7Ak=; b=fUk3Cqs1KxESUYV7zjgtIZB6Dh
	+dA7v7GzQs/XUosn4FMTR6RcoNPK1CUB9e74ygLHZCieulg15ItbogQbPfm2ABIIKAn1/sgkLQAoY
	oFugY2yNP1WCb/qnuV2L5JcuA6l41Afvkvrh8mlk23UzU0en8ARXYPSC6rb9t3hMU4GF4s5V8V3si
	iG1aNugVvikqSeVbVwEx3hQfrT1zc3smn4YDOWg2Z2U7FwllmCA2Ey04eH8fBhUF8oQPvZDxcamXR
	TjaVgVWc34AEDAibtqAplEVt9mB/egnFfuuuxca+iACsaETID2uUNGGFrPmObO6gOcM4TfEjop4EG
	Aunv/o3Q==;
From: Andreas Kemnade <andreas@kemnade.info>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	rogerq@kernel.org,
	linux-omap@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	tony@atomide.com,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	Conor Dooley <conor+dt@kernel.org>,
	aaro.koskinen@iki.fi
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 3/4] ARM: dts: omap: omap4-epson-embt2ws: add unknown gpio outputs
Date: Thu, 10 Oct 2024 14:29:56 +0200
Message-Id: <20241010122957.85164-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241010122957.85164-1-andreas@kemnade.info>
References: <20241010122957.85164-1-andreas@kemnade.info>
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
 .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
index 7684868a2eed..983a21d95db3 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -115,6 +115,73 @@ wl12xx_vmmc: wl12xx-vmmc {
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
+	/*
+	 * Name taken from vendor kernel but no evidence of actual usage found
+	 * nor what it really controls.
+	 */
+	panel-power-en-hog {
+		gpio-hog;
+		gpios = <14 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "panel_power_en";
+	};
+
+	/*
+	 * These two are exported to sysfs in vendor kernel, usage unknown,
+	 * backlight state seems unrelated to these.
+	 */
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
@@ -406,6 +473,22 @@ OMAP4_IOPAD(0x56, PIN_INPUT_PULLUP | MUX_MODE3) /* gpio35 */
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
@@ -527,6 +610,15 @@ OMAP4_IOPAD(0x1c8, PIN_OUTPUT | MUX_MODE3)  /* gpio_24 / WLAN_EN */
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


