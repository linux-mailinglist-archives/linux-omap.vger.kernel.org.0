Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44ADE40F66C
	for <lists+linux-omap@lfdr.de>; Fri, 17 Sep 2021 13:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240937AbhIQLDm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Sep 2021 07:03:42 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47964 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234873AbhIQLDl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Sep 2021 07:03:41 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18HB2396098451;
        Fri, 17 Sep 2021 06:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1631876523;
        bh=w4kvjGKZNf4N10M7gdmkloHMoOeku5FLyiIXDj3jUU8=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=VmCuAkVVh/AJFgV4npwPP55t0y39iMu8IudtuFGj+gRzDmvxe3bg3t2ROdvm2j2sn
         Km1IMqYVS81IyKhi5JmCN2pWub2r1hi6WA9V4g7Wzm2abMV8xTEno/bEMImzmRpUqH
         QJKxXlZ3AbAPnalkdE3UqGKzoEmEItCcMxR+0hDY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18HB2376084904
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Sep 2021 06:02:03 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Sep 2021 06:02:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 17 Sep 2021 06:02:02 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18HB20gr124424;
        Fri, 17 Sep 2021 06:02:01 -0500
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
From:   Grygorii Strashko <grygorii.strashko@ti.com>
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
Message-ID: <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
Date:   Fri, 17 Sep 2021 14:01:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 17/09/2021 13:57, Grygorii Strashko wrote:
> 
> 
> On 17/09/2021 13:28, Vaittinen, Matti wrote:
>> Hi deeee Ho Tony & All,
>>
>> On 9/17/21 09:14, Tony Lindgren wrote:
>>> Hi,
>>>
>>> * Vaittinen, Matti <Matti.Vaittinen@fi.rohmeurope.com> [210916 09:15]:
>>
>>>> My beaglebone black (rev c) based test environment fails to boot with
>>>> v5.15-rc1. Boot succeeds with the v5.14.
>>>>
>>>> Bisecting the Linus' tree pointed out the commit:
>>>> [1c7ba565e70365763ea780666a3eee679344b962] ARM: dts: am335x-baltos:
>>>> switch to new cpsw switch drv
>>>>
>>>> I don't see this exact commit touching the BBB device-tree. In Linus'
>>>> tree it is a part of a merge commit. Reverting the whole merge on top of
>>>> the v5.15-rc1
>>>>
>>>> This reverts commit 81b6a285737700c2e04ef0893617b80481b6b4b7, reversing
>>>> changes made to f73979109bc11a0ed26b6deeb403fb5d05676ffc.
>>>>
>>>> makes my beaglebone black to boot again.
>>>>
>>>> Yesterday I tried adding this patch:
>>>> https://lore.kernel.org/linux-omap/20210915065032.45013-1-tony@atomide.com/T/#u
>>>> pointed by Tom on top of the v5.15-rc1 - no avail. I also did #define
>>>> DEBUG at ti-sys.c as was suggested by Tom - but I don't see any more output.
>>>
>>> Correction, that was me, not Tom :)
>>
>> Oh.. Sorry! I don't know where I picked Tom from... My bad!
>>
>>> For me, adding any kind of delay fixed the issue. Also adding some printk
>>> statements fixed it for me.
>>>
>>>> Any suggestions what to check next?
>>>
>>> Maybe try the attached patch? If it helps, just try with the with the
>>> ti,sysc-delay-us = <2> added as few modules need that after enable.
>>>
>>> It's also possible there is an issue with some other device that is now
>>> getting enabled other than pruss. The last XXX printk output should show
>>> the last device being probed.
>>>
>>> Looks like you need to also enable CONFIG_SERIAL_EARLYCON=y, and pass
>>> console=ttyS0,115200 debug earlycon in the kernel command line.
>>
>> Ah. Thanks again. I indeed lacked the "debug earlycon" parameters. Now
>> we're more likely to see what went wrong :) I pasted the serial log form
>> failing boot with v5.15-rc1 which has both the patch you linked me above
>> and the patch you suggested me to test in previous email.
>>
> 
> [...]
> 
>> [    2.786181] ti-sysc 48311fe0.target-module: XXX sysc_probe
>> [    2.791994] ti-sysc 48311fe0.target-module:
>> 48310000:2000:1fe0:1fe4:NA:00000020:rng
>> [    2.800820] omap_rng 48310000.rng: Random Number Generator ver. 20
>> [    2.807315] random: crng init done
>> [    2.814207] ti-sysc 4a101200.target-module: XXX sysc_probe
>> [    2.820080] ti-sysc 4a101200.target-module:
>> 4a100000:8000:1200:1208:1204:4edb0100:cpgmac
> 
> This one cpsw
> 
>> [    2.830347] ti-sysc 4a326000.target-module: XXX sysc_probe
> 
> This one pruss and it still shows sysc_probe
> 
> Not sure what are the dependency here :( if any.
> 
> Additional option to try - cmdline param "initcall_debug" and maybe increase print level in really_probe_debug()
> 

Just to be clear - idea is to see *all* probes - not only sysc.

[...]

-- 
Best regards,
grygorii
