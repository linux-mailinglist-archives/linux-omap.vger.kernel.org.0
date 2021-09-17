Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC8340F7E3
	for <lists+linux-omap@lfdr.de>; Fri, 17 Sep 2021 14:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244359AbhIQMiC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Sep 2021 08:38:02 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38000 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244153AbhIQMiC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Sep 2021 08:38:02 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18HCaT61130501;
        Fri, 17 Sep 2021 07:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1631882189;
        bh=RJOfo7Gm35SgVYqgyXRCvUWKflzMUGo2w7N4iJF4F30=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jw+94CRPJ2yWzD34OA4AskdhOxWSoGrniPa1cObGnutMfBkOIfKPoeBSoOW7XkBgy
         iMkhT5lfylMyaUQYRL6P4c1uqx+VWhd5o5a3Go9TzEyixlJ66Y0DoOuOOqUbdPjSrP
         sR12hmkqL46FdRd9Ln75NgXEbys00qHu15l3iotg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18HCaT4B105616
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Sep 2021 07:36:29 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Sep 2021 07:36:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 17 Sep 2021 07:36:28 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18HCaQqG019518;
        Fri, 17 Sep 2021 07:36:26 -0500
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        Tony Lindgren <tony@atomide.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
 <YUQyQgFAOFnBlcdP@atomide.com>
 <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
 <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
 <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
Date:   Fri, 17 Sep 2021 15:36:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 17/09/2021 14:34, Vaittinen, Matti wrote:
> Thanks a lot guys!
> 
> On 9/17/21 14:01, Grygorii Strashko wrote:
>>
>>
>> On 17/09/2021 13:57, Grygorii Strashko wrote:
>>>
>>>
>>> On 17/09/2021 13:28, Vaittinen, Matti wrote:
>>>> Hi deeee Ho Tony & All,
>>>>
>>>> On 9/17/21 09:14, Tony Lindgren wrote:
>>>>> Hi,
>>>>>
>>>>> * Vaittinen, Matti <Matti.Vaittinen@fi.rohmeurope.com> [210916 09:15]:
>>>>
>>>>>> My beaglebone black (rev c) based test environment fails to boot with
>>>>>> v5.15-rc1. Boot succeeds with the v5.14.
>>>>>>
>>>>>> Bisecting the Linus' tree pointed out the commit:
>>>>>> [1c7ba565e70365763ea780666a3eee679344b962] ARM: dts: am335x-baltos:
>>>>>> switch to new cpsw switch drv
>>>>>>
>>>>>> I don't see this exact commit touching the BBB device-tree. In Linus'
>>>>>> tree it is a part of a merge commit. Reverting the whole merge on
>>>>>> top of
>>>>>> the v5.15-rc1
>>>>>>
>>>>>> This reverts commit 81b6a285737700c2e04ef0893617b80481b6b4b7,
>>>>>> reversing
>>>>>> changes made to f73979109bc11a0ed26b6deeb403fb5d05676ffc.
>>>>>>
>>>>>> makes my beaglebone black to boot again.
>>>>>>
>>>>>> Yesterday I tried adding this patch:
>>>>>> https://lore.kernel.org/linux-omap/20210915065032.45013-1-tony@atomide.com/T/#u
>>>>>>
>>>>>> pointed by Tom on top of the v5.15-rc1 - no avail. I also did #define
>>>>>> DEBUG at ti-sys.c as was suggested by Tom - but I don't see any
>>>>>> more output.
>>>>>
>>>>> Correction, that was me, not Tom :)
>>>>
>>>> Oh.. Sorry! I don't know where I picked Tom from... My bad!
>>>>
>>>>> For me, adding any kind of delay fixed the issue. Also adding some
>>>>> printk
>>>>> statements fixed it for me.
>>>>>
>>>>>> Any suggestions what to check next?
>>>>>
>>>>> Maybe try the attached patch? If it helps, just try with the with the
>>>>> ti,sysc-delay-us = <2> added as few modules need that after enable.
>>>>>
>>>>> It's also possible there is an issue with some other device that is now
>>>>> getting enabled other than pruss. The last XXX printk output should
>>>>> show
>>>>> the last device being probed.
>>>>>
>>>>> Looks like you need to also enable CONFIG_SERIAL_EARLYCON=y, and pass
>>>>> console=ttyS0,115200 debug earlycon in the kernel command line.
>>>>
>>>> Ah. Thanks again. I indeed lacked the "debug earlycon" parameters. Now
>>>> we're more likely to see what went wrong :) I pasted the serial log form
>>>> failing boot with v5.15-rc1 which has both the patch you linked me above
>>>> and the patch you suggested me to test in previous email.
>>>>
>>>
> 
> This really feels like an timing/synchronization issue. Adding various
> prints to
> 
> I tried adding prints to omap_reset_deassert() made the Ooops to go
> away. I suspect the prints did change timing just the needed bit. Later
> the boot hanged to NFS mount failing though - but that may also be
> problem on the NFS server side. (I jave a new laptop and I am still
> trying to set-up my development environment there.)
> 
> 
>>> [...]
>>>
>>>> [    2.786181] ti-sysc 48311fe0.target-module: XXX sysc_probe
>>>> [    2.791994] ti-sysc 48311fe0.target-module:
>>>> 48310000:2000:1fe0:1fe4:NA:00000020:rng
>>>> [    2.800820] omap_rng 48310000.rng: Random Number Generator ver. 20
>>>> [    2.807315] random: crng init done
>>>> [    2.814207] ti-sysc 4a101200.target-module: XXX sysc_probe
>>>> [    2.820080] ti-sysc 4a101200.target-module:
>>>> 4a100000:8000:1200:1208:1204:4edb0100:cpgmac
>>>
>>> This one cpsw
>>>
>>>> [    2.830347] ti-sysc 4a326000.target-module: XXX sysc_probe
>>>
>>> This one pruss and it still shows sysc_probe
>>>
>>> Not sure what are the dependency here :( if any.
>>>
>>> Additional option to try - cmdline param "initcall_debug" and maybe
>>> increase print level in really_probe_debug()
>>>
>>
>> Just to be clear - idea is to see *all* probes - not only sysc.
>>
>> [...]
>>
> 
> I added initcall_debug && changed the pr_debug() to pr_err() in
> really_probe_debug(). Log from that run is attached. The
> omap_reset_deassert() was not instrumented to print/delay for this run.

can you try just disable pruss_tm in am335x-bone-common.dtsi?



-- 
Best regards,
grygorii
