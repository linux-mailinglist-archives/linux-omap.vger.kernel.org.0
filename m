Return-Path: <linux-omap+bounces-5078-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 116E9C94193
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 16:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 88C8D34576A
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 15:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D451F8723;
	Sat, 29 Nov 2025 15:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4+hV7bw"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47148156236;
	Sat, 29 Nov 2025 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764431660; cv=none; b=K9tXcrozvuyS30CJ7ECbU7q2opc+RVG5N9iFPg9U/q+VIokZ5wkuZBdu3GKw3fWK7LkMpFt9lUpgmris8jV/Gy9Vt3iQ3kxn4J53+qRZCWrPnLvK5Qc8ImRJ6pssLzuf8dF+0KrxI2c/1xxFjYqAKs2MGp8xPZRCs3jyD2KPXH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764431660; c=relaxed/simple;
	bh=P2SkA+WxYdD0k3BRTsy2IxHgKdWg694ccPQkThNiudU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoQbZCVILDM7+Ukxw+Ze2XWknITp9jiZSXQhI+t7RQKz/XnjEThfzz+EXte6e4CoGGkpb7wexW2BB0RlYgafUlC7t31yE/FH5P8iu0numhvDq6qh02yGQr1lKc8BsRy1JIlpqJxV5xVyKOzQy5zj5HesIzEdoyNe5KMQEu4ZCcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4+hV7bw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB3FC4CEF7;
	Sat, 29 Nov 2025 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764431659;
	bh=P2SkA+WxYdD0k3BRTsy2IxHgKdWg694ccPQkThNiudU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c4+hV7bwsI4kPOstMPDeGTiDijrSx+n2zZ4dyAbbEQSTTkUxC0mr/WxR1dn+IiAXX
	 8XSGv22jSW1hClFpUKjRt9f5dnh9RR7rVI7Wk8i/owa1hgjRn/5YFCLIBPnMU09ebA
	 hbJ4xLLNfy3p1yuNUbHBc15FRQC5IZoAJMA04Zasega89GiAGLfj7i98kfLgDfS3aH
	 zuQTxqlgejlHrU+FU2pvlH/kTQakjn1rEurLmnxVIcpj6XRVUuXcVpop73YS+BSZID
	 SNr8fcxmRVU3/dy/7TRzpUcifmjdE2b1WBF4aKwIMTzF+LeFEdhrvdoXifoofzwRW4
	 WInk0f6SoF0Gw==
Message-ID: <bbf2c52f-e067-431f-a031-b173bf2f19e9@kernel.org>
Date: Sat, 29 Nov 2025 16:54:14 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm: dts: omap: Mark various register maps as
 dangerous
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
 <20251129142042.344359-5-richard@nod.at>
 <e775d0be-d4d8-429b-bfd1-05872f141832@kernel.org>
 <880768638.4519.1764430531092.JavaMail.zimbra@nod.at>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <880768638.4519.1764430531092.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/11/2025 16:35, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
>> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
>> An: "richard" <richard@nod.at>, "linux-kernel" <linux-kernel@vger.kernel.org>
>> CC: "linux-omap" <linux-omap@vger.kernel.org>, "devicetree" <devicetree@vger.kernel.org>, "Arnd Bergmann"
>> <arnd@arndb.de>, "Lee Jones" <lee@kernel.org>, "dakr" <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Greg
>> Kroah-Hartman" <gregkh@linuxfoundation.org>, "Mark Brown" <broonie@kernel.org>, "tony" <tony@atomide.com>, "rogerq"
>> <rogerq@kernel.org>, "khilman" <khilman@baylibre.com>, "Andreas Kemnade" <andreas@kemnade.info>, "aaro koskinen"
>> <aaro.koskinen@iki.fi>, "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "robh"
>> <robh@kernel.org>
>> Gesendet: Samstag, 29. November 2025 16:26:19
>> Betreff: Re: [PATCH 4/4] arm: dts: omap: Mark various register maps as dangerous
> 
>> On 29/11/2025 15:20, Richard Weinberger wrote:
>>> index 711ce4c31bb1f..1b1f31608d37e 100644
>>> --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
>>> +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
>>> @@ -359,6 +359,7 @@ bandgap: bandgap@4a0021e0 {
>>>  		dsp1_system: dsp_system@40d00000 {
>>>  			compatible = "syscon";
>>
>> Oh, no no, sorry, but buggy/incomplete/legacy DT is not an excuse for
>> new properties. You cannot have such compatible alone in the first place.
> 
> Okay, I didn't know that the OMAP DT is in that bad shape.

Heh, let me give you a piece of a spoiler of my OSS Japan talk in a
week: TI (entire TI, not individual sub-platforms) for arm32 is 0%
compliant, meaning EVERY board has issues, and TI has THE HIGHEST total
number of warnings of all active mainline arm32 platforms.

TI ARM32 status is absolutely terrible... TI ARM64 is on quite different
side. :)

More of hall-of-shame on 9th of December...

Best regards,
Krzysztof

