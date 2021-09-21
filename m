Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6C94136D5
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 18:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234347AbhIUQA0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 12:00:26 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36286 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234329AbhIUQA0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 12:00:26 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18LFwmGc020466;
        Tue, 21 Sep 2021 10:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632239928;
        bh=1r3pbvLwn3IwtJFXYKF7t3Wi7jQUxr5lrUGXlXP7aew=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=qIO94xr2i+CjblgbZEP0GU6Iu+SbBiRIBZb32+VA0Nia1kpw+l0RbmYDrnuJ6h1sG
         jhjPjoZ6iBGwtMQl+ZMuZEbr8Y7JslR4TotiGwTwjuu5/Uee3h9onHpFcK48x5JWSD
         cIX6ypBZB8z3UKH74EJJXJGOo5qNCNxdNAIrlt+w=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18LFwmoD028705
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Sep 2021 10:58:48 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Sep 2021 10:58:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Sep 2021 10:58:48 -0500
Received: from [10.250.37.219] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18LFwlLb029991;
        Tue, 21 Sep 2021 10:58:48 -0500
Subject: Re: [PATCH] bus: ti-sysc: Fix external abort for am335x pruss probe
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Kishon Vijay Abraham <kishon@ti.com>
References: <20210915065032.45013-1-tony@atomide.com>
 <3fd1968e-491e-6d98-ec9c-d29baed3158f@ti.com> <YUmP9avkWbsIZmBE@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <d7cb4008-2cf2-c9c3-8187-1ee42dee2dd4@ti.com>
Date:   Tue, 21 Sep 2021 10:58:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUmP9avkWbsIZmBE@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 9/21/21 2:55 AM, Tony Lindgren wrote:
> * Suman Anna <s-anna@ti.com> [210916 16:55]:
>> Let me take a look at this during the weekend. I did verify the AM335x PRUSS
>> when I posted the dts patches on 5.14-rc. You should be able to check as well
>> from your staging branch with PRUSS patches.
> 
> FYI, I just posted what might be a better fix and a test script in thread
> "beaglebone black boot failure Linux v5.15.rc1".
> 
> Regards,
> 
> Tony
> 

I had tested PRUSS on AM335x when I posted the patches originally, and I can
confirm that it is still working with v5.15-rc1 on my beaglebone-black board.

I have added the full log below (using NFS, omap2plus_defconfig + the USB
Networking related configs).

regards
Suman

U-Boot SPL 2016.05-00228-g1a3c095fe1c5 (Jun 01 2016 - 13:32:07)
Trying to boot from MMC2
Card doesn't support part_switch
MMC partition switch failed
*** Warning - MMC partition switch failed, using default environment

U-Boot 2016.05-00228-g1a3c095fe1c5 (Jun 01 2016 - 13:32:07 -0500)

       Watchdog enabled
I2C:   ready
DRAM:  512 MiB
MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
Net:   cpsw, usb_ether
Press SPACE to abort autoboot in 2 seconds
switch to partitions #0, OK
mmc0 is current device
SD/MMC found on device 0
reading boot.scr
** Unable to read file boot.scr **
reading uEnv.txt
2272 bytes read in 12 ms (184.6 KiB/s)
Loaded env from uEnv.txt
Importing environment from mmc0 ...
Running uenvcmd ...
network start
Loading DTB over network ...
link up on port 0, speed 100, full duplex
BOOTP broadcast 1
BOOTP broadcast 2
BOOTP broadcast 3
DHCP client bound to address 192.168.0.140 (1014 ms)
Using cpsw device
TFTP from server 192.168.0.254; our IP address is 192.168.0.140
Filename 'suman/am335x-boneblack.dtb'.
Load address: 0x88000000
Loading: #####
         2.2 MiB/s
done
Bytes transferred = 67151 (1064f hex)
DTB loaded ...
Loading kernel over network ...
link up on port 0, speed 100, full duplex
BOOTP broadcast 1
DHCP client bound to address 192.168.0.140 (3 ms)
Using cpsw device
TFTP from server 192.168.0.254; our IP address is 192.168.0.140
Filename 'suman/zImage'.
Load address: 0x82000000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         ##########################################################
         2.2 MiB/s
done
Bytes transferred = 4661320 (472048 hex)
Kernel loaded ...
network stop
Kernel image @ 0x82000000 [ 0x000000 - 0x472048 ]
## Flattened Device Tree blob at 88000000
   Booting using the fdt blob at 0x88000000
   Loading Device Tree to 8ffec000, end 8ffff64e ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.15.0-rc1 (suman@Irmo)
(arm-none-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture
10.2-2020.11 (arm-10.16)) 10.2.1 20201103, GNU ld (GNU Toolchain for the A-profil1
[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] OF: fdt: Machine model: TI AM335x BeagleBone Black
[    0.000000] Memory policy: Data cache writeback
[    0.000000] cma: Reserved 16 MiB at 0x9e800000
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080000000-0x000000009fdfffff]
[    0.000000]   HighMem  empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x000000009fdfffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000009fdfffff]
[    0.000000] CPU: All CPU(s) started in SVC mode.
[    0.000000] AM335X ES2.0 (sgx neon)
[    0.000000] percpu: Embedded 16 pages/cpu s33740 r8192 d23604 u65536
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 129412
[    0.000000] Kernel command line: root=/dev/nfs rw
nfsroot=192.168.0.254:/home/suman/projects/rfs/am335x/part/release/rfs-20200130,v3,tcp
rootdelay=1 console=ttyO0,115200n8 noinitrd ip=dhcp earlyprintk
[    0.000000] Unknown command line parameters: earlyprintk
[    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes,
linear)
[    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 bytes,
linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 484868K/522240K available (10240K kernel code, 1025K
rwdata, 2184K rodata, 1024K init, 245K bss, 20988K reserved, 16384K
cma-reserved, 0K highmem)
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=2 to nr_cpu_ids=1.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10
jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] IRQ: Found an INTC at 0x(ptrval) (revision 5.0) with 128 interrupts
[    0.000000] random: get_random_bytes called from start_kernel+0x46c/0x6c4
with crng_init=0
[    0.000000] TI gptimer clocksource: always-on
/ocp/interconnect@44c00000/segment@200000/target-module@31000
[    0.000002] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every
89478484971ns
[    0.000029] clocksource: dmtimer: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 79635851949 ns
[    0.000408] TI gptimer clockevent: 24000000 Hz at
/ocp/interconnect@48000000/segment@0/target-module@40000
[    0.001962] Console: colour dummy device 80x30
[    0.002030] WARNING: Your 'console=ttyO0' has been replaced by 'ttyS0'
[    0.002041] This ensures that you still see kernel messages. Please
[    0.002049] update your kernel commandline.
[    0.002097] Calibrating delay loop... 996.14 BogoMIPS (lpj=4980736)
[    0.090519] pid_max: default: 32768 minimum: 301
[    0.090681] LSM: Security Framework initializing
[    0.090773] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.090796] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes,
linear)
[    0.092041] CPU: Testing write buffer coherency: ok
[    0.092116] CPU0: Spectre v2: using BPIALL workaround
[    0.092480] CPU0: thread -1, cpu 0, socket -1, mpidr 0
[    0.093289] Setting up static identity map for 0x80100000 - 0x80100078
[    0.093510] rcu: Hierarchical SRCU implementation.
[    0.094027] smp: Bringing up secondary CPUs ...
[    0.094050] smp: Brought up 1 node, 1 CPU
[    0.094063] SMP: Total of 1 processors activated (996.14 BogoMIPS).
[    0.094075] CPU: All CPU(s) started in SVC mode.
[    0.094745] devtmpfs: initialized
[    0.107849] VFP support v0.3: implementor 41 architecture 3 part 30 variant c
rev 3
[    0.108175] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 19112604462750000 ns
[    0.108212] futex hash table entries: 256 (order: 2, 16384 bytes, linear)
[    0.109568] pinctrl core: initialized pinctrl subsystem
[    0.111358] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.114059] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.114615] audit: initializing netlink subsys (disabled)
[    0.115664] thermal_sys: Registered thermal governor 'fair_share'
[    0.115684] thermal_sys: Registered thermal governor 'step_wise'
[    0.115702] thermal_sys: Registered thermal governor 'user_space'
[    0.116059] cpuidle: using governor menu
[    0.129926] No ATAGs?
[    0.129966] hw-breakpoint: debug architecture 0x4 unsupported.
[    0.137882] Kprobes globally optimized
[    0.138171] audit: type=2000 audit(0.110:1): state=initialized
audit_enabled=0 res=1
[    0.144016] iommu: Default domain type: Translated
[    0.144041] iommu: DMA domain TLB invalidation policy: strict mode
[    0.145338] SCSI subsystem initialized
[    0.146014] usbcore: registered new interface driver usbfs
[    0.146075] usbcore: registered new interface driver hub
[    0.146133] usbcore: registered new device driver usb
[    0.146407] pps_core: LinuxPPS API ver. 1 registered
[    0.146423] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti@linux.it>
[    0.146450] PTP clock support registered
[    0.147765] clocksource: Switched to clocksource dmtimer
[    0.194603] VFS: Disk quotas dquot_6.6.0
[    0.194733] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    0.816443] NET: Registered PF_INET protocol family
[    0.816700] IP idents hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.817600] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144
bytes, linear)
[    0.817658] TCP established hash table entries: 4096 (order: 2, 16384 bytes,
linear)
[    0.817783] TCP bind hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    0.817851] TCP: Hash tables configured (established 4096 bind 4096)
[    0.817986] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.818021] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.818226] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.819321] RPC: Registered named UNIX socket transport module.
[    0.819354] RPC: Registered udp transport module.
[    0.819364] RPC: Registered tcp transport module.
[    0.819372] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.820696] Initialise system trusted keyrings
[    0.821480] workingset: timestamp_bits=14 max_order=17 bucket_order=3
[    0.822627] NFS: Registering the id_resolver key type
[    0.822689] Key type id_resolver registered
[    0.822701] Key type id_legacy registered
[    0.822748] jffs2: version 2.2. (NAND) (SUMMARY)  © 2001-2006 Red Hat, Inc.
[    0.823067] Key type asymmetric registered
[    0.823090] Asymmetric key parser 'x509' registered
[    0.823151] io scheduler mq-deadline registered
[    0.823164] io scheduler kyber registered
[    0.826152] Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
[    0.840350] brd: module loaded
[    0.847319] loop: module loaded
[    0.848373] mtdoops: mtd device (mtddev=name/number) must be supplied
[    0.849636] libphy: Fixed MDIO Bus: probed
[    0.850649] usbcore: registered new interface driver smsc75xx
[    0.850713] usbcore: registered new interface driver smsc95xx
[    0.850736] i2c_dev: i2c /dev entries driver
[    0.851520] cpuidle: enable-method property 'ti,am3352' found operations
[    0.851902] sdhci: Secure Digital Host Controller Interface driver
[    0.851918] sdhci: Copyright(c) Pierre Ossman
[    0.852075] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.852312] ledtrig-cpu: registered to indicate activity on CPUs
[    0.852844] Initializing XFRM netlink socket
[    0.853067] NET: Registered PF_INET6 protocol family
[    0.854430] Segment Routing with IPv6
[    0.854484] In-situ OAM (IOAM) with IPv6
[    0.854584] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    0.855375] NET: Registered PF_PACKET protocol family
[    0.855423] NET: Registered PF_KEY protocol family
[    0.855515] Key type dns_resolver registered
[    0.855615] ThumbEE CPU extension supported.
[    0.855634] Registering SWP/SWPB emulation handler
[    0.856082] omap_voltage_late_init: Voltage driver support not added
[    0.856409] SmartReflex Class3 initialized
[    0.857079] Loading compiled-in X.509 certificates
[    0.887116] pinctrl-single 44e10800.pinmux: 142 pins, size 568
[    0.912937] OMAP GPIO hardware version 0.1
[    0.923885] omap_i2c 4819c000.i2c: bus 2 rev0.11 at 100 kHz
[    0.947695] sdhci-omap 481d8000.mmc: supply vqmmc not found, using dummy
regulator
[    0.997746] davinci_mdio 4a101000.mdio: davinci mdio revision 1.6, bus freq
1000000
[    0.997808] libphy: 4a101000.mdio: probed
[    0.999980] davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00,
driver SMSC LAN8710/LAN8720
[    1.000267] cpsw-switch 4a100000.switch: initialized cpsw ale version 1.4
[    1.000289] cpsw-switch 4a100000.switch: ALE Table size 1024
[    1.000395] cpsw-switch 4a100000.switch: cpts: overflow check period 500
(jiffies)
[    1.000417] cpsw-switch 4a100000.switch: CPTS: ref_clk_freq:250000000
calc_mult:2147483648 calc_shift:29 error:0 nsec/sec
[    1.000513] cpsw-switch 4a100000.switch: Detected MACID = bc:6a:29:79:db:37
[    1.001981] cpsw-switch 4a100000.switch: initialized (regs 0x4a100000, pool
size 256) hw_ver:0019010C 1.12 (0)
[    1.010576] debugfs: Directory '49000000.dma' with parent 'dmaengine' already
present!
[    1.010633] edma 49000000.dma: TI EDMA DMA engine driver
[    1.026629] hw perfevents: enabled with armv7_cortex_a8 PMU driver, 5
counters available
[    1.033795] l3-aon-clkctrl:0000:0: failed to disable
[    1.035717] 44e09000.serial: ttyS0 at MMIO 0x44e09000 (irq = 18, base_baud =
3000000) is a 8250
[    1.949109] printk: console [ttyS0] enabled
[    1.978577] tps65217-pmic: Failed to locate of_node [id: -1]
[    1.987937] random: fast init done
[    1.995192] tps65217-bl: Failed to locate of_node [id: -1]
[    2.003610] tps65217 0-0024: TPS65217 ID 0xe version 1.2
[    2.009638] i2c 0-0070: Fixing up cyclic dependency with 4830e000.lcdc
[    2.016500] omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 kHz
[    2.023834] omap_gpio 44e07000.gpio: Could not set line 6 debounce to 200000
microseconds (-22)
[    2.032666] sdhci-omap 48060000.mmc: Got CD GPIO
[    2.037595] sdhci-omap 48060000.mmc: supply vqmmc not found, using dummy
regulator
[    2.049591] sdhci-omap 481d8000.mmc: supply vqmmc not found, using dummy
regulator
[    2.084407] mmc1: SDHCI controller on 481d8000.mmc [481d8000.mmc] using
External DMA
[    2.092871] mmc0: SDHCI controller on 48060000.mmc [48060000.mmc] using
External DMA
[    2.101508] cpsw-switch 4a100000.switch: starting ndev. mode: dual_mac
[    2.144184] mmc0: new SDHC card at address b368
[    2.149907] mmcblk0: mmc0:b368 SDC   3.84 GiB
[    2.158476]  mmcblk0: p1 p2
[    2.189609] SMSC LAN8710/LAN8720 4a101000.mdio:00: attached PHY driver
(mii_bus:phy_addr=4a101000.mdio:00, irq=POLL)
[    2.205840] mmc1: new high speed MMC card at address 0001
[    2.212426] mmcblk1: mmc1:0001 MMC02G 1.79 GiB
[    2.220446]  mmcblk1: p1 p2
[    2.224404] mmcblk1boot0: mmc1:0001 MMC02G 1.00 MiB
[    2.231868] mmcblk1boot1: mmc1:0001 MMC02G 1.00 MiB
[    2.238890] mmcblk1rpmb: mmc1:0001 MMC02G 128 KiB, chardev (250:0)
[    4.328484] cpsw-switch 4a100000.switch eth0: Link is Up - 100Mbps/Full -
flow control off
[    4.357809] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[    4.387741] Sending DHCP requests ., OK
[    4.431607] IP-Config: Got DHCP answer from 192.168.0.254, my address is
192.168.0.140
[    4.439608] IP-Config: Complete:
[    4.442849]      device=eth0, hwaddr=bc:6a:29:79:db:37, ipaddr=192.168.0.140,
mask=255.255.255.0, gw=192.168.0.254
[    4.453289]      host=192.168.0.140, domain=irmo.internal.ti.com,
nis-domain=(none)
[    4.460998]      bootserver=192.168.0.254, rootserver=192.168.0.254, rootpath=
[    4.461009]      nameserver0=8.8.8.8, nameserver1=8.8.4.4
[    4.474898] Waiting 1 sec before mounting root device...
[    5.540763] VFS: Mounted root (nfs filesystem) on device 0:15.
[    5.547383] devtmpfs: mounted
[    5.551945] Freeing unused kernel image (initmem) memory: 1024K
[    5.568311] Run /sbin/init as init process
[    6.099419] systemd[1]: System time before build time, advancing clock.
[    6.121464] systemd[1]: Failed to insert module 'autofs4': No such file or
directory
[    6.152215] systemd[1]: systemd 239 running in system mode. (+PAM -AUDIT
-SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP -LIBCRYPTSETUP -GCRYPT -GNUTLS
+ACL +XZ -LZ4 -SECCOMP +BLKID -ELFUTILS +KMOD -IDN2 -IDN)
[    6.174563] systemd[1]: Detected architecture arm.

Welcome to Arago 2019.11!

[    6.220735] systemd[1]: Set hostname to <am335x-evm>.
[    6.698098] systemd[1]: File /lib/systemd/system/systemd-journald.service:36
configures an IP firewall (IPAddressDeny=any), but the local system does not
support BPF/cgroup based firewalling.
[    6.715380] systemd[1]: Proceeding WITHOUT firewalling in effect! (This
warning is only shown for the first loaded unit using IP firewalling.)
[    7.380702] random: systemd: uninitialized urandom read (16 bytes read)
[    7.388341] systemd[1]: Listening on initctl Compatibility Named Pipe.
[  OK  ] Listening on initctl Compatibility Named Pipe.
[    7.428171] random: systemd: uninitialized urandom read (16 bytes read)
[    7.438022] systemd[1]: Listening on Journal Socket.
[  OK  ] Listening on Journal Socket.
[    7.468124] random: systemd: uninitialized urandom read (16 bytes read)
[    7.479649] systemd[1]: Created slice system-serial\x2dgetty.slice.
[  OK  ] Created slice system-serial\x2dgetty.slice.
[    7.519933] systemd[1]: Listening on udev Kernel Socket.
[  OK  ] Listening on udev Kernel Socket.
[    7.560106] systemd[1]: Listening on Network Service Netlink Socket.
[  OK  ] Listening on Network Service Netlink Socket.
         Mounting POSIX Message Queue File System...
[  OK  ] Created slice User and Session Slice.
[  OK  ] Reached target Slices.
[  OK  ] Listening on Process Core Dump Socket.
         Mounting Kernel Debug File System...
[  OK  ] Reached target Remote File Systems.
[  OK  ] Started Dispatch Password Requests to Console Directory Watch.
[  OK  ] Listening on Journal Socket (/dev/log).
         Starting Load Kernel Modules...
[  OK  ] Created slice system-getty.slice.
[  OK  ] Started Hardware RNG Entropy Gatherer Daemon.
[  OK  ] Listening on Journal Audit Socket.
         Starting Journal Service...
         Starting Remount Root and Kernel File Systems...
[  OK  ] Started Forward Password Requests to Wall Directory Watch.
[  OK  ] Reached target Paths.
[  OK  ] Listening on udev Control Socket.
         Starting udev Coldplug all Devices...
[  OK  ] Reached target Swap.
         Mounting Temporary Directory (/tmp)...
[  OK  ] Mounted POSIX Message Queue File System.
[  OK  ] Mounted Kernel Debug File System.
[FAILED] Failed to start Load Kernel Modules.
See 'systemctl status systemd-modules-load.service' for details.
[  OK  ] Started Remount Root and Kernel File Systems.
[  OK  ] Mounted Temporary Directory (/tmp).
         Starting Create Static Device Nodes in /dev...
         Starting Apply Kernel Variables...
         Mounting Kernel Configuration File System...
[  OK  ] Mounted Kernel Configuration File System.
[  OK  ] Started Apply Kernel Variables.
[  OK  ] Started Create Static Device Nodes in /dev.
[  OK  ] Started Journal Service.
         Starting Flush Journal to Persistent Storage...
         Starting udev Kernel Device Manager...
[  OK  ] Reached target Local File Systems (Pre).
         Mounting /d...
[  OK  ] Reached target Containers.
         Mounting /media/ram...
         Mounting /var/volatile...
[  OK  ] Mounted /d.
[  OK  ] Mounted /media/ram.
[  OK  ] Mounted /var/volatile.
[    9.686420] systemd-journald[92]: Received request to flush runtime journal
from PID 1
         Starting Load/Save Random Seed...
[  OK  ] Reached target Local File Systems.
[  OK  ] Started Flush Journal to Persistent Storage.
         Starting Create Volatile Files and Directories...
[  OK  ] Started udev Kernel Device Manager.
[  OK  ] Started Load/Save Random Seed.
[  OK  ] Started Create Volatile Files and Directories.
         Starting Update UTMP about System Boot/Shutdown...
         Starting Network Time Synchronization...
         Starting Network Service...
[  OK  ] Started Update UTMP about System Boot/Shutdown.
[   11.862216] random: crng init done
[   11.865681] random: 7 urandom warning(s) missed due to ratelimiting
[  OK  ] Started udev Coldplug all Devices.
[  OK  ] Started Network Service.
         Starting Wait for Network to be Configured...
         Starting Network Name Resolution...
[  OK  ] Started Network Time Synchronization.
[  OK  ] Reached target System Initialization.
         Starting Reboot and dump vmcore via kexec...
[  OK  ] Listening on dropbear.socket.
[  OK  ] Listening on D-Bus System Message Bus Socket.
[  OK  ] Listening on Avahi mDNS/DNS-SD Stack Activation Socket.
[  OK  ] Started Daily Cleanup of Temporary Directories.
[  OK  ] Listening on RPCbind Server Activation Socket.
[  OK  ] Reached target Sockets.
[  OK  ] Reached target Basic System.
         Starting rc.pvr.service...
[  OK  ] Started Job spooling tools.
[  OK  ] Started Periodic Command Scheduler.
         Starting Print notice about GPLv3 packages...
         Starting RPC Bind Service...
         Starting Login Service...
[  OK  ] Started D-Bus System Message Bus.
[  OK  ] Reached target System Time Synchronized.
[  OK  ] Started Daily rotation of log files.
[  OK  ] Reached target Timers.
[  OK  ] Started Reboot and dump vmcore via kexec.
[  OK  ] Started rc.pvr.service.
[  OK  ] Started RPC Bind Service.
[  OK  ] Found device /dev/ttyS0.
[  OK  ] Started Network Name Resolution.
[  OK  ] Reached target Network.
         Starting Lightning Fast Webserver With Light System Requirements...
         Starting Enable and configure wl18xx bluetooth stack...
         Starting Permit User Sessions...
         Starting Avahi mDNS/DNS-SD Stack...
[  OK  ] Reached target Host and Network Name Lookups.
[  OK  ] Started NFS status monitor for NFSv2/3 locking..
         Starting weston.service...
[  OK  ] Started Lightning Fast Webserver With Light System Requirements.
[  OK  ] Started Permit User Sessions.
[  OK  ] Started Enable and configure wl18xx bluetooth stack.
[  OK  ] Found device /dev/ttyS3.
[  OK  ] Started weston.service.
[  OK  ] Started Wait for Network to be Configured.
[  OK  ] Reached target Network is Online.
[  OK  ] Started strongSwan IPsec IKEv1/IKEv2 daemon using ipsec.conf.
[  OK  ] Created slice system-systemd\x2dfsck.slice.
         Starting File System Check on /dev/mmcblk1p2...
         Starting File System Check on /dev/mmcblk0p1...
         Starting File System Check on /dev/mmcblk1p1...
         Starting telnetd.service...
         Starting Matrix GUI...
[  OK  ] Started Serial Getty on ttyS3.
[  OK  ] Started Getty on tty1.
[  OK  ] Started Serial Getty on ttyS0.
[  OK  ] Reached target Login Prompts.
         Starting Synchronize System and HW clocks...
[  OK  ] Started telnetd.service.
[FAILED] Failed to start Synchronize System and HW clocks.
See 'systemctl status sync-clocks.service' for details.
[  OK  ] Started Matrix GUI.
         Starting LSB: network benchmark...
         Starting thttpd.service...
[  OK  ] Started File System Check on /dev/mmcblk1p2.
         Mounting /run/media/mmcblk1p2...
[  OK  ] Started LSB: network benchmark.
[  OK  ] Started thttpd.service.
         Starting thermal-zone-init.service...
         Starting parse-ip.service...
[  OK  ] Started File System Check on /dev/mmcblk0p1.
[   39.838509] EXT4-fs (mmcblk1p2): mounted filesystem with ordered data mode.
Opts: (null). Quota mode: none.
[  OK  ] Found device /dev/mmcblk0p2.
***************************************************************
***************************************************************
NOTICE: This file system contains the following GPLv3 packages:
        autoconf
        bash
        bc
        binutils
        cifs-utils
        cpio
        cpp-symlinks
        cpp
        dosfstools
        elfutils
        g++-symlinks
        g++
        gawk
        gcc-symlinks
        gcc
        gdb
        gdbserver
        gettext
        glmark2
        gstreamer1.0-libav
        gzip
        libbfd
        libdw1
        libelf1
        libgdbm-compat4
        libgdbm6
        libgettextlib
        libgettextsrc
        libgmp10
        libidn2-0
        libmpc3
        libmpfr6
        libreadline7
        libunistring2
        m4
        make
        nettle
        pdm-anomaly-detection
        which

[  OK  ] Mounted /run/media/mmcblk1p2.
If you do not wish to distribute GPLv3 components please remove
the above packages prior to distribution.  This can be done using
the opkg remove command.  i.e.:
    opkg remove <package>
Where <package> is the name printed in the list above

NOTE: If the package is a dependency of another package you
      will be notified of the dependent packages.  You should
      use the --force-removal-of-dependent-packages option to
      also remove the dependent packages as well
***************************************************************
***************************************************************
[  OK  ] Started thermal-zone-init.service.
[  OK  ] Started Print notice about GPLv3 packages.
[  OK  ] Started parse-ip.service.
         Starting File System Check on /dev/mmcblk0p2...
         Mounting /run/media/mmcblk0p1...

 _____                    _____           _         _
|  _  |___ ___ ___ ___   |  _  |___ ___  |_|___ ___| |_
|     |  _| .'| . | . |  |   __|  _| . | | | -_|  _|  _|
|__|__|_| |__,|_  |___|  |__|  |_| |___|_| |___|___|_|
              |___|                    |___|

Arago Project http://arago-project.org am335x-evm ttyS0

Arago 2019.11 am335x-evm ttyS0

am335x-evm login: [   43.658925] audit: type=1701 audit(1580168616.560:2):
auid=4294967295 uid=0 gid=0 ses=4294967295 pid=927 comm="matrix_browser"
exe="/usr/bin/matrix_browser" sig=6 res=1

 _____                    _____           _         _
|  _  |___ ___ ___ ___   |  _  |___ ___  |_|___ ___| |_
|     |  _| .'| . | . |  |   __|  _| . | | | -_|  _|  _|
|__|__|_| |__,|_  |___|  |__|  |_| |___|_| |___|___|_|
              |___|                    |___|

Arago Project http://arago-project.org am335x-evm ttyS0

Arago 2019.11 am335x-evm ttyS0

am335x-evm login: [   44.952272] EXT4-fs (mmcblk0p2): mounted filesystem with
ordered data mode. Opts: (null). Quota mode: none.
root
[   46.978959] audit: type=1006 audit(1580168619.880:3): pid=1031 uid=0
old-auid=4294967295 auid=0 tty=(none) old-ses=4294967295 ses=1 res=1
[   46.991571] audit: type=1300 audit(1580168619.880:3): arch=40000028 syscall=4
per=800000 success=yes exit=1 a0=8 a1=bee10454 a2=1 a3=0 items=0 ppid=1 pid=1031
auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 )
[   47.198024] audit: type=1327 audit(1580168619.880:3): proctitle="(systemd)"
root@am335x-evm:~#
root@am335x-evm:~#
root@am335x-evm:~# uname -a
Linux am335x-evm 5.15.0-rc1 #9 SMP Tue Sep 21 10:46:37 CDT 2021 armv7l GNU/Linux
root@am335x-evm:~#
root@am335x-evm:~# ls -l /sys/bus/platform/devices/ | grep pru
lrwxrwxrwx    1 root     root             0 Jan 27 23:43 4a300000.pruss ->
../../../devices/platform/ocp/4a000000.interconnect/4a000000.interconnect:segment@0/4a326000.target-module/4a300000.pruss
root@am335x-evm:~#
root@am335x-evm:~# omapconf dump prcm per | grep PRU
Error: I2C Read failed
Error: I2C Read failed
Error: I2C Read failed
Error: I2C Read failed
| CM_PER_PRU_ICSS_CLKCTRL    | 0x44E000E8   | 0x00070000 |
| CM_PER_PRU_ICSS_CLKSTCTRL  | 0x44E00140   | 0x00000001 |
root@am335x-evm:~# omapconf dump prcm per | grep RST
Error: I2C Read failed
Error: I2C Read failed
Error: I2C Read failed
Error: I2C Read failed
| RM_PER_RSTCTRL    | 0x44E00C00   | 0x00000003 |
| PM_PER_PWRSTST    | 0x44E00C08   | 0x01E60007 |
| PM_PER_PWRSTCTRL  | 0x44E00C0C   | 0xEE0000EB |
root@am335x-evm:~#
root@am335x-evm:~# cd /rpmsg/opensrc/
root@am335x-evm:/rpmsg/opensrc# insmod pruss.ko
root@am335x-evm:/rpmsg/opensrc# omapconf dump prcm per | grep PRU
Error: I2C Read failed
Error: I2C Read failed
Error: I2C Read failed
Error: I2C Read failed
| CM_PER_PRU_ICSS_CLKCTRL    | 0x44E000E8   | 0x00040002 |
| CM_PER_PRU_ICSS_CLKSTCTRL  | 0x44E00140   | 0x00000072 |
root@am335x-evm:/rpmsg/opensrc# omapconf dump prcm per | grep RST
Error: I2C Read failed
Error: I2C Read failed
Error: I2C Read failed
Error: I2C Read failed
| RM_PER_RSTCTRL    | 0x44E00C00   | 0x00000001 |
| PM_PER_PWRSTST    | 0x44E00C08   | 0x01E60007 |
| PM_PER_PWRSTCTRL  | 0x44E00C0C   | 0xEE0000EB |
root@am335x-evm:/rpmsg/opensrc#
root@am335x-evm:/rpmsg/opensrc# ls -l /sys/bus/platform/devices/ | grep pru
lrwxrwxrwx    1 root     root             0 Jan 27 23:43 4a300000.pruss ->
../../../devices/platform/ocp/4a000000.interconnect/4a000000.interconnect:segment@0/4a326000.target-module/4a300000.pruss
lrwxrwxrwx    1 root     root             0 Jan 27 23:44
4a320000.interrupt-controller ->
../../../devices/platform/ocp/4a000000.interconnect/4a000000.interconnect:segment@0/4a326000.target-module/4a300000.prusr
lrwxrwxrwx    1 root     root             0 Jan 27 23:44 4a326000.cfg ->
../../../devices/platform/ocp/4a000000.interconnect/4a000000.interconnect:segment@0/4a326000.target-module/4a300000.pruss/4a326000.cfg
lrwxrwxrwx    1 root     root             0 Jan 27 23:44 4a332000.mii-rt ->
../../../devices/platform/ocp/4a000000.interconnect/4a000000.interconnect:segment@0/4a326000.target-module/4a300000.pruss/4a332000.miit
lrwxrwxrwx    1 root     root             0 Jan 27 23:44 4a334000.pru ->
../../../devices/platform/ocp/4a000000.interconnect/4a000000.interconnect:segment@0/4a326000.target-module/4a300000.pruss/4a334000.pru
lrwxrwxrwx    1 root     root             0 Jan 27 23:44 4a338000.pru ->
../../../devices/platform/ocp/4a000000.interconnect/4a000000.interconnect:segment@0/4a326000.target-module/4a300000.pruss/4a338000.pru
root@am335x-evm:/rpmsg/opensrc# devmem2 0x4a326000
/dev/mem opened.
Memory mapped at address 0xb6f9f000.
Read at address  0x4A326000 (0xb6f9f000): 0x47000000
root@am335x-evm:/rpmsg/opensrc#



