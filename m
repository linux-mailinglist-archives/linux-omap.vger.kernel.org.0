Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4AE8A3371
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2019 11:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbfH3JLw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 05:11:52 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55610 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfH3JLw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Aug 2019 05:11:52 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7U9BfWW059779;
        Fri, 30 Aug 2019 04:11:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567156301;
        bh=OtXMxri5W+7xhTSgK5b0Vzq5/gd7fFmm+bEt3fupLqQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=zTgmDV9Q/NldjyKWuoRTvZrdi6fxNNypfUAREAEOZSpsqq8kASInGw5+G4zcJtcV+
         vmNse6XPBX6pHNLjx9vu3IBbakbqqGTWoRAzOcfUmv2ccUIxwqCkI1oSHUuxuufH5g
         /Igos2qRNF2R4hA9qwujZEZLOpV5lvsVHDnhHaN0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7U9BfY1052178
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Aug 2019 04:11:41 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 04:11:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 04:11:41 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7U9Bcdv120663;
        Fri, 30 Aug 2019 04:11:39 -0500
Subject: Re: [PATCHv2 02/11] soc: ti: add initial PRM driver with reset
 control support
To:     Philipp Zabel <p.zabel@pengutronix.de>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
References: <20190828071941.32378-1-t-kristo@ti.com>
 <20190828071941.32378-3-t-kristo@ti.com>
 <1567084339.5345.7.camel@pengutronix.de>
 <049da607-c352-4ed1-9a2d-2374d7a7e372@ti.com>
 <1567155748.3714.1.camel@pengutronix.de>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <11b891ea-7f5c-40fa-89b6-7e5b924cfb99@ti.com>
Date:   Fri, 30 Aug 2019 12:11:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567155748.3714.1.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/08/2019 12:02, Philipp Zabel wrote:
> Hi Tero,
> 
> On Fri, 2019-08-30 at 10:28 +0300, Tero Kristo wrote:
>> On 29/08/2019 16:12, Philipp Zabel wrote:
> [...]
>>> I wonder if splitting rstctrl/rstst/rstmap out into a separate structure
>>> would make sense. That could be linked from omap_reset_data directly.
>>> That only makes sense if there'd be enough cases where it can be reused
>>> for multiple PRMs instances.
>>
>> Hmm, splitting these out would make it possible to share the bits for
>> ipu:s across devices, same for dsp:s and eve:s.
>>
>> However, adding too many levels of abstraction makes it kind of
>> difficult to follow what is happening with the code, and it would only
>> save maybe ~100 bytes of memory at the moment.
> 
> Good point, that is likely not worth the additional complexity.
> 
> [...]
>>> What does the value read from the rstst register indicate? Is it the
>>> current state of the reset line? Is it 0 until deassertion is completed,
>>> and then it turns to 1?
>>
>> Value of 1 indicates that the corresponding IP has been reset
>> successfully. Writing back 1 to the same bit clears it out, so the
>> status can be polled later on.
> 
> Then this should not be returned directly by reset_control_status:
> 
> /**
>   * reset_control_status - returns a negative errno if not supported, a
>   * positive value if the reset line is asserted, or zero if the reset
>   * line is not asserted or if the desc is NULL (optional reset).
>   */
> 
> This should return 0 only if the control bit is deasserted and the
> status bit is already set.
> 
> If either the control bit is asserted, or if the status bit is still
> cleared, this should return 1.

Hmm ok, let me fix that a bit also.

> 
> [...]
>>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>> +	if (!res)
>>>> +		return -ENODEV;
>>>
>>> This can be merged with devm_ioremap_resource below.
>>
>> Well, I actually use the "res" later on to map the DT node to the
>> corresponding prm_data based on address.
> 
> Ok. I glanced over the data->base loop below after questioning whether
> it is needed at all.
> 
>>>
>>>> +	match = of_match_device(omap_prm_id_table, &pdev->dev);
>>>> +	if (!match)
>>>> +		return -ENOTSUPP;
>>>> +
>>>> +	prm = devm_kzalloc(&pdev->dev, sizeof(*prm), GFP_KERNEL);
>>>> +	if (!prm)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	data = match->data;
>>>> +
>>>> +	while (data->base != res->start) {
>>>> +		if (!data->base)
>>>> +			return -EINVAL;
>>>> +		data++;
>>>> +	}
>>>
>>> Is this not something that you want to have encoded in the compatible
>>> string? They all have a different register layout.
>>
>> With the addition of all the prm instances later on, this changes. Most
>> of the prm instances will have same register layout then. See v1 data
>> that was posted earlier [1], but which I dropped for now to keep this
>> series isolated for reset handling only. In this patch, you see that for
>> DRA7, all the power domain handling related PRM instances have identical
>> register layout, they just differ based on base address.
>>
>> [1] https://www.spinics.net/lists/linux-omap/msg149872.html
>>
>> It would be possible to encode all of this based on different
>> compatibles, but then the amount of different compatible strings would
>> explode... DRA7 is just one SoC.
> 
> I see only 3 different layouts in that patch. All instances with
> identical layout could share the same compatible.
> 
> Either way, that is DT bindings territory, and not for me to decide. I
> just found it unusual to encode the device type by its base address in
> the driver.

I'll try to poke Rob for comment on that on the bindings patch.

> 
>>>
>>>> +
>>>> +	prm->data = data;
>>>> +
>>>> +	prm->base = devm_ioremap_resource(&pdev->dev, res);
>>>
>>> 	prm->base = devm_platform_ioremap_resource(pdev, 0);
>>
>> I still need the "res" pointer as indicated above.
> 
> Got it. If the lookup by base address is needed, this has to stay split.

Ok thanks for the reviews, much appreciated. I'll see if I can get reply 
from Rob on the binding item, otherwise I might just send v2 with the 
existing bindings out and send a v3 with updated bindings if necessary.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
