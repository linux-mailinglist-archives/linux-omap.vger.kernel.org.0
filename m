Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 380619DD5E
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 07:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbfH0F5V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 01:57:21 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60472 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfH0F5V (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 01:57:21 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R5vHUX086686;
        Tue, 27 Aug 2019 00:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566885437;
        bh=Ph3+W7BZUY9kT74tOsS+qeS2WWgajfa4Dtl0zioATD0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GF8GHOGzrO9BjSnV6G5cI9mZJQ5ZoFKuRC6289FRoROvbDb4EH5kC8+xYN1QrZz7y
         Q8PUkcODh8xRDo3WgjfC5EolUp0zbzp24zI9CyWFbsC4r6MKlf3pE/PAgvFW4suZGy
         f2HGTS4v9vztA/a5zAxb1um1IriZjjCZ8P8TsmH8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R5vHL8047771
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 27 Aug 2019 00:57:17 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 00:57:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 00:57:16 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R5vEc8063165;
        Tue, 27 Aug 2019 00:57:15 -0500
Subject: Re: [PATCH 3/3] clk: ti: dra7xx: add timer_sys_ck clock alias
To:     Suman Anna <s-anna@ti.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "tony@atomide.com" <tony@atomide.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
 <1565183079-27798-4-git-send-email-t-kristo@ti.com>
 <9d0edab4-cae2-50d5-2df9-42c879f2623f@ti.com>
 <b1005a98-e098-f651-d70e-c519fd740540@ti.com>
 <12f0fa92-f6e1-0e71-09da-78722f040966@ti.com>
 <78fe85dc-6349-1cd7-e0fb-b0ccd6a81ad8@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <c2e7b2ce-7d52-415f-e867-4af509cc3286@ti.com>
Date:   Tue, 27 Aug 2019 08:57:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <78fe85dc-6349-1cd7-e0fb-b0ccd6a81ad8@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27.8.2019 1.26, Suman Anna wrote:
> Hi Tero,
> 
> On 8/23/19 1:16 PM, Tero Kristo wrote:
>>>>
>>>> On 8/7/19 8:04 AM, Tero Kristo wrote:
>>>>> This is needed by the TI DM timer driver.
>>>>
>>>> Again can do with some better patch descriptions. Similar to the
>>>> previous patch, missing the equivalent patches for OMAP4 and OMAP5.
>>>> You can use my downstream patches for these - [1][2][3] that has all the
>>>> needed Fixes by details. Only difference is that you used a single line
>>>> change on DRA7, and this should suffice since all the sources are same,
>>>> but OMAP4 and OMAP5 needed different ones.
>>>>
>>>> [1] OMAP4:
>>>> http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=9d45dc42fbed8395d733366dbf6c0fd5ec171e2f
>>>>
>>>> [2] OMAP5:
>>>> http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=34f4682a91173386307b310d7f4955d46dcaaea2
>>>>
>>>> [3] DRA7:
>>>> http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=2a662694437ae7192b5ef759ec40abe796d2a058
>>>>
>>>>
>>>> Technically, this data need to be added back for all OMAP2+ SoCs which
>>>> support dmtimer with any other drivers wanting to use the timers.
>>>
>>> So, I checked and these aliases already are defined on OMAP2, OMAP3,
>>> AM33xx, AM43xx, DM814x and DM816x SoCs. So, just include the OMAP4 and
>>> OMAP5 ones along with the DRA7x one.
>>
>> Actually, all these alias definitions can be completely removed, and can
>> be replaced with DT data. Here's sample how it can be done for dra7xx
>> timer11:
>>
>> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi
>> b/arch/arm/boot/dts/dra7-l4.dtsi
>> index bed67603c186..fafa0a131af0 100644
>> --- a/arch/arm/boot/dts/dra7-l4.dtsi
>> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
>> @@ -1910,8 +1910,8 @@
>>                          timer11: timer@0 {
>>                                  compatible = "ti,omap5430-timer";
>>                                  reg = <0x0 0x80>;
>> -                               clocks = <&l4per_clkctrl
>> DRA7_L4PER_TIMER11_CLKCTRL 24>;
>> -                               clock-names = "fck";
>> +                               clocks = <&l4per_clkctrl
>> DRA7_L4PER_TIMER11_CLKCTRL 24>, <&timer_sys_clk_div>;
>> +                               clock-names = "fck", "timer_sys_ck";
>>                                  interrupts = <GIC_SPI 42
>> IRQ_TYPE_LEVEL_HIGH>;
>>                          };
>>                  };
>>
>> I will post these changes along with other DTS patches once the time is
>> right. For now, I will just drop these aliases completely.
> 
> I am not sure if this is gonna buy us anything and if it is scalable.
> The added clock is neither a functional clock nor an optional clock of
> the timer device, but is just a name to use to set the clock parent. Are
> you going to add the aliases from clk-<soc>.h to all the device nodes?
> DRA7 dmtimers can actually be parented from one of 13 clocks (driver was
> never updated to support those).

No, adding all of these has no point.

> 
> Given that the dmtimers can only be requested using phandle on DT boots,
> it is possible to eliminate the naming and rely on
> assigned-clock-parents in either the dmtimer nodes or the client nodes
> (provided all the clock parents are listed in dts), and eliminate this
> set_source logic.

Either way works, however the alias mechanism provided inside the TI 
clock driver was meant to be temporary only when it was introduced a few 
years back... Any clock handles needed by drivers should be provided via DT.

If you need re-parenting of things, using assigned-clocks would be ideal.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
