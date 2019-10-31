Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0899FEB220
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2019 15:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbfJaOHG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Oct 2019 10:07:06 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35734 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbfJaOHG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Oct 2019 10:07:06 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9VE721j018372;
        Thu, 31 Oct 2019 09:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572530822;
        bh=gXlDD/veFRApipmYmd4pB/kMLt9HDcd6FQb3Up3HhD8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Lqpd/6vevC3PHl2R41apuC5tes6oO9pb6lTXLMH/IQI8Rmxhi17UYVsXTEzv8JZuh
         OuTph8htEQ0X1glpsRb8c5l2aYwl5xwqE8xt6r7B4klGqnQb3qFo+nzsL5S9LAVOq6
         dMsCtCkRotsrhtWfDyOyHyzhzTi59HI1ablT/o24=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9VE71ZG034519
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 31 Oct 2019 09:07:02 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 31
 Oct 2019 09:06:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 31 Oct 2019 09:06:49 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9VE6x5I089523;
        Thu, 31 Oct 2019 09:07:00 -0500
Subject: Re: [Patch 1/3] ARM: dts: am43xx: add support for clkout1 clock
To:     Benoit Parrot <bparrot@ti.com>, Tony Lindgren <tony@atomide.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191016184954.14048-1-bparrot@ti.com>
 <20191016184954.14048-2-bparrot@ti.com> <20191022154816.GO5610@atomide.com>
 <20191022162134.fpawonjdjvd5kxza@ti.com>
 <586dcabb-0400-50d6-5488-16bddc059286@ti.com>
 <20191022165516.GE5610@atomide.com> <20191023155657.GL5610@atomide.com>
 <20191030195946.ouexmis632nb7lqj@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <39b79438-ad82-0840-b2a5-36856d0ac520@ti.com>
Date:   Thu, 31 Oct 2019 16:06:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030195946.ouexmis632nb7lqj@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/10/2019 21:59, Benoit Parrot wrote:
> Tony Lindgren <tony@atomide.com> wrote on Wed [2019-Oct-23 08:56:57 -0700]:
>> * Tony Lindgren <tony@atomide.com> [191022 16:56]:
>>> * Tero Kristo <t-kristo@ti.com> [191022 16:48]:
>>>> On 22/10/2019 19:21, Benoit Parrot wrote:
>>>>> Tony Lindgren <tony@atomide.com> wrote on Tue [2019-Oct-22 08:48:16 -0700]:
>>>>>> * Benoit Parrot <bparrot@ti.com> [191016 18:47]:
>>>>>>> --- a/arch/arm/boot/dts/am43xx-clocks.dtsi
>>>>>>> +++ b/arch/arm/boot/dts/am43xx-clocks.dtsi
>>>>>>> @@ -704,6 +704,60 @@
>>>>>>>    		ti,bit-shift = <8>;
>>>>>>>    		reg = <0x2a48>;
>>>>>>>    	};
>>>>>>> +
>>>>>>> +	clkout1_osc_div_ck: clkout1_osc_div_ck {
>>>>>>> +		#clock-cells = <0>;
>>>>>>> +		compatible = "ti,divider-clock";
>>>>>>> +		clocks = <&sys_clkin_ck>;
>>>>>>> +		ti,bit-shift = <20>;
>>>>>>> +		ti,max-div = <4>;
>>>>>>> +		reg = <0x4100>;
>>>>>>> +	};
>>>>>>
>>>>>> Here too please describe why the clock names are not generic.
>>>>>
>>>>> Tero originally had this patch in the kernel so this is somewhat of a
>>>>> revert. Since these "clock" were removed. If the name syntax is no longer
>>>>> valid for some reason, then I will need a little more informations to
>>>>> proceed.
>>>>>
>>>>> Tero, can you assist here?
>>>>
>>>> This one is just following the naming convention of the rest of the clocks
>>>> atm.
>>>>
>>>> If we need to fix all the underscore name clocks, that requires pretty much
>>>> complete revamp of both the dts data + clock data under the clock driver,
>>>> and it is not backwards compatible either. How should we tackle that one?
>>>>
>>>> We could maybe add support code in kernel to do s/-/_/g for the "new" clocks
>>>> so that their parent-child relationships would be retained, and then convert
>>>> the clocks in phases.
>>>
>>> Well some of them can be fixed by configuring things based
>>> on the compatible value and then the node name can be just
>>> clock like it should be.
>>>
>>> Here too one option would be to add custom compatibles like:
>>>
>>> compatible = "ti,clkout1-osc-div", "ti,divider-clock";
>>>
>>> And then have match data configure the rest.
>>>
>>> The other option would be to have lookup tables in the clock
>>> driver based on the SoC and reg address.
>>>
>>> This is a hidden mine though.. We've hit it already several times,
>>> and any dts clean-up effort has a chance of breaking things.
>>
>> Hmm maybe in this case just doing this is enough:
>>
>> clkout1_osc_div_ck: clock@4100 {
>> 	...
>> }
> 
> But then we would end up with 6 clock node with the same name "clock@4100",
> doesn't pose a problem somewhere?

Yeah, clk core would not know which one to use then.

> 
> Tero?
> 
> Benoit
> 
>>
>> Or do all the TI clocks we have have a dependency to the
>> node naming?

This is a feature of clock core. Clock parents need to have distinct 
names, otherwise it won't work.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
