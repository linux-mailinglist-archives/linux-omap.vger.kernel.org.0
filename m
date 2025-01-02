Return-Path: <linux-omap+bounces-2938-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D64E89FF6F7
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 09:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC18418827D3
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 08:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8357519ABA3;
	Thu,  2 Jan 2025 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHGoQ6ZQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C3D19340B;
	Thu,  2 Jan 2025 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735807002; cv=none; b=AsliNh/d48Kf/MTzW2l6d/YDyEZxmVkroWBAmowPt0olly5HXrdiZNN9Cr0yl5vPxicD2M+Pes/M/Yt3wHIPsRc7CLPp/uF0HlKJIOqnabTxLDAook7w4zAiZ5zmTPeDAXdlyXruHsRef/sUct/suQhBKdNRd3+XF4/VceofnAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735807002; c=relaxed/simple;
	bh=aoVonJahGfaeZcNc5qzat7F0wQh7EIK73+Yul0EUm8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hd6qjoPVP8v9+xRdINhdKVmsBed+yfOkk+dDLggQhl2pSQlt87Zm2xVrkp9fxpVaUdbrpt1l3AQKOIYqnkcg1I2ZGTRJXKDCPrtyT6J7k0LDQswH4cNeixEFwJuu6g57ZraOIZ0mEtysfAfwPdhH9CUki97cea125PEsowxfAh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHGoQ6ZQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4362f61757fso111094725e9.2;
        Thu, 02 Jan 2025 00:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735806998; x=1736411798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YYJor2AmGHzULTddD4uxyLN+pbDfv85xFKFL5lFNPng=;
        b=eHGoQ6ZQeerqxQ65Pan8HybGhA5/nalmr5pwtR3bUA/AdJz2F//84p76KGGEz+z6iX
         GcA85K1Hwejt/ZC5sKpUyuRZwQQ7+IX0NR6Afi1WymF6RfNwv2XicG+QhJ6KqFFKxO2Q
         Is/SiEKNr1DiXUyJuidR7677zEIurW4nNwTVMyL9KbhhrnYemDP4RMscwoWlsLQgkfnN
         U/BP/4ncLy7nVesw4ojxsGtXFNMGwZVmGhhgkYgGqFFCGwRTYdtEWrXP5hU+HqEuroM3
         dXxxi7Cup5ftxQsZYh+3f1PbIU95ABu4rJ+WcDPUYct3lVuGvax6hTmsMuhL027QmjCC
         if6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735806998; x=1736411798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYJor2AmGHzULTddD4uxyLN+pbDfv85xFKFL5lFNPng=;
        b=lvlr9msc1fE0UR17+o70UgwUD4EnxWjRh08M3fRm1Et/imKdJbPQqBj+skNqfZWrll
         zxLqD+mzQlkF0/LTZvu0RpoT7qBtRFqIvDorZZ/MaSfoEp01WpmQgakuhZ3ORhrzAgoG
         ao8Q74Tcouf08vV1kOaDM9Ny2lcTU0TTJfEpHINlivV/F6WaU/VEoeqWPOsJC9jYIjHl
         b4wwi7xx8ay3pvo5I3lKe3aPdN5dXpgH8P3TeogCPPzdRbD+pQ5nXEvSFsxWOtVOWDhD
         xnZJbkoZfeYF2arZoDMflXVpjAK5SpPmuiiYuVp5Yx4B8gcFXrPj57ossBl84wIfRQIb
         kD4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmM/TLNW0hykIeOn2X5hEw1RNs1dO8LM6mwDebaG53jQOZi4LCTIl0/zBdQEXphB7dLuU3UcsZDiU6QaI=@vger.kernel.org, AJvYcCVobyC1Q1mhtxHkOMdtWhAzIFqdAwkwjXLP0BanaEA/VIT8z2fFpqGeuZWKYqay8iGqK4s5+rG6bKjlvA==@vger.kernel.org, AJvYcCWsIcBgKZUetSoZW793ixO+vOf6rOrlrzSmgumeXkxEfzkVbx1PdZ3QgltVA1QHXEQjVum+moGz1eVmY5iA@vger.kernel.org, AJvYcCXPa2ifG2knPagG8A3fGoqVOteLo2SaXrBNtsc1yAuMPlkVEZ8xrewXYTjIiOFAmackQ+qidu5ELKme@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5GiR7wFiHXWO/aBl9ntb6sK6Wz7NTBLu8koMqjBqmrqYrwvi5
	+HZdJ91la6CO4dYxNC8wPDiL5hvzP5Y1sNlqq6f4E2CIWaG8ktVS
X-Gm-Gg: ASbGncujuaKFIiJZgDqukUtNTU0l5uWWGG0ET/rxV+IPFdwzwVbsTow3G+WdfCPzuK4
	m7jFUdX0RRPjLDTgTrpj5BZiwVeVB29Kqgy7KeZUcoZ41V3Ni5wei+bXI71TNUkIs5Vgs59Ga+a
	6Buyy6EY3afuVBmgzbedib4uemBWJPsWIPPZnuvDYkbFwFWE1yaBC8pw8jwZoEjiX/0bzKCs18u
	3TWaBEl1aITvfyOZRR6Z4pu5g5Uk71e1e/rnJQkvrkFUE7XWfRr34oq3Gk3qmAGVoSbkg==
X-Google-Smtp-Source: AGHT+IF1+vwaMP1oFD27c9V/NJzPDSUhYFVPYLsw92ZrI3AanIY0LFkHZE0Q66LIV67pErjcgQ1XEw==
X-Received: by 2002:a5d:6c63:0:b0:386:3e0f:944b with SMTP id ffacd0b85a97d-38a223ffbfbmr33448922f8f.37.1735806998282;
        Thu, 02 Jan 2025 00:36:38 -0800 (PST)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8472d5sm37998379f8f.47.2025.01.02.00.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 00:36:37 -0800 (PST)
Message-ID: <3562e162-a425-4d4a-96c5-e6b748dc87c6@gmail.com>
Date: Thu, 2 Jan 2025 10:36:36 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: mfd: motorola-cpcap: Document
 audio-codec interrupts
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
References: <20241228114514.91594-1-ivo.g.dimitrov.75@gmail.com>
 <20241228114514.91594-4-ivo.g.dimitrov.75@gmail.com>
 <34ratvyiosxtphzliv6jxcjsddk4op5745jummklumd7fyzoe4@lq4ylmrlokmr>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <34ratvyiosxtphzliv6jxcjsddk4op5745jummklumd7fyzoe4@lq4ylmrlokmr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 31.12.24 г. 10:41 ч., Krzysztof Kozlowski wrote:
> On Sat, Dec 28, 2024 at 01:45:12PM +0200, Ivaylo Dimitrov wrote:
>> This adds the DT binding for the audio-codec headset detection interrupts
> 
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
> Also, missing full stop.
> 
>>
>> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/mfd/motorola-cpcap.txt | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
>> index 190230216de8..3ad809e119ff 100644
>> --- a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
>> +++ b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
>> @@ -31,10 +31,15 @@ node must be named "audio-codec".
>>   Required properties for the audio-codec subnode:
>>   
>>   - #sound-dai-cells = <1>;
>> +- interrupts-extended = <&cpcap 9 0>, <&cpcap 10 0>;
> 
> Instead: interrupts and say which interrupt is where.
> 
> Anyway this should be converted to DT schema.
> 

Do you want me to do the conversion? If yes, could it be done in a 
follow-up patch?

Thanks and happy new year,
Ivo

