Return-Path: <linux-omap+bounces-2304-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA198FDE9
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 09:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC3691C21341
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 07:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57487139579;
	Fri,  4 Oct 2024 07:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NU4mDWFh"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87CD130499;
	Fri,  4 Oct 2024 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728027507; cv=none; b=igbo+HsRfw/3srYygpRDQo2kymvO+VblgKEfJDMq2WU6DPMNo5PZKrHB3VscBjFK+5V/ReHMxFgJw4GQ/cv7abZK+0u9CMowqeHimprpnrAiYw96Zs+amld2RUocFvB9pSm1+0hGXQJNi8uk/Tbgqxo/cgcwMlYvJm33pUXMr7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728027507; c=relaxed/simple;
	bh=o0yKYeTnHlj1IBqcV9+Tlo4aUsb74pKV9hHiBfKT/z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kl3QWqU3w3EgPFgcXDFNxKv5FhgLvjxP8TnxSiBnYHrRh6X/Kl/Z9sHveOTkK0BbQOgnJbjoYLdIwQej0F1w12VyCtCtO5DRxmtoCkngwd7coZabTqqiQlE9biF9zLFPiWvQlkjYWwZBJxoq3714a1pScHoGfr+/MnZutaiu/YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NU4mDWFh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C6BC4CEC6;
	Fri,  4 Oct 2024 07:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728027506;
	bh=o0yKYeTnHlj1IBqcV9+Tlo4aUsb74pKV9hHiBfKT/z0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=NU4mDWFhtyRfJW00oPkiGwm63cfzNgc+L8k3wAwcrmeekLe3Qee+g5aFLnTKPFlHp
	 bY090ryzwCr4x6nI6cj89KSumb9O8CvMU0J9/3adDwRo+v9h6a4lGgAYh4e6XedItc
	 XU3fPW7Q/xziQlMYXgLfNdyV0Y7IfZoKgl02hcbh/bshKoDHpqLCUZIaHFvuenMES7
	 TOx3Nj0KnCG+yUo0pKJA5nCc79BIAsbj8daLS6tGC+pQTC5zITgm+Fp4ZZ4dsnNCue
	 ckjWhSV7oiwqoAtiEd3uQbxA7BzFefGj0fIrHT8sPwZiAgWfII8wOFky3aNU3R9osA
	 MHAni2I1Qf0iQ==
Message-ID: <79d9aeef-2b38-44c5-a371-f696f6ae1de3@kernel.org>
Date: Fri, 4 Oct 2024 10:38:22 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: dts: omap: omap4-epson-embt2ws: wire up
 regulators
To: Andreas Kemnade <andreas@kemnade.info>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 khilman@baylibre.com, devicetree@vger.kernel.org, tony@atomide.com,
 aaro.koskinen@iki.fi, linux-omap@vger.kernel.org
References: <20240930213008.159647-1-andreas@kemnade.info>
 <20240930213008.159647-3-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240930213008.159647-3-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/10/2024 00:30, Andreas Kemnade wrote:
> Wire up the regulators where usage is plausible. Do not
> wire them if purpose/usage is unclear like 5V for
> many things requiring lower voltages.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> index d6b0abba19f6..cc1b6080bf95 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> +++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> @@ -20,13 +20,13 @@ memory@80000000 {
>  	backlight-left {
>  		compatible = "pwm-backlight";
>  		pwms = <&twl_pwm 1 7812500>;
> -		power-supply = <&unknown_supply>;
> +		power-supply = <&lb_v50>;

This is probably wrong. I noticed this while reviewing patch 3.

you probably want to wire this to blc_l?

>  	};
>  
>  	backlight-right {
>  		compatible = "pwm-backlight";
>  		pwms = <&twl_pwm 0 7812500>;
> -		power-supply = <&unknown_supply>;
> +		power-supply = <&lb_v50>;

this one should be wired to blc_r?

>  	};
>  
>  	cb_v18: cb-v18 {
> @@ -95,11 +95,6 @@ lb_v50: lb-v50 {
>  		enable-active-high;
>  	};
>  
> -	unknown_supply: unknown-supply {
> -		compatible = "regulator-fixed";
> -		regulator-name = "unknown";
> -	};
> -
>  	wl12xx_pwrseq: wl12xx-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		clocks = <&twl 1>;
> @@ -308,6 +303,8 @@ mpu9150: imu@68 {
>  		pinctrl-0 = <&mpu9150_pins>;
>  		interrupt-parent = <&gpio2>;
>  		interrupt = <7 IRQ_TYPE_LEVEL_HIGH>;
> +		vddio-supply = <&cb_v18>;
> +		vdd-supply = <&cb_v33>;
>  		invensense,level-shifter;
>  	};
>  };

-- 
cheers,
-roger

