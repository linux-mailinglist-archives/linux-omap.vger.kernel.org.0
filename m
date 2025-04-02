Return-Path: <linux-omap+bounces-3526-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F31A78D83
	for <lists+linux-omap@lfdr.de>; Wed,  2 Apr 2025 13:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12B96189332E
	for <lists+linux-omap@lfdr.de>; Wed,  2 Apr 2025 11:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0863B238143;
	Wed,  2 Apr 2025 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoQnwDAz"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947C620F07D;
	Wed,  2 Apr 2025 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594858; cv=none; b=tL969HYseCKdvfM391hPHIIUggxttSl/X+LFHCp5j+TdRV37MM3nl1uwn6WZQH9bNw5U+lagfUWNOHPz8mZHM9PAubqWUrJpalJ/QI/LiYY6OYE9f7scpQPZrk0n36KRyKjTcj09UT8Ih6qogg0OEf0cKtVXCYmuFTtdkdvpIOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594858; c=relaxed/simple;
	bh=2Ua8xGnzQmFoDDoihWOJWU4MrZ5rcLtSCeGpEWXLOCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gy2uFlpQTncxXfa1kgTqSPyyh0mckQaF3bySzJ0UPrep+xel9WCo/Hwqb/mUwtxDvPg0v/4sdPcFEoMgQmixtSsQ+A6tZLNfQHOI2tuJdfJya08oQyBsUKaXLHtuO/ykXoXMzgG7pqucrWHjouZeBz4xNy6f1UlzvGqGIP0w2fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoQnwDAz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34E4C4CEDD;
	Wed,  2 Apr 2025 11:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743594858;
	bh=2Ua8xGnzQmFoDDoihWOJWU4MrZ5rcLtSCeGpEWXLOCU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=VoQnwDAz8UNT7tYFJN1lQ76ONyM3sSJhMpKElJSzTQUQ1Sw6Vv2fXzkrjY05pZe13
	 UhNQLf8YzsoY7bAzyy7MZK7hOD6v+IqgxCEpIAofSzK0FlqyvMhKvO4kM5tXnUUifZ
	 MT8jfP6y80HrJx+MWEsMhHlK1XltQBPIHGdgwDFprW8BvGEJO3TC1TWhqR/rkvyvHI
	 Om9a2NG1vsMJw/IbmOAj3bzZvmC0LHWbRAkKva9P0qkVdcYgL2TFAczC1GM4pMQZtP
	 iFOuwBAj94CQ+z5qPWpSBmccjxIJiYsno4aZeN2rILbMTIHtGcNAe+AcGFAXQYqyfo
	 TjcoXHii66FGA==
Message-ID: <aded0940-45d8-4063-a1a2-f0763d509095@kernel.org>
Date: Wed, 2 Apr 2025 14:54:12 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: omap4: panda: cleanup bluetooth
To: Andreas Kemnade <andreas@kemnade.info>, Rob Herring <robh@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>, devicetree@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250330151401.444956-1-andreas@kemnade.info>
 <20250330151401.444956-3-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250330151401.444956-3-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andreas,

On 30/03/2025 18:14, Andreas Kemnade wrote:
> Bluetooth is available on the other Panda board versions, too, so move
> stuff to common and specify the needed clock properly.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../boot/dts/ti/omap/omap4-panda-common.dtsi  | 31 ++++++++++++++++--
>  arch/arm/boot/dts/ti/omap/omap4-panda-es.dts  | 32 -------------------
>  2 files changed, 28 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> index c860b590142a..05c871d31d7b 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> @@ -367,10 +367,8 @@ OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
>  	 */
>  	wl12xx_gpio: wl12xx-gpio-pins {
>  		pinctrl-single,pins = <
> -			OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 */
> -			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 */
> +			OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 - WLAN_EN */
>  			OMAP4_IOPAD(0x070, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a24.gpio_48 */

Apparently GPIO 48 is FM audio related and has nothing to do with wl12xx?
So should we drop it from here?

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
> +			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)	  /* gpmc_a22.gpio_46 - BTEN */
> +			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3) /* gpmc_a25.gpio_49 - BTWAKEUP */
> +		>;
> +	};
> +
> +	uart2_pins: uart2-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x118, PIN_INPUT_PULLUP | MUX_MODE0)  /* uart2_cts.uart2_cts - HCI */
> +			OMAP4_IOPAD(0x11a, PIN_OUTPUT | MUX_MODE0)	  /* uart2_rts.uart2_rts */
> +			OMAP4_IOPAD(0x11c, PIN_INPUT_PULLUP | MUX_MODE0)  /* uart2_rx.uart2_rx */
> +			OMAP4_IOPAD(0x11e, PIN_OUTPUT | MUX_MODE0)	  /* uart2_tx.uart2_tx */
> +		>;
> +	};
>  };
>  
>  &omap4_pmx_wkup {
> @@ -531,8 +545,19 @@ &twl_usb_comparator {
>  };
>  
>  &uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart2_pins>;
>  	interrupts-extended = <&wakeupgen GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH
>  			       &omap4_pmx_core OMAP4_UART2_RX>;
> +
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

otherwise,

Reviewed-by: Roger Quadros <rogerq@kernel.org>

-- 
cheers,
-roger


