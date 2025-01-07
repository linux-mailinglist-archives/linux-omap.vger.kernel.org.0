Return-Path: <linux-omap+bounces-3014-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48938A03F3F
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 13:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55E901886ED3
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 12:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF1928E37;
	Tue,  7 Jan 2025 12:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sIGxY6+C"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A3922612;
	Tue,  7 Jan 2025 12:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736253240; cv=none; b=f/0/VMNO2MqvwiovKgSU0DHZBqwJVDMzYAk+zmOtLE6lrvWUszETNIGEFtNgJlLfpcI0tL670+t5QpXBT6IAwj5uXyHdE5oqH5UZ7O9XltjHw0UtJAh7PsGpA/2sbxKCy4GcQQGT3vcuBlPdrNWqKAc1gfpb7nzce4Ml7/eL8k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736253240; c=relaxed/simple;
	bh=HIQ6c6qfRvziQSfwzBzxaTbD8VlHnhlibiO7BADeb/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s8XOp7C34veZDzDGI6w/OvfV2pJ2ILwK/ZApa9+vU0JkDgBWLRejvEF0a0M56rXn9JUiBYO9YL3w3wmXulhDMl50xGYgT1+rkrQzmL4DgsEO39HtvCGgn/qXUgxPY5CpCel2Cc3Dn5kPFoI098AJCZOoaV5HE6VxNUGV9YhnbTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sIGxY6+C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6E4C4CED6;
	Tue,  7 Jan 2025 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736253240;
	bh=HIQ6c6qfRvziQSfwzBzxaTbD8VlHnhlibiO7BADeb/k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sIGxY6+CenUYM72MHwPzsD6FYAMl6nnu9WfTYDIr6znpumgJcIiNxy176czvRo9I0
	 W8Q33pBN0MEoRmjFrpg1jMH1bTZK3+1L+2L0ZjoXB/AgH1//JPsZhE/Ebci8I3FfsP
	 876u+UaWZ0TipoX4niHfhegpHCvaUpdJL4QqtO9tGh3uxa+kbGqXEP1CbI5POxTt+N
	 FfcqR3Av9MLEJ+JumAdu3U/348VgFf29jVZi7ojaZWNflIBAFjLOMsGhJcp6SXxA+u
	 vLp2r2eXQYwaL2J5wb5DrxzYrszW1/m+9wb62AvESj1rxT4M8clzdUakFr3wiqJR7J
	 XZT9af6VV1ECw==
Message-ID: <4e2312b8-78d2-4dec-9911-8fd513eeef25@kernel.org>
Date: Tue, 7 Jan 2025 14:33:55 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: omap4: panda: cleanup bluetooth
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Tony Lindgren <tony@atomide.com>
References: <20241229230125.85787-1-andreas@kemnade.info>
 <20241229230125.85787-3-andreas@kemnade.info>
 <64d14e8f-a1d5-4e04-afa7-c129cee29dc2@kernel.org>
 <20250104194158.06449a3e@akair>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250104194158.06449a3e@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/01/2025 20:41, Andreas Kemnade wrote:
> Hello Roger,
> 
> Am Sat, 4 Jan 2025 19:29:44 +0200
> schrieb Roger Quadros <rogerq@kernel.org>:
> 
>> Hello Andreas,
>>
>> On 30/12/2024 01:01, Andreas Kemnade wrote:
>>> Bluetooth is available on the other Panda board versions, too, so move
>>> stuff to common and specify the needed clock properly.
>>>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>> ---
>>>  .../boot/dts/ti/omap/omap4-panda-common.dtsi  | 30 +++++++++++++++--
>>>  arch/arm/boot/dts/ti/omap/omap4-panda-es.dts  | 32 -------------------
>>>  2 files changed, 28 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
>>> index c860b590142a..c048ab9af053 100644
>>> --- a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
>>> +++ b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
>>> @@ -368,9 +368,7 @@ OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
>>>  	wl12xx_gpio: wl12xx-gpio-pins {
>>>  		pinctrl-single,pins = <
>>>  			OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 */  
>>
>> We could add function name in comment? e.g. /* gpmc_a19.gpio_43 - WLAN_EN */
>>
> This is about existing code, there is still a lot of room to cleanup
> other stuff. 
> 
>>> -			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 */
>>>  			OMAP4_IOPAD(0x070, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a24.gpio_48 */  
>>
>> This one is FM_EN and has nothing to do with WLAN.
>>
> same here.
>>> -			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a25.gpio_49 */  
>>>  		>;  
>>>  	};
>>>  
>>> @@ -393,6 +391,22 @@ button_pins: button-pins {
>>>  			OMAP4_IOPAD(0x114, PIN_INPUT_PULLUP | MUX_MODE3)	/* gpio_121 */  
>>>  		>;  
>>>  	};
>>> +
>>> +	bt_pins: bt-pins {
>>> +		pinctrl-single,pins = <
>>> +			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)	  /* BTEN */
>>> +			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3) /* BTWAKEUP */  
>>
>> Could we please use comment style <pin name>.<pinmux name> - Function
>> 			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 - BTEN */
>> 			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a25.gpio_49 - BTWAKEUP */
>>
> I was a bit lazy with checkpatch.pl. Your proposal generates a lot of
> noise there, so I was too lazy to filter that noise, so I disabled that
> noise. I had it first that way.

What noise? line length exceeded warnings? Those are harmless.
I'd prefer not to loose the pinmux/function information in the comment.

-- 
cheers,
-roger


