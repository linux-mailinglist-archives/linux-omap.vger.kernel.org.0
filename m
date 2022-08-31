Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 911E15A7C58
	for <lists+linux-omap@lfdr.de>; Wed, 31 Aug 2022 13:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbiHaLmy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Aug 2022 07:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiHaLmw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 31 Aug 2022 07:42:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9C6B9FB5
        for <linux-omap@vger.kernel.org>; Wed, 31 Aug 2022 04:42:50 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AB25481;
        Wed, 31 Aug 2022 13:42:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661946168;
        bh=ByNbDM0cq/zDVathnOvWMeHX2IStV0ebK6pn4xby+eU=;
        h=Date:To:From:Subject:From;
        b=ZV9lASw3ZutAmN1PN1bl2OAY1qlM9zU4jWQB6XZZt02gZPrR1snK30OunO6GSh4r/
         9r2Hd8iaE75PkBpn/kLO3Li3GNak3cdo+mB52gDpYdG/4A+H4JeFB5oEhcgMFHOaGF
         o58kbZmIg2HUyxKz27MdBaJerxxrLfQDIrVSWNIg=
Message-ID: <abf4d275-b732-b1d5-35f0-40d78ef09962@ideasonboard.com>
Date:   Wed, 31 Aug 2022 14:42:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Unable to boot 6.0-rc3 on dra76
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

I've been unable to boot 6.0-rc3 on dra76 evm with omap2plus_defconfig. I get no output from the kernel.
Enabling earlyprintk gives me the following. Any ideas?

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.0.0-rc3 (tomba@deskari) (arm-none-linux-gnueabihf-gcc (GNU Toolchain for the Arm Architecture 11.2-2022.02 (a
rm-11.14)) 11.2.1 20220111, GNU ld (GNU Toolchain for the Arm Architecture 11.2-2022.02 (arm-11.14)) 2.37.20220122) #2 SMP Wed Aug 31 14:35:
46 EEST 2022
[    0.000000] CPU: ARMv7 Processor [412fc0f2] revision 2 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] OF: fdt: Machine model: TI DRA762 EVM
[    0.000000] OF: fdt: Ignoring memory block 0x200000000 - 0x280000000
[    0.000000] printk: bootconsole [earlycon0] enabled
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] Reserved memory: created CMA memory pool at 0x95800000, size 56 MiB
[    0.000000] OF: reserved mem: initialized node ipu2_cma@95800000, compatible id shared-dma-pool
[    0.000000] Reserved memory: created CMA memory pool at 0x99000000, size 64 MiB
[    0.000000] OF: reserved mem: initialized node dsp1_cma@99000000, compatible id shared-dma-pool
[    0.000000] Reserved memory: created CMA memory pool at 0x9d000000, size 32 MiB
[    0.000000] OF: reserved mem: initialized node ipu1_cma@9d000000, compatible id shared-dma-pool
[    0.000000] Reserved memory: created CMA memory pool at 0x9f000000, size 8 MiB
[    0.000000] OF: reserved mem: initialized node dsp2_cma@9f000000, compatible id shared-dma-pool
[    0.000000] cma: Reserved 64 MiB at 0xfb000000
[    0.000000] OMAP4: Map 0xafe00000 to (ptrval) for dram barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080000000-0x00000000afdfffff]
[    0.000000]   HighMem  [mem 0x00000000afe00000-0x00000000feffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000afdfffff]
[    0.000000]   node   0: [mem 0x00000000b0000000-0x00000000feffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000feffffff]
[    0.000000] On node 0, zone HighMem: 512 pages in unavailable ranges
[    0.000000] DRA762 ES1.0
[    0.000000] percpu: Embedded 16 pages/cpu s33940 r8192 d23404 u65536
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 517956
[    0.000000] Kernel command line: console=ttyS0,115200n8 root=/dev/nfs rw nfsroot=192.168.50.1:/nfs/rootfs,v3,tcp ip=192.168.50.15:::::eth
0: cma=64M earlyprintk no_console_suspend
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 1813596K/2078720K available (10240K kernel code, 1062K rwdata, 2296K rodata, 1024K init, 248K bss, 35748K reserved, 2
29376K cma-reserved, 1228800K highmem)
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] OMAP clocksource: 32k_counter at 32768 Hz
[    0.000000] clocksource: 32k_counter: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 58327039986419 ns
[    0.000000] sched_clock: 32 bits at 33kHz, resolution 30517ns, wraps every 65535999984741ns
[    0.009979] TI gptimer clockevent: always-on 32786 Hz at /ocp/interconnect@4ae00000/segment@10000/target-module@8000
[    0.022308] TI gptimer percpu-dmtimer: 20000000 Hz at /ocp/interconnect@48800000/segment@0/target-module@2c000
[    0.032714] TI gptimer percpu-dmtimer: 20000000 Hz at /ocp/interconnect@48800000/segment@0/target-module@2e000
[    0.044067] Console: colour dummy device 80x30
[    0.048645] Calibrating delay loop... 2000.48 BogoMIPS (lpj=10002432)
[    0.108062] pid_max: default: 32768 minimum: 301
[    0.112915] LSM: Security Framework initializing
[    0.117736] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.125274] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.133850] CPU: Testing write buffer coherency: ok
[    0.138885] CPU0: Spectre v2: using ICIALLU workaround
[    0.144165] CPU0: Spectre BHB: enabling loop workaround for all CPUs
[    0.150878] /cpus/cpu@0 missing clock-frequency property
[    0.156341] /cpus/cpu@1 missing clock-frequency property
[    0.161804] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.167633] Early cacheinfo failed, ret = -2
[    0.172607] Setting up static identity map for 0x80100000 - 0x80100078
[    0.179412] rcu: Hierarchical SRCU implementation.
[    0.184326] rcu:     Max phase no-delay instances is 1000.
[    0.190551] smp: Bringing up secondary CPUs ...
[    0.250732] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.250762] Early cacheinfo failed, ret = -2
[    0.250762] CPU1: Spectre v2: using ICIALLU workaround
[    0.266296] smp: Brought up 1 node, 2 CPUs
[    0.270507] SMP: Total of 2 processors activated (4000.97 BogoMIPS).
[    0.277038] CPU: All CPU(s) started in HYP mode.
[    0.281799] CPU: Virtualization extensions available.
[    0.287384] devtmpfs: initialized
[    0.311340] VFP support v0.3: implementor 41 architecture 4 part 30 variant f rev 0
[    0.319335] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.329467] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.339691] pinctrl core: initialized pinctrl subsystem
[    0.346130] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.353912] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.361480] audit: initializing netlink subsys (disabled)
[    0.367156] audit: type=2000 audit(0.320:1): state=initialized audit_enabled=0 res=1
[    0.367797] thermal_sys: Registered thermal governor 'fair_share'
[    0.375122] thermal_sys: Registered thermal governor 'step_wise'
[    0.381408] thermal_sys: Registered thermal governor 'user_space'
[    0.388458] cpuidle: using governor menu
[    0.427642] platform encoder: Fixing up cyclic dependency with connector
[    0.434692] No ATAGs?
[    0.437072] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 watchpoint registers.
[    0.445312] hw-breakpoint: maximum watchpoint size is 8 bytes.
[    0.458923] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.526306] iommu: Default domain type: Translated
[    0.531311] iommu: DMA domain TLB invalidation policy: strict mode
[    0.539093] SCSI subsystem initialized
[    0.543304] pps_core: LinuxPPS API ver. 1 registered
[    0.548400] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.557800] PTP clock support registered
[    0.971282] vgaarb: loaded
[    0.974151] clocksource: Switched to clocksource 32k_counter
[    1.014617] VFS: Disk quotas dquot_6.6.0
[    1.018707] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    1.032836] NET: Registered PF_INET protocol family
[    1.038055] IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    1.046997] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
[    1.055603] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    1.063568] TCP established hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    1.071594] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    1.079040] TCP: Hash tables configured (established 8192 bind 8192)
[    1.085632] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    1.092437] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
[    1.099822] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    1.106140] RPC: Registered named UNIX socket transport module.
[    1.112213] RPC: Registered udp transport module.
[    1.117065] RPC: Registered tcp transport module.
[    1.121917] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.128540] PCI: CLS 0 bytes, default 64
[    1.132995] armv7-pmu pmu: hw perfevents: no interrupt-affinity property, guessing.
[    1.141052] hw perfevents: enabled with armv7_cortex_a15 PMU driver, 7 counters available
[    1.150238] Initialise system trusted keyrings
[    1.155029] workingset: timestamp_bits=14 max_order=19 bucket_order=5
[    1.162261] NFS: Registering the id_resolver key type
[    1.167510] Key type id_resolver registered
[    1.171813] Key type id_legacy registered
[    1.175964] jffs2: version 2.2. (NAND) (SUMMARY)  © 2001-2006 Red Hat, Inc.
[    1.183441] Key type asymmetric registered
[    1.187652] Asymmetric key parser 'x509' registered
[    1.192718] bounce: pool size: 64 pages
[    1.196716] io scheduler mq-deadline registered
[    1.201354] io scheduler kyber registered
[    1.209777] Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
[    1.224273] brd: module loaded
[    1.231811] loop: module loaded
[    1.235656] mtdoops: mtd device (mtddev=name/number) must be supplied
[    1.244262] i2c_dev: i2c /dev entries driver
[    1.249359] cpu cpu0: Failed to set OPP config
[    1.254150] sdhci: Secure Digital Host Controller Interface driver
[    1.260498] sdhci: Copyright(c) Pierre Ossman
[    1.265167] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.271179] ledtrig-cpu: registered to indicate activity on CPUs
[    1.277893] Initializing XFRM netlink socket
[    1.282348] NET: Registered PF_INET6 protocol family
[    1.288330] Segment Routing with IPv6
[    1.292144] In-situ OAM (IOAM) with IPv6
[    1.296264] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.302764] NET: Registered PF_PACKET protocol family
[    1.307983] NET: Registered PF_KEY protocol family
[    1.312988] Key type dns_resolver registered
[    1.317413] ThumbEE CPU extension supported.
[    1.321807] Registering SWP/SWPB emulation handler
[    1.327178] omap_voltage_late_init: Voltage driver support not added
[    1.333709] sr_init_by_name: Unable to get voltage domain pointer for VDD mpu
[    1.341033] sr_init_by_name: Unable to get voltage domain pointer for VDD core
[    1.348480] Power Management for TI OMAP4+ devices.
[    1.353729] SmartReflex Class3 initialized
[    1.358428] Loading compiled-in X.509 certificates
[    1.396881] cpu cpu0: Failed to set OPP config
[    1.401702] cpu cpu0: Failed to set OPP config
[    1.408111] Trying to probe devices needed for running init ...
[    1.415283] cpu cpu0: Failed to set OPP config
[   11.414520] cpu cpu0: Failed to set OPP config
[   11.419128] platform fixedregulator-sd: deferred probe pending
[   11.425140] platform fixedregulator-vio_1v8: deferred probe pending
[   11.431579] platform fixedregulator-mmcwl: deferred probe pending
[   11.437835] platform ti-cpufreq: deferred probe pending
[   13.899322] l3init-clkctrl:0068:0: failed to disable
