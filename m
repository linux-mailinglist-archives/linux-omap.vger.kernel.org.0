Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29756140C39
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jan 2020 15:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgAQOQF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Jan 2020 09:16:05 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56638 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgAQOQE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Jan 2020 09:16:04 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00HEG19M015368;
        Fri, 17 Jan 2020 08:16:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579270561;
        bh=19u9Xw6BWk5rmFuzu35uo/8szOm4shzG97TLnJNpWUA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Pt6oV5Oe7HGCOpI2ZubTlMb3Va/OanaLMgY2A4PsJNSv2oSsudiFTnH7uUHTzfjFi
         2cAgIcAZ4e0xDiqdIJMWSkMUih1R+oIPrEJ8s4AaTSJnDOAX/Mk2YnbGKpR4zsXw/W
         XHF4kYsg9p5CP7Mk2Ec9CfdpUPKi5lGsDb1obetw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00HEG1aY085701
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Jan 2020 08:16:01 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Jan 2020 08:16:00 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Jan 2020 08:16:00 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00HEFvIN024800;
        Fri, 17 Jan 2020 08:15:58 -0600
Subject: Re: [Patch v3 0/3] ARM: dts: am43x-vpfe/ov2659.patch
To:     Tony Lindgren <tony@atomide.com>, Benoit Parrot <bparrot@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191211140720.10539-1-bparrot@ti.com>
 <20191212174123.GF35479@atomide.com>
 <c4ae58dc-3c81-f493-a665-6926baa0f04c@ti.com>
 <20191213152938.GK35479@atomide.com> <20200113165413.i6nbi2i7xyue4fti@ti.com>
 <20200114160422.GQ5885@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <e72f8de3-fd30-a216-8e6e-934a05259ed6@ti.com>
Date:   Fri, 17 Jan 2020 16:15:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114160422.GQ5885@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 14/01/2020 18:04, Tony Lindgren wrote:
> * Benoit Parrot <bparrot@ti.com> [200113 16:51]:
>> Tony Lindgren <tony@atomide.com> wrote on Fri [2019-Dec-13 07:29:38 -0800]:
>>> * Tero Kristo <t-kristo@ti.com> [191213 07:43]:
>>>> On 12/12/2019 19:41, Tony Lindgren wrote:
>>>>> * Benoit Parrot <bparrot@ti.com> [191211 06:04]:
>>>>>> This patch series adds the missing camera endpoint (ov2659) as well as
>>>>>> the required source clocks nodes for the sensor.
>>>>>>
>>>>>> On the am437x-sk-evm the camera sensor is sourced from clkout1 but that
>>>>>> clock nodes/tree was removed as it was unsed at the time, we are
>>>>>> re-adding the needed clock nodes here.
>>>>>
>>>>> Tero, it seems I can already pick this series?
>>>>
>>>> I believe it is ready if you approve the clkout1 clock patch.
>>>
>>> OK yeah looks fine.
>>>
>>>>> Or ou want to queue the changes to am43xx-clocks.dtsi along with all
>>>>> your other clock patches?
>>>>
>>>> Well, I have actually never queued any omap2+ dts patches myself, and I
>>>> don't think there would be too many of those coming for next merge either.
>>>
>>> OK will queue this series then. For the other ones from Benoit
>>> looks like we need an immutable clock branch before I can apply
>>> anything.
>>
>> Tony, Tero,
>>
>> Are these merged anyware now?
>> I still don't see any of these on linux-next?
> 
> Tero any news on getting some immutable clock changes branch done?
> Looks like there are quite a few pending clock patches right now,
> probably best to set them all into a branch that I can also merge
> in.

Working on that now, have been forced to prioritize work lately. I can 
probably get the branch set-up on Monday and send a pull-req out 
assuming it is not too late for 5.6 already.

-Tero

> 
>> And by "these" I mean this one and both
>>   ARM: dts: dra7: add vpe nodes
>>   ARM: dts: dra7: add cal nodes
> 
> Yeah looks good to me other than the clock dependency.
> 
> Regards,
> 
> Tony
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
