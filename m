Return-Path: <linux-omap+bounces-5119-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 980E5CA308E
	for <lists+linux-omap@lfdr.de>; Thu, 04 Dec 2025 10:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78142304BDB0
	for <lists+linux-omap@lfdr.de>; Thu,  4 Dec 2025 09:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E177D331A65;
	Thu,  4 Dec 2025 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wuF+X8nx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E090417BB21;
	Thu,  4 Dec 2025 09:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841107; cv=none; b=eX7qN6WUE5xI/2YRl4jgcAsU01PdsdhjPk1j2Ory8qsrnh8SnV5zTwmap4k1r8r979kERufgwWI12I02iM4c7H2gkO1ky0axOHZPD+wRD8x7qjQUWP28ONx/tIshn2d6kH5OTLpN40z6XQWV7HVqNYoRuMC3FypkXGoZJeVz7sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841107; c=relaxed/simple;
	bh=CzgJ7R39f7yP8IJai8dIx5Kw3gQI/9m6U+ljWTS2cF0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vB96pFirT3SdQdp88P0UhkPFmkd4LEuDCSiWGgSUiEVv5PtRuHNAqIHV1pKYx2rzSDXTbfHqPR3d/1BX0dFRg0y5oVQ2W1zx7hqsSsEn0o9rjqW7YYstLgFtGt2jZ0k6zbAz8XOyFFw4pO+PsxGPpspDIVlIBS1vLk6ud4u5vU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wuF+X8nx; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B47F4E41A2A;
	Thu,  4 Dec 2025 09:38:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FFE66068C;
	Thu,  4 Dec 2025 09:38:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D16D0119221A0;
	Thu,  4 Dec 2025 10:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764841102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y82nxECdC2RrjXuDkgCcOFWqta7uFEsUhs4TrfOMmYs=;
	b=wuF+X8nxtTKV5MLnQQ04LyjNA7SIVet2tU6GPN45KxYeCX27wrH1gPa1zXA3kmmtCWYRtB
	aCWsEiFr96bsEH6frO5vaXQoE/0z7ZYSYLaDdEZDCDYUeNv/QxzIWWoLRdCGM1vYA39jU0
	lWcSgNTYvKnUMZ4CaNlcgFOtrL/6sr1ZVh88GGQAxphfIL7GxAprmSWl9i5csgIiXQokOg
	dyhWWq8xB195VBbsRLwVmT7dK/b1dWAmjJ7XizNLI7SWjZDp8smk5odhDkPx9z67JJ4IG/
	VQvtKEFFWqxK4jxGyjTQ1fUrXhzHCqlvCNBsiHZ/VXATTs6UNQ5d/MvIIWQuqw==
Date: Thu, 4 Dec 2025 10:38:19 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: thomas.petazzoni@bootlin.com, Tony Lindgren <tony@atomide.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Enric Balletbo i Serra <eballetbo@gmail.com>
Subject: Re: [PATCH] ARM: dts: Drop am335x-base0033 devicetree
Message-ID: <20251204103819.1681b954@kmaincent-XPS-13-7390>
In-Reply-To: <20251204092346.1076836-1-kory.maincent@bootlin.com>
References: <20251204092346.1076836-1-kory.maincent@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On Thu,  4 Dec 2025 10:23:44 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
>=20
> Remove the am335x-base0033 devicetree as it has been non-functional since
> 2017 (Linunx v4.14) when the ti,tilcdc,slave binding was removed. The HDMI
> output on this board has been broken for over 8 years without any reported
> issues or attempts to fix it, indicating this devicetree is no longer in
> active use.

+Enric Balletbo i Serra <eballetbo@gmail.com>
The original author of this devicetree.

>=20
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>  arch/arm/boot/dts/ti/omap/Makefile            |  1 -
>  arch/arm/boot/dts/ti/omap/am335x-base0033.dts | 92 -------------------
>  2 files changed, 93 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/ti/omap/am335x-base0033.dts
>=20
> diff --git a/arch/arm/boot/dts/ti/omap/Makefile
> b/arch/arm/boot/dts/ti/omap/Makefile index 04c820771eae3..b79256b09d31f 1=
00644
> --- a/arch/arm/boot/dts/ti/omap/Makefile
> +++ b/arch/arm/boot/dts/ti/omap/Makefile
> @@ -86,7 +86,6 @@ dtb-$(CONFIG_SOC_AM33XX) +=3D \
>  	am335x-baltos-ir2110.dtb \
>  	am335x-baltos-ir3220.dtb \
>  	am335x-baltos-ir5221.dtb \
> -	am335x-base0033.dtb \
>  	am335x-bone.dtb \
>  	am335x-boneblack.dtb \
>  	am335x-boneblack-wireless.dtb \
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts deleted file mode 100644
> index 46078af4b7a35..0000000000000
> --- a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * am335x-base0033.dts - Device Tree file for IGEP AQUILA EXPANSION
> - *
> - * Copyright (C) 2013 ISEE 2007 SL - https://www.isee.biz
> - */
> -
> -#include "am335x-igep0033.dtsi"
> -
> -/ {
> -	model =3D "IGEP COM AM335x on AQUILA Expansion";
> -	compatible =3D "isee,am335x-base0033", "isee,am335x-igep0033",
> "ti,am33xx"; -
> -	hdmi {
> -		compatible =3D "ti,tilcdc,slave";
> -		i2c =3D <&i2c0>;
> -		pinctrl-names =3D "default", "off";
> -		pinctrl-0 =3D <&nxp_hdmi_pins>;
> -		pinctrl-1 =3D <&nxp_hdmi_off_pins>;
> -		status =3D "okay";
> -	};
> -
> -	leds_base {
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&leds_base_pins>;
> -
> -		compatible =3D "gpio-leds";
> -
> -		led0 {
> -			label =3D "base:red:user";
> -			gpios =3D <&gpio1 21 GPIO_ACTIVE_HIGH>;	/*
> gpio1_21 */
> -			default-state =3D "off";
> -		};
> -
> -		led1 {
> -			label =3D "base:green:user";
> -			gpios =3D <&gpio2 0 GPIO_ACTIVE_HIGH>;	/*
> gpio2_0 */
> -			default-state =3D "off";
> -		};
> -	};
> -};
> -
> -&am33xx_pinmux {
> -	nxp_hdmi_pins: nxp-hdmi-pins {
> -		pinctrl-single,pins =3D <
> -			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0,
> PIN_OUTPUT, MUX_MODE3)	/* xdma_event_intr0.clkout1 */
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA0, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA1, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA2, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA3, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA4, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA5, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA6, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA7, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA8, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA9, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA10, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA11, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA12, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA13, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA14, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_DATA15, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_HSYNC, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_PCLK, PIN_OUTPUT,
> MUX_MODE0)
> -			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN,
> PIN_OUTPUT, MUX_MODE0)
> -		>; =20
> -	};
> -	nxp_hdmi_off_pins: nxp-hdmi-off-pins {
> -		pinctrl-single,pins =3D <
> -			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0,
> PIN_OUTPUT, MUX_MODE3)	/* xdma_event_intr0.clkout1 */
> -		>; =20
> -	};
> -
> -	leds_base_pins: leds-base-pins {
> -		pinctrl-single,pins =3D <
> -			AM33XX_PADCONF(AM335X_PIN_GPMC_A5,
> PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* gpmc_a5.gpio1_21 */
> -			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN3,
> PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* gpmc_csn3.gpio2_0 */
> -		>; =20
> -	};
> -};
> -
> -&lcdc {
> -	status =3D "okay";
> -};
> -
> -&i2c0 {
> -	eeprom: eeprom@50 {
> -		compatible =3D "atmel,24c256";
> -		reg =3D <0x50>;
> -	};
> -};



--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

