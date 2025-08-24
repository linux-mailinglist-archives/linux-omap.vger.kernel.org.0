Return-Path: <linux-omap+bounces-4318-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E125CB33308
	for <lists+linux-omap@lfdr.de>; Mon, 25 Aug 2025 00:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD215481650
	for <lists+linux-omap@lfdr.de>; Sun, 24 Aug 2025 22:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5047A26560B;
	Sun, 24 Aug 2025 22:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="WNaySMpV"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF5A257836;
	Sun, 24 Aug 2025 22:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756073289; cv=none; b=OtG+HzubagHj4kB3w6Rx2kRlLTkdr4MXzN2bG7TYyXG6Zn/5lR11Klo5L5LcyeDt9io3WN84xtr5Iy0p2QK0+AxtECtrwZF+9tNGrDhFkvUkKfI/yshot9P9k89XqwoSiKibLkcO9hPE1H2uZALq1cz0QrYgrTZTYs2v58pE6mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756073289; c=relaxed/simple;
	bh=CUcs35OJOETWZAyV81kcK5XJcR6zEFg5XONEReKO7jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=istgFYXzjpO3ZsOoWcaguXfoNHSW9MyesN8h4suUcNK8hQUyahs3UwPqFHJdE2AHBlucMm5sdR37kOapWNAPFtOxge/oBuY11KW7cZGAbnTTQu0zNB1jvdoK4WlOpldIkcvtHNA2uA14t5dVMKp3RgfGueD6NWkXY13BH/6ViPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=WNaySMpV; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ymOYjpVivlCLXw/DbSukmlKetF/L1S/nZ1r8QgNYs6I=; b=WNaySMpVkPcY22UBeVJVrotvng
	mWsIhLlkom2bKfVe+ROntXyaINeDU7dbtXR0jfhQeTsYuY7Elt0Isx2nd8UZST6JXA8oN9Vlk0FfL
	yNMVZZVSnkhW3pe44RSEGq+SNxgG5JmFvPAqhnZCa+X+sitWIaN7/kp6fgtqavKirXC+ort2Rjp8O
	O1hl7cxeGzdR5M6Uk9XIq0+cQsncRm9yeODhrujWuSN7McxT8J2/EClW2RVmXD5By7xDhuVBbG9Yq
	kqGZOrHfEHGzbQ5U586uZhrMWr1yy+8bvWDB72EP0i/wL8QZUFTEiqa89kvlxu0R94n2LPX3f6yB4
	YdmbK4Ow==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Mon, 25 Aug 2025 00:07:30 +0200
Subject: [PATCH RFC 3/3] ARM: dts: ti/omap: epson-bt2ws: add touchpad
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-ektp-submit-v1-3-1dd476c1277b@kemnade.info>
References: <20250825-ektp-submit-v1-0-1dd476c1277b@kemnade.info>
In-Reply-To: <20250825-ektp-submit-v1-0-1dd476c1277b@kemnade.info>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Tony Lindgren <tony@atomide.com>, hns@goldelico.com
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=CUcs35OJOETWZAyV81kcK5XJcR6zEFg5XONEReKO7jk=;
 b=owGbwMvMwCEm/rzkS6lq2x3G02pJDBmrey1V3cImFFwTMHq4oKO/4FLwZuP8gIgk058/jpaGf
 di3tXR7RykLgxgHg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABMJucvwV/pnwtWiWX5e8+PV
 UhbMXGJjVlJ/fkmTx+pGY3bBWVN3tzP8L7PjYnR456kmz7vgdOfxO97Xd/At2PR6y2Gf8ze+ee3
 ZxAsA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Add the EKTP1059 based touchpad connected via SPI.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
index c90f43cc2fae..746ac4761b0d 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -429,6 +429,23 @@ MATRIX_KEY(1, 1, KEY_VOLUMEDOWN)
 	linux,input-no-autorepeat;
 };
 
+&mcspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcspi1_pins>;
+
+	touchpad@0 {
+		compatible = "elan,ektp1059";
+		reg = <0>;      /* cs0 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&elan_pins>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <200000>;
+		spi-cpol;
+		spi-cpha;
+	};
+};
+
 &mcbsp2 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
@@ -506,6 +523,12 @@ OMAP4_IOPAD(0x1d4, PIN_OUTPUT | MUX_MODE3) /* gpio191 */
 		>;
 	};
 
+	elan_pins: pinmux-elan-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x78, PIN_INPUT | MUX_MODE3) /* gpio52 */
+		>;
+	};
+
 	gpio_keys_pins: pinmux-gpio-key-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x56, PIN_INPUT_PULLUP | MUX_MODE3) /* gpio35 */
@@ -579,6 +602,15 @@ OMAP4_IOPAD(0x1ce, PIN_OUTPUT | MUX_MODE3) /* gpio27 */
 		>;
 	};
 
+	mcspi1_pins: pinmux-mcspi1-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x132, PIN_INPUT_PULLUP | MUX_MODE0)
+			OMAP4_IOPAD(0x134, PIN_INPUT_PULLUP | MUX_MODE0)
+			OMAP4_IOPAD(0x136, PIN_OUTPUT | MUX_MODE0)
+			OMAP4_IOPAD(0x138, PIN_OUTPUT | MUX_MODE0)
+		>;
+	};
+
 	mcbsp2_pins: pinmux-mcbsp2-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0f6, PIN_INPUT | MUX_MODE0)       /* abe_mcbsp2_clkx */

-- 
2.39.5


