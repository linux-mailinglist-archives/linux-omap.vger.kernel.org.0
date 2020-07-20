Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A176C22616F
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jul 2020 15:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgGTN5T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jul 2020 09:57:19 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44068 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgGTN5S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Jul 2020 09:57:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06KDuqSn106024;
        Mon, 20 Jul 2020 08:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595253412;
        bh=iPhBau1YEYPBK8bU4HxjLBRitHMLoy2Hor5v8YlhoNw=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=YQZ4RKcKbXVdvUwC+IlWyVztBSoQQB7JkpKTUmTyY8/arcGhvAtKpZV4PolF7+EWf
         RwCMiw42rgM/89LmKt4niR7zeInJIfyK9Mlk539yv6/rIqWBP35aS++oOr1AEhDvFp
         EM68OA7M3P+EtJUSpNvDUUlQruSlLDaxMsPJo0vk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06KDuqeM129191
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jul 2020 08:56:52 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 20
 Jul 2020 08:56:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 20 Jul 2020 08:56:52 -0500
Received: from [158.218.117.90] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06KDuoJ9106794;
        Mon, 20 Jul 2020 08:56:51 -0500
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Fix suspend and resume
 for am3 and am4
From:   Carlos Hernandez <ceh@ti.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200713162601.6829-1-tony@atomide.com>
 <1ac1ac81-1335-8ba2-590c-8f57c2df1910@linaro.org>
 <f96cb9d8-c940-672a-b1d2-a26570d6f775@ti.com>
Message-ID: <10b49f3f-7778-b391-27ca-0d28b282a55d@ti.com>
Date:   Mon, 20 Jul 2020 09:56:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f96cb9d8-c940-672a-b1d2-a26570d6f775@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


On 7/17/20 5:34 PM, Carlos Hernandez wrote:
>
>
> On 7/17/20 6:29 AM, Daniel Lezcano wrote:
>> On 13/07/2020 18:26, Tony Lindgren wrote:
>>> Carlos Hernandez<ceh@ti.com>  reported that we now have a suspend and
>>> resume regresssion on am3 and am4 compared to the earlier kernels. While
>>> suspend and resume works with v5.8-rc3, we now get errors with rtcwake:
>>>
>>> pm33xx pm33xx: PM: Could not transition all powerdomains to target state
>>> ...
>>> rtcwake: write error
>>>
>>> This is because we now fail to idle the system timer clocks that the
>>> idle code checks and the error gets propagated to the rtcwake.
>>>
>>> Turns out there are several issues that need to be fixed:
>>>
>>> 1. Ignore no-idle and no-reset configured timers for the ti-sysc
>>>     interconnect target driver as otherwise it will keep the system timer
>>>     clocks enabled
>>>
>>> 2. Toggle the system timer functional clock for suspend for am3 and am4
>>>     (but not for clocksource on am3)
>>>
>>> 3. Only reconfigure type1 timers in dmtimer_systimer_disable()
>>>
>>> 4. Use of_machine_is_compatible() instead of of_device_is_compatible()
>>>     for checking the SoC type
>>>
>>> Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
>>> Reported-by: Carlos Hernandez<ceh@ti.com>
>>> Signed-off-by: Tony Lindgren<tony@atomide.com>
>>> ---
>> Carlos, were you able to test this patch ?
>
> Tested the patch on top of 5.8-rc5.
>
> cbdb2617290d (HEAD) clocksource/drivers/timer-ti-dm: Fix suspend and 
> resume for am3 and am4
> 11ba468877bb (tag: v5.8-rc5) Linux 5.8-rc5
>
> It works on am335x-evm but fails on am437x-evm
>
> am3:
>
> [ 122.541423] PM: suspend entry (deep)
> [ 122.545498] Filesystems sync: 0.000 seconds
> [ 122.549711] PM: Preparing system for sleep (deep)
> [ 122.564217] Freezing user space processes ... (elapsed 0.003 
> seconds) done.
> [ 122.575110] OOM killer disabled.
> [ 122.578370] Freezing remaining freezable tasks ... (elapsed 0.001 
> seconds) done.
> [ 122.587604] PM: Suspending system (deep)
> [ 122.591572] printk: Suspending console(s) (use no_console_suspend to 
> debug)
> [ 122.735877] cpsw 4a100000.ethernet eth0: Link is Down
> [ 122.742365] PM: suspend of devices complete after 142.546 msecs
> [ 122.742397] PM: start suspend of devices complete after 143.777 msecs
> [ 122.748722] PM: late suspend of devices complete after 6.257 msecs
> [ 122.754662] PM: noirq suspend of devices complete after 5.632 msecs
> [ 122.754689] Disabling non-boot CPUs ...
> [ 122.754715] pm33xx pm33xx: PM: Successfully put all powerdomains to 
> target state
> [ 122.754715] PM: Wakeup source RTC Alarm
> [ 122.766169] ti-sysc 4a101200.target-module: OCP softreset timed out
> [ 122.769222] PM: noirq resume of devices complete after 14.367 msecs
> [ 122.772956] PM: early resume of devices complete after 3.428 msecs
> [ 122.775749] cpsw 4a100000.ethernet: initializing cpsw version 1.12 (0)
> [ 122.857132] Qualcomm Atheros AR8031/AR8033 4a101000.mdio:00: 
> attached PHY driver [Qualcomm Atheros AR8031/AR8033] 
> (mii_bus:phy_addr=4a101000.mdio:00, irq=POLL)
> [ 122.874236] ti-sysc 4802a000.target-module: OCP softreset timed out
> [ 122.879559] PM: Timekeeping suspended for 18.212 seconds
> [ 122.994120] PM: resume of devices complete after 221.091 msecs
> [ 123.101133] PM: Finishing wakeup.
> [ 123.104493] OOM killer enabled.
> [ 123.107657] Restarting tasks ... done.
> [ 123.168294] PM: suspend exit
> [ 126.005262] cpsw 4a100000.ethernet eth0: Link is Up - 1Gbps/Full - 
> flow control off
> [ 122.742365] PM: suspend of devices complete after 142.546 msecs
>
>
> am4:
>
> |TRACE LOG|Inside do_cmd:CMD=echo 1 > /sys/kernel/debug/pm_debug/enable_off_mode|
> |TRACE LOG|suspend function: power_state: mem|
> |TRACE LOG|suspend function: max_stime: 10|
> |TRACE LOG|suspend function: max_atime: 5|
> |TRACE LOG|suspend function: iterations: 2|
> |TRACE LOG|suspend function: usb_remove: 0|
> |TRACE LOG|suspend function: usb_module: |
> |TRACE LOG|===suspend iteration 0===|
> sh1577:1590898691->1590898692(1):: wakeup - 9 sec 0 msec
> sh1577:1590898691->1590898692(1):: Use rtc to suspend resume, adding 10 secs to suspend time
> rtcwake: wakeup from "mem" using /dev/rtc0 at Sun May 31 04:18:33 2020
> [  106.401004] PM: suspend entry (deep)
> [  106.420151] Filesystems sync: 0.015 seconds
> [  106.424598] PM: Preparing system for sleep (deep)
> [  106.434312] Freezing user space processes ... (elapsed 0.001 seconds) done.
> [  106.442808] OOM killer disabled.
> [  106.446152] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> [  106.454894] PM: Suspending system (deep)
> [  106.458893] printk: Suspending console(s) (use no_console_suspend to debug)
> CCCCCCCC** 1196 printk messages dropped **
> [  107.379605] [<c0573bd8>] (gic_handle_irq) from [<c0100b6c>] (__irq_svc+0x6c/0x90)
> ** 41 printk messages dropped **
> [  107.412635] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.8.0-rc5-00001-gcbdb2617290d #1
> ** 37 printk messages dropped **
> [  107.429822] [<c0198358>] (handle_irq_event) from [<c019cdf8>] (handle_fasteoi_irq+0xc4/0x188)
> ** 37 printk messages dropped **
> [  107.446915] [<c09573f8>] (cpu_idle_poll) from [<c016d0e4>] (do_idle+0x7c/0x2b4)
> [  107.446946] [<c016d0e4>] (do_idle) from [<c016d5d4>] (cpu_startup_entry+0x18/0x1c)
> ** 34 printk messages dropped **
> [  107.479851] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.8.0-rc5-00001-gcbdb2617290d #1
> ** 42 printk messages dropped **
> [  107.497182] Exception stack(0xc0e01f10 to 0xc0e01f58)
> [  107.497202] 1f00:                                     000429e8 00000000 c0e00000 00000001
> ** 34 printk messages dropped **
> [  107.514208] ---[ end trace c18ea2591ccbc697 ]---
> [  107.524884] usb 1-1: reset high-speed USB device number 2 using xhci-hcd
> ** 34 printk messages dropped **
> [  107.547126] [<c0111b08>] (unwind_backtrace) from [<c010ba54>] (show_stack+0x10/0x14)
> [  107.547164] [<c010ba54>] (show_stack) from [<c055ad98>] (dump_stack+0xc4/0xe0)
> ** 42 printk messages dropped **
> [  107.564441] 1e60: c0e00000 00000002 ffffb4d5 c0e01e88 c013f95c c01012fc 60000153 ffffffff
> [  107.564473] [<c0100b6c>] (__irq_svc) from [<c01012fc>] (__do_softirq+0x7c/0x390)
> ** 43 printk messages dropped **
> [  107.597112] 44000000.ocp:L3 Custom Error: MASTER DSS TARGET GPMC (Read): Data Access in User mode during Functional access
> ** 34 printk messages dropped **
> [  107.614456] [<c0138a40>] (__warn) from [<c0138e08>] (warn_slowpath_fmt+0x90/0xc0)
> [  107.614491] [<c0138e08>] (warn_slowpath_fmt) from [<c057581c>] (l3_interrupt_handler+0x250/0x370)
> ** 42 printk messages dropped **
> [  107.631781] [<c016d0e4>] (do_idle) from [<c016d5d4>] (cpu_startup_entry+0x18/0x1c)
> ** 35 printk messages dropped **
> [  107.664649] Hardware name: Generic AM43 (Flattened Device Tree)
> [  107.664711] [<c0111b08>] (unwind_backtrace) from [<c010ba54>] (show_stack+0x10/0x14)
> ** 42 printk messages dropped **
> [  107.682068] 1f20: c0e00000 c0e05234 c0ec3b9c c0e05234 00000000 c0d48a40 c0d766b0 c0e055e0
> [  107.682089] 1f40: 00000000 c0e01f60 c0957380 c09573d0 20000153 ffffffff
> ** 38 printk messages dropped **
> [  107.720215] CPU: 0 PID: 1604 Comm: rtcwake Tainted: G        W         5.8.0-rc5-00001-gcbdb2617290d #1
> ** 44 printk messages dropped **
> [  107.734583] CPU: 0 PID: 1604 Comm: rtcwake Tainted: G        W         5.8.0-rc5-00001-gcbdb2617290d #1
> [  107.734594] Hardware name: Generic AM43 (Flattened Device Tree)
> ** 39 printk messages dropped **
> [  107.747964] ti-sysc 44e0b000.target-module: OCP softreset timed out
>
> -- 
> Carlos

-- 
Carlos

