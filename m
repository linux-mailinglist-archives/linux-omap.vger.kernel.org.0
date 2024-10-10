Return-Path: <linux-omap+bounces-2387-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B691998602
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 14:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F13F1F25060
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 12:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2241C7B82;
	Thu, 10 Oct 2024 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="lUGmQmAJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771811C5799;
	Thu, 10 Oct 2024 12:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728563409; cv=none; b=huAzveHWMX/GApN6q6D07iSf3pu8JusT6Jhrw1DhN2/pVOHthMIHBXjDZTEY9KJVqTjnVc0xGKZvcMb4lOIlTrqTxx0038gVqj5uQ9rd2PISg2XCLXFaL50CLaYLk61q29TfPJBFzU2mLIfZKQ1eUdkn2SZIFdTYRuuujkjG6CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728563409; c=relaxed/simple;
	bh=B8fBtw305FZ4bKF6UrPP7Qui5fyzO9uQMcfpLl+pKvc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X4aIQ6ghCy2yGzwKedzY9JjOUj//O3ikPQBwPvuqhsSUpgCS6KIyXBAOiR9EjEMBIBzU3DuK9040SOxdu7fzlMERHpS/4kAhcpjWrWugsq74sWRYrV6Mj9lFnUsTrsxTWQjhlV7i8nIAYZsMfQuDwlMosJnvXcNJOhLugNSD14E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=lUGmQmAJ; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tkFhd0O+ezIO8vzMqk6aqFHquXcWm43ot+D5UbEr0e4=; b=lUGmQmAJbspwzLAxoqhqKwiBJx
	xHnbQamD1eVeaFdBWQKx1YBnp3JE2QRafTbPQK+0x5ZbNbNiLfYiNJ+S6HmEqnPOChBXlw9rjh/z4
	0QfXZZZt8wQ/cah22Chizu47YK5FCm+4+PEn6R5dWpyFo3tWw6ZIxrZB0M+rtzM4xZgHHRGahcRLA
	4bDqjxEDTrnFyHQc9X7j4OD8pC394nqYUzoPyDWtECJpB6Wj8anQrYj4MnI6IODAiY61Z7K0bef2x
	FPwu+2RQ2Bocot4xjpeYvpIG3PS/QDOvXDLZlQiwr/9Z9cIC6CAhsUOeGyvi9byGa4jEhtypPCqdQ
	RmBVwQjA==;
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
Subject: [PATCH v2 1/4] ARM: dts: omap: omap4-epson-embt2ws: define GPIO regulators
Date: Thu, 10 Oct 2024 14:29:54 +0200
Message-Id: <20241010122957.85164-2-andreas@kemnade.info>
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
index 339e52ba3614..4462747b5cf5 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -46,6 +46,55 @@ key-lock {
 		};
 	};
 
+	cb_v18: regulator-cb-v18 {
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
+	cb_v33: regulator-cb-v33 {
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
+	regulator-cb-v50 {
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
+	lb_v50: regulator-lb-v50 {
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


