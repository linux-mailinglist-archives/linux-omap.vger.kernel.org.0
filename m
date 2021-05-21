Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678CD38C747
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 14:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhEUM7W (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 08:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbhEUM7M (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 May 2021 08:59:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88AD7C061574
        for <linux-omap@vger.kernel.org>; Fri, 21 May 2021 05:57:48 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A72258D8;
        Fri, 21 May 2021 14:57:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621601865;
        bh=CbrIXVeCFx3vxG0hKVpClfZqcaiFK824oqoElnjBGcI=;
        h=From:To:Cc:References:Subject:Date:In-Reply-To:From;
        b=lkNYznLAdH9SSR9KZj/2WmM/oAA9xVrtXprSFWYHY11TVG8hWaBwEO2Q/pmDbDssD
         zOLdUwcpjuH15C36xsFTLM4vqp2i+ThJLqKiCvn3FpHLJuHjDfjDZ5cDvvSSLJCQQY
         LX/vie1UQsJyaNpysjLqMyVgjjhFP1Ahiz44SoZI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>, linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <0f48c7e5-6acd-1143-35ef-3dea2255bec6@ideasonboard.com>
 <YKdG5rsNCRYVLDpj@atomide.com>
 <f71c2b05-9d11-f8a4-a0ff-c2c179eda7f0@ideasonboard.com>
 <YKdjyAYY1s8BXLAz@atomide.com>
 <064a9324-cfcf-47b9-6ae3-a29085a52683@ideasonboard.com>
 <YKd56/KAnIUIm7K5@atomide.com>
 <9e2e544d-4e3c-4171-9a37-fb582861e368@ideasonboard.com>
Subject: Re: Random stack corruption on v5.13 with dra76
Message-ID: <d59af1bf-c235-2e81-3e81-d61d5263dbe4@ideasonboard.com>
Date:   Fri, 21 May 2021 15:57:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9e2e544d-4e3c-4171-9a37-fb582861e368@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/05/2021 13:30, Tomi Valkeinen wrote:
> On 21/05/2021 12:14, Tony Lindgren wrote:
>> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210521 08:45]:
>>> On 21/05/2021 10:39, Tony Lindgren wrote:
>>>> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210521 07:05]:
>>>>> On 21/05/2021 08:36, Tony Lindgren wrote:
>>>>>> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210520 08:27]:
>>>>>>> Hi,
>>>>>>>
>>>>>>> I've noticed that the v5.13 rcs crash randomly (but quite often) 
>>>>>>> on dra76 evm
>>>>>>> (I haven't tested other boards). Anyone else seen this problem?
>>>>>>
>>>>>> I have not seen this so far and beagle-x15 is behaving for me.
>>>>>>
>>>>>> Does it always happen on boot?
>>>>>
>>>>> No, but quite often. I can't really say how often, as it's 
>>>>> annoyingly random.
>>>>> I tried to bisect, but that proved to be difficult as sometimes I 
>>>>> get multiple (5+)
>>>>> successful boots before the crash.
>>>>>
>>>>> I tested with x15, same issue (below). So... Something in my kernel 
>>>>> config? Or compiler?
>>>>> Looks like the crash happens always very soon after (or during) 
>>>>> probing palmas.
>>>>
>>>> After about 10 reboots with your .config I'm seeing it now too on
>>>> beagle-x15. So far no luck reproducing it with omap2plus_defconfig.
>>>
>>> I think I have an easy way to see if a kernel is good or bad, by 
>>> printing
>>> stack_not_used(current) in the first call to omap_i2c_xfer_irq(). 
>>> There's a
>>> huge drop between v5.12 and v5.13-rc1.
>>>
>>> And interestingly, sometimes a simple printk seems to use hundreds of 
>>> bytes
>>> of stack (i.e. compare stack usage before and after the print). But not
>>> always. So maybe the issue is somehow related to printk.
>>>
>>> I'm bisecting.
>>
>> OK sounds good to me.
> 
> Well, I found the bad commit but unfortunately it doesn't exactly point 
> where the issue is.
> 
> f483a3e123410bd1c78af295bf65feffb6769a98 is the first bad commit
> commit f483a3e123410bd1c78af295bf65feffb6769a98
> Author: Tony Lindgren <tony@atomide.com>
> Date:   Wed Mar 10 14:03:48 2021 +0200
> 
>      ARM: dts: Configure simple-pm-bus for dra7 l4_per1
> 
>      We can now probe interconnects with device tree only configuration 
> using
>      simple-pm-bus and genpd.
> 
>      Tested-by: Kishon Vijay Abraham I <kishon@ti.com>
>      Signed-off-by: Tony Lindgren <tony@atomide.com>
> 
>   arch/arm/boot/dts/dra7-l4.dtsi | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> 
> The difference is clear, though. With 
> 9a75368b6426739e8b798592f084cb682d760568, which is the last good commit, 
> when I print the stack usage with stack_not_used() in three different 
> places in omap_i2c_xfer_irq(), I get always prints roughly like:
> 
> STACK FREE omap_i2c_xfer_irq: 2972, 2972, 2972
> 
> And these repeat exactly the same for each call to omap_i2c_xfer_irq (at 
> least during palmas probe).
> 
> With the bad commit the situation is different. The first call to 
> omap_i2c_xfer_irq prints:
> 
> STACK FREE omap_i2c_xfer_irq: 2024, 2024, 2024
> 
> so we're already using 1k more. But then, instead of the stack usage 
> staying the same, consecutive calls show increased stack usage. It 
> doesn't increase for each xfer call, but after about 10 calls, I'm 
> getting ~1800, ten calls more I see ~800, and going down to ~500.
> 
> However, with this bad commit, I don't see the empty stack going below 
> ~500, so I don't get crashes. But going to a more recent commit, like 
> 01d7136894410a71932096e0fb9f1d301b6ccf07, the situation is much worse. 
> The first print shows:
> 
> STACK FREE omap_i2c_xfer_irq: 1164, 1164, 1164
> 
> and it quickly goes to stack overflow.

Well... I guess there's no bug as such. The simple-pm-bus just uses a 
lot more stack. Looking at the reports from CONFIG_STACK_TRACER, in the 
good commit the biggest stack is in USB probing with depth of 4896. With 
01d7136894410a71932096e0fb9f1d301b6ccf07, and a debug print in 
omap_i2c_xfer_common, I can get to 7544.

I don't know what to do about this, so I'm giving up for the time being 
and "fix" it for myself by increasing THREAD_SIZE_ORDER.

# cat /sys/kernel/debug/tracing/stack_trace
         Depth    Size   Location    (143 entries)
         -----    ----   --------
   0)     7544      28   ftrace_graph_call+0x0/0xc
   1)     7516      28   rcu_read_lock_sched_held+0x38/0x88
   2)     7488     120   lock_acquire+0x1ac/0x560
   3)     7368      16   _raw_spin_lock_irqsave+0x64/0x80
   4)     7352      56   timekeeping_advance+0x3c/0x934
   5)     7296     144   update_wall_time+0x1c/0x20
   6)     7152      16   tick_do_update_jiffies64+0x1f0/0x304
   7)     7136     104   tick_sched_timer+0xf0/0x10c
   8)     7032      96   __hrtimer_run_queues+0x2d8/0x68c
   9)     6936     112   hrtimer_interrupt+0x158/0x388
  10)     6824      16   dmtimer_clockevent_interrupt+0x34/0x3c
  11)     6808      64   __handle_irq_event_percpu+0x108/0x384
  12)     6744      40   handle_irq_event+0x68/0xe0
  13)     6704      32   handle_fasteoi_irq+0xbc/0x224
  14)     6672      40   __handle_domain_irq+0x98/0x10c
  15)     6632      48   gic_handle_irq+0x9c/0xc4
  16)     6584      68   __irq_svc+0x70/0x98
  17)     6516      60   console_unlock+0x444/0x688
  18)     6456     196   vprintk_emit+0x138/0x344
  19)     6260      68   vprintk_default+0x34/0x3c
  20)     6192      48   vprintk_func+0xec/0x194
  21)     6144      24   printk+0x3c/0x64
  22)     6120     104   omap_i2c_xfer_common+0x698/0x6e4
  23)     6016      16   omap_i2c_xfer_irq+0x1c/0x20
  24)     6000      80   __i2c_transfer+0x184/0xa80
  25)     5920      40   i2c_transfer+0xa8/0x144
  26)     5880      64   regmap_i2c_read+0x6c/0xa8
  27)     5816      72   _regmap_raw_read+0x138/0x474
  28)     5744      40   _regmap_bus_read+0x54/0x80
  29)     5704      56   _regmap_read+0x74/0x248
  30)     5648      32   regmap_read+0x4c/0x70
  31)     5616      32   regulator_get_voltage_sel_regmap+0x40/0x94
  32)     5584      32   regulator_attr_is_visible+0x18c/0x278
  33)     5552      88   internal_create_group+0xe4/0x3e0
  34)     5464      40   internal_create_groups.part.0+0x54/0x98
  35)     5424      16   sysfs_create_groups+0x24/0x30
  36)     5408      96   device_add+0x280/0x944
  37)     5312     104   regulator_register+0x694/0xc4c
  38)     5208      32   devm_regulator_register+0x48/0x84
  39)     5176      72   palmas_smps_registration+0x1b4/0x480
  40)     5104     136   palmas_regulators_probe+0x348/0x450
  41)     4968      32   platform_probe+0x68/0xc8
  42)     4936      64   really_probe+0x114/0x588
  43)     4872      48   driver_probe_device+0x88/0x1f0
  44)     4824      32   __device_attach_driver+0xac/0x118
  45)     4792      48   bus_for_each_drv+0x90/0xe0
  46)     4744      48   __device_attach+0xe0/0x1ec
  47)     4696      16   device_initial_probe+0x1c/0x20
  48)     4680      32   bus_probe_device+0x98/0xa0
  49)     4648      96   device_add+0x37c/0x944
  50)     4552      16   of_device_add+0x44/0x4c
  51)     4536      40   of_platform_device_create_pdata+0xa0/0xcc
  52)     4496     112   of_platform_bus_create+0x1bc/0x34c
  53)     4384      48   of_platform_populate+0x90/0x124
  54)     4336      32   devm_of_platform_populate+0x4c/0x90
  55)     4304      88   palmas_i2c_probe+0x478/0x608
  56)     4216      40   i2c_device_probe+0x2a0/0x2f8
  57)     4176      64   really_probe+0x114/0x588
  58)     4112      48   driver_probe_device+0x88/0x1f0
  59)     4064      32   __device_attach_driver+0xac/0x118
  60)     4032      48   bus_for_each_drv+0x90/0xe0
  61)     3984      48   __device_attach+0xe0/0x1ec
  62)     3936      16   device_initial_probe+0x1c/0x20
  63)     3920      32   bus_probe_device+0x98/0xa0
  64)     3888      96   device_add+0x37c/0x944
  65)     3792      24   device_register+0x24/0x28
  66)     3768      48   i2c_new_client_device+0x140/0x264
  67)     3720     112   of_i2c_register_devices+0xdc/0x188
  68)     3608      64   i2c_register_adapter+0x220/0x700
  69)     3544      32   __i2c_add_numbered_adapter+0x60/0xac
  70)     3512      32   i2c_add_adapter+0xa0/0xe4
  71)     3480      16   i2c_add_numbered_adapter+0x2c/0x30
  72)     3464      80   omap_i2c_probe+0x404/0x6b8
  73)     3384      32   platform_probe+0x68/0xc8
  74)     3352      64   really_probe+0x114/0x588
  75)     3288      48   driver_probe_device+0x88/0x1f0
  76)     3240      32   __device_attach_driver+0xac/0x118
  77)     3208      48   bus_for_each_drv+0x90/0xe0
  78)     3160      48   __device_attach+0xe0/0x1ec
  79)     3112      16   device_initial_probe+0x1c/0x20
  80)     3096      32   bus_probe_device+0x98/0xa0
  81)     3064      96   device_add+0x37c/0x944
  82)     2968      16   of_device_add+0x44/0x4c
  83)     2952      40   of_platform_device_create_pdata+0xa0/0xcc
  84)     2912     112   of_platform_bus_create+0x1bc/0x34c
  85)     2800      48   of_platform_populate+0x90/0x124
  86)     2752     104   sysc_probe+0x10e4/0x1628
  87)     2648      32   platform_probe+0x68/0xc8
  88)     2616      64   really_probe+0x114/0x588
  89)     2552      48   driver_probe_device+0x88/0x1f0
  90)     2504      32   __device_attach_driver+0xac/0x118
  91)     2472      48   bus_for_each_drv+0x90/0xe0
  92)     2424      48   __device_attach+0xe0/0x1ec
  93)     2376      16   device_initial_probe+0x1c/0x20
  94)     2360      32   bus_probe_device+0x98/0xa0
  95)     2328      96   device_add+0x37c/0x944
  96)     2232      16   of_device_add+0x44/0x4c
  97)     2216      40   of_platform_device_create_pdata+0xa0/0xcc
  98)     2176     112   of_platform_bus_create+0x1bc/0x34c
  99)     2064      48   of_platform_populate+0x90/0x124
100)     2016      32   simple_pm_bus_probe+0x54/0x80
101)     1984      32   platform_probe+0x68/0xc8
102)     1952      64   really_probe+0x114/0x588
103)     1888      48   driver_probe_device+0x88/0x1f0
104)     1840      32   __device_attach_driver+0xac/0x118
105)     1808      48   bus_for_each_drv+0x90/0xe0
106)     1760      48   __device_attach+0xe0/0x1ec
107)     1712      16   device_initial_probe+0x1c/0x20
108)     1696      32   bus_probe_device+0x98/0xa0
109)     1664      96   device_add+0x37c/0x944
110)     1568      16   of_device_add+0x44/0x4c
111)     1552      40   of_platform_device_create_pdata+0xa0/0xcc
112)     1512     112   of_platform_bus_create+0x1bc/0x34c
113)     1400      48   of_platform_populate+0x90/0x124
114)     1352      32   simple_pm_bus_probe+0x54/0x80
115)     1320      32   platform_probe+0x68/0xc8
116)     1288      64   really_probe+0x114/0x588
117)     1224      48   driver_probe_device+0x88/0x1f0
118)     1176      32   __device_attach_driver+0xac/0x118
119)     1144      48   bus_for_each_drv+0x90/0xe0
120)     1096      48   __device_attach+0xe0/0x1ec
121)     1048      16   device_initial_probe+0x1c/0x20
122)     1032      32   bus_probe_device+0x98/0xa0
123)     1000      96   device_add+0x37c/0x944
124)      904      16   of_device_add+0x44/0x4c
125)      888      40   of_platform_device_create_pdata+0xa0/0xcc
126)      848     112   of_platform_bus_create+0x1bc/0x34c
127)      736      48   of_platform_populate+0x90/0x124
128)      688      32   simple_pm_bus_probe+0x54/0x80
129)      656      32   platform_probe+0x68/0xc8
130)      624      64   really_probe+0x114/0x588
131)      560      48   driver_probe_device+0x88/0x1f0
132)      512      32   __device_attach_driver+0xac/0x118
133)      480      48   bus_for_each_drv+0x90/0xe0
134)      432      48   __device_attach+0xe0/0x1ec
135)      384      16   device_initial_probe+0x1c/0x20
136)      368      32   bus_probe_device+0x98/0xa0
137)      336      48   deferred_probe_work_func+0xac/0xfc
138)      288     104   process_one_work+0x270/0x7c4
139)      184      48   worker_thread+0x1ec/0x524
140)      136      48   kthread+0x160/0x178
141)       88       8   ret_from_fork+0x14/0x38
142)       80      80   0x0


  Tomi
