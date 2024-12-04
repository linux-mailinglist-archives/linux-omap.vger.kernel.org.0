Return-Path: <linux-omap+bounces-2772-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B22259E42BB
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2024 19:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D15E2828DE
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2024 18:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740DD1C3C0C;
	Wed,  4 Dec 2024 17:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="41PxPg18"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436B9152E12;
	Wed,  4 Dec 2024 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733334130; cv=none; b=EafJVFWl97lYf0KNuqaph9IvZFS1Sj7e2bk5cg5mQx5Um0nALTYibxJ3+iWCzL4XsVGN007lZ/F8TxIURRae3UFRRm7rnjggj50+1sq9aBrbQuATij8UPrkrB3Egq/3VeSSLF0HsViKGrXHziZ5NiLBYkcg1hEFkwMwkSQ+/Pgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733334130; c=relaxed/simple;
	bh=3L9eOiR18IaXDUf8McGC7rXg/jOof5o0S5IiQTTr9Yc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gebGl+CZ74utE8FsPiz/kdDeP98xPRr568n+zj3Vd+FEXkJ9b82yVD56toP2fJ0GmuMVFW+PJ/5xa+TIgluFzTBg7ZbYyU2WDByqOzmACZQWgu9DQrxZmKl+LkcqmJ05uG6EcGAwsqUTs+FQcMiJSbofnMSqlGEIUxZWr2OYWlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=41PxPg18; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=3dmzYk0uh63gJxP2aLsDAmg9xvUtfWv6FeOCSsbtOSw=; b=41PxPg1845mHrLLARQxHghNZ+/
	a3oODHuaDCzeV6Aag4pMNvkymxiqFOzkHJnZchoGMNECBEtbMEFfbRQ/7QPUFLnCDFoqqK+6HXXlC
	xC+QRbLp2Enn0iLABBRw74sXmoliaALlRXUY8P4owXDbYFAfP1EdrA5fJf6GyEeG13GopnXTPZnNU
	LWiDt/at8yJPQd1UmQlFBvLbCWThLYNc7E9AWlTMjYF9m472jgRxOovr4LRLBHyO5sMU+5a0tu6U2
	Cv4j0jeUcZlPHKStlBWHWEAZMHo2dO9frRNhq1/vX9t5AihZy61ykTpkzN0TRuiBTRQgrY9OgSuC8
	TuTLz5GQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andreas@kemnade.info,
	hns@goldelico.com,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aaro.koskinen@iki.fi,
	khilman@baylibre.com,
	rogerq@kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3] ARM: dts: ti/omap: gta04: fix pm issues caused by spi module
Date: Wed,  4 Dec 2024 18:41:52 +0100
Message-Id: <20241204174152.2360431-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Despite CM_IDLEST1_CORE and CM_FCLKEN1_CORE behaving normal,
disabling SPI leads to messages like when suspending:
Powerdomain (core_pwrdm) didn't enter target state 0
and according to /sys/kernel/debug/pm_debug/count off state is not
entered. That was not connected to SPI during the discussion
of disabling SPI. See:
https://lore.kernel.org/linux-omap/20230122100852.32ae082c@aktux/

The reason is that SPI is per default in slave mode. Linux driver
will turn it to master per default. It slave mode, the powerdomain seems to
be kept active if active chip select input is sensed.

Fix that by explicitly disabling the SPI3 pins which used to be muxed by
the bootloader since they are available on an optionally fitted header
which would require dtb overlays anyways.

Fixes: a622310f7f01 ("ARM: dts: gta04: fix excess dma channel usage")
CC: stable@vger.kernel.org
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in V3:
- use gpio mode instead of mode7 which is not safe mode in this special
  case

Changes in V2:
- instead of reenabling mcspi, do a fix more near the root of the
  problem

 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
index 2ee3ddd640209..536070e80b2c6 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
@@ -446,6 +446,7 @@ &omap3_pmx_core2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <
 			&hsusb2_2_pins
+			&mcspi3hog_pins
 	>;
 
 	hsusb2_2_pins: hsusb2-2-pins {
@@ -459,6 +460,15 @@ OMAP3630_CORE2_IOPAD(0x25fa, PIN_INPUT_PULLDOWN | MUX_MODE3)	/* etk_d15.hsusb2_d
 		>;
 	};
 
+	mcspi3hog_pins: mcspi3hog-pins {
+		pinctrl-single,pins = <
+			OMAP3630_CORE2_IOPAD(0x25dc, PIN_OUTPUT_PULLDOWN | MUX_MODE4)	/* etk_d0 */
+			OMAP3630_CORE2_IOPAD(0x25de, PIN_OUTPUT_PULLDOWN | MUX_MODE4)	/* etk_d1 */
+			OMAP3630_CORE2_IOPAD(0x25e0, PIN_OUTPUT_PULLDOWN | MUX_MODE4)	/* etk_d2 */
+			OMAP3630_CORE2_IOPAD(0x25e2, PIN_OUTPUT_PULLDOWN | MUX_MODE4)	/* etk_d3 */
+		>;
+	};
+
 	spi_gpio_pins: spi-gpio-pinmux-pins {
 		pinctrl-single,pins = <
 			OMAP3630_CORE2_IOPAD(0x25d8, PIN_OUTPUT | MUX_MODE4) /* clk */
-- 
2.39.2


