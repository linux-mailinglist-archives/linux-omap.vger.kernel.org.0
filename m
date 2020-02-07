Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F39B155D0B
	for <lists+linux-omap@lfdr.de>; Fri,  7 Feb 2020 18:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgBGRkq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 Feb 2020 12:40:46 -0500
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:34272 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726897AbgBGRkq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 7 Feb 2020 12:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:
        Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=N7VtmXvX5fik5QDufl8i2sAL7YK8CnxgdVcZASZ39Z0=; b=IkvyJvj2tFNjNUagG0FJ6x+8xb
        PoJPxEV9r7Om7xcuLappfPh6Ggc/5je9c+gvWl2976I6zTfAMIEw/V3uYRlfavJVSM4dBMELgm4RU
        27Wux/zFV9V/ZPUfGOjwFOclOPruMTSMIoxc5i3OFoCnpZY4En9cFzscl07mqZEmunlM3IE8lPoUp
        JEKo+XavP/K98SZ1/n++G3om+aEoBV0hDdY55zamZ10jN040glV0h1QoMP/Qn9HWoHPzvmNX3vy+7
        4FyjLPR2tVHUI4I4EPXtz9oZX/Nf0Bd5FiDRvddAoOjZEWZercCQMwkf9twd3sKHpngpoYiETbRhG
        TBATVTAg==;
Received: from deepwater.fritz.box ([192.168.178.25] helo=[0.0.0.0])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1j07cP-0007aH-Jr; Fri, 07 Feb 2020 17:40:41 +0000
To:     linux-omap <linux-omap@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Tony Lindgren <tony@atomide.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        "Arthur D." <spinal.by@gmail.com>
From:   Merlijn Wajer <merlijn@wizzup.org>
Subject: mmc0 on Nokia N900 on Linux 5.4.18
Autocrypt: addr=merlijn@wizzup.org; prefer-encrypt=mutual; keydata=
 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
 /XslHw==
Message-ID: <5362c659-120f-5247-aaa5-7916229300bc@wizzup.org>
Date:   Fri, 7 Feb 2020 18:41:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="P3X7FdCxtknYuCoFFLQiw1Sy3urpNvhLN"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--P3X7FdCxtknYuCoFFLQiw1Sy3urpNvhLN
Content-Type: multipart/mixed; boundary="MF1pkRvnDDZmf7t5lLB7b3KMqLHaDAXb7"

--MF1pkRvnDDZmf7t5lLB7b3KMqLHaDAXb7
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi,

When booting Linux 5.4.18 with omap2plus_defconfig, I no longer get a
/dev/mmcblk0 device - the one corresponding to my microSD card, where
u-boot also loads the kernel from.

This also likely seems to be a regression, but I haven't tried to hunt
it down yet.

Kernel log attached, below.

Cheers,
Merlijn


[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.4.18 (merlijn@kgpe-d16) (gcc version
7.3.0 (Gentoo Hardened 7.3.0-r3 p1.4)) #5 SMP Fri Feb 7 17:43:53 CET 2020=

[    0.000000] CPU: ARMv7 Processor [411fc083] revision 3 (ARMv7),
cr=3D10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing
instruction cache
[    0.000000] OF: fdt: Machine model: Nokia N900
[    0.000000] Malformed early option 'earlycon'
[    0.000000] Memory policy: Data cache writeback
[    0.000000] cma: Reserved 16 MiB at 0x8e800000
[    0.000000] On node 0 totalpages: 65024
[    0.000000]   Normal zone: 572 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 65024 pages, LIFO batch:15
[    0.000000] CPU: All CPU(s) started in SVC mode.
[    0.000000] OMAP3430/3530 ES3.1 (l2cache iva sgx neon isp)
[    0.000000] percpu: Embedded 19 pages/cpu s48780 r8192 d20852 u77824
[    0.000000] pcpu-alloc: s48780 r8192 d20852 u77824 alloc=3D19*4096
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 644=
52
[    0.000000] Kernel command line: console=3Dtty0 console=3DttyS2,115200=

debug earlycon ro rootwait rootfstype=3Dext4 root=3D/dev/mmcblk0p2 init=3D=
/bin/sh
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072
bytes, linear)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 228556K/260096K available (7168K kernel code,
713K rwdata, 2076K rodata, 1024K init, 258K bss, 15156K reserved, 16384K
cma-reserved, 0K highmem)
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D2 to nr_cpu_i=
ds=3D1.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D1
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] IRQ: Found an INTC at 0x(ptrval) (revision 4.0) with 96
interrupts
[    0.000000] random: get_random_bytes called from
start_kernel+0x2b0/0x4e0 with crng_init=3D0
[    0.000000] Clocking rate (Crystal/Core/MPU): 19.2/332/500 MHz
[    0.000000] OMAP clockevent source: timer1 at 32768 Hz
[    0.000000] clocksource: 32k_counter: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 58327039986419 ns
[    0.000000] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps
every 65535999984741ns
[    0.000030] OMAP clocksource: 32k_counter at 32768 Hz
[    0.001770] Console: colour dummy device 80x30
[    0.002624] printk: console [tty0] enabled
[    0.002716] Calibrating delay loop... 496.43 BogoMIPS (lpj=3D2482176)
[    0.047424] pid_max: default: 32768 minimum: 301
[    0.047790] LSM: Security Framework initializing
[    0.048034] Mount-cache hash table entries: 1024 (order: 0, 4096
bytes, linear)
[    0.048126] Mountpoint-cache hash table entries: 1024 (order: 0, 4096
bytes, linear)
[    0.050384] CPU: Testing write buffer coherency: ok
[    0.050567] CPU0: Spectre v2: using BPIALL workaround
[    0.051361] CPU0: thread -1, cpu 0, socket -1, mpidr 0
[    0.053344] Setting up static identity map for 0x80100000 - 0x80100078=

[    0.053802] rcu: Hierarchical SRCU implementation.
[    0.054809] smp: Bringing up secondary CPUs ...
[    0.054870] smp: Brought up 1 node, 1 CPU
[    0.054901] SMP: Total of 1 processors activated (496.43 BogoMIPS).
[    0.054931] CPU: All CPU(s) started in SVC mode.
[    0.056121] devtmpfs: initialized
[    0.101867] VFP support v0.3: implementor 41 architecture 3 part 30
variant c rev 1
[    0.102600] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.102691] futex hash table entries: 256 (order: 2, 16384 bytes, line=
ar)
[    0.105102] pinctrl core: initialized pinctrl subsystem
[    0.108276] NET: Registered protocol family 16
[    0.114807] DMA: preallocated 256 KiB pool for atomic coherent
allocations
[    0.155059] omap_hwmod: mcbsp2_sidetone using broken dt data from mcbs=
p
[    0.156311] omap_hwmod: mcbsp3_sidetone using broken dt data from mcbs=
p
[    0.219299] audit: initializing netlink subsys (disabled)
[    0.221618] cpuidle: using governor menu
[    0.222442] Reprogramming SDRC clock to 332000000 Hz
[    0.231689] audit: type=3D2000 audit(0.220:1): state=3Dinitialized
audit_enabled=3D0 res=3D1
[    0.232086] gpio gpiochip0: (gpio-0-31): added GPIO chardev (254:0)
[    0.232330] gpiochip_setup_dev: registered GPIOs 0 to 31 on device:
gpiochip0 (gpio-0-31)
[    0.232452] OMAP GPIO hardware version 2.5
[    0.234222] gpio gpiochip1: (gpio-32-63): added GPIO chardev (254:1)
[    0.234497] gpiochip_setup_dev: registered GPIOs 32 to 63 on device:
gpiochip1 (gpio-32-63)
[    0.236236] gpio gpiochip2: (gpio-64-95): added GPIO chardev (254:2)
[    0.236480] gpiochip_setup_dev: registered GPIOs 64 to 95 on device:
gpiochip2 (gpio-64-95)
[    0.238403] gpio gpiochip3: (gpio-96-127): added GPIO chardev (254:3)
[    0.238647] gpiochip_setup_dev: registered GPIOs 96 to 127 on device:
gpiochip3 (gpio-96-127)
[    0.240417] gpio gpiochip4: (gpio-128-159): added GPIO chardev (254:4)=

[    0.240661] gpiochip_setup_dev: registered GPIOs 128 to 159 on
device: gpiochip4 (gpio-128-159)
[    0.242401] gpio gpiochip5: (gpio-160-191): added GPIO chardev (254:5)=

[    0.242645] gpiochip_setup_dev: registered GPIOs 160 to 191 on
device: gpiochip5 (gpio-160-191)
[    0.268585] RX-51: Enabling ARM errata 430973 workaround
[    0.270782] hw-breakpoint: debug architecture 0x4 unsupported.
[    0.273437] Reserving DMA channels 0 and 1 for HS ROM code
[    0.273498] OMAP DMA hardware revision 4.0
[    0.331756] omap-dma-engine 48056000.dma-controller: OMAP DMA engine
driver
[    0.337768] iommu: Default domain type: Translated
[    0.340576] omap-iommu 480bd400.mmu: 480bd400.mmu registered
[    0.341461] platform 480bc000.isp: Adding to iommu group 0
[    0.345245] vgaarb: loaded
[    0.346405] SCSI subsystem initialized
[    0.347534] libata version 3.00 loaded.
[    0.348907] pps_core: LinuxPPS API ver. 1 registered
[    0.348937] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    0.349060] PTP clock support registered
[    0.351226] clocksource: Switched to clocksource 32k_counter
[    1.465576] VFS: Disk quotas dquot_6.6.0
[    1.465850] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096
bytes)
[    1.490692] thermal_sys: Registered thermal governor 'fair_share'
[    1.490692] thermal_sys: Registered thermal governor 'step_wise'
[    1.490783] thermal_sys: Registered thermal governor 'user_space'
[    1.492431] NET: Registered protocol family 2
[    1.494049] tcp_listen_portaddr_hash hash table entries: 512 (order:
0, 6144 bytes, linear)
[    1.494171] TCP established hash table entries: 2048 (order: 1, 8192
bytes, linear)
[    1.494293] TCP bind hash table entries: 2048 (order: 2, 16384 bytes,
linear)
[    1.494384] TCP: Hash tables configured (established 2048 bind 2048)
[    1.494659] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)=

[    1.494720] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes,
linear)
[    1.495147] NET: Registered protocol family 1
[    1.496826] RPC: Registered named UNIX socket transport module.
[    1.496887] RPC: Registered udp transport module.
[    1.496948] RPC: Registered tcp transport module.
[    1.496978] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.497009] PCI: CLS 0 bytes, default 64
[    1.502349] hw perfevents: enabled with armv7_cortex_a8 PMU driver, 5
counters available
[    1.506225] Initialise system trusted keyrings
[    1.506896] workingset: timestamp_bits=3D14 max_order=3D16 bucket_orde=
r=3D2
[    1.509490] NFS: Registering the id_resolver key type
[    1.509613] Key type id_resolver registered
[    1.509643] Key type id_legacy registered
[    1.509765] jffs2: version 2.2. (NAND) (SUMMARY)  =C2=A9 2001-2006 Red=

Hat, Inc.
[    1.510559] Key type asymmetric registered
[    1.510620] Asymmetric key parser 'x509' registered
[    1.510681] io scheduler mq-deadline registered
[    1.510742] io scheduler kyber registered
[    1.513214] ti-sysc 480cb024.target-module: sysc_flags 00000100 !=3D
00000110
[    1.514892] ti-sysc 480c9024.target-module: sysc_flags 00000100 !=3D
00000110
[    1.519622] pinctrl-single 48002030.pinmux: 284 pins, size 568
[    1.520507] pinctrl-single 48002a00.pinmux: 46 pins, size 92
[    1.521697] pinctrl-single 480025d8.pinmux: 18 pins, size 36
[    1.529388] Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
[    1.536651] 4806c000.serial: ttyS1 at MMIO 0x4806c000 (irq =3D 89,
base_baud =3D 3000000) is a 8250
[    1.537200] serial serial0: tty port ttyS1 registered
[    1.539031] 49020000.serial: ttyS2 at MMIO 0x49020000 (irq =3D 90,
base_baud =3D 3000000) is a 8250
[    2.342681] printk: console [ttyS2] enabled
[    2.376953] brd: module loaded
[    2.402435] loop: module loaded
[    2.408569] mtdoops: mtd device (mtddev=3Dname/number) must be supplie=
d
[    2.425079] mdio_bus fixed-0: GPIO lookup for consumer reset
[    2.430847] mdio_bus fixed-0: using lookup tables for GPIO lookup
[    2.437164] mdio_bus fixed-0: No GPIO consumer reset found
[    2.442810] libphy: Fixed MDIO Bus: probed
[    2.450592] i2c /dev entries driver
[    2.457183] sdhci: Secure Digital Host Controller Interface driver
[    2.463562] sdhci: Copyright(c) Pierre Ossman
[    2.469024] omap_hsmmc 4809c000.mmc: GPIO lookup for consumer cd
[    2.475219] omap_hsmmc 4809c000.mmc: using device tree for GPIO lookup=

[    2.481964] of_get_named_gpiod_flags: parsed 'cd-gpios' property of
node '/ocp@68000000/mmc@4809c000[0]' - status (0)
[    2.492858] gpio gpiochip5: Persistence not supported for GPIO 0
[    2.498962] omap_gpio 49058000.gpio: Could not set line 0 debounce to
200000 microseconds (-22)
[    2.507843] omap_hsmmc 4809c000.mmc: Got CD GPIO
[    2.512573] omap_hsmmc 4809c000.mmc: GPIO lookup for consumer wp
[    2.518646] omap_hsmmc 4809c000.mmc: using device tree for GPIO lookup=

[    2.525329] of_get_named_gpiod_flags: can't parse 'wp-gpios' property
of node '/ocp@68000000/mmc@4809c000[0]'
[    2.535430] of_get_named_gpiod_flags: can't parse 'wp-gpio' property
of node '/ocp@68000000/mmc@4809c000[0]'
[    2.545410] omap_hsmmc 4809c000.mmc: using lookup tables for GPIO look=
up
[    2.552246] omap_hsmmc 4809c000.mmc: No GPIO consumer wp found
[    2.560211] omap_hsmmc 480b4000.mmc: GPIO lookup for consumer wp
[    2.566406] random: fast init done
[    2.569885] omap_hsmmc 480b4000.mmc: using device tree for GPIO lookup=

[    2.576599] of_get_named_gpiod_flags: can't parse 'wp-gpios' property
of node '/ocp@68000000/mmc@480b4000[0]'
[    2.586700] of_get_named_gpiod_flags: can't parse 'wp-gpio' property
of node '/ocp@68000000/mmc@480b4000[0]'
[    2.596679] omap_hsmmc 480b4000.mmc: using lookup tables for GPIO look=
up
[    2.603515] omap_hsmmc 480b4000.mmc: No GPIO consumer wp found
[    2.611206] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.617736] ledtrig-cpu: registered to indicate activity on CPUs
[    2.628387] oprofile: using arm/armv7
[    2.632812] Initializing XFRM netlink socket
[    2.637542] NET: Registered protocol family 10
[    2.644622] Segment Routing with IPv6
[    2.648529] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    2.656219] NET: Registered protocol family 17
[    2.660797] NET: Registered protocol family 15
[    2.665588] Key type dns_resolver registered
[    2.670288] ThumbEE CPU extension supported.
[    2.674713] Registering SWP/SWPB emulation handler
[    2.683349] SmartReflex Class3 initialized
[    2.688537] Loading compiled-in X.509 certificates
[    2.762573] omap-gpmc 6e000000.gpmc: GPMC revision 5.0
[    2.767852] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
[    2.774230] gpiochip_find_base: found new base at 508
[    2.780029] gpio gpiochip6: (omap-gpmc): added GPIO chardev (254:6)
[    2.786743] gpiochip_setup_dev: registered GPIOs 508 to 511 on
device: gpiochip6 (omap-gpmc)
[    2.796813] omap2-onenand 1000000.onenand: GPIO lookup for consumer in=
t
[    2.803619] omap2-onenand 1000000.onenand: using device tree for GPIO
lookup
[    2.810791] of_get_named_gpiod_flags: can't parse 'int-gpios'
property of node '/ocp@68000000/gpmc@6e000000/onenand@0,0[0]'
[    2.822143] of_get_named_gpiod_flags: can't parse 'int-gpio' property
of node '/ocp@68000000/gpmc@6e000000/onenand@0,0[0]'
[    2.833343] omap2-onenand 1000000.onenand: using lookup tables for
GPIO lookup
[    2.840667] omap2-onenand 1000000.onenand: No GPIO consumer int found
[    2.847259] omap2-onenand 1000000.onenand: initializing on CS0
(0x01000000), va (ptrval), DMA mode
[    2.856384] OneNAND Manufacturer: Unknown (0xa0)
[    2.863067] smc91x 2000000.ethernet: GPIO lookup for consumer power
[    2.869445] smc91x 2000000.ethernet: using device tree for GPIO lookup=

[    2.876220] of_get_named_gpiod_flags: parsed 'power-gpios' property
of node '/ocp@68000000/gpmc@6e000000/ethernet@gpmc[0]' - status (0)
[    2.888702] gpio gpiochip2: Persistence not supported for GPIO 22
[    2.895721] smc91x 2000000.ethernet: GPIO lookup for consumer reset
[    2.902130] smc91x 2000000.ethernet: using device tree for GPIO lookup=

[    2.908813] of_get_named_gpiod_flags: parsed 'reset-gpios' property
of node '/ocp@68000000/gpmc@6e000000/ethernet@gpmc[0]' - status (0)
[    2.921264] gpio gpiochip5: Persistence not supported for GPIO 4
[    2.929260] smc91x: not found (-19).
[    2.938476] Skipping twl internal clock init and using bootloader
value (unknown osc rate)
[    2.953124] twl 1-0048: PIH (irq 23) chaining IRQs 146..154
[    2.958984] twl 1-0048: power (irq 151) chaining IRQs 154..161
[    3.002105] V28_A: Bringing 2600000uV into 2800000-2800000uV
[    3.029388] twl4030_gpio twl4030-gpio: gpio (irq 146) chaining IRQs
162..179
[    3.037200] gpiochip_find_base: found new base at 490
[    3.046600] gpio gpiochip7: (twl4030): added GPIO chardev (254:7)
[    3.053070] gpiochip_setup_dev: registered GPIOs 490 to 507 on
device: gpiochip7 (twl4030)
[    3.118835] omap_i2c 48070000.i2c: bus 1 rev3.3 at 2200 kHz
[    3.129852] omap_i2c 48072000.i2c: bus 2 rev3.3 at 100 kHz
[    3.138824] omap_i2c 48060000.i2c: bus 3 rev3.3 at 400 kHz
[    3.145629] omap_hsmmc 4809c000.mmc: GPIO lookup for consumer cd
[    3.151824] omap_hsmmc 4809c000.mmc: using device tree for GPIO lookup=

[    3.158508] of_get_named_gpiod_flags: parsed 'cd-gpios' property of
node '/ocp@68000000/mmc@4809c000[0]' - status (0)
[    3.169433] gpio gpiochip5: Persistence not supported for GPIO 0
[    3.175598] omap_gpio 49058000.gpio: Could not set line 0 debounce to
200000 microseconds (-22)
[    3.184448] omap_hsmmc 4809c000.mmc: Got CD GPIO
[    3.189147] omap_hsmmc 4809c000.mmc: GPIO lookup for consumer wp
[    3.195281] omap_hsmmc 4809c000.mmc: using device tree for GPIO lookup=

[    3.201965] of_get_named_gpiod_flags: can't parse 'wp-gpios' property
of node '/ocp@68000000/mmc@4809c000[0]'
[    3.212036] of_get_named_gpiod_flags: can't parse 'wp-gpio' property
of node '/ocp@68000000/mmc@4809c000[0]'
[    3.222045] omap_hsmmc 4809c000.mmc: using lookup tables for GPIO look=
up
[    3.228820] omap_hsmmc 4809c000.mmc: No GPIO consumer wp found
[    3.266418] omap_hsmmc 480b4000.mmc: GPIO lookup for consumer wp
[    3.272674] omap_hsmmc 480b4000.mmc: using device tree for GPIO lookup=

[    3.279327] of_get_named_gpiod_flags: can't parse 'wp-gpios' property
of node '/ocp@68000000/mmc@480b4000[0]'
[    3.289459] of_get_named_gpiod_flags: can't parse 'wp-gpio' property
of node '/ocp@68000000/mmc@480b4000[0]'
[    3.299438] omap_hsmmc 480b4000.mmc: using lookup tables for GPIO look=
up
[    3.306274] omap_hsmmc 480b4000.mmc: No GPIO consumer wp found
[    3.346343] hctosys: unable to open rtc device (rtc0)
[    3.352630] smartreflex 480cb000.smartreflex: omap_sr_probe:
SmartReflex driver initialized
[    3.361938] smartreflex 480c9000.smartreflex: omap_sr_probe:
SmartReflex driver initialized
[    3.375061] Waiting for root device /dev/mmcblk0p2...
[    3.740325] mmc1: switch to bus width 8 failed
[    3.745452] mmc1: switch to bus width 4 failed
[    3.749999] mmc1: new high speed MMC card at address 0001
[    3.757476] mmcblk1: mmc1:0001 MMC32G 29.8 GiB
[    3.763092] mmcblk1boot0: mmc1:0001 MMC32G partition 1 512 KiB
[    3.769836] mmcblk1boot1: mmc1:0001 MMC32G partition 2 512 KiB
[    3.779998]  mmcblk1: p1 p2 p3



--MF1pkRvnDDZmf7t5lLB7b3KMqLHaDAXb7--

--P3X7FdCxtknYuCoFFLQiw1Sy3urpNvhLN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRM5LT7NbLF9yb6a/UGN09rynK8WgUCXj2hXQAKCRAGN09rynK8
WqkqAP4tkYYCRSYH7lucwfHgdim6YZxDhFMTIzfgFuDilhTxEgEA2Dw49I2Cmy64
MoqCz5BAJUIRJthN67Jizc7eKEkxmAg=
=cYxU
-----END PGP SIGNATURE-----

--P3X7FdCxtknYuCoFFLQiw1Sy3urpNvhLN--
