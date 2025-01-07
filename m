Return-Path: <linux-omap+bounces-3012-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA4A03EE7
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 13:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47AE1160729
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 12:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF5D1EBFEB;
	Tue,  7 Jan 2025 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeuBs0mB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CFB1E1322;
	Tue,  7 Jan 2025 12:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736252120; cv=none; b=ohvwUY2M41YboY36HU2aglfShUJiSlaIgGpcm+ZK5T54BCwJqAoGH3U+jOI68Sigd2jPnfcAyQY+e2oJgpfuBkK4iUFZMVcrAfslRiB7KS0W+460KOoYh26frNLHDVccRqNDmAYw0r+HL7GEHoQfbI8NRUhcR3QZyJACDMq1FQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736252120; c=relaxed/simple;
	bh=0Fw9Tr2BdnHYEVFc9Jni9+GvqKIkiNHC0t94nkzAwdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXJSNEKQopWJLUG0DIuTzaAGo08hRPpXCJ2WbH0Fd+3NxcNZwRkKyLDHncAytjPYiNHwgj6DYg5wF1XqXv8ulWEIQlyDRrEb3z2PLeCbCMlJXa1qBEUbGuqhjPxWQyvSWm9OUJpwCzcPfhVLq/+/TJ4cNCPRJd/Blvjbl3Xcq5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeuBs0mB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74ECCC4CEDD;
	Tue,  7 Jan 2025 12:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736252119;
	bh=0Fw9Tr2BdnHYEVFc9Jni9+GvqKIkiNHC0t94nkzAwdk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AeuBs0mB5OIa5cyEkjzwMVUPw2qub3Jt0aKwqdqvzdH+pOwhMQnU1AFZIyRjqEuIq
	 p28Eo+wM8G5ehXKwP7NAbtlCHsWGvI31UwMPkLy6VIretTZoPJ9BM3jyZ6m05bA2Vs
	 F6czmiLHFAsNRgK/Z+ujgtCli+t4BQ24CsFXKylox0PO05CUokMpxfMqdGv7uWifQY
	 +eHP8CiLEVmqX8W3F4XVIl/FHTSxJ81iKUELYtCxA7xtSiIbCcvFI84UCMDTBhkPJs
	 DViG5q5RfQraifyEFAxQWlOHhlz+89awJzjL61k3KbjWSO69WFTn6/OXb7qsHn0wND
	 huWm+XOuKubGw==
Message-ID: <8a77f406-0886-4bb8-8452-de506f458d17@kernel.org>
Date: Tue, 7 Jan 2025 14:15:14 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: ti/omap: omap4-serial: fix interrupts syntax
To: Andreas Kemnade <andreas@kemnade.info>
Cc: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com, aaro.koskinen@iki.fi
References: <20241230195556.112118-1-andreas@kemnade.info>
 <3bde5a34-4bb8-42a3-ad5c-eeb495c6aa6d@kernel.org>
 <20250104192015.0a7a4f47@akair>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250104192015.0a7a4f47@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/01/2025 20:20, Andreas Kemnade wrote:
> Am Sat, 4 Jan 2025 19:45:35 +0200
> schrieb Roger Quadros <rogerq@kernel.org>:
> 
>> Hi Andreas,
>>
>> On 30/12/2024 21:55, Andreas Kemnade wrote:
>>> Usually interrupts are overwritten in the board file to specify a
>>> mux-dependent dedicated wakeup irq, so there is interrupts and
>>> interrupts-extended property which is not allowed. That has generated a
>>> lot of noise during dts changes if just a phandle involved has randomly
>>> changed.
>>>
>>> Avoid that mess by specifying interrupts-extended in the dtsi file.
>>>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>> Reported-by: Rob Herring <robh@kernel.org>
>>> Closes: https://lore.kernel.org/linux-omap/173558214240.2262575.18233884215338168789.robh@kernel.org/
>>> Closes: https://lore.kernel.org/linux-omap/172784021601.525825.18405282128990798038.robh@kernel.org/
>>> ---
>>>  arch/arm/boot/dts/ti/omap/omap4-l4.dtsi | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
>>> index 3fcef3080eae..150dd84c9e0f 100644
>>> --- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
>>> +++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
>>> @@ -1414,7 +1414,7 @@ SYSC_OMAP2_SOFTRESET |
>>>  			uart3: serial@0 {
>>>  				compatible = "ti,omap4-uart";
>>>  				reg = <0x0 0x100>;
>>> -				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
>>> +				interrupts-extended = <&wakeupgen GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;  
>>
>> At this point interrupts-extended is not applicable.
>>
> we have it this way also in omap3. I do not understand what is the
> problem with it. Do you have a pointer where it is forbidden?
> At least
> Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> says nothing againt using it in such cases.

Pasting the quoted text here for reference.

"The "interrupts-extended" property is a special form; useful when a node needs
to reference multiple interrupt parents or a different interrupt parent than
the inherited one."

I understood both were false so said that it is not applicable here.

> 
>> We could use
>> 	/delete-property/ interrupts
>> in the board files that needs multiple interrupt parents?
>>
> What is the advantage of using that more complex solution? I would then
> prefer to have the same with omap3 and omap4. If we do anything about
> interrupts in board file here, they will have multiple parents.

I was suggesting from the point to avoid churn in SoC dtsi file.
But I see your point now.

I don't have any objections.

-- 
cheers,
-roger


