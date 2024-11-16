Return-Path: <linux-omap+bounces-2700-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8681A9D00ED
	for <lists+linux-omap@lfdr.de>; Sat, 16 Nov 2024 22:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74026282379
	for <lists+linux-omap@lfdr.de>; Sat, 16 Nov 2024 21:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3709E19AA63;
	Sat, 16 Nov 2024 21:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="rL6Ejz1h"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E983EAF6;
	Sat, 16 Nov 2024 21:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731791767; cv=none; b=l9wislrpUMrD39e01urR/ttHBp37/cA9gljK3OODEkIPp/QLq/kkPxmn2EdRohLCElPMnBLwJOQ5yhGd03HnMq8yxMhd8pi0aJSCU+aUWa59FSj98KmqWbrCOl7NLDVIMPZ2QdmQ6Gq7/o6fHOREYq71dhlSyPSliv6GN1IlUyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731791767; c=relaxed/simple;
	bh=U2pJc8REWDsdLIPxp7BDuqopyGKNMspiPzESHNEMlS0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gD0K0xpbi+TpJ9W5aI7aOqo67BRA0FS37OMF2AKaVml6/6coC5NcgXIX7IIV63MymKeIbmBO1MECNRpp/ZWEa4M29I9I9ztoASRfZhD6YByxr8TxYRl/Fg+jGJXPa4tTrnXbGUeQL8cE3ta/UHqUDL6eZT1EfCSMRtsjsOG9G+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=rL6Ejz1h; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=itjZf9E6/qIWSLq9IIKXiUeBc6Kh8+cNzA1c8FEziO4=; b=rL6Ejz1hxbEhz/GMboHwA2gxKE
	WePU+K1MC6DxwJDji2f6xMJ/NvHf5jZputKWo3wBkAAkE2i7w49tQFp+DkjQBbepSTpv/Guvie6vt
	QXM85vgT4G594v6guiGOY9hTjT3mLmbJ5Krd3sdGHiy38sRJsZq06tb4URF2/vwxaiFGJYemzkKna
	ABaWJnh4dzxqkYnOjS5En8YrVHHufLbjG0pDZbRjMfVDBH7QtTApp9ovFG3XIBVlF3gq6k2hS7UD1
	dyLYLCPeBzqja4qYBzvZze+IWur0AIb4z57XOm16mkvcW3O7GYAdfj99cTWOPsjNe2dwC8H/TwpfC
	m4IoGxlA==;
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
Subject: [PATCH v2] ARM: dts: ti/omap: gta04: fix pm issues caused by spi module
Date: Sat, 16 Nov 2024 22:15:49 +0100
Message-Id: <20241116211549.2020727-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Despite CM_IDLEST1_CORE and CM_FCLKEN1_CORE behaving normal,
disabling SPI leads to messages like:
Powerdomain (core_pwrdm) didn't enter target state 0
and according to /sys/kernel/debug/pm_debug/count off state is not
entered. That was not connected to SPI during the discussion
of disabling SPI. See:
https://lore.kernel.org/linux-omap/20230122100852.32ae082c@aktux/

The reason is that SPI is per default in slave mode. Linux driver
will turn it to master per default. It slave mode, the powerdomain seems to
be kept active if active chip select input is sensed.

Fix that by explicitly disabling the SPI3 pins which are muxed by
the bootloader since they are available on an optionally fitted header
which would require dtb overlays anyways.

Fixes: a622310f7f01 ("ARM: dts: gta04: fix excess dma channel usage")
CC: stable@vger.kernel.org
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
index 3661340009e7a..3940909a5aac7 100644
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
+			OMAP3630_CORE2_IOPAD(0x25dc, PIN_OUTPUT_PULLDOWN | MUX_MODE7)	/* etk_d0 */
+			OMAP3630_CORE2_IOPAD(0x25de, PIN_OUTPUT_PULLDOWN | MUX_MODE7)	/* etk_d1 */
+			OMAP3630_CORE2_IOPAD(0x25e0, PIN_OUTPUT_PULLDOWN | MUX_MODE7)	/* etk_d2 */
+			OMAP3630_CORE2_IOPAD(0x25e2, PIN_OUTPUT_PULLDOWN | MUX_MODE7)	/* etk_d3 */
+		>;
+	};
+
 	spi_gpio_pins: spi-gpio-pinmux-pins {
 		pinctrl-single,pins = <
 			OMAP3630_CORE2_IOPAD(0x25d8, PIN_OUTPUT | MUX_MODE4) /* clk */
-- 
2.39.2


