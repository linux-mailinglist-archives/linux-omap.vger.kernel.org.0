Return-Path: <linux-omap+bounces-2309-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D14899002C
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 11:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B43BB24EAB
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 09:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7541487C0;
	Fri,  4 Oct 2024 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYwJdss8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7C7140E50;
	Fri,  4 Oct 2024 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728035113; cv=none; b=erpf4K01UZy8xBcJ8SAzw+JbEwEdJ18qNOBycfFoNLkhH3cFub0y+MGgwQnJN6EHpsSKY05Gu/e/rl8NtDt67e41FCG4rpYdIPtXWvZubUljl0GuN1rNC+fSFoyrHMKu784bxu1bnymESlRcJrADscqsL2lxAD6y8geQmaECpVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728035113; c=relaxed/simple;
	bh=TaiYoGdpBfdpz0ME0klNH6KoD2sXjnt2vr017uHEmjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuGFqJAqicbikffCzKKl6yD0hWY7lyflmcVXJY448EtohkVoo95XPfdaFvBbDR9EsuNDHp105GqgdHjLA0QZzRybWXDVroa0PgoUbZTRmkd/sUpk+eFLbB6ufkt+MfSfLcbbtLCFHnPJf5v+Z4CtcUM+qntQMdcLMtRugMXIJVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYwJdss8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3977C4CEC6;
	Fri,  4 Oct 2024 09:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728035113;
	bh=TaiYoGdpBfdpz0ME0klNH6KoD2sXjnt2vr017uHEmjI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PYwJdss8/faK0K7G+0mkAciLFYvSoNJFW3xcLsN0xFcIFXbUZDVYUye8BHBaop8UI
	 OKlyKiiBd4B+TCAelTd0LPde2Di3+fcyqEOqHRupkZWrEn0YTNPVPjHj7XjnAfissO
	 rDVPsmKdZChwu6+VMCvYJ+j/Zb/9WPdK4IRqzMl6+sU9hmnmLCyyvnh3RT3og9YxIb
	 T4jwlQjXjcmATwaPKu4kg4JDRVCBPMINb4Cq1Zzy5a6UkZQbG0h8fIt2MS7JWooefG
	 V0I78qyU7QC6v+Zu8rLtvv1A95Mhtbq8vYy66h/QrM5UwrmZ9b07i7NzCzoc+C+ERT
	 n3iNdozHat19w==
Message-ID: <7f821dc9-299f-4e7e-b6dd-568573358300@kernel.org>
Date: Fri, 4 Oct 2024 12:45:08 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: dts: omap: omap4-epson-embt2ws: wire up
 regulators
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, khilman@baylibre.com,
 devicetree@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 linux-omap@vger.kernel.org
References: <20240930213008.159647-1-andreas@kemnade.info>
 <20240930213008.159647-3-andreas@kemnade.info>
 <79d9aeef-2b38-44c5-a371-f696f6ae1de3@kernel.org>
 <20241004110110.163db244@akair>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241004110110.163db244@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/10/2024 12:01, Andreas Kemnade wrote:
> Am Fri, 4 Oct 2024 10:38:22 +0300
> schrieb Roger Quadros <rogerq@kernel.org>:
> 
>> On 01/10/2024 00:30, Andreas Kemnade wrote:
>>> Wire up the regulators where usage is plausible. Do not
>>> wire them if purpose/usage is unclear like 5V for
>>> many things requiring lower voltages.
>>>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>> ---
>>>  arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts | 11 ++++-------
>>>  1 file changed, 4 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
>>> b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts index
>>> d6b0abba19f6..cc1b6080bf95 100644 ---
>>> a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts +++
>>> b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts @@ -20,13
>>> +20,13 @@ memory@80000000 { backlight-left {
>>>  		compatible = "pwm-backlight";
>>>  		pwms = <&twl_pwm 1 7812500>;
>>> -		power-supply = <&unknown_supply>;
>>> +		power-supply = <&lb_v50>;  
>>
>> This is probably wrong. I noticed this while reviewing patch 3.
>>
>> you probably want to wire this to blc_l?
>>
> No idea was blc_l is. I did not find any code handling blc_l.
> looking at the vendor kernel:
> 
> $ grep -R BLC_L_GPIO *
> arch/arm/mach-omap2/board-bt2ws.c:#define BLC_L_GPIO
> 16	/* LB LED GPIO */ arch/arm/mach-omap2/board-bt2ws.c:
> {BLC_L_GPIO,   GPIOF_OUT_INIT_LOW,  "gpio_blc_l"   },
> arch/arm/mach-omap2/board-bt2ws.c:	gpio_export(BLC_L_GPIO, 0);
> arch/arm/mach-omap2/board-bt2ts.c:#define BLC_L_GPIO
> 16	/* LB LED GPIO */ arch/arm/mach-omap2/board-bt2ts.c:
> {BLC_L_GPIO,   GPIOF_OUT_INIT_LOW,  "gpio_blc_l"   },
> arch/arm/mach-omap2/board-bt2ts.c:	gpio_export(BLC_L_GPIO, 0);
> 
> These two gpios are exported. But they seem not to influence
> backlight in any way. I just tested again to make sure. Maybe it is just
> a leftover from earlier board revisions.

OK. you could then leave it as it is now.

> 
>>>  	};
>>>  
>>>  	backlight-right {
>>>  		compatible = "pwm-backlight";
>>>  		pwms = <&twl_pwm 0 7812500>;
>>> -		power-supply = <&unknown_supply>;
>>> +		power-supply = <&lb_v50>;  
>>
>> this one should be wired to blc_r?
>>
> Same as with blc_l.
> $ grep -R BLC_R_GPIO *
> arch/arm/mach-omap2/board-bt2ws.c:#define BLC_R_GPIO
> 17	/* LB LED GPIO */ arch/arm/mach-omap2/board-bt2ws.c:
> {BLC_R_GPIO,   GPIOF_OUT_INIT_LOW,  "gpio_blc_r"   },
> arch/arm/mach-omap2/board-bt2ws.c:	gpio_export(BLC_R_GPIO, 0);
> arch/arm/mach-omap2/board-bt2ts.c:#define BLC_R_GPIO
> 17	/* LB LED GPIO */ arch/arm/mach-omap2/board-bt2ts.c:
> {BLC_R_GPIO,   GPIOF_OUT_INIT_LOW,  "gpio_blc_r"   },
> arch/arm/mach-omap2/board-bt2ts.c:	gpio_export(BLC_R_GPIO, 0);
> 
> Regards,
> Andreas

-- 
cheers,
-roger

