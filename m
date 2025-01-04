Return-Path: <linux-omap+bounces-2975-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A00D2A0161C
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 18:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1495A1883B69
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 17:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3C51C5F0E;
	Sat,  4 Jan 2025 17:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7O7E18T"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3462236C;
	Sat,  4 Jan 2025 17:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736011790; cv=none; b=p51LgSdLCMjJXyWUYS1owLo6SXZqNFrYSraOiSVQyaWrXnXFkVZ1oKLF0pYJzaEfMcB1SgSm1LfvstNtJaFqG8jyJWWpqLni2PKaolNgb9b8d+lSSz5fQzbko16H1bOjO5PUkXtL0oQLM4wUY/1OnpLnU9QowEnBHZuUD3yRLnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736011790; c=relaxed/simple;
	bh=2LQp/E4jBX/LFz6Xj6POQuDcTwz4Ws1x6LtC6rZ8Tqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Br4p/QScuQRXmof+WHxGxmmr+GJMFMf8OAVa2n0MbbUBSpsxkrFz79M3xay+ivxZz4dafE29A7ussbuxetnWJNMnM0zDDjNgyIwVUavF9yI49XrYU4Tg2aQUHUsQxvsiv2HtZs0EEpIgALc+LOTT9hkV/nIfduQvimEn+4EKNF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7O7E18T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F72C4CED1;
	Sat,  4 Jan 2025 17:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736011789;
	bh=2LQp/E4jBX/LFz6Xj6POQuDcTwz4Ws1x6LtC6rZ8Tqo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Z7O7E18T53GJFk1ai1NdXe9PiudmH/pTEF/eURAh+Xs99+23iX7AXuH6MXubykJdT
	 mfrdfrkNz3Mpdo0zdcshPk8c2pngkFBCL5rlR1IlrMdcVq0FdUU5PTUMN3epJqKJlW
	 k9jvhMkyXtjPuwhfhVYNTkT0xs5YR/GPhmL/YHNiz1sb24jERRlaEkjZ6PIMl63nhf
	 6/Tsv9js7NF3j26tP8Mc0lbyZz97W0K2YqL7vkDXTftkN7kWus+hNpBvllAO0LwcA8
	 +3gah6TH33SF7V5Ph1gAbVLNlHh6AZOTYAkzd/bXK9FjyT5/cJ3Gsb0xpF5P6rO/VX
	 3ekRoDmUHkYtg==
Message-ID: <64d14e8f-a1d5-4e04-afa7-c129cee29dc2@kernel.org>
Date: Sat, 4 Jan 2025 19:29:44 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: omap4: panda: cleanup bluetooth
To: Andreas Kemnade <andreas@kemnade.info>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
References: <20241229230125.85787-1-andreas@kemnade.info>
 <20241229230125.85787-3-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241229230125.85787-3-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Andreas,

On 30/12/2024 01:01, Andreas Kemnade wrote:
> Bluetooth is available on the other Panda board versions, too, so move
> stuff to common and specify the needed clock properly.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../boot/dts/ti/omap/omap4-panda-common.dtsi  | 30 +++++++++++++++--
>  arch/arm/boot/dts/ti/omap/omap4-panda-es.dts  | 32 -------------------
>  2 files changed, 28 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> index c860b590142a..c048ab9af053 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> @@ -368,9 +368,7 @@ OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
>  	wl12xx_gpio: wl12xx-gpio-pins {
>  		pinctrl-single,pins = <
>  			OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 */

We could add function name in comment? e.g. /* gpmc_a19.gpio_43 - WLAN_EN */

> -			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 */
>  			OMAP4_IOPAD(0x070, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a24.gpio_48 */

This one is FM_EN and has nothing to do with WLAN.

> -			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a25.gpio_49 */
>  		>;
>  	};
>  
> @@ -393,6 +391,22 @@ button_pins: button-pins {
>  			OMAP4_IOPAD(0x114, PIN_INPUT_PULLUP | MUX_MODE3)	/* gpio_121 */
>  		>;
>  	};
> +
> +	bt_pins: bt-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)	  /* BTEN */
> +			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3) /* BTWAKEUP */

Could we please use comment style <pin name>.<pinmux name> - Function
			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 - BTEN */
			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a25.gpio_49 - BTWAKEUP */

> +		>;
> +	};
> +
> +	uart2_pins: uart2-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x118, PIN_INPUT_PULLUP | MUX_MODE0)  /* uart2_cts - HCI */
> +			OMAP4_IOPAD(0x11a, PIN_OUTPUT | MUX_MODE0)	  /* uart2_rts */
> +			OMAP4_IOPAD(0x11c, PIN_INPUT_PULLUP | MUX_MODE0)  /* uart2_rx */
> +			OMAP4_IOPAD(0x11e, PIN_OUTPUT | MUX_MODE0)	  /* uart2_tx */

Need to fix comment style to <pin name>.<pinmux name> - Function

> +		>;
> +	};
>  };
>  
>  &omap4_pmx_wkup {
> @@ -531,8 +545,20 @@ &twl_usb_comparator {
>  };
>  
>  &uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart2_pins>;
> +

Unnecessary new line.
>  	interrupts-extended = <&wakeupgen GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH
>  			       &omap4_pmx_core OMAP4_UART2_RX>;
> +

Here too?

> +	bluetooth {
> +		compatible = "ti,wl1271-st";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_pins>;
> +		enable-gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>;	/* GPIO_46 */
> +		clocks = <&twl 0>;
> +		clock-names = "ext_clock";
> +	};
>  };
>  
>  &uart3 {
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts b/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
> index fe7b156d10ed..a933fe560834 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
> +++ b/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
> @@ -49,22 +49,6 @@ button_pins: button-pins {
>  			OMAP4_IOPAD(0x0fc, PIN_INPUT_PULLUP | MUX_MODE3) /* gpio_113 */
>  		>;
>  	};
> -
> -	bt_pins: bt-pins {
> -		pinctrl-single,pins = <
> -			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 - BTEN */
> -			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a25.gpio_49 - BTWAKEUP */
> -		>;
> -	};
> -
> -	uart2_pins: uart2-pins {
> -		pinctrl-single,pins = <
> -			OMAP4_IOPAD(0x118, PIN_INPUT_PULLUP | MUX_MODE0)	/* uart2_cts.uart2_cts - HCI */
> -			OMAP4_IOPAD(0x11a, PIN_OUTPUT | MUX_MODE0)		/* uart2_rts.uart2_rts */
> -			OMAP4_IOPAD(0x11c, PIN_INPUT_PULLUP | MUX_MODE0)	/* uart2_rx.uart2_rx */
> -			OMAP4_IOPAD(0x11e, PIN_OUTPUT | MUX_MODE0)		/* uart2_tx.uart2_tx */
> -		>;
> -	};
>  };
>  
>  &led_wkgpio_pins {
> @@ -96,19 +80,3 @@ buttonS2 {
>  &gpio1_target {
>  	 ti,no-reset-on-init;
>  };
> -
> -&wl12xx_gpio {
> -	pinctrl-single,pins = <
> -		OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 */
> -		OMAP4_IOPAD(0x070, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a24.gpio_48 */
> -	>;
> -};
> -
> -&uart2 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&uart2_pins &bt_pins>;
> -	bluetooth: tiwi {
> -		compatible = "ti,wl1271-st";
> -		enable-gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>;	/* GPIO_46 */
> -	};
> -};

-- 
cheers,
-roger


