Return-Path: <linux-omap+bounces-4733-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D34BF7D77
	for <lists+linux-omap@lfdr.de>; Tue, 21 Oct 2025 19:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 005FB18C8574
	for <lists+linux-omap@lfdr.de>; Tue, 21 Oct 2025 17:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61FA344CEC;
	Tue, 21 Oct 2025 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLFyB1hK"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571B734B180;
	Tue, 21 Oct 2025 17:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761067110; cv=none; b=TeztIVlLmhadMg11PVFvyQFKm3a6BcaAM4TDEpiDqtVXZm/L9f02nIFUmANIiX+Y1PIgttDLbgOOZyx7OPQYI0UNj5c8M0IwWDKfg39VU162MdwO+I/83zpwxtzyPZBr1irBPqgQcaekHjEixdpSRPDjQXIZLb01xIBBgj4oIqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761067110; c=relaxed/simple;
	bh=QtLXS3rzu85GPfiyQyWFtuvBX2K+zVl2eqhHbxp7VYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t9vsjQZgcoclsJQH8itFoE+QQyATD91D3wMWdtISHOspVLYI/Vlw1mLGtF8nuXS7tv4gcYPhbB3cToCL4UAaYodBgt25ZBm6jbUFb3B6H86uHDbU5le/fL4usrs8dQG/akPKX2hslmCmKe6NoDsh1trKZuzjsRDsHNlk7w4bu4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLFyB1hK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2101C4CEF1;
	Tue, 21 Oct 2025 17:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761067109;
	bh=QtLXS3rzu85GPfiyQyWFtuvBX2K+zVl2eqhHbxp7VYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tLFyB1hKmQyILba52G5QPz0hWIrOzggT5rxoOzZqq7ZoR+eRBNGGZrjcdOWAGcQga
	 rNHX+CSDcSL4YMcZ+OO8a2m42NZgFgVmSoyqjhOR2cUNL3k4nNq+KwBGp9YuvyfV3t
	 JNeY5ZDJAY6nRuJwNRaGmQVdFfHVI6s4PklmUH5+ae8Xlkb9mXq0dFXmco496qqXYH
	 +QkgxK/6c8vF4a5RB7VCSWDcwVlsvc43O70bBSY8UDAAgEOE3h0/Ao4JjtgMg1lAd6
	 Wo4oxiBfX+uaJHpV+JFhCZHHWnBC/jByJQclgtU3EEEWrT9zNnguXO6Pkaf/3WJlcZ
	 tI/s+XSGpbnxw==
Message-ID: <7702e4f6-4913-4d9e-bbc4-1fb849507e4c@kernel.org>
Date: Tue, 21 Oct 2025 19:18:25 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mfd: twl: enable power button also for
 twl603x
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org
References: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
 <20251020-twl6030-button-v1-1-93e4644ac974@kernel.org>
 <5fd43d2c-3a08-4a51-abb6-38883ee86bf2@kernel.org>
 <20251021104515.5e25bec1@kemnade.info>
 <beabb9f7-fcf4-4c1d-a259-6c48e82fbcf5@kernel.org>
 <20251021183624.6fde0a15@kemnade.info>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251021183624.6fde0a15@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2025 18:36, Andreas Kemnade wrote:
> On Tue, 21 Oct 2025 11:58:49 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 21/10/2025 10:45, Andreas Kemnade wrote:
>>> On Tue, 21 Oct 2025 09:10:28 +0200
>>> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>   
>>>> On 20/10/2025 14:31, akemnade@kernel.org wrote:  
>>>>> From: Andreas Kemnade <andreas@kemnade.info>
>>>>>
>>>>> TWL603x has also a power button, so add the corresponding subnode.    
>>>>
>>>> No, we don't add subnodes just because there is a power button. This
>>>> needs broader explanation, see also my further comment.
>>>>  
>>> Hmm, what is the general pattern to follow if a mfd device has some
>>> functionality which depends on some optional external components?  
>>
>> Please describe it better - how these nodes depend on external
>> component? The power button logic/IC is in this device always. It is not
>> optional.
>>
> The power button logic is always there, yes, but it depends on an optional
> actual mechanical button connected to a pad of this device, which is
> not always there. The logic will not work if I just put my finger on the PMIC,
> but it will work if there is a mechanical button which I can press connected to
> the PMIC.


Hm... how do you represent this logic now? By adding status=disabled to
the pwrbutton node?


> 
>>> The might be a power button connected to it or not. I find it ugly
>>> to have non-existent stuff in the system.
>>> In general, yes I understand the argument against the subnode.
>>>   
>>>>>
>>>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/mfd/ti,twl.yaml | 40 ++++++++++++++++++-----
>>>>>  1 file changed, 32 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
>>>>> index 776b04e182cb2..3527fee32cb07 100644
>>>>> --- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
>>>>> @@ -55,6 +55,15 @@ allOf:
>>>>>  
>>>>>          gpadc: false
>>>>>  
>>>>> +        pwrbutton:
>>>>> +          properties:
>>>>> +            compatible:
>>>>> +              const: ti,twl4030-pwrbutton
>>>>> +            interrupts:
>>>>> +              items:
>>>>> +                - items:
>>>>> +                    const: 8    
>>>>
>>>> What is the point of defining const interrupts? If they are const, then
>>>> it is implied by compatible and defined in the driver.
>>>>
>>>> Anyway, double items does not look right here. This is an odd syntax.
>>>>  
>>> Quoting Rob:
>>> As 'interrupts' is a matrix, this needs to be:
>>>
>>> interrupts:
>>>   items:
>>>     - items:
>>>         - const: 8
>>>
>>> https://lore.kernel.org/linux-omap/20240318150750.GA4000895-robh@kernel.org/  
>>
>>
>> OK, this answers second part but I don't understand why even having this
>> in DT. If this is fixed, should be implied by the compatible?
>>
> correct, they do not need to come from DT. The same is true for all
> subnodes of the twl[46]03X. I just followed the usual
> pattern there, which is of course not recommended for new designs.


OK, please mention the reasons (so following established pattern for
this legacy device) in commit msg.

Best regards,
Krzysztof

