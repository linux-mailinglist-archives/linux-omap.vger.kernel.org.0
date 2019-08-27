Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4899F1CE
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 19:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbfH0Rmv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 13:42:51 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56816 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbfH0Rmv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 13:42:51 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7RHgcxG035070;
        Tue, 27 Aug 2019 12:42:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566927758;
        bh=1nAeT6kKD6cMhV8AFSrTi5MHy7Xj/oA5+AZB7jmrcBU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=cSPiG7DVW1mRiZhgvKhmx5huNWktnSrr6lqeuuvuTjayPC1bY9E1W2JwHSoiU6Smc
         x9S4WELOk9wwFozzS2m5OBKsUNQt/vswKGvVMCnIQcC5o+NBHEAsfU9yt7HTg/aufA
         C7oNPKpfo4Hrmm+pbklh+0HG12oA5JqCPPkd9So0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7RHgceL114822
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 27 Aug 2019 12:42:38 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 12:42:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 12:42:38 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7RHgaWK068248;
        Tue, 27 Aug 2019 12:42:36 -0500
Subject: Re: OMAP3 ROM RNG probe failure on N900
To:     Adam Ford <aford173@gmail.com>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
CC:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
References: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
 <7d195797-085e-3bcc-933e-dca71dc12364@ti.com>
 <20190827081120.6lvtmqrdh2un7kit@pali>
 <CAHCN7xLqbQ80+AO1Q5PoYyHpdjCTMBYTXzG=HBb5W838dXavjQ@mail.gmail.com>
 <20190827132419.wgcn36557zlwjmah@pali>
 <CAHCN7xKhEksEwvs0pL3P0HTbOef=1s-G9B9dBUUw4O4NagGx4A@mail.gmail.com>
 <20190827134905.5mc5b3rxpmojp3ay@pali>
 <CAHCN7x+te3JWGNr440fLsU0fVnaLJY9_cdG_Keo8rPCzXNuODg@mail.gmail.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <1f59d161-cb02-8aa4-269c-0ce3a26707fe@ti.com>
Date:   Tue, 27 Aug 2019 20:42:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7x+te3JWGNr440fLsU0fVnaLJY9_cdG_Keo8rPCzXNuODg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/08/2019 16:54, Adam Ford wrote:
> On Tue, Aug 27, 2019 at 8:49 AM Pali Rohár <pali.rohar@gmail.com> wrote:
>>
>> On Tuesday 27 August 2019 08:34:33 Adam Ford wrote:
>>> On Tue, Aug 27, 2019 at 8:24 AM Pali Rohár <pali.rohar@gmail.com> wrote:
>>>>
>>>> On Tuesday 27 August 2019 08:17:55 Adam Ford wrote:
>>>>> On Tue, Aug 27, 2019 at 3:12 AM Pali Rohár <pali.rohar@gmail.com> wrote:
>>>>>>
>>>>>> On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
>>>>>>> On 24.8.2019 0.46, Aaro Koskinen wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> I was looking at N900 boot logs from the current mainline (v5.3-rc),
>>>>>>>> and noticed this:
>>>>>>>>
>>>>>>>> [    3.297668] omap3_rom_rng: initializing
>>>>>>>> [    3.301940] omap3_rom_rng: unable to get RNG clock
>>>>>>>> [    3.307006] omap3-rom-rng: probe of omap3-rom-rng failed with error -2
>>>>>>>>
>>>>>>>> It seems some clock data was deleted with 0ed266d7ae5e ("clk: ti: omap3:
>>>>>>>> cleanup unnecessary clock aliases"), including one for omap3-rom-rng.
>>>>>>>> How this driver is supposed to work now? I guess it has been broken for
>>>>>>>> a while. :-(
>>>>>>>
>>>>>>> You should have a DT node for the device, which contains the clock handle.
>>>>>
>>>>> I am interested in enabling the RNG too, because sshd takes a long
>>>>> time to initialize without the hwrng.
>>>>>
>>>>> I am not able to find addresses in either the DM3730 TRM nor the
>>>>> OMAP3530 TRM.  Can someone from TI make a recommendation as to what
>>>>> the node address should be?  Having this would be a nice starting
>>>>> point.  Also looking at the other omap RNG nodes there are references
>>>>> to hwmods, but looking at the platdata in pdata quirks, I am not
>>>>> seeing anything.
>>>>>
>>>>> There is also chunks of code that exist insdie
>>>>> arch/mach-omap2/omap-secure.c which appear to only be referenced from
>>>>> this driver, so I wonder if there might be some way to
>>>>> combine/condense this once it's been converted to device tree and
>>>>> functional again.
>>>>
>>>> This part of code calls N900's PPA function via SMC instruction, which
>>>> is provided by closed Nokia bootloader NOLO/X-Loader. So it is needed.
>>>
>>> I am arguing that there is open source code for OMAP2 and OMAP4 RNG, I
>>> don't understand why we can't have support for everyone.  The TRM
>>> references the RNG, but it doesn't give much info.  There are other
>>> RNG's supported in the open source so I would think if the IP is
>>> present in the chips, we should be able to use it without a custom
>>> bootloader.
>>
>> I do not know about general solution for OMAP3.
>>
>> But Nokia N900 is HS device, has signed and closed bootloader (Nokia
>> X-Loader) which is running in secure mode and it does not enable L3
>> firewall (or how it is called in OMAP world) for accessing RNG blocks
>> outside of secure mode. It just export PPA function which "other side"
>> can use to get access to RNG.
>>
>> Accessing blocks which are not allowed by that firewall cause immediate
>> reset of board. So kernel must avoid such things.
>>
>> So for OMAP3 HS devices, like N900, we need signed bootloader which
>> either enable direct access to RNG (which we do not have) or bootloader
>> which provide custom PPA call for RNG (which we have).
>>
>> Exactly same problem is with AES acceleration on N900. See for details:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=69540a7c277d96382257216436f41abc040cc878
> 
> I have an OMAP3 and I am able to access the AES and SHA acceleration
> using the cryptodev instructions following:
> http://processors.wiki.ti.com/index.php/AM335x_Crypto_Performance
> 
> I am able to load the SHA and AES modules without signed bootloaders.
> 
>>
>> Later I played a bit with that L3 firewall and reading its configuration
>> is also disabled. After trying to read it 3 or 4 times from userspace I
>> got immediate reset of board. I was told that this is normal (firewall
>> violation) and reset is there for security reasons.
> 
> If you're using secure world, I would expect this behaviour, but I am
> just not seeing why access to the HWRNG would be limited to secure
> world when I can use HWRNG for other processors families without it.
> 
>>
>> Public GP TRM does not provide information because RNG is part of crypto
>> IP and it is for HS devices. And IIRC TRM for HS devices is (or was)
>> available only under NDA and only for licensed customers.
> 
> I agree, yet the omap2 and omap4 rng have open source code. I wonder
> how different the omap3 version is from the omap2.
> 
>>
>> Somebody from TI should really provide up-to-date information about this
>> topic. All those information are from time when I played with AES which
>> is from year 2014.
> 
> I could not agree more.

Delving on the topic of NDA chip features is dangerous area for TI 
people... as we might be violating NDA ourselves and get into trouble 
for it.

I would prefer someone outside TI reverse engineers the support somehow 
against omap2/omap4, and sees what works out. AM35x public TRM might 
have some info on it, that chip is basically a copy of omap3.

-Tero

> 
> adam
>>
>>> adam
>>>
>>>>
>>>>> adam
>>>>>>
>>>>>> Hello, I have not tested new kernel on N900 for a longer time. And at
>>>>>> that time (4.9) it worked fine. So it is just missing DT node? Maybe you
>>>>>> could fix it when you testing it?
>>>>>>
>>>>>> --
>>>>>> Pali Rohár
>>>>>> pali.rohar@gmail.com
>>>>
>>>> --
>>>> Pali Rohár
>>>> pali.rohar@gmail.com
>>
>> --
>> Pali Rohár
>> pali.rohar@gmail.com

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
