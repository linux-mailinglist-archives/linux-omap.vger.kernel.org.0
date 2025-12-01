Return-Path: <linux-omap+bounces-5093-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AA346C9938C
	for <lists+linux-omap@lfdr.de>; Mon, 01 Dec 2025 22:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CAEA74E2E4B
	for <lists+linux-omap@lfdr.de>; Mon,  1 Dec 2025 21:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1522A285C8C;
	Mon,  1 Dec 2025 21:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jih3YmpY"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC6A79CF;
	Mon,  1 Dec 2025 21:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764625316; cv=none; b=XOyfH9agZUI7oyHgUq9Wk/ukcHprXKvGSxdfxSjVgCdEoX9wWbOJGRVtH2LiRhcFgZwmGWMvMdvyuDH8VKQ8Spn+CEmJ7HjZ3MvEQJkykxfZEtqdGep1eA0Uj75kLuDqohq8qAvji4jXN7nIOKp1kYfgKvDyasEEHqUuy/SsEnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764625316; c=relaxed/simple;
	bh=6N+9tgFMH9jHHEA69cM/Gh06aTNX2GJ1DraSpzZnQIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mB3+YeDHEsTmkOHDuuP9BXh4swBgLFI4TOmWW4PKCgI2R57UNMfxLXiqnOyb1YhAXFREbqrjBAs4qqfKpDQ6kC444e+3p9gUjj8oFCijU6exEqjdUSetVn/wvm8SRK8dfznN4ubCxQCChxzzr+rCCuUB5W+H3HGO+ZbHUm+N3Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jih3YmpY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2F9C4CEF1;
	Mon,  1 Dec 2025 21:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764625316;
	bh=6N+9tgFMH9jHHEA69cM/Gh06aTNX2GJ1DraSpzZnQIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jih3YmpY6bvMk2F8zAU1VcAefP10RhKh9GeNLYeUaWFIieTUuhw0K2Ak1o4+mOjNZ
	 WesKfsh2yAQuOU1E51fTfucFavXW/KeVuZBkndwUfQe+EdeZfie84KcccbuDoNG78A
	 KxfIYs9GHi/u4diCR1v8Xb+KFPgu7zPow2MdjPikvqIS9Tae6UoLb6XGdIdaq8oWQI
	 VadUmtX95g3QFPSvG82KmRDeXce52fJlFsUrMeb4C+PfmJpGj8y552Ez2z9Ge0qMyH
	 m698sk1rGXusCsm2FpUz+cTsT0dAKRX699CWnphLe6gr1Tp1lJpwVsaOPDfvS25Du3
	 GW1M7qGQkRf1A==
Message-ID: <b89cf979-b2b2-4534-a633-648dc640e3ad@kernel.org>
Date: Mon, 1 Dec 2025 22:41:45 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: Document new common property:
 has-inaccessible-regs
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Lee Jones <lee@kernel.org>, dakr <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, tony <tony@atomide.com>,
 rogerq <rogerq@kernel.org>, khilman <khilman@baylibre.com>,
 Andreas Kemnade <andreas@kemnade.info>, aaro koskinen
 <aaro.koskinen@iki.fi>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, robh <robh@kernel.org>
References: <20251129142042.344359-1-richard@nod.at>
 <20251129142042.344359-2-richard@nod.at>
 <7d9fcf24-5ad5-48cf-b36d-83025976f3aa@kernel.org>
 <771947541.4509.1764430418744.JavaMail.zimbra@nod.at>
 <8b0e2b8a-314f-40ee-8f30-c281f3799705@kernel.org>
 <1810160052.4618.1764431802423.JavaMail.zimbra@nod.at>
 <c303a5f3-4283-445e-9e0e-053fab32a468@kernel.org>
 <2010740416.11902.1764624886863.JavaMail.zimbra@nod.at>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <2010740416.11902.1764624886863.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/12/2025 22:34, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
>> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
>>>>> What solution do you propose?
>>>>> Splitting reg = <0x0 0x1400> into many tiny fractions and not using an mfd
>>>>> anymore?
>>>>
>>>> Fix the driver. In your case, the syscon driver.
>>>
>>> Please help me to understand what the desired behavior of the driver is.
>>>
>>> Currently syscon creates one regmap for everything and passes this regmap
>>> to the individual syscon users.
>>> These users have to know what offset within the regmap is their playground.
>>> If I understand correctly, it would be better if every syscon user would
>>> register their own regmap?
>>
>> I don't think so. This device driver, so the syscon, creates the regmap
>> and knows EXACTLY which registers are valid or not. It is not
>> responsibility of the consumer to tell the syscon what this syscon is.
>> Syscon knows that...
> 
> How to configure this in syscon?
> AFAIK it takes only a single reg property.
> Are you suggesting to add many more syscon nodes to the DT to skip the holes?
> 
> Currently the scm_conf@0 DT node defines the first 0x1400 bytes
> of the CTRL_MODULE_CORE register[0].
> 
> Reading from register 0x180 triggers an async data abort here.
> The manual describes it as "RESERVED" of type "R".
> Lots of other offsets in CTRL_MODULE_CORE are reserved, but reading works.
> 
> Long story short, please tell me how to model it in DT and I'll do so.

I already told you:

"...we had it in several devices and fixed drivers."

"Fix the driver. In your case, the syscon driver."

and finally:

"BTW, the state of existing TI DRA code is so poor that you don't have
many choices... or rather every choice has drawbacks. If this was proper
DTS, then I would say - define register map, used by regmap, for your
compatible either in syscon driver or dedicated driver (thus new driver
will be the syscon provider for you, just like Google GS101 syscon is
special)."

What to say more? This is the instruction/proposal.

Best regards,
Krzysztof

