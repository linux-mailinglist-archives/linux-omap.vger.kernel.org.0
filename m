Return-Path: <linux-omap+bounces-2400-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 725AA99A18A
	for <lists+linux-omap@lfdr.de>; Fri, 11 Oct 2024 12:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36070283BF7
	for <lists+linux-omap@lfdr.de>; Fri, 11 Oct 2024 10:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C65213EDE;
	Fri, 11 Oct 2024 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcVq3gfx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5051212F10;
	Fri, 11 Oct 2024 10:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728643027; cv=none; b=rBn+UlFTmGdiP4RcEmIUGpJvis5bxGSd7iCuqwHsYIN3fKrTytBvGQz+4TtK/ssaVKAI9DZMaqEj4iKXSEfVtIhkb5iasUY8lMPxgdNPRpn+ITRZRAyKs8XDaRQ2jPnC6/sal2rsy6oJ/kV2fZrPlujk/TdV5eYBvGiAN1kgLhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728643027; c=relaxed/simple;
	bh=XtgtB9U5UItDpfn9p1vNq1wTCwTC7BdxgrxBwagW/nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxKLFXfxTxMsW/sBa8iF3ktWjB7glepkHJIfriOyLj/deNg3/DIybeqVx4CCwTcIC0smOLzspbhyug5Kzhqxzop7DJ6B6c9ut4h3+w5CYt0RwQCojqEx76D9fVdaSPlQEwcNzOBninSvJDnCD03lhA1Kpu5PVL3cuvsL7QrNCfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcVq3gfx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB43C4CECF;
	Fri, 11 Oct 2024 10:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728643027;
	bh=XtgtB9U5UItDpfn9p1vNq1wTCwTC7BdxgrxBwagW/nE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KcVq3gfxDwbv137hjR3zWqJBbacsY+73ETuXxYW1l4b1LVOHxPT4ENIN70yj+bgl7
	 6LWG2N4u8cWJqM2LGwnhcHk3eFaXHKSTS5fM6f7tyaGC1OpXuPSdgDCtVgKYkZufyR
	 e3Rh1r+91R9qtK5+YWOZsJ9ypy5qakHpdn84m8GZXeeZpa1Kx9q8CmdqpiR4hbt9kJ
	 XgX91YGBqnu5JhxFsDVblKJyp+f6KIkuf6gKDR79SdW02055nlmX2/vwfeSIr5EFp6
	 1b3LdOrvS6AJGPJBMngl6wUTPfXurd8eXgALlCGVViz9Dz7uJ/gKVqzYnablOrTSsB
	 NN3KpPJvpms8w==
Message-ID: <2d2382e1-2c5b-4780-a670-59dee524ca23@kernel.org>
Date: Fri, 11 Oct 2024 13:37:02 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] ARM: dts: omap: omap4-epson-embt2ws: add unknown
 gpio outputs
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-omap@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 tony@atomide.com, devicetree@vger.kernel.org, khilman@baylibre.com,
 Conor Dooley <conor+dt@kernel.org>, aaro.koskinen@iki.fi
References: <20241010122957.85164-1-andreas@kemnade.info>
 <20241010122957.85164-4-andreas@kemnade.info>
 <7cde7090-639b-4115-8240-88a63c760d93@kernel.org>
 <20241011111212.1b935eb8@akair>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241011111212.1b935eb8@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/2024 12:12, Andreas Kemnade wrote:
> Am Thu, 10 Oct 2024 23:15:51 +0300
> schrieb Roger Quadros <rogerq@kernel.org>:
> 
>> On 10/10/2024 15:29, Andreas Kemnade wrote:
>>> Set them to the state seen in a running system, initialized
>>> by vendor u-boot or kernel. Add line names where they are defined
>>> in the vendor kernel.
>>> gpio15 resets something in the display, otherwise meaning of the
>>> gpios is not known.
>>>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>> ---
>>>  .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 92
>>> +++++++++++++++++++ 1 file changed, 92 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
>>> b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts index
>>> 7684868a2eed..983a21d95db3 100644 ---
>>> a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts +++
>>> b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts @@ -115,6
>>> +115,73 @@ wl12xx_vmmc: wl12xx-vmmc { };
>>>  };
>>>  
>>> +&gpio1 {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&gpio1_hog_pins &gpio1wk_hog_pins>;
>>> +
>>> +	lb-reset-hog {
>>> +		gpio-hog;
>>> +		gpios = <9 GPIO_ACTIVE_HIGH>;
>>> +		output-low;
>>> +		line-name = "lb_reset";
>>> +	};
>>> +
>>> +	power-en-hog {
>>> +		gpio-hog;
>>> +		gpios = <10 GPIO_ACTIVE_HIGH>;
>>> +		output-high;
>>> +		line-name = "power_en";
>>> +	};  
>>
>> As GPIO 9 and 10 come form the Wake-up domain, my guess is 
>> they are used as wake-up input source. Reset button / Power off/wake
>> button? From pinmux they seem to be Input. So why do we need to force
>> them to a certain output state?
> 
> Interesting reasoning and good to bring up those thoughts.
> 
> Vendor v3.0 kernel:
> shell@android:/sys/kernel/debug # cat gpio 
> GPIOs 0-31, gpio:
> [...]
>  gpio-9   (gpio_lb_reset       ) out lo
>  gpio-10  (gpio_power_en       ) out hi
> 
> So they are configured as output.
> There is one power button. It can be handled via the TWL6032 (driver
> not upstreamed yet). There is also one reset button resetting the SoC.
> 
> I do not see a reason why to deviate from vendor kernel.

OK.

>  
>> Can you please confirm if everything works as usual without this hog?
>>
> Well, if everything is working well, I would agree to optimize
> these things. But not now. There are races in the boot process
> and I would like to rule out that any random or strange behavior has
> anything to do with some gpio setting.
> 
> Regards,
> Andreas

-- 
cheers,
-roger

