Return-Path: <linux-omap+bounces-2302-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3FE98FDC5
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 09:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40F1CB225CB
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 07:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9BE137903;
	Fri,  4 Oct 2024 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYztXTcT"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E76F132132;
	Fri,  4 Oct 2024 07:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728026677; cv=none; b=f9iVXLwVg1ZATPG7lRYbLlLnizAWx8kytK0VJYXOb2R3yMZfzmKHCcH2SUxfeLq0Ehn7rFldofakYD8I/i1ukUh1Xmg2H/1O9ax6BlL708n9khWqV52TeCXeu5bJQ6Xe/4JZnNxB0emAQpXilcp1LyRtWqHnw7UAM+pbf12WH2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728026677; c=relaxed/simple;
	bh=keAV/4nTEqCTZeTZapqkyWUxxzF4vPbW1pM06dXRhNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rUXi881MEodUMuxTKjLnryLW7ns8MHw5m8BcorhLrFLGvAiSOWixsjY94Ob4da9QU5kOeQEA8CNEwtASGFL8s2tlN/ro8z8AxdBHBZKW1xNHwe13JPPuvqWlx6gDrxS0rWmJtLz1WiZSClbadRNxzP/nNmPGt/kNQCGNpCtcGgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYztXTcT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B20C4CEC6;
	Fri,  4 Oct 2024 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728026677;
	bh=keAV/4nTEqCTZeTZapqkyWUxxzF4vPbW1pM06dXRhNU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=qYztXTcTOiticLEHg29pWh5hIQvl4TAvF/l+M0B9kLHJBz7Yym15WAskgH1oWEWCX
	 I0R3VSVPMXX4Hd5ZFrJpkT1M7kVRCLBUOfNEWurfpP647sZJFnExX63vcwEis7Chd9
	 Op0PdEkY+4viIo6oDfyM/W1q3PBW1UPQz0QN8vq392ubUphN5fXSlVrRjFv5icfP7r
	 G0YhYpOd12pAtZPSbEZskl+AtMPMQX8Zd1ywt5xl20xgRbfMGM8IiAT77etViO9d/H
	 fYhpEOifWWC4aj5GFTh1brsnZbjfD0OAf/0tyBWKpSHP1PqJyGUTr0xJ/seEUwtt9k
	 dU9xT3LFajDAw==
Message-ID: <3c83c399-708c-41e2-988d-4ccec63c6042@kernel.org>
Date: Fri, 4 Oct 2024 10:24:32 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: omap: omap4-epson-embt2ws: define GPIO
 regulators
To: Andreas Kemnade <andreas@kemnade.info>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 khilman@baylibre.com, devicetree@vger.kernel.org, tony@atomide.com,
 aaro.koskinen@iki.fi, linux-omap@vger.kernel.org
References: <20240930213008.159647-1-andreas@kemnade.info>
 <20240930213008.159647-2-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240930213008.159647-2-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/10/2024 00:30, Andreas Kemnade wrote:
> To properly have things running after cold boot, define
> GPIO regulators. Naming is based on board file.
> 
> In the vendor kernel they are enabled in a function
> called bt2ws_dcdc_init() if the system is not booted just
> to charge the battery.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> index 339e52ba3614..d6b0abba19f6 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> +++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> @@ -29,6 +29,42 @@ backlight-right {
>  		power-supply = <&unknown_supply>;
>  	};
>  
> +	cb_v18: cb-v18 {

https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#generic-names-recommendation


So regulator@n
where n is some index if it can't be address.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cb_v18_pins>;
> +		compatible = "regulator-fixed";
> +		regulator-name = "cb_v18";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	cb_v33: cb-v33 {
here

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cb_v33_pins>;
> +		compatible = "regulator-fixed";
> +		regulator-name = "cb_v33";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		gpio = <&gpio6 30 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	cb-v50 {
here too

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cb_v50_pins>;
> +		compatible = "regulator-fixed";
> +		regulator-name = "cb_v50";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		gpio = <&gpio6 31 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	chosen {
>  		stdout-path = &uart3;
>  	};
> @@ -46,6 +82,19 @@ key-lock {
>  		};
>  	};
>  
> +	lb_v50: lb-v50 {
and here as well

> +		/* required for many things at the head (probably indirectly) */
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lb_v50_pins>;
> +		compatible = "regulator-fixed";
> +		regulator-name = "lb_v50";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		gpio = <&gpio1 27 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	unknown_supply: unknown-supply {
>  		compatible = "regulator-fixed";
>  		regulator-name = "unknown";
> @@ -336,6 +385,24 @@ OMAP4_IOPAD(0x1ca, PIN_OUTPUT | MUX_MODE3) /* gpio25 */
>  		>;
>  	};
>  
> +	cb_v18_pins: pinmux-cb-v18-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x1d0, PIN_OUTPUT | MUX_MODE3) /* gpio28 */
> +		>;
> +	};
> +
> +	cb_v33_pins: pinmux-cb-v33-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x1d2, PIN_OUTPUT | MUX_MODE3) /* gpio190 */
> +		>;
> +	};
> +
> +	cb_v50_pins: pinmux-cb-v50-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x1d4, PIN_OUTPUT | MUX_MODE3) /* gpio191 */
> +		>;
> +	};
> +
>  	gpio_keys_pins: pinmux-gpio-key-pins {
>  		pinctrl-single,pins = <
>  			OMAP4_IOPAD(0x56, PIN_INPUT_PULLUP | MUX_MODE3) /* gpio35 */
> @@ -387,6 +454,12 @@ OMAP4_IOPAD(0x005c, PIN_OUTPUT | MUX_MODE1)
>  		>;
>  	};
>  
> +	lb_v50_pins: pinmux-lb-v50-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x1ce, PIN_OUTPUT | MUX_MODE3) /* gpio27 */
> +		>;
> +	};
> +
>  	mcbsp2_pins: pinmux-mcbsp2-pins {
>  		pinctrl-single,pins = <
>  			OMAP4_IOPAD(0x0f6, PIN_INPUT | MUX_MODE0)       /* abe_mcbsp2_clkx */

-- 
cheers,
-roger

