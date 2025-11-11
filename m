Return-Path: <linux-omap+bounces-4898-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF8BC4EC82
	for <lists+linux-omap@lfdr.de>; Tue, 11 Nov 2025 16:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7216B34CD08
	for <lists+linux-omap@lfdr.de>; Tue, 11 Nov 2025 15:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BDB366549;
	Tue, 11 Nov 2025 15:28:09 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2062365A07
	for <linux-omap@vger.kernel.org>; Tue, 11 Nov 2025 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874888; cv=none; b=LGGWdWjlxrKslfkmHKBiVkTaa4Hj1UcCLWAVnrVJPyqZz3FKjDW+beynVWqiJnLETl3YEiOwpGXqOJ/N7jYwvUrHnalVRx7CGzJvp2lWrX96sgb1P/mXzRafA+CK6PMAYc3W7/XOafpJXSZr0axRel0pOjeblddaW9vxpQNSlaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874888; c=relaxed/simple;
	bh=HS28uWRoA/Dc+y57RgagT5fvXagXuKEY9Q/FLGYTUE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqEw/46AFWGqqf6qUu3/IMNRsoC1fmAZMzWBtFcxP5pDYQmHmnqDxYhyn9qHlYOTomc7FBN0b38kpQdLs0BavCb1FJwiW1yeZT65AHN1jr2AeGnnvHqz8SQu4DOwiiiM6dQPvaV++hTvR6V8J03yi14cCNqVpBDNnKj4FxraGYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vIqHq-000536-7u; Tue, 11 Nov 2025 16:28:02 +0100
Message-ID: <5f500a58-4ed4-47b7-80bf-3ad5b619d049@pengutronix.de>
Date: Tue, 11 Nov 2025 16:28:00 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: DT compatibility break for am335x (Was: Re: [PATCH] ARM: dts:
 am33xx-l4: fix UART compatible)
To: Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <20250721173741.6369-1-bruno.thomsen@gmail.com>
 <91f764ab-bec1-4791-b01b-3ba0803ce8f8@pengutronix.de>
 <CAH+2xPAEAfJW+yy-45Y8EpOWb-8vvaNf27GXe1Ch0Xj8ZuLZHA@mail.gmail.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAH+2xPAEAfJW+yy-45Y8EpOWb-8vvaNf27GXe1Ch0Xj8ZuLZHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org

Hello Bruno,

On 11/11/25 4:15 PM, Bruno Thomsen wrote:
> Hi Ahmad,
> 
> Den fre. 7. nov. 2025 kl. 19.47 skrev Ahmad Fatoum <a.fatoum@pengutronix.de>:
>>
>> Hello Bruno,
>>
>> On 21.07.25 19:37, Bruno Thomsen wrote:
>>> Fixes the following dtschema check warning:
>>>
>>> serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>>>       ['ti,am3352-uart', 'ti,omap3-uart'] is too long
>>>       'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>>>       'ti,am654-uart' was expected
>>>       from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>>
>>> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
>>
>> I tripped over this patch, because it broke the console in barebox after the
>> device tree sync with Linux v6.18-rc1, fortunately caught before release.
> 
> Sorry to have caused you issues in barebox, that was not my intention.
> 
>>
>> I believe the correct resolution for the DT binding warning would have been
>> to extend the compatible list in the binding with ti,omap3-uart if they are
>> indeed compatible.
> 
> I can see that I forgot to include the full reason for the change in the commit
> message. We have some products based on ti,am33xx soc and the serial
> the console had many quirks when using the ti,omap3-uart that we did not
> see on other soc families. The console did not like opening vi or htop but
> could only handle simple kernel log. Switching to ti,am3352-uart fixed these
> issues, so that was why I changed the device trees and not the schema.

Couldn't the same result have been achieved by disabling
CONFIG_SERIAL_OMAP? The driver match logic should already have preferred
the more specific compatible, so the problem is that two drivers are
matching against the same compatible, right?


>> I have submitted a patch to add the now sole compatible to the barebox driver[1],
>> but please keep DT compatibility in mind with similar changes in future.
> 
> Thank you for maintaining barebox. On our new platforms we only use barebox
> as a bootloader as it provides a much easier board boot then u-boot.

Happy to hear. :-)

Cheers,
Ahmad


> 
> /Bruno
> 
>>
>> [1]: https://lore.kernel.org/barebox/20251107182805.3367244-1-a.fatoum@pengutronix.de/T/#u
>>
>> Thanks,
>> Ahmad
>>
>>
>>> ---
>>>  arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 12 ++++++------
>>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
>>> index d6a143abae5f..cef24aafed1a 100644
>>> --- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
>>> +++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
>>> @@ -200,7 +200,7 @@ SYSC_OMAP2_SOFTRESET |
>>>                       ranges = <0x0 0x9000 0x1000>;
>>>
>>>                       uart0: serial@0 {
>>> -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
>>> +                             compatible = "ti,am3352-uart";
>>>                               clock-frequency = <48000000>;
>>>                               reg = <0x0 0x1000>;
>>>                               interrupts = <72>;
>>> @@ -1108,7 +1108,7 @@ SYSC_OMAP2_SOFTRESET |
>>>                       ranges = <0x0 0x22000 0x1000>;
>>>
>>>                       uart1: serial@0 {
>>> -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
>>> +                             compatible = "ti,am3352-uart";
>>>                               clock-frequency = <48000000>;
>>>                               reg = <0x0 0x1000>;
>>>                               interrupts = <73>;
>>> @@ -1139,7 +1139,7 @@ SYSC_OMAP2_SOFTRESET |
>>>                       ranges = <0x0 0x24000 0x1000>;
>>>
>>>                       uart2: serial@0 {
>>> -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
>>> +                             compatible = "ti,am3352-uart";
>>>                               clock-frequency = <48000000>;
>>>                               reg = <0x0 0x1000>;
>>>                               interrupts = <74>;
>>> @@ -1770,7 +1770,7 @@ SYSC_OMAP2_SOFTRESET |
>>>                       ranges = <0x0 0xa6000 0x1000>;
>>>
>>>                       uart3: serial@0 {
>>> -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
>>> +                             compatible = "ti,am3352-uart";
>>>                               clock-frequency = <48000000>;
>>>                               reg = <0x0 0x1000>;
>>>                               interrupts = <44>;
>>> @@ -1799,7 +1799,7 @@ SYSC_OMAP2_SOFTRESET |
>>>                       ranges = <0x0 0xa8000 0x1000>;
>>>
>>>                       uart4: serial@0 {
>>> -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
>>> +                             compatible = "ti,am3352-uart";
>>>                               clock-frequency = <48000000>;
>>>                               reg = <0x0 0x1000>;
>>>                               interrupts = <45>;
>>> @@ -1828,7 +1828,7 @@ SYSC_OMAP2_SOFTRESET |
>>>                       ranges = <0x0 0xaa000 0x1000>;
>>>
>>>                       uart5: serial@0 {
>>> -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
>>> +                             compatible = "ti,am3352-uart";
>>>                               clock-frequency = <48000000>;
>>>                               reg = <0x0 0x1000>;
>>>                               interrupts = <46>;
>>>
>>> base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
>>
>>
>> --
>> Pengutronix e.K.                           |                             |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


