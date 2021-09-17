Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1269E40F65D
	for <lists+linux-omap@lfdr.de>; Fri, 17 Sep 2021 12:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhIQK7c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Sep 2021 06:59:32 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46684 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbhIQK7b (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Sep 2021 06:59:31 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18HAw0eF096519;
        Fri, 17 Sep 2021 05:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1631876280;
        bh=L2EIE6OG7UXJtU/GpDpLYUz2yv9SDcMyMLeBwT0+9oc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jo1bBxvWjj3yKsmSu/4EYx/R5LDe0t/MJ1ELInou7zeuxVK4XusxEgegI8twoIoFp
         ndcQDj4/9Nf6VGb6NtWstpaBy33hkscFlw6szXlN7O1Z7K/IitG2Upvny9fE6sDK0W
         SjsIsPjJijpBj77Whu9fqy3OJhshmMYPj1puQawc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18HAw0rA013379
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Sep 2021 05:58:00 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Sep 2021 05:57:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 17 Sep 2021 05:57:59 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18HAvu9C116683;
        Fri, 17 Sep 2021 05:57:57 -0500
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
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
Date:   Fri, 17 Sep 2021 13:57:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 17/09/2021 13:28, Vaittinen, Matti wrote:
> Hi deeee Ho Tony & All,
> 
> On 9/17/21 09:14, Tony Lindgren wrote:
>> Hi,
>>
>> * Vaittinen, Matti <Matti.Vaittinen@fi.rohmeurope.com> [210916 09:15]:
> 
>>> My beaglebone black (rev c) based test environment fails to boot with
>>> v5.15-rc1. Boot succeeds with the v5.14.
>>>
>>> Bisecting the Linus' tree pointed out the commit:
>>> [1c7ba565e70365763ea780666a3eee679344b962] ARM: dts: am335x-baltos:
>>> switch to new cpsw switch drv
>>>
>>> I don't see this exact commit touching the BBB device-tree. In Linus'
>>> tree it is a part of a merge commit. Reverting the whole merge on top of
>>> the v5.15-rc1
>>>
>>> This reverts commit 81b6a285737700c2e04ef0893617b80481b6b4b7, reversing
>>> changes made to f73979109bc11a0ed26b6deeb403fb5d05676ffc.
>>>
>>> makes my beaglebone black to boot again.
>>>
>>> Yesterday I tried adding this patch:
>>> https://lore.kernel.org/linux-omap/20210915065032.45013-1-tony@atomide.com/T/#u
>>> pointed by Tom on top of the v5.15-rc1 - no avail. I also did #define
>>> DEBUG at ti-sys.c as was suggested by Tom - but I don't see any more output.
>>
>> Correction, that was me, not Tom :)
> 
> Oh.. Sorry! I don't know where I picked Tom from... My bad!
> 
>> For me, adding any kind of delay fixed the issue. Also adding some printk
>> statements fixed it for me.
>>
>>> Any suggestions what to check next?
>>
>> Maybe try the attached patch? If it helps, just try with the with the
>> ti,sysc-delay-us = <2> added as few modules need that after enable.
>>
>> It's also possible there is an issue with some other device that is now
>> getting enabled other than pruss. The last XXX printk output should show
>> the last device being probed.
>>
>> Looks like you need to also enable CONFIG_SERIAL_EARLYCON=y, and pass
>> console=ttyS0,115200 debug earlycon in the kernel command line.
> 
> Ah. Thanks again. I indeed lacked the "debug earlycon" parameters. Now
> we're more likely to see what went wrong :) I pasted the serial log form
> failing boot with v5.15-rc1 which has both the patch you linked me above
> and the patch you suggested me to test in previous email.
> 

[...]

> [    2.786181] ti-sysc 48311fe0.target-module: XXX sysc_probe
> [    2.791994] ti-sysc 48311fe0.target-module:
> 48310000:2000:1fe0:1fe4:NA:00000020:rng
> [    2.800820] omap_rng 48310000.rng: Random Number Generator ver. 20
> [    2.807315] random: crng init done
> [    2.814207] ti-sysc 4a101200.target-module: XXX sysc_probe
> [    2.820080] ti-sysc 4a101200.target-module:
> 4a100000:8000:1200:1208:1204:4edb0100:cpgmac

This one cpsw

> [    2.830347] ti-sysc 4a326000.target-module: XXX sysc_probe

This one pruss and it still shows sysc_probe

Not sure what are the dependency here :( if any.

Additional option to try - cmdline param "initcall_debug" and maybe increase print level in really_probe_debug()


I see one possible diff if you could try:

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index c9629cb5ccd1..d62943ba3506 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -801,7 +801,7 @@
  
                                 davinci_mdio_sw: mdio@1000 {
                                         compatible = "ti,cpsw-mdio","ti,davinci_mdio";
-                                       clocks = <&cpsw_125mhz_gclk>;
+                                       clocks = <&cpsw_125mhz_clkctrl AM3_CPSW_125MHZ_CPGMAC0_CLKCTRL 0>;
                                         clock-names = "fck";
                                         #address-cells = <1>;
                                         #size-cells = <0>;



> [    2.836198] 8<--- cut here ---
> [    2.839339] Unhandled fault: external abort on non-linefetch (0x1008)
> at 0xe0266000
> [    2.847215] pgd = 342d2420
> [    2.850000] [e0266000] *pgd=81ec1811, *pte=4a326653, *ppte=4a326453
> [    2.856467] Internal error: : 1008 [#1] THUMB2
> [    2.861036] Modules linked in:
> [    2.864176] CPU: 0 PID: 65 Comm: kworker/u2:2 Not tainted
> 5.15.0-rc1-00002-g5285574596c0 #552
> [    2.872946] Hardware name: Generic AM33XX (Flattened Device Tree)
> [    2.879212] Workqueue: events_unbound deferred_probe_work_func
> [    2.885231] PC is at sysc_probe+0xb30/0xf6c
> [    2.889545] LR is at omap_reset_deassert+0x8d/0x164
> [    2.894569] pc : [<c05afb40>]    lr : [<c0605e2d>]    psr: 40000033
> [    2.901009] sp : c1bcb798  ip : 05355555  fp : c0a56460
> [    2.906379] r10: 00000000  r9 : 00000001  r8 : 00000000
> [    2.911746] r7 : c110be4c  r6 : c1f5ae10  r5 : c1f52240  r4 : c1105288
> [    2.918457] r3 : e0266000  r2 : 00000001  r1 : 00026000  r0 : 00000000
> [    2.925171] Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb
> Segment none
> [    2.932687] Control: 50c5387d  Table: 80004019  DAC: 00000051
> [    2.938590] Register r0 information: NULL pointer
> [    2.943430] Register r1 information: non-paged memory
> [    2.948622] Register r2 information: non-paged memory
> [    2.953813] Register r3 information: 0-page vmalloc region starting
> at 0xe0240000 allocated at __devm_ioremap+0x6f/0x78
> [    2.964915] Register r4 information: non-slab/vmalloc memory
> [    2.970734] Register r5 information: slab kmalloc-256 start c1f52200
> pointer offset 64 size 256
> [    2.979701] Register r6 information: slab kmalloc-512 start c1f5ae00
> pointer offset 16 size 512
> [    2.988661] Register r7 information: non-slab/vmalloc memory
> [    2.994481] Register r8 information: NULL pointer
> [    2.999316] Register r9 information: non-paged memory
> [    3.004508] Register r10 information: NULL pointer
> [    3.009433] Register r11 information: non-slab/vmalloc memory
> [    3.015343] Register r12 information: non-paged memory
> [    3.020625] Process kworker/u2:2 (pid: 65, stack limit = 0xa1c5a543)
> [    3.027159] Stack: (0xc1bcb798 to 0xc1bcc000)
> [    3.031637] b780:
>      ???????? ????????
> [    3.040045] b7a0: ???????? ???????? ???????? ???????? ????????
> ???????? ???????? ????????

what is these ?? :(

> [    3.603378] [<c05afb40>] (sysc_probe) from [<c0695135>]
> (platform_probe+0x5d/0x88)
> [    3.611178] [<c0695135>] (platform_probe) from [<c069334b>]
> (really_probe+0x12b/0x2c8)
> [    3.619334] [<c069334b>] (really_probe) from [<c069356f>]
> (__driver_probe_device+0x87/0x17c)
> [    3.628019] [<c069356f>] (__driver_probe_device) from [<c0693699>]
> (driver_probe_device+0x35/0xa4)
> [    3.637244] [<c0693699>] (driver_probe_device) from [<c0693951>]
> (__device_attach_driver+0x61/0xa8)
> [    3.646560] [<c0693951>] (__device_attach_driver) from [<c0691c7b>]
> (bus_for_each_drv+0x47/0x70)
> [    3.655604] [<c0691c7b>] (bus_for_each_drv) from [<c06931b3>]
> (__device_attach+0x8f/0xf0)
> [    3.664023] [<c06931b3>] (__device_attach) from [<c06926f3>]
> (bus_probe_device+0x5b/0x60)
> [    3.672443] [<c06926f3>] (bus_probe_device) from [<c0690e19>]
> (device_add+0x389/0x640)
> [    3.680597] [<c0690e19>] (device_add) from [<c08064b5>]
> (of_platform_device_create_pdata+0x71/0xa0)
> [    3.689919] [<c08064b5>] (of_platform_device_create_pdata) from
> [<c08065fd>] (of_platform_bus_create+0x10d/0x244)
> [    3.700484] [<c08065fd>] (of_platform_bus_create) from [<c0806879>]
> (of_platform_populate+0x5d/0xd8)
> [    3.709886] [<c0806879>] (of_platform_populate) from [<c05add17>]
> (simple_pm_bus_probe+0x2b/0x50)
> [    3.719020] [<c05add17>] (simple_pm_bus_probe) from [<c0695135>]
> (platform_probe+0x5d/0x88)
> [    3.727617] [<c0695135>] (platform_probe) from [<c069334b>]
> (really_probe+0x12b/0x2c8)
> [    3.735766] [<c069334b>] (really_probe) from [<c069356f>]
> (__driver_probe_device+0x87/0x17c)
> [    3.744452] [<c069356f>] (__driver_probe_device) from [<c0693699>]
> (driver_probe_device+0x35/0xa4)
> [    3.753677] [<c0693699>] (driver_probe_device) from [<c0693951>]
> (__device_attach_driver+0x61/0xa8)
> [    3.762991] [<c0693951>] (__device_attach_driver) from [<c0691c7b>]
> (bus_for_each_drv+0x47/0x70)
> [    3.772037] [<c0691c7b>] (bus_for_each_drv) from [<c06931b3>]
> (__device_attach+0x8f/0xf0)
> [    3.780454] [<c06931b3>] (__device_attach) from [<c06926f3>]
> (bus_probe_device+0x5b/0x60)
> [    3.788873] [<c06926f3>] (bus_probe_device) from [<c0690e19>]
> (device_add+0x389/0x640)
> [    3.797023] [<c0690e19>] (device_add) from [<c08064b5>]
> (of_platform_device_create_pdata+0x71/0xa0)
> [    3.806336] [<c08064b5>] (of_platform_device_create_pdata) from
> [<c08065fd>] (of_platform_bus_create+0x10d/0x244)
> [    3.816899] [<c08065fd>] (of_platform_bus_create) from [<c0806879>]
> (of_platform_populate+0x5d/0xd8)
> [    3.826302] [<c0806879>] (of_platform_populate) from [<c05add17>]
> (simple_pm_bus_probe+0x2b/0x50)
> [    3.835434] [<c05add17>] (simple_pm_bus_probe) from [<c0695135>]
> (platform_probe+0x5d/0x88)
> [    3.844030] [<c0695135>] (platform_probe) from [<c069334b>]
> (really_probe+0x12b/0x2c8)
> [    3.852182] [<c069334b>] (really_probe) from [<c069356f>]
> (__driver_probe_device+0x87/0x17c)
> [    3.860871] [<c069356f>] (__driver_probe_device) from [<c0693699>]
> (driver_probe_device+0x35/0xa4)
> [    3.870095] [<c0693699>] (driver_probe_device) from [<c0693951>]
> (__device_attach_driver+0x61/0xa8)
> [    3.879409] [<c0693951>] (__device_attach_driver) from [<c0691c7b>]
> (bus_for_each_drv+0x47/0x70)
> [    3.888455] [<c0691c7b>] (bus_for_each_drv) from [<c06931b3>]
> (__device_attach+0x8f/0xf0)
> [    3.896874] [<c06931b3>] (__device_attach) from [<c06926f3>]
> (bus_probe_device+0x5b/0x60)
> [    3.905295] [<c06926f3>] (bus_probe_device) from [<c0690e19>]
> (device_add+0x389/0x640)
> [    3.913443] [<c0690e19>] (device_add) from [<c08064b5>]
> (of_platform_device_create_pdata+0x71/0xa0)
> [    3.922756] [<c08064b5>] (of_platform_device_create_pdata) from
> [<c08065fd>] (of_platform_bus_create+0x10d/0x244)
> [    3.933320] [<c08065fd>] (of_platform_bus_create) from [<c0806879>]
> (of_platform_populate+0x5d/0xd8)
> [    3.942722] [<c0806879>] (of_platform_populate) from [<c05add17>]
> (simple_pm_bus_probe+0x2b/0x50)
> [    3.951857] [<c05add17>] (simple_pm_bus_probe) from [<c0695135>]
> (platform_probe+0x5d/0x88)
> [    3.960452] [<c0695135>] (platform_probe) from [<c069334b>]
> (really_probe+0x12b/0x2c8)
> [    3.968600] [<c069334b>] (really_probe) from [<c069356f>]
> (__driver_probe_device+0x87/0x17c)
> [    3.977286] [<c069356f>] (__driver_probe_device) from [<c0693699>]
> (driver_probe_device+0x35/0xa4)
> [    3.986512] [<c0693699>] (driver_probe_device) from [<c0693951>]
> (__device_attach_driver+0x61/0xa8)
> [    3.995827] [<c0693951>] (__device_attach_driver) from [<c0691c7b>]
> (bus_for_each_drv+0x47/0x70)
> [    4.004871] [<c0691c7b>] (bus_for_each_drv) from [<c06931b3>]
> (__device_attach+0x8f/0xf0)
> [    4.013290] [<c06931b3>] (__device_attach) from [<c06926f3>]
> (bus_probe_device+0x5b/0x60)
> [    4.021710] [<c06926f3>] (bus_probe_device) from [<c0692a9b>]
> (deferred_probe_work_func+0x77/0xa4)
> [    4.030931] [<c0692a9b>] (deferred_probe_work_func) from [<c01343d5>]
> (process_one_work+0x109/0x310)
> [    4.040336] [<c01343d5>] (process_one_work) from [<c0134921>]
> (worker_thread+0xe5/0x3a8)
> [    4.048663] [<c0134921>] (worker_thread) from [<c01397a7>]
> (kthread+0xe3/0x11c)
> [    4.056194] [<c01397a7>] (kthread) from [<c0100139>]
> (ret_from_fork+0x11/0x38)
> [    4.063632] Exception stack(0xc1bcbfb0 to 0xc1bcbff8)
> [    4.068824] bfa0:                                     ????????
> ???????? ???????? ????????
> [    4.077233] bfc0: ???????? ???????? ???????? ???????? ????????
> ???????? ???????? ????????
> [    4.085640] bfe0: ???????? ???????? ???????? ???????? ???????? ????????
> [    4.092446] Code: f100 81cc 696b 440b (6818) 46cc
> [    4.097375] ---[ end trace eba2b1d5f478df09 ]---
> 
> 


-- 
Best regards,
grygorii
