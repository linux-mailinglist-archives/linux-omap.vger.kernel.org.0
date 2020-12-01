Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4792E2CACEF
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 21:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbgLAUBW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 15:01:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgLAUBV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Dec 2020 15:01:21 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D47C0613D4;
        Tue,  1 Dec 2020 12:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7eMtjf+cySS70RWajkyKZtHfc94aexCgpD+8dlIX5iQ=; b=F6NwN8yJIvpiRf0vkm92xj/dt2
        HsR5LyvOnkrs0RtYjlji2eHYlgDH2F6mpZxROZgyqHoHr1ebAMlWyif3Q2FwWann5V42jphV80TC5
        QtHgCoH2ZCaUOXciVEueJkp9onF93MK6d7kh47dRehWG+jkclCoDawIB39PAUtQI0t6g=;
Received: from p200300ccff124e001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff12:4e00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1kkBpH-0003cH-T3; Tue, 01 Dec 2020 21:00:40 +0100
Date:   Tue, 1 Dec 2020 21:00:39 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     linux-mmc@vger.kernel.org,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>
Subject: Bug: Kernel oops during probing of mmc with WL1835 on GTA04A5
Message-ID: <20201201210039.258d3fed@aktux>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

during probing of second mmc host on the GTA04A5 which has a
WL1835 wifi chip attached, I get the following oops. From a first glance
this seems to be a timing sensitive. Maybe it rings some bells for someone.=
..
so I hesitate a bit to start the bisect job.
Wild guessing: bus width is set while mmc module is not active, so registers
are not accessible.
Kernel configuration is omap2plus_defconfig

Regards,
Andreas


[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.10.0-rc6 (andi@aktux) (arm-linux-gnueabihf-g=
cc (Debian 8.3.0-2) 8.3.0, GNU0
[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=3D10c=
5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instr=
uction cache
[    0.000000] OF: fdt: Machine model: Goldelico GTA04A5/Letux 2804
[    0.000000] Memory policy: Data cache writeback
[    0.000000] cma: Reserved 16 MiB at 0xbf000000
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080000000-0x00000000afdfffff]
[    0.000000]   HighMem  [mem 0x00000000afe00000-0x00000000bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000afdfffff]
[    0.000000]   node   0: [mem 0x00000000b0000000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000bffff=
fff]
[    0.000000] CPU: All CPU(s) started in SVC mode.
[    0.000000] OMAP3630/DM3730 ES1.2 (l2cache iva sgx neon isp 192mhz_clk)
[    0.000000] percpu: Embedded 20 pages/cpu s49228 r8192 d24500 u81920
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 259908
[    0.000000] Kernel command line: root=3D/dev/mmcblk0p6 rootfstype=3Dext4=
,ext3,btrfs rootwait console=3DttyS20
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 by=
tes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 byte=
s, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 1005132K/1046528K available (9216K kernel code, 1028=
K rwdata, 2176K rodata, 1024K )
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D2 to nr_cpu_ids=
=3D1.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 1=
0 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D1
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] IRQ: Found an INTC at 0x(ptrval) (revision 4.0) with 96 inte=
rrupts
[    0.000000] random: get_random_bytes called from start_kernel+0x30c/0x54=
c with crng_init=3D0
[    0.000000] Clocking rate (Crystal/Core/MPU): 26.0/400/600 MHz
[    0.000000] OMAP clocksource: 32k_counter at 32768 Hz
[    0.000000] clocksource: 32k_counter: mask: 0xffffffff max_cycles: 0xfff=
fffff, max_idle_ns: 5832703998s
[    0.000030] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps eve=
ry 65535999984741ns
[    0.003356] TI gptimer clockevent: always-on 32768 Hz at /ocp@68000000/t=
arget-module@48318000
[    0.005096] Console: colour dummy device 80x30
[    0.005187] Calibrating delay loop... 600.47 BogoMIPS (lpj=3D3002368)
[    0.053863] pid_max: default: 32768 minimum: 301
[    0.054138] LSM: Security Framework initializing
[    0.054260] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, =
linear)
[    0.054321] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 by=
tes, linear)
[    0.055694] CPU: Testing write buffer coherency: ok
[    0.055816] CPU0: Spectre v2: using BPIALL workaround
[    0.056213] CPU0: thread -1, cpu 0, socket -1, mpidr 0
[    0.057342] Setting up static identity map for 0x80100000 - 0x80100078
[    0.057617] rcu: Hierarchical SRCU implementation.
[    0.058349] smp: Bringing up secondary CPUs ...
[    0.058380] smp: Brought up 1 node, 1 CPU
[    0.058380] SMP: Total of 1 processors activated (600.47 BogoMIPS).
[    0.058410] CPU: All CPU(s) started in SVC mode.
[    0.059234] devtmpfs: initialized
[    0.086822] VFP support v0.3: implementor 41 architecture 3 part 30 vari=
ant c rev 3
[    0.087280] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 19112604462750s
[    0.087310] futex hash table entries: 256 (order: 2, 16384 bytes, linear)
[    0.088806] pinctrl core: initialized pinctrl subsystem
[    0.090850] NET: Registered protocol family 16
[    0.094573] DMA: preallocated 256 KiB pool for atomic coherent allocatio=
ns
[    0.121429] omap_hwmod: mcbsp2_sidetone using broken dt data from mcbsp
[    0.122253] omap_hwmod: mcbsp3_sidetone using broken dt data from mcbsp
[    0.206390] audit: initializing netlink subsys (disabled)
[    0.207855] thermal_sys: Registered thermal governor 'fair_share'
[    0.207855] thermal_sys: Registered thermal governor 'step_wise'
[    0.207885] thermal_sys: Registered thermal governor 'user_space'
[    0.208648] cpuidle: using governor menu
[    0.209106] Reprogramming SDRC clock to 400000000 Hz
[    0.252105] audit: type=3D2000 audit(0.200:1): state=3Dinitialized audit=
_enabled=3D0 res=3D1
[    0.252563] OMAP GPIO hardware version 2.5
[    0.257019] gpio-111 (irda_en): hogged as output/high
[    0.448425] No ATAGs?
[    0.448455] hw-breakpoint: debug architecture 0x4 unsupported.
[    0.478210] iommu: Default domain type: Translated=20
[    0.480072] omap-iommu 480bd400.mmu: 480bd400.mmu registered
[    0.480865] platform 480bc000.isp: Adding to iommu group 0
[    0.483367] vgaarb: loaded
[    0.484069] SCSI subsystem initialized
[    0.490417] omap_i2c 48070000.i2c: bus 0 rev4.4 at 2600 kHz
[    0.511016] omap_i2c 48072000.i2c: bus 1 rev4.4 at 400 kHz
[    0.512695] omap_i2c 48060000.i2c: bus 2 rev4.4 at 100 kHz
[    0.513214] pps_core: LinuxPPS API ver. 1 registered
[    0.513244] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.513275] PTP clock support registered
[    0.515014] clocksource: Switched to clocksource 32k_counter
[    1.539031] VFS: Disk quotas dquot_6.6.0
[    1.539184] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 byt=
es)
[    1.554412] NET: Registered protocol family 2
[    1.555694] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, =
6144 bytes, linear)
[    1.555755] TCP established hash table entries: 8192 (order: 3, 32768 by=
tes, linear)
[    1.555877] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, li=
near)
[    1.556060] TCP: Hash tables configured (established 8192 bind 8192)
[    1.556243] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    1.556304] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, lin=
ear)
[    1.556579] NET: Registered protocol family 1
[    1.557617] RPC: Registered named UNIX socket transport module.
[    1.557647] RPC: Registered udp transport module.
[    1.557678] RPC: Registered tcp transport module.
[    1.557678] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.557708] PCI: CLS 0 bytes, default 64
[    1.566101] hw perfevents: enabled with armv7_cortex_a8 PMU driver, 5 co=
unters available
[    1.568389] Initialise system trusted keyrings
[    1.568878] workingset: timestamp_bits=3D14 max_order=3D18 bucket_order=
=3D4
[    1.570465] NFS: Registering the id_resolver key type
[    1.570526] Key type id_resolver registered
[    1.570556] Key type id_legacy registered
[    1.570617] jffs2: version 2.2. (NAND) (SUMMARY)  =EF=BF=BD=C9=A9 2001-2=
006 Red Hat, Inc.
[    1.571105] Key type asymmetric registered
[    1.571136] Asymmetric key parser 'x509' registered
[    1.571228] bounce: pool size: 64 pages
[    1.571258] io scheduler mq-deadline registered
[    1.571289] io scheduler kyber registered
[    1.597412] omap-dma-engine 48056000.dma-controller: OMAP DMA engine dri=
ver (LinkedList1/2/3 supported)
[    1.609954] pinctrl-single 48002030.pinmux: 284 pins, size 568
[    1.610656] pinctrl-single 48002a00.pinmux: 46 pins, size 92
[    1.611511] pinctrl-single 480025a0.pinmux: 46 pins, size 92
[    1.612030] pinctrl-single 48002274.pinmux_mcbsp1: initialized with no i=
nterrupts
[    1.612060] pinctrl-single 48002274.pinmux_mcbsp1: 10 pins, size 4
[    1.612396] pinctrl-single 480022d8.pinmux_tv_out: initialized with no i=
nterrupts
[    1.612426] pinctrl-single 480022d8.pinmux_tv_out: 4 pins, size 4
[    1.619689] Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
[    1.624481] 4806a000.serial: ttyS0 at MMIO 0x4806a000 (irq =3D 88, base_=
baud =3D 3000000) is a 8250
[    1.626922] 4806c000.serial: ttyS1 at MMIO 0x4806c000 (irq =3D 89, base_=
baud =3D 3000000) is a 8250
[    1.627258] serial serial0: tty port ttyS1 registered
[    1.629028] 49020000.serial: ttyS2 at MMIO 0x49020000 (irq =3D 90, base_=
baud =3D 3000000) is a 8250
[    2.394439] printk: console [ttyS2] enabled
[    2.401123] 49042000.serial: ttyS3 at MMIO 0x49042000 (irq =3D 96, base_=
baud =3D 3000000) is a 8250
[    2.428985] brd: module loaded
[    2.444610] loop: module loaded
[    2.477172] random: fast init done
[    2.486877] twl 0-0048: PIH (irq 23) chaining IRQs 145..153
[    2.492614] twl 0-0048: power (irq 150) chaining IRQs 153..160
[    2.513305] VAUX3: Bringing 2800000uV into 2500000-2500000uV
[    2.558990] twl4030_gpio twl4030-gpio: gpio (irq 145) chaining IRQs 161.=
.178
[    2.587097] mtdoops: mtd device (mtddev=3Dname/number) must be supplied
[    2.601928] libphy: Fixed MDIO Bus: probed
[    2.609924] i2c /dev entries driver
[    2.619293] sdhci: Secure Digital Host Controller Interface driver
[    2.625793] sdhci: Copyright(c) Pierre Ossman
[    2.631317] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.643859] ledtrig-cpu: registered to indicate activity on CPUs
[    2.654022] Initializing XFRM netlink socket
[    2.658843] NET: Registered protocol family 10
[    2.665496] Segment Routing with IPv6
[    2.669311] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    2.676452] NET: Registered protocol family 17
[    2.680969] NET: Registered protocol family 15
[    2.685791] Key type dns_resolver registered
[    2.690795] oprofile: using arm/armv7
[    2.694641] ThumbEE CPU extension supported.
[    2.699157] Registering SWP/SWPB emulation handler
[    2.706512] SmartReflex Class3 initialized
[    2.712371] Loading compiled-in X.509 certificates
[    2.757385] smartreflex 480cb000.smartreflex: omap_sr_probe: SmartReflex=
 driver initialized
[    2.766540] smartreflex 480c9000.smartreflex: omap_sr_probe: SmartReflex=
 driver initialized
[    2.778320] omap-gpmc 6e000000.gpmc: GPMC revision 5.0
[    2.783508] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
[    2.792236] omap2-onenand 4000000.onenand: initializing on CS0 (0x040000=
00), va (ptrval), DMA mode
[    2.801574] Muxed OneNAND 512MB 1.8V 16-bit (0x50)
[    2.806579] OneNAND version =3D 0x0232
[    2.811950] Scanning device for bad blocks
[    2.872314] mmc0: host does not support reading read-only switch, assumi=
ng write-enable
[    2.895294] mmc0: new high speed SDXC card at address aaaa
[    2.905822] mmcblk0: mmc0:aaaa SC64G 59.5 GiB=20
[    3.098297] omap2-onenand 4000000.onenand: optimized timings for 83 MHz
[    3.105010] 5 fixed-partitions partitions found on MTD device 4000000.on=
enand
[    3.112335] Creating 5 MTD partitions on "4000000.onenand":
[    3.118133] 0x000000000000-0x000000080000 : "X-Loader"
[    3.127716] 0x000000080000-0x000000240000 : "U-Boot"
[    3.135925] 0x000000240000-0x000000280000 : "U-Boot Env"
[    3.145904] 0x000000280000-0x000000880000 : "Kernel"
[    3.152587]  mmcblk0: p1 p2 p3 p4 < p5 p6 p7 p8 >
[    3.159393] 0x000000880000-0x000020000000 : "File System"
[    3.179534] omap_hsmmc 480b4000.mmc: omap_device_late_idle: enabled but =
no driver.  Idling
[    3.265594] 8<--- cut here ---
[    3.268707] Unhandled fault: external abort on non-linefetch (0x1028) at=
 0xfa0b402c
[    3.276397] pgd =3D (ptrval)
[    3.279144] [fa0b402c] *pgd=3D48011452(bad)
[    3.283203] Internal error: : 1028 [#1] SMP ARM
[    3.287750] Modules linked in:
[    3.290832] CPU: 0 PID: 7 Comm: kworker/u2:0 Not tainted 5.10.0-rc6 #3
[    3.297393] Hardware name: Generic OMAP36xx (Flattened Device Tree)
[    3.303710] Workqueue: events_unbound async_run_entry_fn
[    3.309082] PC is at omap_hsmmc_set_bus_width+0x8/0x78
[    3.314239] LR is at omap_hsmmc_set_ios+0x11c/0x258
[    3.319152] pc : [<c079787c>]    lr : [<c07996bc>]    psr: 20000013
[    3.325469] sp : c10f9e00  ip : c175c800  fp : 00000066
[    3.330718] r10: c175cb80  r9 : fa0b4000  r8 : 00000000
[    3.335968] r7 : c123e010  r6 : c175ca58  r5 : c175cb80  r4 : c175c800
[    3.342529] r3 : 00000001  r2 : 58ad940c  r1 : fa0b4000  r0 : c175cb80
[    3.349090] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment=
 none
[    3.356262] Control: 10c5387d  Table: 80004019  DAC: 00000051
[    3.362030] Process kworker/u2:0 (pid: 7, stack limit =3D 0x(ptrval))
[    3.368347] Stack: (0xc10f9e00 to 0xc10fa000)
[    3.372741] 9e00: c175c800 00000007 c123e000 c123e010 00000000 c077b2b0 =
c175c800 00000000
[    3.380950] 9e20: c123e000 c077c14c c175c800 c077d284 c175c800 c175c800 =
c123e000 c0799190
[    3.389190] 9e40: 00000000 c1755040 c175cb80 00000000 c123fd68 58ad940c =
00000001 c123e010
[    3.397430] 9e60: 00000000 c0edaec8 00000000 00000000 c0edaec8 00000006 =
ffffe000 c0666728
[    3.405639] 9e80: c123e010 c0f38c28 c0f38c30 00000000 00000000 c066457c =
c123e010 c0edaec8
[    3.413879] 9ea0: c06649bc c0e051c8 00000000 00000000 c0efa4a0 c06648b8 =
00000000 c10f9ef4
[    3.422119] 9ec0: c06649bc c066298c 00000000 c1039e6c c1653738 58ad940c =
c123e010 c123e010
[    3.430328] 9ee0: c0e051c8 c123e054 c100f000 c0663e60 c0e03d00 c123e010 =
00010101 58ad940c
[    3.438568] 9f00: c12642d0 c0f02018 c12642c0 c015da48 c12642d0 c10bbf00 =
c1009400 c100f000
[    3.446807] 9f20: 00000000 c0153b74 c10bc800 c1009400 00000088 c10bbf00 =
c10bbf14 c1009400
[    3.455017] 9f40: 00000088 c1009418 c0e03d00 c1009400 ffffe000 c0153eec =
ffffe000 00000000
[    3.463256] 9f60: c10bbf00 00000000 c10b1ac0 c10b1c40 c10f8000 c0153ec0 =
c10bbf00 c10ebe94
[    3.471466] 9f80: c10b1ae4 c015a9ac 00000001 c10b1c40 c015a87c 00000000 =
00000000 00000000
[    3.479705] 9fa0: 00000000 00000000 00000000 c0100168 00000000 00000000 =
00000000 00000000
[    3.487945] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    3.496154] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 =
00000000 00000000
[    3.504394] [<c079787c>] (omap_hsmmc_set_bus_width) from [<c07996bc>] (o=
map_hsmmc_set_ios+0x11c/0x258)
[    3.513763] [<c07996bc>] (omap_hsmmc_set_ios) from [<c077b2b0>] (mmc_pow=
er_up.part.8+0x3c/0xd0)
[    3.522521] [<c077b2b0>] (mmc_power_up.part.8) from [<c077c14c>] (mmc_st=
art_host+0x88/0x9c)
[    3.530944] [<c077c14c>] (mmc_start_host) from [<c077d284>] (mmc_add_hos=
t+0x58/0x84)
[    3.538726] [<c077d284>] (mmc_add_host) from [<c0799190>] (omap_hsmmc_pr=
obe+0x5fc/0x8c0)
[    3.546874] [<c0799190>] (omap_hsmmc_probe) from [<c0666728>] (platform_=
drv_probe+0x48/0x98)
[    3.555358] [<c0666728>] (platform_drv_probe) from [<c066457c>] (really_=
probe+0x1dc/0x3b4)
[    3.563690] [<c066457c>] (really_probe) from [<c06648b8>] (driver_probe_=
device+0x58/0xb4)
[    3.571929] [<c06648b8>] (driver_probe_device) from [<c066298c>] (bus_fo=
r_each_drv+0x7c/0xc4)
[    3.580505] [<c066298c>] (bus_for_each_drv) from [<c0663e60>] (__device_=
attach_async_helper+0xa4/0xd8)
[    3.589874] [<c0663e60>] (__device_attach_async_helper) from [<c015da48>=
] (async_run_entry_fn+0x3c/0x1)
[    3.599487] [<c015da48>] (async_run_entry_fn) from [<c0153b74>] (process=
_one_work+0x228/0x574)
[    3.608154] [<c0153b74>] (process_one_work) from [<c0153eec>] (worker_th=
read+0x2c/0x5d0)
[    3.616302] [<c0153eec>] (worker_thread) from [<c015a9ac>] (kthread+0x13=
0/0x144)
[    3.623748] [<c015a9ac>] (kthread) from [<c0100168>] (ret_from_fork+0x14=
/0x2c)
[    3.631011] Exception stack(0xc10f9fb0 to 0xc10f9ff8)
[    3.636108] 9fa0:                                     00000000 00000000 =
00000000 00000000
[    3.644317] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    3.652557] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    3.659210] Code: e8bd4070 ea082166 e590c004 e5901024 (e591302c)=20
[    3.665344] ---[ end trace 085f2ded837c839d ]---
[    3.670013] In-band Error seen by MPU  at address 0
[    3.674926] ------------[ cut here ]------------
[    3.679565] WARNING: CPU: 0 PID: 7 at drivers/bus/omap_l3_smx.c:152 omap=
3_l3_app_irq+0xb4/0x120
[    3.688323] Modules linked in:
[    3.691406] CPU: 0 PID: 7 Comm: kworker/u2:0 Tainted: G      D          =
 5.10.0-rc6 #3
[    3.699371] Hardware name: Generic OMAP36xx (Flattened Device Tree)
[    3.705657] Workqueue: events_unbound async_run_entry_fn
[    3.711029] [<c0110c34>] (unwind_backtrace) from [<c010b538>] (show_stac=
k+0x10/0x14)
[    3.718841] [<c010b538>] (show_stack) from [<c09924a8>] (dump_stack+0xc4=
/0xe4)
[    3.726104] [<c09924a8>] (dump_stack) from [<c0137968>] (__warn+0xd8/0x1=
00)
[    3.733123] [<c0137968>] (__warn) from [<c098e0f8>] (warn_slowpath_fmt+0=
x58/0xb8)
[    3.740661] [<c098e0f8>] (warn_slowpath_fmt) from [<c058d284>] (omap3_l3=
_app_irq+0xb4/0x120)
[    3.749145] [<c058d284>] (omap3_l3_app_irq) from [<c019b1c4>] (__handle_=
irq_event_percpu+0x48/0x208)
[    3.758331] [<c019b1c4>] (__handle_irq_event_percpu) from [<c019b3ac>] (=
handle_irq_event_percpu+0x28/0)
[    3.768035] [<c019b3ac>] (handle_irq_event_percpu) from [<c019b44c>] (ha=
ndle_irq_event+0x48/0x6c)
[    3.776977] [<c019b44c>] (handle_irq_event) from [<c019fa90>] (handle_le=
vel_irq+0xc4/0x15c)
[    3.785369] [<c019fa90>] (handle_level_irq) from [<c019a3e0>] (generic_h=
andle_irq+0x30/0x44)
[    3.793853] [<c019a3e0>] (generic_handle_irq) from [<c019a9f4>] (__handl=
e_domain_irq+0x64/0xe0)
[    3.802612] [<c019a9f4>] (__handle_domain_irq) from [<c0100b6c>] (__irq_=
svc+0x6c/0x90)
[    3.810577] Exception stack(0xc10f9cd0 to 0xc10f9d18)
[    3.815673] 9cc0:                                     00000000 00000000 =
c10bda80 00000002
[    3.823883] 9ce0: 00000000 c10ecb40 00000000 00000000 c10f8000 00000000 =
bf000000 ffffe000
[    3.832122] 9d00: 00000000 c10f9d20 00000000 c01e0cd8 40000113 ffffffff
[    3.838775] [<c0100b6c>] (__irq_svc) from [<c01e0cd8>] (acct_collect+0x1=
b0/0x1cc)
[    3.846313] [<c01e0cd8>] (acct_collect) from [<c013ca10>] (do_exit+0x1d0=
/0xb44)
[    3.853668] [<c013ca10>] (do_exit) from [<c010b860>] (die+0x324/0x364)
[    3.860229] [<c010b860>] (die) from [<c01154e0>] (do_DataAbort+0x9c/0xb8)
[    3.867065] [<c01154e0>] (do_DataAbort) from [<c0100ac0>] (__dabt_svc+0x=
60/0xa0)
[    3.874511] Exception stack(0xc10f9db0 to 0xc10f9df8)
[    3.879608] 9da0:                                     c175cb80 fa0b4000 =
58ad940c 00000001
[    3.887817] 9dc0: c175c800 c175cb80 c175ca58 c123e010 00000000 fa0b4000 =
c175cb80 00000066
[    3.896057] 9de0: c175c800 c10f9e00 c07996bc c079787c 20000013 ffffffff
[    3.902709] [<c0100ac0>] (__dabt_svc) from [<c079787c>] (omap_hsmmc_set_=
bus_width+0x8/0x78)
[    3.911102] [<c079787c>] (omap_hsmmc_set_bus_width) from [<c07996bc>] (o=
map_hsmmc_set_ios+0x11c/0x258)
[    3.920471] [<c07996bc>] (omap_hsmmc_set_ios) from [<c077b2b0>] (mmc_pow=
er_up.part.8+0x3c/0xd0)
[    3.929229] [<c077b2b0>] (mmc_power_up.part.8) from [<c077c14c>] (mmc_st=
art_host+0x88/0x9c)
[    3.937622] [<c077c14c>] (mmc_start_host) from [<c077d284>] (mmc_add_hos=
t+0x58/0x84)
[    3.945434] [<c077d284>] (mmc_add_host) from [<c0799190>] (omap_hsmmc_pr=
obe+0x5fc/0x8c0)
[    3.953552] [<c0799190>] (omap_hsmmc_probe) from [<c0666728>] (platform_=
drv_probe+0x48/0x98)
[    3.962066] [<c0666728>] (platform_drv_probe) from [<c066457c>] (really_=
probe+0x1dc/0x3b4)
[    3.970367] [<c066457c>] (really_probe) from [<c06648b8>] (driver_probe_=
device+0x58/0xb4)
[    3.978607] [<c06648b8>] (driver_probe_device) from [<c066298c>] (bus_fo=
r_each_drv+0x7c/0xc4)
[    3.987182] [<c066298c>] (bus_for_each_drv) from [<c0663e60>] (__device_=
attach_async_helper+0xa4/0xd8)
[    3.996551] [<c0663e60>] (__device_attach_async_helper) from [<c015da48>=
] (async_run_entry_fn+0x3c/0x1)
[    4.006164] [<c015da48>] (async_run_entry_fn) from [<c0153b74>] (process=
_one_work+0x228/0x574)
[    4.014831] [<c0153b74>] (process_one_work) from [<c0153eec>] (worker_th=
read+0x2c/0x5d0)
[    4.022979] [<c0153eec>] (worker_thread) from [<c015a9ac>] (kthread+0x13=
0/0x144)
[    4.030426] [<c015a9ac>] (kthread) from [<c0100168>] (ret_from_fork+0x14=
/0x2c)
[    4.037689] Exception stack(0xc10f9fb0 to 0xc10f9ff8)
[    4.042755] 9fa0:                                     00000000 00000000 =
00000000 00000000
[    4.050994] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    4.059204] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    4.065856] ---[ end trace 085f2ded837c839e ]---
