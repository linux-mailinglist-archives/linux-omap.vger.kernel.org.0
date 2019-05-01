Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 539D210C58
	for <lists+linux-omap@lfdr.de>; Wed,  1 May 2019 19:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfEARoh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 May 2019 13:44:37 -0400
Received: from muru.com ([72.249.23.125]:47802 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbfEARoh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 1 May 2019 13:44:37 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B2AB6805C;
        Wed,  1 May 2019 17:44:51 +0000 (UTC)
Date:   Wed, 1 May 2019 10:44:31 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
Message-ID: <20190501174431.GL8007@atomide.com>
References: <5cc8b55c.1c69fb81.c3759.1c27@mx.google.com>
 <20190501153711.pxmapo2k3n5ynqrc@linutronix.de>
 <20190501162944.GW8004@atomide.com>
 <20190501164444.iclxlzrxofqnj4bn@linutronix.de>
 <20190501165224.GK8007@atomide.com>
 <20190501170125.xjlwdyqtp5oxx2mb@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190501170125.xjlwdyqtp5oxx2mb@linutronix.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Andrzej Siewior <bigeasy@linutronix.de> [190501 17:01]:
> On 2019-05-01 09:52:24 [-0700], Tony Lindgren wrote:
> > > > Oh interesting thanks for letting me know. Next boots fine for me here
> > > > with NFSroot on BBB.
> > > > 
> > > > Do you have some output on what happens so I can investigate?
> > > 
> > > Nope, the console remains dark.
> > 
> > OK. Can you please email me your .config and the kernel cmdline you're
> > using? I'll try to reproduce that one here.
> 
> This is "multi_v7_defconfig+CONFIG_SMP=n" and my earlyprintk vanished.
> So with this added:
> |[    0.000000] Booting Linux on physical CPU 0x0
> |[    0.000000] Linux version 5.1.0-rc7-next-20190501 (bigeasy@flow) (gcc version 8.3.0 (Debian 8.3.0-7)) #29 Wed May 1 18:55:24 CEST 2019
> |[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=10c5387d
> |[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> |[    0.000000] OF: fdt: Machine model: TI AM335x BeagleBone Black
> |[    0.000000] printk: bootconsole [earlycon0] enabled
> |[    0.000000] Memory policy: Data cache writeback
> |[    0.000000] efi: Getting EFI parameters from FDT:
> |[    0.000000] efi: UEFI not found.
> |[    0.000000] cma: Reserved 64 MiB at 0x9b800000
> |[    0.000000] CPU: All CPU(s) started in SVC mode.
> |[    0.000000] AM335X ES2.0 (neon)
> |[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 129540
> |[    0.000000] Kernel command line: console=ttyO0,115200n8 root=/dev/mmcblk1p2 rootwait coherent_pool=1M net.ifnames=0 earlyprintk

Hmm so I tried without "earlycon" in command line thinking it might be
happening with just "earlyprintk" but still no luck.

BTW, in general you might want to update your kernel command line
options to:

debug earlyprintk earlycon

As that way you get early output without CONFIG_DEBUG_LL=y
with earlycon that should be enabled by default already.

> |[    1.073661] Unhandled fault: external abort on non-linefetch (0x1028) at 0xfa1cc000
> |[    1.081518] pgd = (ptrval)
> |[    1.084285] [fa1cc000] *pgd=48011452(bad)
> |[    1.088398] Internal error: : 1028 [#1] ARM
> |[    1.092681] Modules linked in:
> |[    1.095814] CPU: 0 PID: 1 Comm: swapper Not tainted 5.1.0-rc7-next-20190501 #29
> |[    1.103300] Hardware name: Generic AM33XX (Flattened Device Tree)
> |[    1.109560] PC is at sysc_probe+0x958/0x10a4
> |[    1.113932] LR is at sysc_probe+0x928/0x10a4
> |[    1.118302] pc : [<c0644e38>]    lr : [<c0644e08>]    psr: 60000013
> |[    1.124720] sp : db0b1db8  ip : 00000013  fp : c162ac60
> |[    1.130069] r10: 00000000  r9 : 00000028  r8 : 00000001
> |[    1.135418] r7 : 00000000  r6 : db191210  r5 : c1604048  r4 : db345940
> |[    1.142103] r3 : fa1cc000  r2 : 00000000  r1 : 00000000  r0 : 00000000
> |[    1.148793] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> |[    1.156103] Control: 10c5387d  Table: 80204019  DAC: 00000051
> |[    1.161987] Process swapper (pid: 1, stack limit = 0x(ptrval))
> |…
> |[    1.331712] [<c0644e38>] (sysc_probe) from [<c08f027c>] (platform_drv_probe+0x48/0x98)
> |[    1.339831] [<c08f027c>] (platform_drv_probe) from [<c08ee41c>] (really_probe+0xf0/0x2c8)
> |[    1.348216] [<c08ee41c>] (really_probe) from [<c08ee754>] (driver_probe_device+0x60/0x16c)
> |[    1.356688] [<c08ee754>] (driver_probe_device) from [<c08eea00>] (device_driver_attach+0x58/0x60)
> |[    1.365782] [<c08eea00>] (device_driver_attach) from [<c08eea60>] (__driver_attach+0x58/0xcc)
> |[    1.374521] [<c08eea60>] (__driver_attach) from [<c08ec8d8>] (bus_for_each_dev+0x74/0xb4)
> |[    1.382903] [<c08ec8d8>] (bus_for_each_dev) from [<c08ed944>] (bus_add_driver+0x1b8/0x1d8)
> |[    1.391374] [<c08ed944>] (bus_add_driver) from [<c08ef394>] (driver_register+0x74/0x108)
> |[    1.399672] [<c08ef394>] (driver_register) from [<c0302d88>] (do_one_initcall+0x50/0x1a4)
> |[    1.408064] [<c0302d88>] (do_one_initcall) from [<c1401064>] (kernel_init_freeable+0x1c4/0x25c)
> |[    1.416989] [<c1401064>] (kernel_init_freeable) from [<c0dedba4>] (kernel_init+0x8/0x10c)
> |[    1.425373] [<c0dedba4>] (kernel_init) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
> |[    1.433127] Exception stack(0xdb0b1fb0 to 0xdb0b1ff8)
> |[    1.438301] 1fa0:                                     00000000 00000000 00000000 00000000
> |[    1.446683] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> |[    1.455063] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> |[    1.461845] Code: e3130004 1a000126 e5943014 e0833001 (e5930000) 
> |[    1.468105] ---[ end trace 5481d6c45bd9fae0 ]---
> |[    1.472934] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> |[    1.480784] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> 
> with  arm-linux-gnueabihf-addr2line -i c0644e38 -e vmlinux
> | arch/arm/include/asm/io.h:117
> | drivers/bus/ti-sysc.c:117
> | drivers/bus/ti-sysc.c:132
> | drivers/bus/ti-sysc.c:1361
> | drivers/bus/ti-sysc.c:2117
> 
> Does this help?

Yes getting closer thanks. Can you please boot one more time with
the following debug patch that sould confirm which target module
during probing triggers the abort?

Looking at the oops 0xfa1cc000, so 0x481cc000 I guess which is d_can0?

Regards,

Tony

8< ------------------
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -2069,6 +2069,8 @@ static int sysc_probe(struct platform_device *pdev)
 	struct sysc *ddata;
 	int error;
 
+	dev_info(&pdev->dev, "probing\n");
+
 	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
 		return -ENOMEM;
