Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9637510CFA
	for <lists+linux-omap@lfdr.de>; Wed,  1 May 2019 21:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfEATDU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Wed, 1 May 2019 15:03:20 -0400
Received: from Galois.linutronix.de ([146.0.238.70]:51976 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbfEATDU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 May 2019 15:03:20 -0400
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1hLuVT-0006l0-DH; Wed, 01 May 2019 21:03:03 +0200
Date:   Wed, 1 May 2019 21:03:03 +0200
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     "kernelci.org bot" <bot@kernelci.org>, Tejun Heo <tj@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
        mgalka@collabora.com, Thomas Gleixner <tglx@linutronix.de>,
        broonie@kernel.org, matthew.hart@linaro.org, khilman@baylibre.com,
        enric.balletbo@collabora.com, Ingo Molnar <mingo@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org
Subject: Re: next/master boot bisection: next-20190430 on beagle-xm
Message-ID: <20190501190303.pz2yxs3hnc2qpamu@linutronix.de>
References: <5cc8b55c.1c69fb81.c3759.1c27@mx.google.com>
 <20190501153711.pxmapo2k3n5ynqrc@linutronix.de>
 <20190501162944.GW8004@atomide.com>
 <20190501164444.iclxlzrxofqnj4bn@linutronix.de>
 <20190501165224.GK8007@atomide.com>
 <20190501170125.xjlwdyqtp5oxx2mb@linutronix.de>
 <20190501174431.GL8007@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20190501174431.GL8007@atomide.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2019-05-01 10:44:31 [-0700], Tony Lindgren wrote:
> Hmm so I tried without "earlycon" in command line thinking it might be
> happening with just "earlyprintk" but still no luck.
> 
> BTW, in general you might want to update your kernel command line
> options to:
> 
> debug earlyprintk earlycon

debug. Let me look if I manage to hide that `debug' from systemd…

> As that way you get early output without CONFIG_DEBUG_LL=y
> with earlycon that should be enabled by default already.

yup, thx.

> Yes getting closer thanks. Can you please boot one more time with
> the following debug patch that sould confirm which target module
> during probing triggers the abort?

|[    1.091575] ti-sysc 48042000.target-module: probing
|[    1.096694] ti-sysc 48042000.target-module: sysc_flags 00000222 != 00000022
|[    1.104784] ti-sysc 48044000.target-module: probing
|[    1.109974] ti-sysc 48044000.target-module: sysc_flags 00000222 != 00000022
|[    1.118079] ti-sysc 48046000.target-module: probing
|[    1.123206] ti-sysc 48046000.target-module: sysc_flags 00000222 != 00000022
|[    1.131331] ti-sysc 48048000.target-module: probing
|[    1.136505] ti-sysc 48048000.target-module: sysc_flags 00000222 != 00000022
|[    1.144571] ti-sysc 4804a000.target-module: probing
|[    1.149755] ti-sysc 4804a000.target-module: sysc_flags 00000222 != 00000022
|[    1.157846] ti-sysc 4804c000.target-module: probing
|[    1.164537] ti-sysc 480602fc.target-module: probing
|[    1.170858] ti-sysc 48080000.target-module: probing
|[    1.176168] ti-sysc 480c8000.target-module: probing
|[    1.182309] ti-sysc 480ca000.target-module: probing
|[    1.188357] ti-sysc 4819c000.target-module: probing
|[    1.206713] ti-sysc 481a0000.target-module: probing
|[    1.212003] ti-sysc 481a6050.target-module: probing
|[    1.217306] ti-sysc 481a8050.target-module: probing
|[    1.222546] ti-sysc 481aa050.target-module: probing
|[    1.227806] ti-sysc 481ac000.target-module: probing
|[    1.234355] ti-sysc 481ae000.target-module: probing
|[    1.240877] ti-sysc 481cc000.target-module: probing
|[    1.245976] Unhandled fault: external abort on non-linefetch (0x1028) at 0xfa1cc000
|[    1.253847] pgd = (ptrval)
|[    1.256623] [fa1cc000] *pgd=48011452(bad)
|[    1.260749] Internal error: : 1028 [#1] ARM
|[    1.265044] Modules linked in:
|[    1.268187] CPU: 0 PID: 1 Comm: swapper Not tainted 5.1.0-rc7-next-20190501-dirty #31
|[    1.276234] Hardware name: Generic AM33XX (Flattened Device Tree)
|[    1.282510] PC is at sysc_probe+0xb80/0xfc0
|[    1.286805] LR is at sysc_probe+0xb40/0xfc0
|[    1.291100] pc : [<c0644f90>]    lr : [<c0644f50>]    psr: 60000013
|[    1.297538] sp : db0b1dc0  ip : 00000013  fp : c1131648
|[    1.302904] r10: c116c9a4  r9 : c116c984  r8 : 00000028
|[    1.308270] r7 : 00000001  r6 : c0e373ac  r5 : 00000000  r4 : db345940
|[    1.314975] r3 : fa1cc000  r2 : db349700  r1 : 00000000  r0 : 00000000
|[    1.321684] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
|[    1.329017] Control: 10c5387d  Table: 80204019  DAC: 00000051
|[    1.334921] Process swapper (pid: 1, stack limit = 0x(ptrval))
…
|[    1.496788] [<c0644f90>] (sysc_probe) from [<c08f00c4>] (platform_drv_probe+0x48/0x98)
|[    1.504933] [<c08f00c4>] (platform_drv_probe) from [<c08ee264>] (really_probe+0xf0/0x2c8)
|[    1.513346] [<c08ee264>] (really_probe) from [<c08ee59c>] (driver_probe_device+0x60/0x16c)
|[    1.521843] [<c08ee59c>] (driver_probe_device) from [<c08ee848>] (device_driver_attach+0x58/0x60)
|[    1.530967] [<c08ee848>] (device_driver_attach) from [<c08ee8a8>] (__driver_attach+0x58/0xcc)
|[    1.539734] [<c08ee8a8>] (__driver_attach) from [<c08ec720>] (bus_for_each_dev+0x74/0xb4)
|[    1.548142] [<c08ec720>] (bus_for_each_dev) from [<c08ed78c>] (bus_add_driver+0x1b8/0x1d8)
|[    1.556640] [<c08ed78c>] (bus_add_driver) from [<c08ef1dc>] (driver_register+0x74/0x108)
|[    1.564963] [<c08ef1dc>] (driver_register) from [<c0302ce4>] (do_one_initcall+0x50/0x1a4)
|[    1.573384] [<c0302ce4>] (do_one_initcall) from [<c1401064>] (kernel_init_freeable+0x1c4/0x25c)
|[    1.582339] [<c1401064>] (kernel_init_freeable) from [<c0ded9e4>] (kernel_init+0x8/0x10c)
|[    1.590750] [<c0ded9e4>] (kernel_init) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
|[    1.598531] Exception stack(0xdb0b1fb0 to 0xdb0b1ff8)
|[    1.603722] 1fa0:                                     00000000 00000000 00000000 00000000
|[    1.612129] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
|[    1.620535] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
|[    1.627337] Code: ebfffa8a ea000002 e5943014 e0833001 (e5930000) 
|[    1.633616] ---[ end trace d02e59e9267a59cb ]---
|[    1.638458] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

> Looking at the oops 0xfa1cc000, so 0x481cc000 I guess which is d_can0?

That node around it I guess.

> Regards,
> 
> Tony

Sebastian
