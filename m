Return-Path: <linux-omap+bounces-2306-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AF498FE1D
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 09:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 202F51F22C2A
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 07:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C592813957B;
	Fri,  4 Oct 2024 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfUHIsPJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7CD2209F;
	Fri,  4 Oct 2024 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028442; cv=none; b=F1qKOySdff8sDokV3H3/VGsE9u0RWDzZ2eHnzK1HrJ60gsxQCARjhN6RflbjhpExfH9H4udMVtWsNXkQdeoILtUlIzt5Js+cWvncMzViyRn19BBqeax+TaoTza398dXyjZ+OWOAMADelSgSdtWI800rnOOXapksOzHlw1UP8M8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028442; c=relaxed/simple;
	bh=J5dh8/U6klIOJiHQqsa0/Rvfb9Wi7dZw7ideSxoiabU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qZd54aSXxfHSAFZZifG1A72uxwcZAp4Kewf+FDaTIeowSfB6pa+QLPClq1zYTKpimuDl/BeL4CJbM/O2AgzefpzdFMGZJfLizeBu/nz+Vh09+bzCdogQedA1WDxLh4Q+BNya3hZZvhP1IPBdT7Pv74li+nnw2jEvGZAqm+quWmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfUHIsPJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865EDC4CEC6;
	Fri,  4 Oct 2024 07:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728028441;
	bh=J5dh8/U6klIOJiHQqsa0/Rvfb9Wi7dZw7ideSxoiabU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=mfUHIsPJsA+9mGTXsmuZGxG7H4/uEd51CuGw+iYDqccD/Z5JEO+KUIDjtUks3dFA0
	 gLefPYOwQ/fcQiB8lRpmfPtkSfs0WmWLwYRQ/F25JVcIuKCr+1F8Ykee9VwmhMeFJr
	 aDP3aXANzPa2gmgRLIFGPiOXHn027ZH2QegsVkVV54frmzM/ImSo40PAfJz+u7OPsF
	 qkzv/bPTxsdaNDf41TUwdoBP1fpMM9GXk0hUC9T9y6A629PFW0lkCn0XJ9QanZo/OL
	 XG+Wi64zlSZXBLRnve+SWH2Qvj+KWdX1EXRChP3rOfAMl0L8Bx7xPd5KF7snXTaQc2
	 UiECHkZoZhcfg==
Message-ID: <7fc3cf75-bf48-4bcc-8c74-09fb89655a72@kernel.org>
Date: Fri, 4 Oct 2024 10:53:57 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: omap: omap4-epson-embt2ws: add unknown gpio
 outputs
To: Andreas Kemnade <andreas@kemnade.info>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 khilman@baylibre.com, devicetree@vger.kernel.org, tony@atomide.com,
 aaro.koskinen@iki.fi, linux-omap@vger.kernel.org
References: <20240930213008.159647-1-andreas@kemnade.info>
 <20240930213008.159647-4-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240930213008.159647-4-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/10/2024 00:30, Andreas Kemnade wrote:
> Set them to the state seen in a running system, initialized
> by vendor u-boot or kernel. Add line names where they are defined in the
> vendor kernel.
> gpio15 resets something in the display, otherwise meaning of the
> gpios is not known.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> index cc1b6080bf95..c8205ae89840 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> +++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> @@ -115,6 +115,65 @@ wl12xx_vmmc: wl12xx-vmmc {
>  	};
>  };
>  > +&gpio1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gpio1_hog_pins &gpio1wk_hog_pins>;
> +
> +	lb-reset-hog {
> +		gpio-hog;
> +		gpios = <9 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "lb_reset";
> +	};

Just curious, what does lb stand for.

> +
> +	power-en-hog {
> +		gpio-hog;
> +		gpios = <10 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "power_en";
> +	};
> +
> +	panel-power-en-hog {
> +		gpio-hog;
> +		gpios = <14 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "panel_power_en";
> +	};

Is panel always enabled? I didn't see a panel driver
else it could be hooked to panel regulator?

> +
> +	blc-r-hog {
> +		gpio-hog;
> +		gpios = <17 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "blc_r";
> +	};

this should be modeled as a gpio regulator and paried to backlight left?

> +
> +	blc-l-hog {
> +		gpio-hog;
> +		gpios = <16 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "blc_l";
> +	};


this should be modeled as a gpio regulator and paried to backlight right?

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

These are probably OK as we don't know their actual function.

> +};
> +
>  &i2c1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c1_pins>;
> @@ -406,6 +465,22 @@ OMAP4_IOPAD(0x56, PIN_INPUT_PULLUP | MUX_MODE3) /* gpio35 */
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
> @@ -527,6 +602,15 @@ OMAP4_IOPAD(0x1c8, PIN_OUTPUT | MUX_MODE3)  /* gpio_24 / WLAN_EN */
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

