Return-Path: <linux-omap+bounces-2396-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE6E99938D
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 22:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D68CB2244C
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 20:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8571DF997;
	Thu, 10 Oct 2024 20:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dw8aEeub"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F9E18C03D;
	Thu, 10 Oct 2024 20:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728591356; cv=none; b=fuG0jdoBGjBLq2LjVLbmvTGiahEl1W7QHxwTWqhsAMbhdZIiW3iGPO33Ayhwd7732eEtpNAa9/2wDwQL6eBZpj9kLvDv0aNIODKRl3iKEJAIk0hNuq9OzxauyCcCkvHsSAoUNsF9+cvsdYubuCaaUIgjcUAmpGAeLTBi/eoul5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728591356; c=relaxed/simple;
	bh=fPmkMLKeMVY0l3xBaFZnSTGoYjOFGnuuHY5pw99SEQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nevHEG5kxZ0paQU3t8lSknkETWg2WLMkslVv1WT2eeBabsBlwR5UNibK9yXGCUW1z3T17bFYuRfPuQJdn6n4H/nGR/8C9yuaWLPFSAaaEonPFFqEXZjN0aA84yJ737Vfq/MajuH2um3RkmfGQVNfO+Uy1bzWDa6SZPbaGSA5V64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dw8aEeub; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CA9C4CECC;
	Thu, 10 Oct 2024 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728591356;
	bh=fPmkMLKeMVY0l3xBaFZnSTGoYjOFGnuuHY5pw99SEQA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Dw8aEeub4DiOhXMLfwdxmedxJNprFDhzKxWneZL57KePsXyxJEwH7xLE5CQwIMFDR
	 giDvRoF3Bq5rbTlc5C6c9MHaUUDXdQcRa6JM/8Akyp8McONy4vqTcy9VZXVj+VQ5LT
	 LnD990DrdgJyW1ugln0D+f2Hp+kflSTmFHSluMj2mxqv/gXDUYU/SjU5YmO6eW2PG3
	 coBFL9zTTizuUP/Xq9QSn27qLjHew/luYFUQMmHt3BcjhfFIhGl76Xsdky95b0InUU
	 EZ7r3/tgedEBt2c0ALAVQJqYN3tlq7eW5Lg5nF/rNn93KF2m7p0AEVF6NM/cI6f4Kv
	 /TwoDWg0cDJhA==
Message-ID: <7cde7090-639b-4115-8240-88a63c760d93@kernel.org>
Date: Thu, 10 Oct 2024 23:15:51 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] ARM: dts: omap: omap4-epson-embt2ws: add unknown
 gpio outputs
To: Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, tony@atomide.com,
 devicetree@vger.kernel.org, khilman@baylibre.com,
 Conor Dooley <conor+dt@kernel.org>, aaro.koskinen@iki.fi
References: <20241010122957.85164-1-andreas@kemnade.info>
 <20241010122957.85164-4-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241010122957.85164-4-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/10/2024 15:29, Andreas Kemnade wrote:
> Set them to the state seen in a running system, initialized
> by vendor u-boot or kernel. Add line names where they are defined in the
> vendor kernel.
> gpio15 resets something in the display, otherwise meaning of the
> gpios is not known.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> index 7684868a2eed..983a21d95db3 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> +++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> @@ -115,6 +115,73 @@ wl12xx_vmmc: wl12xx-vmmc {
>  	};
>  };
>  
> +&gpio1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gpio1_hog_pins &gpio1wk_hog_pins>;
> +
> +	lb-reset-hog {
> +		gpio-hog;
> +		gpios = <9 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "lb_reset";
> +	};
> +
> +	power-en-hog {
> +		gpio-hog;
> +		gpios = <10 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "power_en";
> +	};

As GPIO 9 and 10 come form the Wake-up domain, my guess is 
they are used as wake-up input source. Reset button / Power off/wake button?
From pinmux they seem to be Input. So why do we need to force them to a
certain output state?
Can you please confirm if everything works as usual without this hog?

We could still give the GPIO a name without the hog right?
maybe user-space is interested in the state.

> +
> +	/*
> +	 * Name taken from vendor kernel but no evidence of actual usage found
> +	 * nor what it really controls.
> +	 */
> +	panel-power-en-hog {
> +		gpio-hog;
> +		gpios = <14 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "panel_power_en";
> +	};
> +
> +	/*
> +	 * These two are exported to sysfs in vendor kernel, usage unknown,
> +	 * backlight state seems unrelated to these.
> +	 */
> +	blc-r-hog {
> +		gpio-hog;
> +		gpios = <17 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "blc_r";
> +	};
> +
> +	blc-l-hog {
> +		gpio-hog;
> +		gpios = <16 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "blc_l";
> +	};
> +
> +	high-hog {
> +		gpio-hog;
> +		gpios = <15 GPIO_ACTIVE_HIGH /* maybe dsi to dpi chip reset? */
> +			 21 GPIO_ACTIVE_HIGH
> +			 26 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "unknown-high";
> +	};
> +
> +	low-hog {
> +		gpio-hog;
> +		gpios = <18 GPIO_ACTIVE_HIGH
> +			 19 GPIO_ACTIVE_HIGH
> +			 20 GPIO_ACTIVE_HIGH
> +			 22 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "unknown-low";
> +	};
> +};
> +
>  &i2c1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c1_pins>;
> @@ -406,6 +473,22 @@ OMAP4_IOPAD(0x56, PIN_INPUT_PULLUP | MUX_MODE3) /* gpio35 */
>  		>;
>  	};
>  
> +	gpio1_hog_pins: pinmux-gpio1-hog-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x1b4, PIN_OUTPUT | MUX_MODE3) /* gpio14 */
> +			OMAP4_IOPAD(0x1b8, PIN_OUTPUT | MUX_MODE3) /* gpio16 */
> +			OMAP4_IOPAD(0x1ba, PIN_OUTPUT | MUX_MODE3) /* gpio17 */
> +
> +			OMAP4_IOPAD(0x1b6, PIN_OUTPUT | MUX_MODE3) /* gpio15 */
> +			OMAP4_IOPAD(0x1bc, PIN_OUTPUT | MUX_MODE3) /* gpio18 */
> +			OMAP4_IOPAD(0x1be, PIN_OUTPUT | MUX_MODE3) /* gpio19 */
> +			OMAP4_IOPAD(0x1c0, PIN_OUTPUT | MUX_MODE3) /* gpio20 */
> +			OMAP4_IOPAD(0x1c2, PIN_OUTPUT | MUX_MODE3) /* gpio21 */
> +			OMAP4_IOPAD(0x1c4, PIN_OUTPUT | MUX_MODE3) /* gpio22 */
> +			OMAP4_IOPAD(0x1cc, PIN_OUTPUT | MUX_MODE3) /* gpio26 */
> +		>;
> +	};
> +
>  	i2c1_pins: pinmux-i2c1-pins {
>  		pinctrl-single,pins = <
>  			   OMAP4_IOPAD(0x122, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
> @@ -527,6 +610,15 @@ OMAP4_IOPAD(0x1c8, PIN_OUTPUT | MUX_MODE3)  /* gpio_24 / WLAN_EN */
>  	};
>  };
>  
> +&omap4_pmx_wkup {
> +	gpio1wk_hog_pins: pinmux-gpio1wk-hog-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x68, PIN_INPUT_PULLDOWN | MUX_MODE3) /* gpio9 */
> +			OMAP4_IOPAD(0x6a, PIN_INPUT | MUX_MODE3) /* gpio10 */
> +		>;
> +	};
> +};
> +
>  &uart2 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart2_pins &bt_pins>;

-- 
cheers,
-roger

