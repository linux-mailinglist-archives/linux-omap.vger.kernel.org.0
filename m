Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24E638C05D
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 09:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235218AbhEUHI5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 03:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235367AbhEUHIu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 May 2021 03:08:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1ED1C061343
        for <linux-omap@vger.kernel.org>; Fri, 21 May 2021 00:06:17 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FB7C8D8;
        Fri, 21 May 2021 09:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621580693;
        bh=kI19lQ/fKEjBo4tLCxB6FJZzy5evDaJ6oiZcHII69IU=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=OmAN7IeMlyH3LP3UmbShCYxZoC2omoqiGxfKUr4wHWPA/B/QP0QdYGMFoWdWe52ff
         ByxeA5gv7YRE7k1J6FAd2I4sanlEyib7vfB+/oQ1N+pC40A0s1XoikZhKVqkQ9WnOv
         iXLe+LfnoWGFaQYURN1bnmd7nsUb8sl2c2Pbk60c=
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>, linux-omap@vger.kernel.org
References: <0f48c7e5-6acd-1143-35ef-3dea2255bec6@ideasonboard.com>
 <YKdG5rsNCRYVLDpj@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: Random stack corruption on v5.13 with dra76
Message-ID: <f71c2b05-9d11-f8a4-a0ff-c2c179eda7f0@ideasonboard.com>
Date:   Fri, 21 May 2021 10:04:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKdG5rsNCRYVLDpj@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/05/2021 08:36, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210520 08:27]:
>> Hi,
>>
>> I've noticed that the v5.13 rcs crash randomly (but quite often) on dra76 evm
>> (I haven't tested other boards). Anyone else seen this problem?
> 
> I have not seen this so far and beagle-x15 is behaving for me.
> 
> Does it always happen on boot?

No, but quite often. I can't really say how often, as it's annoyingly random.
I tried to bisect, but that proved to be difficult as sometimes I get multiple (5+)
successful boots before the crash.

I tested with x15, same issue (below). So... Something in my kernel config? Or compiler?
Looks like the crash happens always very soon after (or during) probing palmas.

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.13.0-rc2+ (tomba@deskari) (arm-none-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture 10.2-2020.11 (arm-10.16)) 10.2.1 20201103
, GNU ld (GNU Toolchain for the A-profile Architecture 10.2-2020.11 (arm-10.16)) 2.35.1.20201028) #2 SMP PREEMPT Fri May 21 09:55:16 EEST 2021
[    0.000000] CPU: ARMv7 Processor [412fc0f2] revision 2 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] OF: fdt: Machine model: TI AM5728 BeagleBoard-X15 rev C
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] Reserved memory: created CMA memory pool at 0x95800000, size 56 MiB
[    0.000000] OF: reserved mem: initialized node ipu2-memory@95800000, compatible id shared-dma-pool
[    0.000000] Reserved memory: created CMA memory pool at 0x99000000, size 64 MiB
[    0.000000] OF: reserved mem: initialized node dsp1-memory@99000000, compatible id shared-dma-pool
[    0.000000] Reserved memory: created CMA memory pool at 0x9d000000, size 32 MiB
[    0.000000] OF: reserved mem: initialized node ipu1-memory@9d000000, compatible id shared-dma-pool
[    0.000000] Reserved memory: created CMA memory pool at 0x9f000000, size 8 MiB
[    0.000000] OF: reserved mem: initialized node dsp2-memory@9f000000, compatible id shared-dma-pool
[    0.000000] cma: Reserved 32 MiB at 0xfd800000
[    0.000000] OMAP4: Map 0xafe00000 to (ptrval) for dram barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080000000-0x00000000afdfffff]
[    0.000000]   HighMem  [mem 0x00000000afe00000-0x00000000ffffefff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000afdfffff]
[    0.000000]   node   0: [mem 0x00000000b0000000-0x00000000ffffefff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000ffffefff]
[    0.000000] DRA752 ES2.0
[    0.000000] percpu: Embedded 20 pages/cpu s52780 r8192 d20948 u81920
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 522051
[    0.000000] Kernel command line: console=ttyS2,115200n8 root=/dev/nfs rw nfsroot=192.168.50.1:/nfs/rootfs,v3,tcp ip=192.168.50.15:::::eth0: no_console_suspend
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 1850304K/2095100K available (11264K kernel code, 1189K rwdata, 3468K rodata, 1024K init, 10291K bss, 48188K reserved, 196608K cma-reserved, 1277948K hi
ghmem)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] ftrace: allocating 32491 entries in 64 pages
[    0.000000] ftrace: allocated 64 pages with 1 groups
[    0.000000] trace event string verifier disabled
[    0.000000] Running RCU self tests
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU lockdep checking is enabled.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] random: get_random_bytes called from start_kernel+0x37c/0x5cc with crng_init=0
[    0.000000] OMAP clocksource: 32k_counter at 32768 Hz
[    0.000000] clocksource: 32k_counter: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 58327039986419 ns
[    0.000000] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps every 65535999984741ns
[    0.001861] TI gptimer clockevent: always-on 32786 Hz at /ocp/interconnect@4ae00000/segment@10000/target-module@8000
[    0.002716] TI gptimer percpu-dmtimer: 20000000 Hz at /ocp/interconnect@48000000/segment@0/target-module@34000
[    0.003143] TI gptimer percpu-dmtimer: 20000000 Hz at /ocp/interconnect@48000000/segment@0/target-module@36000
[    0.005676] Console: colour dummy device 80x30
[    0.005706] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
[    0.005737] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.005767] ... MAX_LOCK_DEPTH:          48
[    0.005798] ... MAX_LOCKDEP_KEYS:        8192
[    0.005828] ... CLASSHASH_SIZE:          4096
[    0.005859] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.005859] ... MAX_LOCKDEP_CHAINS:      65536
[    0.005889] ... CHAINHASH_SIZE:          32768
[    0.005920]  memory used by lock dependency info: 4061 kB
[    0.005950]  memory used for stack traces: 2112 kB
[    0.005950]  per task-struct memory footprint: 1536 bytes
[    0.006103] Calibrating delay loop... 2000.48 BogoMIPS (lpj=10002432)
[    0.052581] pid_max: default: 32768 minimum: 301
[    0.053131] LSM: Security Framework initializing
[    0.053466] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.053497] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.058013] CPU: Testing write buffer coherency: ok
[    0.058258] CPU0: Spectre v2: using ICIALLU workaround
[    0.059387] /cpus/cpu@0 missing clock-frequency property
[    0.059509] /cpus/cpu@1 missing clock-frequency property
[    0.059600] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.065643] Running RCU-tasks wait API self tests
[    0.173889] Setting up static identity map for 0x80100000 - 0x80100078
[    0.174896] rcu: Hierarchical SRCU implementation.
[    0.185943] smp: Bringing up secondary CPUs ...
[    0.245178] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.245178] CPU1: Spectre v2: using ICIALLU workaround
[    0.246582] smp: Brought up 1 node, 2 CPUs
[    0.246612] SMP: Total of 2 processors activated (4000.97 BogoMIPS).
[    0.246643] CPU: All CPU(s) started in HYP mode.
[    0.246673] CPU: Virtualization extensions available.
[    0.250701] devtmpfs: initialized
[    0.287078] Callback from call_rcu_tasks_rude() invoked.
[    0.773742] VFP support v0.3: implementor 41 architecture 4 part 30 variant f rev 0
[    0.788330] Callback from call_rcu_tasks() invoked.
[    0.799255] DMA-API: preallocated 65536 debug entries
[    0.799316] DMA-API: debugging enabled by kernel config
[    0.799346] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.799438] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.804931] pinctrl core: initialized pinctrl subsystem
[    0.816070] NET: Registered protocol family 16
[    0.829681] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.838745] audit: initializing netlink subsys (disabled)
[    0.846557] audit: type=2000 audit(0.830:1): state=initialized audit_enabled=0 res=1
[    0.846710] cpuidle: using governor menu
[    1.014648] platform encoder: Fixing up cyclic dependency with connector
[    1.017974] No ATAGs?
[    1.018554] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 watchpoint registers.
[    1.018615] hw-breakpoint: maximum watchpoint size is 8 bytes.
[    1.154907] Kprobes globally optimized
[    1.193634] evm_5v0: supplied by main_12v0
[    1.199981] iommu: Default domain type: Translated
[    1.209228] SCSI subsystem initialized
[    1.211456] usbcore: registered new interface driver usbfs
[    1.212005] usbcore: registered new interface driver hub
[    1.212402] usbcore: registered new device driver usb
[    1.214843] pps_core: LinuxPPS API ver. 1 registered
[    1.214874] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    1.215118] PTP clock support registered
[    1.217590] Advanced Linux Sound Architecture Driver Initialized.
[    1.225219] clocksource: Switched to clocksource 32k_counter
[    1.903778] VFS: Disk quotas dquot_6.6.0
[    1.904327] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    1.991577] NET: Registered protocol family 2
[    1.992156] IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    1.996887] tcp_listen_portaddr_hash hash table entries: 512 (order: 2, 22528 bytes, linear)
[    1.997100] TCP established hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    1.997344] TCP bind hash table entries: 8192 (order: 6, 327680 bytes, linear)
[    1.998962] TCP: Hash tables configured (established 8192 bind 8192)
[    1.999603] UDP hash table entries: 512 (order: 3, 49152 bytes, linear)
[    1.999908] UDP-Lite hash table entries: 512 (order: 3, 49152 bytes, linear)
[    2.001220] NET: Registered protocol family 1
[    2.008972] RPC: Registered named UNIX socket transport module.
[    2.009033] RPC: Registered udp transport module.
[    2.009094] RPC: Registered tcp transport module.
[    2.009124] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    2.011566] armv7-pmu pmu: hw perfevents: no interrupt-affinity property, guessing.
[    2.013305] hw perfevents: enabled with armv7_cortex_a15 PMU driver, 7 counters available
[    2.025726] Initialise system trusted keyrings
[    2.026977] workingset: timestamp_bits=14 max_order=19 bucket_order=5
[    2.145477] NFS: Registering the id_resolver key type
[    2.145690] Key type id_resolver registered
[    2.145751] Key type id_legacy registered
[    2.146118] jffs2: version 2.2. (NAND) (SUMMARY)  © 2001-2006 Red Hat, Inc.
[    2.152099] Key type asymmetric registered
[    2.152160] Asymmetric key parser 'x509' registered
[    2.152709] bounce: pool size: 64 pages
[    2.153076] io scheduler mq-deadline registered
[    2.153137] io scheduler kyber registered
[    2.167144] usbcore: registered new interface driver udlfb
[    2.196990] Serial: 8250/16550 driver, 10 ports, IRQ sharing enabled
[    2.331634] brd: module loaded
[    2.424804] loop: module loaded
[    2.433593] mtdoops: mtd device (mtddev=name/number) must be supplied
[    2.446166] libphy: Fixed MDIO Bus: probed
[    2.455200] random: fast init done
[    2.457092] usbcore: registered new interface driver smsc95xx
[    2.458343] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.458496] ehci-omap: OMAP-EHCI Host Controller driver
[    2.459106] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.462524] i2c /dev entries driver
[    2.468597] ledtrig-cpu: registered to indicate activity on CPUs
[    2.481079] Initializing XFRM netlink socket
[    2.481292] NET: Registered protocol family 17
[    2.481475] NET: Registered protocol family 15
[    2.481994] Key type dns_resolver registered
[    2.482055] ThumbEE CPU extension supported.
[    2.482147] Registering SWP/SWPB emulation handler
[    2.482604] omap_voltage_late_init: Voltage driver support not added
[    2.482666] sr_init_by_name: Unable to get voltage domain pointer for VDD mpu
[    2.482696] sr_init_by_name: Unable to get voltage domain pointer for VDD core
[    2.482757] Power Management for TI OMAP4+ devices.
[    2.483612] SmartReflex Class3 initialized
[    2.489929] Loading compiled-in X.509 certificates
[    2.490997] kmemleak: Kernel memory leak detector initialized (mem pool available: 15866)
[    2.495483] kmemleak: Automatic memory scanning thread started
[    3.121429] pinctrl-single 4a003400.pinmux: 282 pins, size 1128
[    3.350891] omap-dma-engine 4a056000.dma-controller: OMAP DMA engine driver (LinkedList1/2/3 supported)
[    3.439331] l3init-clkctrl:0068:0: failed to disable
[    3.504760] OMAP GPIO hardware version 0.1
[    3.552490] wkupaon-clkctrl:0068:0: failed to disable
[    3.593139] printk: console [ttyS2] disabled
[    3.594207] 48020000.serial: ttyS2 at MMIO 0x48020000 (irq = 105, base_baud = 3000000) is a 8250
[    4.670196] printk: console [ttyS2] enabled
[    4.822723] omap_i2c 48060000.i2c: bus 2 rev0.12 at 400 kHz
[    4.888458] palmas 0-0058: Irq flag is 0x00000008
[    4.938812] palmas 0-0058: Muxing GPIO 2f, PWM 0, LED 0
[    4.963867] smps12: supplied by regulator-dummy
[    4.977294] smps3: supplied by regulator-dummy
[    4.991668] smps45: supplied by regulator-dummy
[    5.006256] smps6: supplied by regulator-dummy
[    5.015319] Kernel panic - not syncing: corrupted stack end detected inside scheduler
[    5.023284] CPU: 1 PID: 7 Comm: kworker/u4:0 Not tainted 5.13.0-rc2+ #2
[    5.029937] Hardware name: Generic DRA74X (Flattened Device Tree)
[    5.036102] Workqueue: events_unbound deferred_probe_work_func
[    5.041992] Backtrace:
[    5.044494] [<c0b99dc4>] (dump_backtrace) from [<c0b9a188>] (show_stack+0x20/0x24)
[    5.052154]  r7:00000080 r6:60000193 r5:00000000 r4:c11c18b8
[    5.057861] [<c0b9a168>] (show_stack) from [<c0ba1024>] (dump_stack+0xd8/0x100)
[    5.065246] [<c0ba0f4c>] (dump_stack) from [<c0b9aab0>] (panic+0x12c/0x368)
[    5.072265]  r7:00000001 r6:c0e4a92c r5:00000000 r4:c122b298
[    5.077972] [<c0b9a984>] (panic) from [<c0babb70>] (__schedule+0xe78/0xf30)
[    5.085021]  r3:57ac6e9d r2:00000000 r1:c0e59e48 r0:c0e4a92c
[    5.090728]  r7:00000001
[    5.093292] [<c0baacf8>] (__schedule) from [<c0babe34>] (preempt_schedule_common+0x3c/0xac)
[    5.101715]  r10:fa0700a4 r9:fa070000 r8:c0baca44 r7:00000000 r6:c0babed8 r5:c0babed8
[    5.109619]  r4:c2310000
[    5.112182] [<c0babdf8>] (preempt_schedule_common) from [<c0babed8>] (preempt_schedule+0x34/0x38)
[    5.121124]  r7:00000000 r6:c23107a0 r5:eeb269c0 r4:40000113
[    5.126831] [<c0babea4>] (preempt_schedule) from [<c0bb41b4>] (_raw_spin_unlock_irqrestore+0x6c/0x78)
[    5.136138] [<c0bb4148>] (_raw_spin_unlock_irqrestore) from [<c0205a4c>] (del_timer_sync+0xe0/0x180)
[    5.145355]  r5:00000001 r4:eeb269c0
[    5.148956] [<c020596c>] (del_timer_sync) from [<c0bb3308>] (schedule_timeout+0xb4/0x138)
[    5.157226]  r7:c1105d00 r6:c2310000 r5:c2310790 r4:ffff8d26
[    5.162933] [<c0bb3254>] (schedule_timeout) from [<c0baca74>] (wait_for_completion_timeout+0xb8/0x138)
[    5.172302]  r7:c42b7050 r6:c42b7054 r5:c2310000 r4:00000064
[    5.178009] [<c0bac9bc>] (wait_for_completion_timeout) from [<c0922bc8>] (omap_i2c_xfer_common+0x418/0x64c)
[    5.187835]  r8:00000001 r7:00000000 r6:c2310918 r5:00000001 r4:c42b7040
[    5.194610] [<c09227b0>] (omap_i2c_xfer_common) from [<c0922e38>] (omap_i2c_xfer_irq+0x1c/0x20)
[    5.203369]  r10:c11091c0 r9:c1105d00 r8:c231090c r7:00000000 r6:00000002 r5:ffff8cc2
[    5.211273]  r4:c42b70a8
[    5.213836] [<c0922e1c>] (omap_i2c_xfer_irq) from [<c091a73c>] (__i2c_transfer+0x184/0xb3c)
[    5.222259] [<c091a5b8>] (__i2c_transfer) from [<c091b19c>] (i2c_transfer+0xa8/0x144)
[    5.230163]  r10:c45da8e8 r9:c120b463 r8:c1109210 r7:c1210fa0 r6:c231090c r5:00000002
[    5.238037]  r4:c42b70a8
[    5.240600] [<c091b0f4>] (i2c_transfer) from [<c07c6998>] (regmap_i2c_read+0x6c/0xa8)
[    5.248504]  r6:c07c692c r5:00000000 r4:00000000
[    5.253173] [<c07c692c>] (regmap_i2c_read) from [<c07c1324>] (_regmap_raw_read+0x138/0x4e0)
[    5.261596]  r6:c07c692c r5:00000001 r4:c5081800
[    5.266235] [<c07c11ec>] (_regmap_raw_read) from [<c07c1720>] (_regmap_bus_read+0x54/0x80)
[    5.274597]  r10:c45da8e8 r9:00000003 r8:c4777270 r7:c2310a10 r6:c5063f41 r5:00000033
[    5.282470]  r4:c5081800
[    5.285034] [<c07c16cc>] (_regmap_bus_read) from [<c07bfbf0>] (_regmap_read+0x74/0x284)
[    5.293121]  r7:c2310a10 r6:c5081800 r5:00000033 r4:c5081800
[    5.298828] [<c07bfb7c>] (_regmap_read) from [<c07bfe4c>] (regmap_read+0x4c/0x70)
[    5.306396]  r10:c45da8e8 r9:00000003 r8:c4777270 r7:c45da800 r6:c2310a10 r5:00000033
[    5.314270]  r4:c5081800
[    5.316833] [<c07bfe00>] (regmap_read) from [<c073ee30>] (regulator_get_voltage_sel_regmap+0x40/0x94)
[    5.326141]  r7:c45da800 r6:c0c54298 r5:00000124 r4:c45da800
[    5.331848] [<c073edf0>] (regulator_get_voltage_sel_regmap) from [<c0732e44>] (regulator_attr_is_visible+0x18c/0x278)
[    5.342559]  r4:c45da8e8
[    5.345123] [<c0732cb8>] (regulator_attr_is_visible) from [<c044c950>] (internal_create_group+0xe4/0x3e0)
[    5.354766]  r7:00000000 r6:c0c4dd98 r5:c11c9c00 r4:00000124
[    5.360473] [<c044c86c>] (internal_create_group) from [<c044d27c>] (internal_create_groups.part.0+0x54/0x98)
[    5.370391]  r10:00000000 r9:00000000 r8:c11c9bec r7:c45da8e8 r6:c11c9bec r5:00000000
[    5.378265]  r4:c45da8e8
[    5.380828] [<c044d228>] (internal_create_groups.part.0) from [<c044d2e4>] (sysfs_create_groups+0x24/0x30)
[    5.390563]  r9:c11c9ac8 r8:c1c2b3d8 r7:c1219db0 r6:c4761410 r5:00000000 r4:c45da8e8
[    5.398376] [<c044d2c0>] (sysfs_create_groups) from [<c0795720>] (device_add+0x280/0x944)
[    5.406616] [<c07954a0>] (device_add) from [<c073d5cc>] (regulator_register+0x694/0xc48)
[    5.414794]  r10:c3f13a74 r9:00000000 r8:00000001 r7:00000000 r6:c45da800 r5:c2310c10
[    5.422668]  r4:00000000
[    5.425231] [<c073cf38>] (regulator_register) from [<c073fbd8>] (devm_regulator_register+0x48/0x84)
[    5.434356]  r10:c3f13a74 r9:c11ca7ac r8:c3f12040 r7:c2310c10 r6:c4761410 r5:c3f12600
[    5.442260]  r4:c4766cc0
[    5.444824] [<c073fb90>] (devm_regulator_register) from [<c0743bb4>] (palmas_smps_registration+0x1b4/0x480)
[    5.454650]  r7:c11ca9bc r6:c11ca65c r5:00000006 r4:c3f12600
[    5.460357] [<c0743a00>] (palmas_smps_registration) from [<c07441c8>] (palmas_regulators_probe+0x348/0x450)
[    5.470184]  r10:c11ca7ac r9:00000082 r8:c11ca944 r7:c473b040 r6:c3f12040 r5:c0743a00
[    5.478057]  r4:c474de80
[    5.480621] [<c0743e80>] (palmas_regulators_probe) from [<c079ca2c>] (platform_probe+0x68/0xc8)
[    5.489410]  r10:c121a050 r9:c11ca5a8 r8:00000000 r7:c1c2b438 r6:c11ca5a8 r5:c4761410
[    5.497283]  r4:00000000
[    5.499847] [<c079c9c4>] (platform_probe) from [<c079994c>] (really_probe+0x114/0x588)
[    5.507843]  r7:c1c2b438 r6:00000000 r5:c1c2b434 r4:c4761410
[    5.513549] [<c0799838>] (really_probe) from [<c0799e48>] (driver_probe_device+0x88/0x1f0)
[    5.521911]  r10:eeb75228 r9:eeb7522c r8:c1c2b3d8 r7:c4761410 r6:c2310d7c r5:c11ca5a8
[    5.529785]  r4:c4761410
[    5.532348] [<c0799dc0>] (driver_probe_device) from [<c079a5ac>] (__device_attach_driver+0xac/0x118)
[    5.541564]  r9:eeb7522c r8:c1c2b3d8 r7:c4761410 r6:c2310d7c r5:c11ca5a8 r4:00000001
[    5.549377] [<c079a500>] (__device_attach_driver) from [<c079711c>] (bus_for_each_drv+0x90/0xe0)
[    5.558227]  r7:00000001 r6:c079a500 r5:c2310d7c r4:00000000
[    5.563934] [<c079708c>] (bus_for_each_drv) from [<c079a1b0>] (__device_attach+0xe0/0x1ec)
[    5.572265]  r6:c47614a0 r5:c11d1b20 r4:c4761410
[    5.576934] [<c079a0d0>] (__device_attach) from [<c079a634>] (device_initial_probe+0x1c/0x20)
[    5.585540]  r7:c1219db0 r6:c4761410 r5:c11d1b20 r4:c4761410
[    5.591247] [<c079a618>] (device_initial_probe) from [<c0798694>] (bus_probe_device+0x98/0xa0)
[    5.599914] [<c07985fc>] (bus_probe_device) from [<c079581c>] (device_add+0x37c/0x944)
[    5.607910]  r7:c1219db0 r6:c5080820 r5:00000000 r4:c4761410
[    5.613616] [<c07954a0>] (device_add) from [<c0951cec>] (of_device_add+0x44/0x4c)
[    5.621185]  r10:c5080820 r9:00000001 r8:eeb75270 r7:00000000 r6:00000000 r5:c5080820
[    5.629058]  r4:c4761400
[    5.631622] [<c0951ca8>] (of_device_add) from [<c09523a8>] (of_platform_device_create_pdata+0xa0/0xcc)
[    5.641021] [<c0952308>] (of_platform_device_create_pdata) from [<c09525b4>] (of_platform_bus_create+0x1bc/0x34c)
[    5.651367]  r9:00000001 r8:00000000 r7:00000000 r6:00000000 r5:eeb7520c r4:00000000
[    5.659149] [<c09523f8>] (of_platform_bus_create) from [<c0952914>] (of_platform_populate+0x90/0x124)
[    5.668457]  r10:c5080820 r9:00000001 r8:c5080820 r7:00000000 r6:00000000 r5:eeb74f2c
[    5.676361]  r4:eeb7520c
[    5.678924] [<c0952884>] (of_platform_populate) from [<c0952a24>] (devm_of_platform_populate+0x4c/0x90)
[    5.688385]  r9:c0c687c0 r8:00000002 r7:c506c0c0 r6:00000000 r5:c474eec0 r4:c5080820
[    5.696197] [<c09529d8>] (devm_of_platform_populate) from [<c07dc380>] (palmas_i2c_probe+0x478/0x608)
[    5.705505]  r7:c506c0c0 r6:00000000 r5:00000000 r4:c5004440
[    5.711212] [<c07dbf08>] (palmas_i2c_probe) from [<c091a56c>] (i2c_device_probe+0x2e0/0x32c)
[    5.719726]  r10:c121a050 r9:c11d4ab0 r8:c07dbf08 r7:c5080804 r6:c5080800 r5:00000000
[    5.727600]  r4:c5080820
[    5.730194] [<c091a28c>] (i2c_device_probe) from [<c079994c>] (really_probe+0x114/0x588)
[    5.738342]  r9:c11d4ab0 r8:00000000 r7:c1c2b438 r6:00000000 r5:c1c2b434 r4:c5080820
[    5.746154] [<c0799838>] (really_probe) from [<c0799e48>] (driver_probe_device+0x88/0x1f0)
[    5.754486]  r10:eeb74f48 r9:eeb74f4c r8:c1c2b3d8 r7:c5080820 r6:c2311074 r5:c11d4ab0
[    5.762359]  r4:c5080820
[    5.764953] [<c0799dc0>] (driver_probe_device) from [<c079a5ac>] (__device_attach_driver+0xac/0x118)
[    5.774139]  r9:eeb74f4c r8:c1c2b3d8 r7:c5080820 r6:c2311074 r5:c11d4ab0 r4:00000001
[    5.781951] [<c079a500>] (__device_attach_driver) from [<c079711c>] (bus_for_each_drv+0x90/0xe0)
[    5.790802]  r7:00000001 r6:c079a500 r5:c2311074 r4:00000000
[    5.796508] [<c079708c>] (bus_for_each_drv) from [<c079a1b0>] (__device_attach+0xe0/0x1ec)
[    5.804870]  r6:c50808b0 r5:c11e6880 r4:c5080820
[    5.809509] [<c079a0d0>] (__device_attach) from [<c079a634>] (device_initial_probe+0x1c/0x20)
[    5.818115]  r7:c1219db0 r6:c5080820 r5:c11e6880 r4:c5080820
[    5.823822] [<c079a618>] (device_initial_probe) from [<c0798694>] (bus_probe_device+0x98/0xa0)
[    5.832519] [<c07985fc>] (bus_probe_device) from [<c079581c>] (device_add+0x37c/0x944)
[    5.840484]  r7:c1219db0 r6:c42b7150 r5:00000000 r4:c5080820
[    5.846191] [<c07954a0>] (device_add) from [<c0795e08>] (device_register+0x24/0x28)
[    5.853942]  r10:c0ee18a0 r9:c5080820 r8:00000000 r7:c5080804 r6:c42b70a8 r5:c231117c
[    5.861816]  r4:c5080820
[    5.864379] [<c0795de4>] (device_register) from [<c091b4e4>] (i2c_new_client_device+0x140/0x258)
[    5.873229]  r5:c231117c r4:c5080800
[    5.876861] [<c091b3a4>] (i2c_new_client_device) from [<c091f71c>] (of_i2c_register_devices+0xdc/0x188)
[    5.886322]  r9:eeb74f2c r8:c1220128 r7:c42b7150 r6:c42b70a8 r5:eeb74cd4 r4:eeb74f90
[    5.894134] [<c091f640>] (of_i2c_register_devices) from [<c091be30>] (i2c_register_adapter+0x21c/0x700)
[    5.903594]  r10:c09184d4 r9:c11e7a74 r8:c1c2eff8 r7:00000000 r6:c42b7150 r5:c11e7a74
[    5.911499]  r4:c42b70a8
[    5.914062] [<c091bc14>] (i2c_register_adapter) from [<c091c374>] (__i2c_add_numbered_adapter+0x60/0xac)
[    5.923614]  r10:00000009 r9:00000009 r8:00000003 r7:c42b70a8 r6:c505fc10 r5:c42b70a8
[    5.931518]  r4:00000000
[    5.934082] [<c091c314>] (__i2c_add_numbered_adapter) from [<c091c460>] (i2c_add_adapter+0xa0/0xe4)
[    5.943206]  r5:c42b70a8 r4:c42b7040
[    5.946807] [<c091c3c0>] (i2c_add_adapter) from [<c091c530>] (i2c_add_numbered_adapter+0x2c/0x30)
[    5.955749]  r5:c505fc00 r4:c42b7040
[    5.959381] [<c091c504>] (i2c_add_numbered_adapter) from [<c092236c>] (omap_i2c_probe+0x380/0x714)
[    5.968414] [<c0921fec>] (omap_i2c_probe) from [<c079ca2c>] (platform_probe+0x68/0xc8)
[    5.976379]  r10:c121a050 r9:c11e7a20 r8:00000000 r7:c1c2b438 r6:c11e7a20 r5:c505fc10
[    5.984283]  r4:00000000
[    5.986846] [<c079c9c4>] (platform_probe) from [<c079994c>] (really_probe+0x114/0x588)
[    5.994842]  r7:c1c2b438 r6:00000000 r5:c1c2b434 r4:c505fc10
[    6.000549] [<c0799838>] (really_probe) from [<c0799e48>] (driver_probe_device+0x88/0x1f0)
[    6.008880]  r10:eeb74cf0 r9:eeb74cf4 r8:c1c2b3d8 r7:c505fc10 r6:c23113ac r5:c11e7a20
[    6.016784]  r4:c505fc10
[    6.019348] [<c0799dc0>] (driver_probe_device) from [<c079a5ac>] (__device_attach_driver+0xac/0x118)
[    6.028564]  r9:eeb74cf4 r8:c1c2b3d8 r7:c505fc10 r6:c23113ac r5:c11e7a20 r4:00000001
[    6.036346] [<c079a500>] (__device_attach_driver) from [<c079711c>] (bus_for_each_drv+0x90/0xe0)
[    6.045227]  r7:00000001 r6:c079a500 r5:c23113ac r4:00000000
[    6.050933] [<c079708c>] (bus_for_each_drv) from [<c079a1b0>] (__device_attach+0xe0/0x1ec)
[    6.059265]  r6:c505fca0 r5:c11d1b20 r4:c505fc10
[    6.063934] [<c079a0d0>] (__device_attach) from [<c079a634>] (device_initial_probe+0x1c/0x20)
[    6.072509]  r7:c1219db0 r6:c505fc10 r5:c11d1b20 r4:c505fc10
[    6.078216] [<c079a618>] (device_initial_probe) from [<c0798694>] (bus_probe_device+0x98/0xa0)
[    6.086914] [<c07985fc>] (bus_probe_device) from [<c079581c>] (device_add+0x37c/0x944)
[    6.094909]  r7:c1219db0 r6:c505e410 r5:00000000 r4:c505fc10
[    6.100616] [<c07954a0>] (device_add) from [<c0951cec>] (of_device_add+0x44/0x4c)
[    6.108154]  r10:c1126648 r9:c11267e8 r8:eeb74d38 r7:00000000 r6:00000000 r5:c505e410
[    6.116058]  r4:c505fc00
[    6.118621] [<c0951ca8>] (of_device_add) from [<c09523a8>] (of_platform_device_create_pdata+0xa0/0xcc)
[    6.127990] [<c0952308>] (of_platform_device_create_pdata) from [<c09525b4>] (of_platform_bus_create+0x1bc/0x34c)
[    6.138336]  r9:c11267e8 r8:00000000 r7:c1126648 r6:00000000 r5:eeb74cd4 r4:00000000
[    6.146148] [<c09523f8>] (of_platform_bus_create) from [<c0952914>] (of_platform_populate+0x90/0x124)
[    6.155456]  r10:c0c3d37c r9:00000001 r8:c505e410 r7:c1126648 r6:c0c3d3a4 r5:eeb74974
[    6.163360]  r4:eeb74cd4
[    6.165924] [<c0952884>] (of_platform_populate) from [<c06d1098>] (sysc_probe+0x10f0/0x1634)
[    6.174438]  r9:00000001 r8:0000021f r7:c1c25298 r6:00000000 r5:c505e410 r4:c505a640
[    6.182220] [<c06cffa8>] (sysc_probe) from [<c079ca2c>] (platform_probe+0x68/0xc8)
[    6.189880]  r10:c121a050 r9:c11c25ec r8:00000000 r7:c1c2b438 r6:c11c25ec r5:c505e410
[    6.197753]  r4:00000000
[    6.200317] [<c079c9c4>] (platform_probe) from [<c079994c>] (really_probe+0x114/0x588)
[    6.208312]  r7:c1c2b438 r6:00000000 r5:c1c2b434 r4:c505e410
[    6.214019] [<c0799838>] (really_probe) from [<c0799e48>] (driver_probe_device+0x88/0x1f0)
[    6.222381]  r10:eeb74990 r9:eeb74994 r8:c1c2b3d8 r7:c505e410 r6:c231168c r5:c11c25ec
[    6.230255]  r4:c505e410
[    6.232818] [<c0799dc0>] (driver_probe_device) from [<c079a5ac>] (__device_attach_driver+0xac/0x118)
[    6.242034]  r9:eeb74994 r8:c1c2b3d8 r7:c505e410 r6:c231168c r5:c11c25ec r4:00000001
[    6.249847] [<c079a500>] (__device_attach_driver) from [<c079711c>] (bus_for_each_drv+0x90/0xe0)
[    6.258697]  r7:00000001 r6:c079a500 r5:c231168c r4:00000000
[    6.264404] [<c079708c>] (bus_for_each_drv) from [<c079a1b0>] (__device_attach+0xe0/0x1ec)
[    6.272735]  r6:c505e4a0 r5:c11d1b20 r4:c505e410
[    6.277404] [<c079a0d0>] (__device_attach) from [<c079a634>] (device_initial_probe+0x1c/0x20)
[    6.286010]  r7:c1219db0 r6:c505e410 r5:c11d1b20 r4:c505e410
[    6.291717] [<c079a618>] (device_initial_probe) from [<c0798694>] (bus_probe_device+0x98/0xa0)
[    6.300384] [<c07985fc>] (bus_probe_device) from [<c079581c>] (device_add+0x37c/0x944)
[    6.308380]  r7:c1219db0 r6:c47a7010 r5:00000000 r4:c505e410
[    6.314086] [<c07954a0>] (device_add) from [<c0951cec>] (of_device_add+0x44/0x4c)
[    6.321655]  r10:c11267a8 r9:c11267e8 r8:eeb749d8 r7:c1126804 r6:00000000 r5:c47a7010
[    6.329528]  r4:c505e400
[    6.332092] [<c0951ca8>] (of_device_add) from [<c09523a8>] (of_platform_device_create_pdata+0xa0/0xcc)
[    6.341491] [<c0952308>] (of_platform_device_create_pdata) from [<c09525b4>] (of_platform_bus_create+0x1bc/0x34c)
[    6.351837]  r9:c11267e8 r8:c1126804 r7:c1126648 r6:00000000 r5:eeb74974 r4:00000000
[    6.359649] [<c09523f8>] (of_platform_bus_create) from [<c0952914>] (of_platform_populate+0x90/0x124)
[    6.368927]  r10:c121a050 r9:00000001 r8:c47a7010 r7:c1126648 r6:00000000 r5:eeb6dcf8
[    6.376831]  r4:eeb74974
[    6.379394] [<c0952884>] (of_platform_populate) from [<c06cdd0c>] (simple_pm_bus_probe+0x54/0x80)
[    6.388366]  r9:c11c2510 r8:00000000 r7:c1c2b438 r6:c1126648 r5:eeb6dcf8 r4:c47a7010
[    6.396148] [<c06cdcb8>] (simple_pm_bus_probe) from [<c079ca2c>] (platform_probe+0x68/0xc8)
[    6.404571]  r7:c1c2b438 r6:c11c2510 r5:c47a7010 r4:00000000
[    6.410278] [<c079c9c4>] (platform_probe) from [<c079994c>] (really_probe+0x114/0x588)
[    6.418273]  r7:c1c2b438 r6:00000000 r5:c1c2b434 r4:c47a7010
[    6.423980] [<c0799838>] (really_probe) from [<c0799e48>] (driver_probe_device+0x88/0x1f0)
[    6.432312]  r10:eeb6dd14 r9:eeb6dd18 r8:c1c2b3d8 r7:c47a7010 r6:c2311924 r5:c11c2510
[    6.440216]  r4:c47a7010
[    6.442779] [<c0799dc0>] (driver_probe_device) from [<c079a5ac>] (__device_attach_driver+0xac/0x118)
[    6.451995]  r9:eeb6dd18 r8:c1c2b3d8 r7:c47a7010 r6:c2311924 r5:c11c2510 r4:00000001
[    6.459777] [<c079a500>] (__device_attach_driver) from [<c079711c>] (bus_for_each_drv+0x90/0xe0)
[    6.468658]  r7:00000001 r6:c079a500 r5:c2311924 r4:00000000
[    6.474365] [<c079708c>] (bus_for_each_drv) from [<c079a1b0>] (__device_attach+0xe0/0x1ec)
[    6.482696]  r6:c47a70a0 r5:c11d1b20 r4:c47a7010
[    6.487365] [<c079a0d0>] (__device_attach) from [<c079a634>] (device_initial_probe+0x1c/0x20)
[    6.495971]  r7:c1219db0 r6:c47a7010 r5:c11d1b20 r4:c47a7010
[    6.501678] [<c079a618>] (device_initial_probe) from [<c0798694>] (bus_probe_device+0x98/0xa0)
[    6.510345] [<c07985fc>] (bus_probe_device) from [<c079581c>] (device_add+0x37c/0x944)
[    6.518341]  r7:c1219db0 r6:c47a5410 r5:00000000 r4:c47a7010
[    6.524047] [<c07954a0>] (device_add) from [<c0951cec>] (of_device_add+0x44/0x4c)
[    6.531585]  r10:c1126648 r9:c1126798 r8:eeb6dd5c r7:c1126648 r6:00000000 r5:c47a5410
[    6.539489]  r4:c47a7000
[    6.542053] [<c0951ca8>] (of_device_add) from [<c09523a8>] (of_platform_device_create_pdata+0xa0/0xcc)
[    6.551452] [<c0952308>] (of_platform_device_create_pdata) from [<c09525b4>] (of_platform_bus_create+0x1bc/0x34c)
[    6.561798]  r9:c1126798 r8:c1126648 r7:c1126648 r6:00000000 r5:eeb6dcf8 r4:00000000
[    6.569580] [<c09523f8>] (of_platform_bus_create) from [<c0952914>] (of_platform_populate+0x90/0x124)
[    6.578887]  r10:c121a050 r9:00000001 r8:c47a5410 r7:c1126648 r6:00000000 r5:eeb6da0c
[    6.586791]  r4:eeb6dcf8
[    6.589355] [<c0952884>] (of_platform_populate) from [<c06cdd0c>] (simple_pm_bus_probe+0x54/0x80)
[    6.598297]  r9:c11c2510 r8:00000000 r7:c1c2b438 r6:c1126648 r5:eeb6da0c r4:c47a5410
[    6.606109] [<c06cdcb8>] (simple_pm_bus_probe) from [<c079ca2c>] (platform_probe+0x68/0xc8)
[    6.614532]  r7:c1c2b438 r6:c11c2510 r5:c47a5410 r4:00000000
[    6.620239] [<c079c9c4>] (platform_probe) from [<c079994c>] (really_probe+0x114/0x588)
[    6.628234]  r7:c1c2b438 r6:00000000 r5:c1c2b434 r4:c47a5410
[    6.633941] [<c0799838>] (really_probe) from [<c0799e48>] (driver_probe_device+0x88/0x1f0)
[    6.642272]  r10:eeb6da28 r9:eeb6da2c r8:c1c2b3d8 r7:c47a5410 r6:c2311bbc r5:c11c2510
[    6.650177]  r4:c47a5410
[    6.652740] [<c0799dc0>] (driver_probe_device) from [<c079a5ac>] (__device_attach_driver+0xac/0x118)
[    6.661956]  r9:eeb6da2c r8:c1c2b3d8 r7:c47a5410 r6:c2311bbc r5:c11c2510 r4:00000001
[    6.669738] [<c079a500>] (__device_attach_driver) from [<c079711c>] (bus_for_each_drv+0x90/0xe0)
[    6.678619]  r7:00000001 r6:c079a500 r5:c2311bbc r4:00000000
[    6.684326] [<c079708c>] (bus_for_each_drv) from [<c079a1b0>] (__device_attach+0xe0/0x1ec)
[    6.692657]  r6:c47a54a0 r5:c11d1b20 r4:c47a5410
[    6.697326] [<c079a0d0>] (__device_attach) from [<c079a634>] (device_initial_probe+0x1c/0x20)
[    6.705932]  r7:c1219db0 r6:c47a5410 r5:c11d1b20 r4:c47a5410
[    6.711639] [<c079a618>] (device_initial_probe) from [<c0798694>] (bus_probe_device+0x98/0xa0)
[    6.720306] [<c07985fc>] (bus_probe_device) from [<c079581c>] (device_add+0x37c/0x944)
[    6.728302]  r7:c1219db0 r6:c397a010 r5:00000000 r4:c47a5410
[    6.734008] [<c07954a0>] (device_add) from [<c0951cec>] (of_device_add+0x44/0x4c)
[    6.741546]  r10:c1126798 r9:c11267e8 r8:eeb6da70 r7:c1126648 r6:00000000 r5:c397a010
[    6.749450]  r4:c47a5400
[    6.752014] [<c0951ca8>] (of_device_add) from [<c09523a8>] (of_platform_device_create_pdata+0xa0/0xcc)
[    6.761413] [<c0952308>] (of_platform_device_create_pdata) from [<c09525b4>] (of_platform_bus_create+0x1bc/0x34c)
[    6.771759]  r9:c11267e8 r8:c1126648 r7:c1126648 r6:00000000 r5:eeb6da0c r4:00000000
[    6.779541] [<c09523f8>] (of_platform_bus_create) from [<c0952914>] (of_platform_populate+0x90/0x124)
[    6.788848]  r10:c121a050 r9:00000001 r8:c397a010 r7:c1126648 r6:00000000 r5:eeb3a2fc
[    6.796752]  r4:eeb6da0c
[    6.799316] [<c0952884>] (of_platform_populate) from [<c06cdd0c>] (simple_pm_bus_probe+0x54/0x80)
[    6.808258]  r9:c11c2510 r8:00000000 r7:c1c2b438 r6:c1126648 r5:eeb3a2fc r4:c397a010
[    6.816070] [<c06cdcb8>] (simple_pm_bus_probe) from [<c079ca2c>] (platform_probe+0x68/0xc8)
[    6.824493]  r7:c1c2b438 r6:c11c2510 r5:c397a010 r4:00000000
[    6.830200] [<c079c9c4>] (platform_probe) from [<c079994c>] (really_probe+0x114/0x588)
[    6.838195]  r7:c1c2b438 r6:00000000 r5:c1c2b434 r4:c397a010
[    6.843902] [<c0799838>] (really_probe) from [<c0799e48>] (driver_probe_device+0x88/0x1f0)
[    6.852233]  r10:c0eb2124 r9:c397a010 r8:00000000 r7:c397a010 r6:c2311e54 r5:c11c2510
[    6.860137]  r4:c397a010
[    6.862701] [<c0799dc0>] (driver_probe_device) from [<c079a5ac>] (__device_attach_driver+0xac/0x118)
[    6.871887]  r9:c397a010 r8:00000000 r7:c397a010 r6:c2311e54 r5:c11c2510 r4:00000001
[    6.879699] [<c079a500>] (__device_attach_driver) from [<c079711c>] (bus_for_each_drv+0x90/0xe0)
[    6.888549]  r7:00000001 r6:c079a500 r5:c2311e54 r4:00000000
[    6.894256] [<c079708c>] (bus_for_each_drv) from [<c079a1b0>] (__device_attach+0xe0/0x1ec)
[    6.902618]  r6:c397a0a0 r5:c11d1b20 r4:c397a010
[    6.907257] [<c079a0d0>] (__device_attach) from [<c079a634>] (device_initial_probe+0x1c/0x20)
[    6.915863]  r7:c121a050 r6:c397a010 r5:c11d1b20 r4:c3941f74
[    6.921569] [<c079a618>] (device_initial_probe) from [<c0798694>] (bus_probe_device+0x98/0xa0)
[    6.930267] [<c07985fc>] (bus_probe_device) from [<c0799324>] (deferred_probe_work_func+0xac/0xfc)
[    6.939300]  r7:c121a050 r6:c11d1740 r5:c11d1654 r4:c3941f74
[    6.945007] [<c0799278>] (deferred_probe_work_func) from [<c01642d4>] (process_one_work+0x270/0x83c)
[    6.954223]  r10:c1109210 r9:c120c3c0 r8:00000000 r7:c2020000 r6:c201c000 r5:c22de100
[    6.962097]  r4:c11d16f0 r3:c0799278
[    6.965728] [<c0164064>] (process_one_work) from [<c0164a8c>] (worker_thread+0x1ec/0x524)
[    6.973968]  r10:c201c000 r9:c2310000 r8:00000088 r7:c201c038 r6:c22de114 r5:c201c000
[    6.981872]  r4:c22de100
[    6.984436] [<c01648a0>] (worker_thread) from [<c016c508>] (kthread+0x178/0x1a4)
[    6.991882]  r10:c22f9e34 r9:c22de100 r8:c01648a0 r7:c2310000 r6:00000000 r5:c22bccc0
[    6.999786]  r4:c22de180 r3:00000000
[    7.003387] [<c016c390>] (kthread) from [<c010013c>] (ret_from_fork+0x14/0x38)
[    7.010681] Exception stack(0xc2311fb0 to 0xc2311ff8)
[    7.015777] 1fa0:                                     00000000 00000000 00000000 00000000
[    7.024017] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    7.032287] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    7.038940]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c016c390
[    7.046844]  r4:c22bccc0
[    7.049530] CPU0: stopping
[    7.052307] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.13.0-rc2+ #2
[    7.058715] Hardware name: Generic DRA74X (Flattened Device Tree)
[    7.064849] Backtrace:
[    7.067352] [<c0b99dc4>] (dump_backtrace) from [<c0b9a188>] (show_stack+0x20/0x24)
[    7.075012]  r7:00000080 r6:60000193 r5:00000000 r4:c11c18b8
[    7.080688] [<c0b9a168>] (show_stack) from [<c0ba1024>] (dump_stack+0xd8/0x100)
[    7.088073] [<c0ba0f4c>] (dump_stack) from [<c0110e54>] (do_handle_IPI+0x384/0x3e0)
[    7.095794]  r7:c1109aec r6:c120c1e0 r5:00000000 r4:00000004
[    7.101501] [<c0110ad0>] (do_handle_IPI) from [<c0110ed4>] (ipi_handler+0x24/0x30)
[    7.109161]  r9:c0110eb0 r8:c2006c80 r7:c1109aec r6:00000014 r5:c1109838 r4:c2188000
[    7.116943] [<c0110eb0>] (ipi_handler) from [<c01d6880>] (handle_percpu_devid_irq+0xc4/0x1ac)
[    7.125549] [<c01d67bc>] (handle_percpu_devid_irq) from [<c01cf1f4>] (__handle_domain_irq+0xbc/0x14c)
[    7.134857]  r9:c1100000 r8:c1092cd0 r7:00000000 r6:c1109838 r5:c1092cd0 r4:00000000
[    7.142639] [<c01cf138>] (__handle_domain_irq) from [<c01016d4>] (gic_handle_irq+0x9c/0xc4)
[    7.151062]  r10:c1101eb8 r9:c1092cf4 r8:c11c1a44 r7:fa21200c r6:c1109aec r5:000003ff
[    7.158966]  r4:fa212000
[    7.161529] [<c0101638>] (gic_handle_irq) from [<c0100b70>] (__irq_svc+0x70/0xb0)
[    7.169067] Exception stack(0xc1101eb8 to 0xc1101f00)
[    7.174163] 1ea0:                                                       00000000 c0eadbd8
[    7.182403] 1ec0: 00000000 fe600000 c1100000 00000000 c1109210 c1109264 c10932b0 00000000
[    7.190643] 1ee0: 00000000 c1101f14 c1101ef4 c1101f08 c012a558 c010a0a4 60000113 ffffffff
[    7.198883]  r10:00000000 r9:c1100000 r8:c10932b0 r7:c1101eec r6:ffffffff r5:60000113
[    7.206787]  r4:c010a0a4 r3:c012a558
[    7.210388] [<c010a078>] (arch_cpu_idle) from [<c0bb3c00>] (default_idle_call+0x58/0xa4)
[    7.218536] [<c0bb3ba8>] (default_idle_call) from [<c0188638>] (do_idle+0x264/0x330)
[    7.226348] [<c01883d4>] (do_idle) from [<c0188b18>] (cpu_startup_entry+0x28/0x30)
[    7.234008]  r10:10c5387d r9:c104ba7c r8:efdff840 r7:c11091c0 r6:00000000 r5:c120aeb8
[    7.241882]  r4:000000e1
[    7.244445] [<c0188af0>] (cpu_startup_entry) from [<c0ba899c>] (rest_init+0x180/0x270)
[    7.252441] [<c0ba881c>] (rest_init) from [<c1000aa8>] (arch_call_rest_init+0x18/0x1c)
[    7.260437]  r5:c104ba7c r4:c122a068
[    7.264038] [<c1000a90>] (arch_call_rest_init) from [<c100100c>] (start_kernel+0x4e8/0x5cc)
[    7.272460] [<c1000b24>] (start_kernel) from [<00000000>] (0x0)
[    7.278442]  r9:412fc0f2 r8:8fefd000 r7:00000000 r6:10c0387d r5:00000051 r4:c1000330
[    7.286285] ---[ end Kernel panic - not syncing: corrupted stack end detected inside scheduler ]---

