Return-Path: <linux-omap+bounces-5118-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFEBCA2FD4
	for <lists+linux-omap@lfdr.de>; Thu, 04 Dec 2025 10:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25FAE30A29A3
	for <lists+linux-omap@lfdr.de>; Thu,  4 Dec 2025 09:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE21333711E;
	Thu,  4 Dec 2025 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ucyZ5f9d"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12303336EEB;
	Thu,  4 Dec 2025 09:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764840236; cv=none; b=JBrYwu4XWIiQk5ejZZ73Mvftv1DXbVWm/BfoXnS35a6lg/wUL8IAfRcLIAc5N2h3eM+FB225B3x4L/VVaKP7bZoZ/ZPIBUq59sD5JV86SHMcssS7I38le7mP+4BTE5wX3Mpopt4JGYcIvEed3NiNHGot4ygl/ARvyTJzzh/4Pgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764840236; c=relaxed/simple;
	bh=tFiO0lAA6DWpebrUO11w6zmuieqyodJNCr81oE1Iu7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XeBhqySiS+jylFjoQMztmws1cCfoVa6p+j/Y0unmc+EcI3llc34ri1erzo3ffYTbVQ+gREkb4i/X3Uz0c9NidQ7i/pOB1ki3mL94w3v5POT+TCbXmb736pRsocjySFJ9p/oeMdPmK2XVQarGvgVpGKZB1flHWXST/OXDPEUQmW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ucyZ5f9d; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9BE9EC17860;
	Thu,  4 Dec 2025 09:23:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDC736068C;
	Thu,  4 Dec 2025 09:23:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E666A1192215B;
	Thu,  4 Dec 2025 10:23:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764840230; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=nXpdNiS56jR1KT4Jpt0BrujsluykoEHSKtLMRVVKOQ8=;
	b=ucyZ5f9dpcM4gv+pcuCztmowf1u01uFz6ox6lNR5/Ph9+Gf22qzLJfyH2EeKYst42+X3rQ
	0at2PUWTWVlzNq8t8ZUJbePexLMkomprEtFXchdzPshMegxhPMkm6CuVEufjQYAfyYuw4U
	YZQyIvV/a/bhxbdlJWV6iSnhbb6zpUPtrl2wutg3orcv3aKjNkmE3pvM6hXKKTQtzr6R9V
	E+Z6pfZ85J9lsMnLxuhRVIvyNziUgI6gOwoCok20PLFqFGeyEQKyOTlkCc0nvyfj5FSYc0
	hbXHNSel01AUnuaKYQn4Ebh8IZ35qaDoQz9nhZMeQAOZo02ccY715BguqrPWyQ==
From: Kory Maincent <kory.maincent@bootlin.com>
To: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] ARM: dts: Drop am335x-base0033 devicetree
Date: Thu,  4 Dec 2025 10:23:44 +0100
Message-ID: <20251204092346.1076836-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>

Remove the am335x-base0033 devicetree as it has been non-functional since
2017 (Linunx v4.14) when the ti,tilcdc,slave binding was removed. The HDMI
output on this board has been broken for over 8 years without any reported
issues or attempts to fix it, indicating this devicetree is no longer in
active use.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 arch/arm/boot/dts/ti/omap/Makefile            |  1 -
 arch/arm/boot/dts/ti/omap/am335x-base0033.dts | 92 -------------------
 2 files changed, 93 deletions(-)
 delete mode 100644 arch/arm/boot/dts/ti/omap/am335x-base0033.dts

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index 04c820771eae3..b79256b09d31f 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -86,7 +86,6 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-baltos-ir2110.dtb \
 	am335x-baltos-ir3220.dtb \
 	am335x-baltos-ir5221.dtb \
-	am335x-base0033.dtb \
 	am335x-bone.dtb \
 	am335x-boneblack.dtb \
 	am335x-boneblack-wireless.dtb \
diff --git a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
deleted file mode 100644
index 46078af4b7a35..0000000000000
--- a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
+++ /dev/null
@@ -1,92 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * am335x-base0033.dts - Device Tree file for IGEP AQUILA EXPANSION
- *
- * Copyright (C) 2013 ISEE 2007 SL - https://www.isee.biz
- */
-
-#include "am335x-igep0033.dtsi"
-
-/ {
-	model = "IGEP COM AM335x on AQUILA Expansion";
-	compatible = "isee,am335x-base0033", "isee,am335x-igep0033", "ti,am33xx";
-
-	hdmi {
-		compatible = "ti,tilcdc,slave";
-		i2c = <&i2c0>;
-		pinctrl-names = "default", "off";
-		pinctrl-0 = <&nxp_hdmi_pins>;
-		pinctrl-1 = <&nxp_hdmi_off_pins>;
-		status = "okay";
-	};
-
-	leds_base {
-		pinctrl-names = "default";
-		pinctrl-0 = <&leds_base_pins>;
-
-		compatible = "gpio-leds";
-
-		led0 {
-			label = "base:red:user";
-			gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;	/* gpio1_21 */
-			default-state = "off";
-		};
-
-		led1 {
-			label = "base:green:user";
-			gpios = <&gpio2 0 GPIO_ACTIVE_HIGH>;	/* gpio2_0 */
-			default-state = "off";
-		};
-	};
-};
-
-&am33xx_pinmux {
-	nxp_hdmi_pins: nxp-hdmi-pins {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_OUTPUT, MUX_MODE3)	/* xdma_event_intr0.clkout1 */
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA0, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA1, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA2, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA3, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA4, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA5, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA6, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA7, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA8, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA9, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA10, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA11, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA12, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA13, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA14, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA15, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_HSYNC, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_PCLK, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN, PIN_OUTPUT, MUX_MODE0)
-		>;
-	};
-	nxp_hdmi_off_pins: nxp-hdmi-off-pins {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_OUTPUT, MUX_MODE3)	/* xdma_event_intr0.clkout1 */
-		>;
-	};
-
-	leds_base_pins: leds-base-pins {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_GPMC_A5, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* gpmc_a5.gpio1_21 */
-			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN3, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* gpmc_csn3.gpio2_0 */
-		>;
-	};
-};
-
-&lcdc {
-	status = "okay";
-};
-
-&i2c0 {
-	eeprom: eeprom@50 {
-		compatible = "atmel,24c256";
-		reg = <0x50>;
-	};
-};
-- 
2.43.0


