Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E7C40F2FA
	for <lists+linux-omap@lfdr.de>; Fri, 17 Sep 2021 09:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238763AbhIQHSh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Sep 2021 03:18:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:55958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238726AbhIQHSh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Sep 2021 03:18:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 512AE61152;
        Fri, 17 Sep 2021 07:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631863035;
        bh=ja8+tLdTmXfno2EXHr51WCR4GUxc76U00kgVCyJ/NGo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=M4ewBQPtOqclfz0Ur4bXuvZKTjWgHGjINFiOawT7DeG8XrFKcauPh5bd7a9DXG/3N
         VD3oPf2BhVIcMKZ6QKsNO8wZTcWOqMEtvd6MRFK9aNK6EqzM0mnMlxuLb1D9Q4sgSY
         Iz/Pma94UcjIpkwjJ5BOumdpzaMBRwyXqOCaKIosCvsNhJqio5gxSKaQVTImdvReMi
         TEWuOMlom04nNjWa3Yw7vARiih+dcMvuHShiv5xMCjjoyhRzLyoysS+Zli9Gu2JwiE
         y4AiuolYY/i6UTP4mRGd56UFiXpoLys3x1OIbCQ1UZabOOIPJOd/ASxUtKc5OhqzQ4
         /pPszyUB5KTLw==
Subject: Re: [PATCH v3 8/8] memory: gpmc-omap: "gpmc,device-width" DT property
 is optional
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210907113226.31876-1-rogerq@kernel.org>
 <20210907113226.31876-9-rogerq@kernel.org>
 <aa465bd9-b3d5-8d75-3e59-e86c2cd093cd@canonical.com>
 <a881ac1f-2f00-e675-aea6-154b28ca6eff@kernel.org>
 <35643319-e3b0-bde1-c51b-57c3b5474146@canonical.com>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <d574837c-b42a-53be-7885-9feb7183ce96@kernel.org>
Date:   Fri, 17 Sep 2021 10:17:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <35643319-e3b0-bde1-c51b-57c3b5474146@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


On 16/09/2021 13:48, Krzysztof Kozlowski wrote:
> On 15/09/2021 11:11, Roger Quadros wrote:
>> Hi Krzysztof,
>>
>> On 07/09/2021 15:36, Krzysztof Kozlowski wrote:
>>> On 07/09/2021 13:32, Roger Quadros wrote:
>>>> Check for valid gpmc,device-width, nand-bus-width and bank-width
>>>> at one place. Default to 8-bit width if none present.
>>>
>>> I don't understand the message in the context of the patch. The title
>>> says one property is optional - that's it. The message says you
>>> consolidate checks. How is this related to the title?
>>>
>>> The patch itself moves around checking of properties and reads
>>> nand-bus-width *always*. It does not "check at one place" but rather
>>> "check always". In the same time, the patch does not remove
>>> gpmc,device-width check in other place.
>>>
>>> All three elements - the title, message and patch - do different things.
>>> What did you want to achieve here? Can you help in clarifying it?
>>>
>>
>> OK I will explain it better in commit log in next revision. Let me explain here a bit.
>>
>> Prior to this patch it was working like this
>>
>> 	/* in gpmc_read_settings_dt() */
>> 	s->device_width = 0;	/* invalid width, should be 1 for 8-bit, 2 for 16-bit */
>> 	of_property_read_u32(np, "gpmc,device-width", s->device_width);
>>
>> 	/* in gpmc_probe_generic_child () */
>> 	if (of_device_is_compatible(child, "ti,omap2-nand")) {
>> 		/* check for nand-bus-width, if absent set s->device_width to 1 (i.e. 8-bit) */
>> 	} else {
>> 		/* check for bank-width, if absent and s->device_width not set, error out */
>> 	}
>>
>> So that means if all three, "gpmc,device-width". "nand-bus-width" and "bank-width" are missing then
>> it would create an error situation.
>>
>> The patch is doing 3 things.
>> 1) Make sure all DT checks related to bus width are being done at one place for better readability.
> 
> Not entirely. The gpmc,device-width is still done in the other place
> because you did not remove it from the code. Unless you meant parsing of
> gpmc,device-width not reading from DT? But then another round of checks
> is in gpmc_cs_program_settings() so not in one place.

By checking I meant parsing. But you are right, I missed the part in gpmc_cs_program_settings().

> 
> If you consolidate the checks to one place, I would expect the code to
> be removed from other places, so from gpmc_cs_program_settings() and
> gpmc_read_settings_dt(). Since this is not happening, the message
> confuses me.
> 
>> 2) even if all 3 width properties are absent, we will not treat it as error and default to 8-bit.
> 
> This is not mentioned in commit msg.
> 
>> 3) check for nand-bus-width regardless of whether compatible to "ti,omap2-nand" or not.
> 
> Also not mentioned in commit msg.
> 
> Your commit reorganizes parsing and validating the child DT properties
> but it does not change from "multiple place" to "one place".
> 
> At least I don't see it.

OK. I will write a better commit log next time. Thanks for the review :)

cheers,
-roger
