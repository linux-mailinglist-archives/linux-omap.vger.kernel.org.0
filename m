Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5B410BB1
	for <lists+linux-omap@lfdr.de>; Wed,  1 May 2019 19:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbfEARBj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Wed, 1 May 2019 13:01:39 -0400
Received: from Galois.linutronix.de ([146.0.238.70]:51547 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfEARBj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 May 2019 13:01:39 -0400
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1hLsbl-0003Qh-PH; Wed, 01 May 2019 19:01:25 +0200
Date:   Wed, 1 May 2019 19:01:25 +0200
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
Message-ID: <20190501170125.xjlwdyqtp5oxx2mb@linutronix.de>
References: <5cc8b55c.1c69fb81.c3759.1c27@mx.google.com>
 <20190501153711.pxmapo2k3n5ynqrc@linutronix.de>
 <20190501162944.GW8004@atomide.com>
 <20190501164444.iclxlzrxofqnj4bn@linutronix.de>
 <20190501165224.GK8007@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20190501165224.GK8007@atomide.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2019-05-01 09:52:24 [-0700], Tony Lindgren wrote:
> > > Oh interesting thanks for letting me know. Next boots fine for me here
> > > with NFSroot on BBB.
> > > 
> > > Do you have some output on what happens so I can investigate?
> > 
> > Nope, the console remains dark.
> 
> OK. Can you please email me your .config and the kernel cmdline you're
> using? I'll try to reproduce that one here.

This is "multi_v7_defconfig+CONFIG_SMP=n" and my earlyprintk vanished.
So with this added:
|[    0.000000] Booting Linux on physical CPU 0x0
|[    0.000000] Linux version 5.1.0-rc7-next-20190501 (bigeasy@flow) (gcc version 8.3.0 (Debian 8.3.0-7)) #29 Wed May 1 18:55:24 CEST 2019
|[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=10c5387d
|[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
|[    0.000000] OF: fdt: Machine model: TI AM335x BeagleBone Black
|[    0.000000] printk: bootconsole [earlycon0] enabled
|[    0.000000] Memory policy: Data cache writeback
|[    0.000000] efi: Getting EFI parameters from FDT:
|[    0.000000] efi: UEFI not found.
|[    0.000000] cma: Reserved 64 MiB at 0x9b800000
|[    0.000000] CPU: All CPU(s) started in SVC mode.
|[    0.000000] AM335X ES2.0 (neon)
|[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 129540
|[    0.000000] Kernel command line: console=ttyO0,115200n8 root=/dev/mmcblk1p2 rootwait coherent_pool=1M net.ifnames=0 earlyprintk
|[    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
|[    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
|[    0.000000] Memory: 430304K/522240K available (11264K kernel code, 1659K rwdata, 4924K rodata, 2048K init, 383K bss, 26400K reserved, 65536K cma-reserved, 0K highmem)
|[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
|[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
|[    0.000000] IRQ: Found an INTC at 0x(ptrval) (revision 5.0) with 128 interrupts
|[    0.000000] random: get_random_bytes called from start_kernel+0x2ec/0x478 with crng_init=0
|[    0.000000] OMAP clockevent source: timer2 at 24000000 Hz
|[    0.000015] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 89478484971ns
|[    0.008050] clocksource: timer1: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635851949 ns
|[    0.017499] OMAP clocksource: timer1 at 24000000 Hz
|[    0.028449] timer_probe: no matching timers found
|[    0.033509] Console: colour dummy device 80x30
|[    0.038089] WARNING: Your 'console=ttyO0' has been replaced by 'ttyS0'
|[    0.044781] This ensures that you still see kernel messages. Please
|[    0.051197] update your kernel commandline.
|[    0.055513] Calibrating delay loop... 996.14 BogoMIPS (lpj=4980736)
|[    0.100098] pid_max: default: 32768 minimum: 301
|[    0.104992] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
|[    0.111774] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
|[    0.119499] *** VALIDATE proc ***
|[    0.123004] *** VALIDATE cgroup1 ***
|[    0.126693] *** VALIDATE cgroup2 ***
|[    0.130358] CPU: Testing write buffer coherency: ok
|[    0.135408] CPU0: Spectre v2: using BPIALL workaround
|[    0.141140] Setting up static identity map for 0x80300000 - 0x803000ac
|[    0.153146] EFI services will not be available.
|[    0.159067] devtmpfs: initialized
|[    0.171139] VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 3
|[    0.179275] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
|[    0.189383] futex hash table entries: 256 (order: -1, 3072 bytes)
|[    0.199562] pinctrl core: initialized pinctrl subsystem
|[    0.207278] DMI not present or invalid.
|[    0.211649] NET: Registered protocol family 16
|[    0.219070] DMA: preallocated 1024 KiB pool for atomic coherent allocations
|[    0.244016] l3-aon-clkctrl:0000:0: failed to disable
|[    0.277247] cpuidle: using governor menu
|[    0.302433] No ATAGs?
|[    0.302443] hw-breakpoint: debug architecture 0x4 unsupported.
|[    0.311790] omap4_sram_init:Unable to allocate sram needed to handle errata I688
|[    0.319401] omap4_sram_init:Unable to get sram pool needed to handle errata I688
|[    0.332438] Serial: AMBA PL011 UART driver
|[    0.355726] edma 49000000.edma: TI EDMA DMA engine driver
|[    0.362309] AT91: Could not find identification node
|[    0.365980] vgaarb: loaded
|[    0.374698] SCSI subsystem initialized
|[    0.379005] usbcore: registered new interface driver usbfs
|[    0.384723] usbcore: registered new interface driver hub
|[    0.390205] usbcore: registered new device driver usb
|[    0.396826] pps_core: LinuxPPS API ver. 1 registered
|[    0.401912] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
|[    0.411320] PTP clock support registered
|[    0.415536] EDAC MC: Ver: 3.0.0
|[    0.421533] clocksource: Switched to clocksource timer1
|[    0.823224] NET: Registered protocol family 2
|[    0.828261] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes)
|[    0.836192] TCP established hash table entries: 4096 (order: 2, 16384 bytes)
|[    0.843460] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
|[    0.850087] TCP: Hash tables configured (established 4096 bind 4096)
|[    0.856698] UDP hash table entries: 256 (order: 0, 4096 bytes)
|[    0.862700] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
|[    0.869257] NET: Registered protocol family 1
|[    0.874257] RPC: Registered named UNIX socket transport module.
|[    0.880325] RPC: Registered udp transport module.
|[    0.885174] RPC: Registered tcp transport module.
|[    0.889989] RPC: Registered tcp NFSv4.1 backchannel transport module.
|[    0.897690] hw perfevents: enabled with armv7_cortex_a8 PMU driver, 5 counters available
|[    0.907566] Initialise system trusted keyrings
|[    0.912417] workingset: timestamp_bits=30 max_order=17 bucket_order=0
|[    0.924685] squashfs: version 4.0 (2009/01/31) Phillip Lougher
|[    0.931401] NFS: Registering the id_resolver key type
|[    0.936677] Key type id_resolver registered
|[    0.940961] Key type id_legacy registered
|[    0.945116] ntfs: driver 2.1.32 [Flags: R/O].
|[    0.950130] Key type asymmetric registered
|[    0.954380] Asymmetric key parser 'x509' registered
|[    0.959421] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 247)
|[    0.967018] io scheduler mq-deadline registered
|[    0.971667] io scheduler kyber registered
|[    0.983052] OMAP GPIO hardware version 0.1
|[    1.010470] ti-sysc 48042000.target-module: sysc_flags 00000222 != 00000022
|[    1.018713] ti-sysc 48044000.target-module: sysc_flags 00000222 != 00000022
|[    1.026947] ti-sysc 48046000.target-module: sysc_flags 00000222 != 00000022
|[    1.035182] ti-sysc 48048000.target-module: sysc_flags 00000222 != 00000022
|[    1.043393] ti-sysc 4804a000.target-module: sysc_flags 00000222 != 00000022
|[    1.073661] Unhandled fault: external abort on non-linefetch (0x1028) at 0xfa1cc000
|[    1.081518] pgd = (ptrval)
|[    1.084285] [fa1cc000] *pgd=48011452(bad)
|[    1.088398] Internal error: : 1028 [#1] ARM
|[    1.092681] Modules linked in:
|[    1.095814] CPU: 0 PID: 1 Comm: swapper Not tainted 5.1.0-rc7-next-20190501 #29
|[    1.103300] Hardware name: Generic AM33XX (Flattened Device Tree)
|[    1.109560] PC is at sysc_probe+0x958/0x10a4
|[    1.113932] LR is at sysc_probe+0x928/0x10a4
|[    1.118302] pc : [<c0644e38>]    lr : [<c0644e08>]    psr: 60000013
|[    1.124720] sp : db0b1db8  ip : 00000013  fp : c162ac60
|[    1.130069] r10: 00000000  r9 : 00000028  r8 : 00000001
|[    1.135418] r7 : 00000000  r6 : db191210  r5 : c1604048  r4 : db345940
|[    1.142103] r3 : fa1cc000  r2 : 00000000  r1 : 00000000  r0 : 00000000
|[    1.148793] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
|[    1.156103] Control: 10c5387d  Table: 80204019  DAC: 00000051
|[    1.161987] Process swapper (pid: 1, stack limit = 0x(ptrval))
|…
|[    1.331712] [<c0644e38>] (sysc_probe) from [<c08f027c>] (platform_drv_probe+0x48/0x98)
|[    1.339831] [<c08f027c>] (platform_drv_probe) from [<c08ee41c>] (really_probe+0xf0/0x2c8)
|[    1.348216] [<c08ee41c>] (really_probe) from [<c08ee754>] (driver_probe_device+0x60/0x16c)
|[    1.356688] [<c08ee754>] (driver_probe_device) from [<c08eea00>] (device_driver_attach+0x58/0x60)
|[    1.365782] [<c08eea00>] (device_driver_attach) from [<c08eea60>] (__driver_attach+0x58/0xcc)
|[    1.374521] [<c08eea60>] (__driver_attach) from [<c08ec8d8>] (bus_for_each_dev+0x74/0xb4)
|[    1.382903] [<c08ec8d8>] (bus_for_each_dev) from [<c08ed944>] (bus_add_driver+0x1b8/0x1d8)
|[    1.391374] [<c08ed944>] (bus_add_driver) from [<c08ef394>] (driver_register+0x74/0x108)
|[    1.399672] [<c08ef394>] (driver_register) from [<c0302d88>] (do_one_initcall+0x50/0x1a4)
|[    1.408064] [<c0302d88>] (do_one_initcall) from [<c1401064>] (kernel_init_freeable+0x1c4/0x25c)
|[    1.416989] [<c1401064>] (kernel_init_freeable) from [<c0dedba4>] (kernel_init+0x8/0x10c)
|[    1.425373] [<c0dedba4>] (kernel_init) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
|[    1.433127] Exception stack(0xdb0b1fb0 to 0xdb0b1ff8)
|[    1.438301] 1fa0:                                     00000000 00000000 00000000 00000000
|[    1.446683] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
|[    1.455063] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
|[    1.461845] Code: e3130004 1a000126 e5943014 e0833001 (e5930000) 
|[    1.468105] ---[ end trace 5481d6c45bd9fae0 ]---
|[    1.472934] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
|[    1.480784] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

with  arm-linux-gnueabihf-addr2line -i c0644e38 -e vmlinux
| arch/arm/include/asm/io.h:117
| drivers/bus/ti-sysc.c:117
| drivers/bus/ti-sysc.c:132
| drivers/bus/ti-sysc.c:1361
| drivers/bus/ti-sysc.c:2117

Does this help?

> Regards,
> 
> Tony

Sebastian
