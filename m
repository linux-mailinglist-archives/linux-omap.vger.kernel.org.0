Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B643B2608D
	for <lists+linux-omap@lfdr.de>; Wed, 22 May 2019 11:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbfEVJdr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 May 2019 05:33:47 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33253 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfEVJdr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 May 2019 05:33:47 -0400
Received: by mail-wr1-f66.google.com with SMTP id d9so1485908wrx.0;
        Wed, 22 May 2019 02:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aVLX5cQDCjhDGReTp1ERmn42HbmJx9qx0QQ1N0X7Nng=;
        b=m0nfEzfQT3Sg0CnmzpJIoXVlwsCP2q3DhslKDzlu22vPKgGvvq4/1eFCCfoSr+yXy3
         W5VFUiAFhWfrem9AiUOSy+7VpwVR7bOuXW3VWVaxhG0GDmWxkZ8NF+iYcNfewgQuh/+z
         7Z9Twg17o48LawkmhXaFcQDrjK0hk5dNOjP8iPezjxA26zMz2CDRwQSPji1oHIj3YBrA
         j59ZzDX5m0+p5O/UX0JtULvC7OM4gM4A/Vll6ysSrWcI0NllK9tiJqybpVcKMSw5OSRo
         nxim1IO0rGnp1iYqGe01KG7tquLqypUa6ZniWRzLVpJTt5BvGiuPbMbLe7wQb4P5d7Ab
         +64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aVLX5cQDCjhDGReTp1ERmn42HbmJx9qx0QQ1N0X7Nng=;
        b=jrFq284omHTQgen8H6XR2eZFF1vOUvgnHN51ba1/ts6lwjqeUT/5WU9WtSJV7pR1j0
         7g7jdjftpwGRrA3X8CI53+ekp8bwzNRYYdmt/7P2QT0BXU5nRqRofCeVUvatwIisTqp0
         4GNzqqthJfB/yXIY0mrxGkhilia7lHI5xsYVIa0uApjL6iHtFJgdNOYOeQRNHDKBGLpR
         FfO9RZpLSoEihXA8ZJYqbEtlL5WsFF71A6ISzpqVHKi2ZDXMo62QShHe7oeF7bDMXF0C
         Fe8o7VgTdSKwDsiABWzUMc6GIXcotWiJ31MCKq9uBhmUMh2NWifQqOumeOTmz9PhCfxn
         cS7Q==
X-Gm-Message-State: APjAAAXw6/W2ERcjzgNU8jZ7I7c2fT2pNPTJDV7F8D6ambVGUq6Za8NT
        N3SvMx/GvHNZ32eUPN+Ai6g=
X-Google-Smtp-Source: APXvYqw6CVJI6lFbf3Gnc0H0dM0YyZJh67e384VFUp01n7eLspfglduEyggy0kLhRJHOUAUrrTND1g==
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr41754232wrw.75.1558517625482;
        Wed, 22 May 2019 02:33:45 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id i125sm10825709wmi.2.2019.05.22.02.33.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 02:33:44 -0700 (PDT)
Date:   Wed, 22 May 2019 11:33:41 +0200
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        qemu-devel@nongnu.org, linux-kernel@vger.kernel.org
Subject: Re: Running linux on qemu omap
Message-ID: <20190522093341.GA32154@Red>
References: <20190520190533.GA28160@Red>
 <20190521232323.GD3621@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521232323.GD3621@darkstar.musicnaut.iki.fi>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 22, 2019 at 02:23:23AM +0300, Aaro Koskinen wrote:
> Hi,
> 
> On Mon, May 20, 2019 at 09:05:33PM +0200, Corentin Labbe wrote:
> > Hello
> > 
> > I am working on adding a maximum set of qemu machine on kernelCI.
> 
> That's cool.
> 
> > For OMAP, five machine exists and I fail to boot any of them.
> 
> Which machines?

Hello

qemu-system-arm -M help |grep OMAP
cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
sx1                  Siemens SX1 (OMAP310) V2
sx1-v1               Siemens SX1 (OMAP310) V1

> 
> > The maximum I can get with omap1_defconfig is
> > qemu-system-arm -kernel zImage -nographic -machine cheetah -append 'root=/dev/ram0 console=ttyO0'
> > Uncompressing Linux... done, booting the kernel.
> > then nothing more.
> 
> It's known that omap1_defconfig doesn't work well for QEMU or
> "multi-board" usage. Perhaps the kernel size is now just too big?
> I'm using a custom config for every OMAP1 board anyway...
> 
> > Does someone have a working config+version to share ?
> 
> I have used the below config for OMAP1 SX1 board (the only one I got
> working with QEMU). Unfortunately the functionality is quite limited,
> but it still allows to run e.g. GCC bootstrap & testsuite, that is rare
> nowadays for armv4t.
> 
> I'm using the following command line with qemu-system-arm 3.1.0:
> 
>         -M sx1 \
>         -kernel "sx1-zImage" \
>         -nographic \
>         -drive file="sx1-mmc",if=sd,format=raw \
>         -no-reboot
> 
> This should work with v5.1 kernel.
> 
> I'm also interested to run other OMAP kernels under QEMU, e.g. cheetah
> (the real device, Palm TE works OK with the current mainline), and it
> would be interesting to know why QEMU/kernel has regressed...
> 

thanks, with your config I was able to boot both sx1 and cheetah (by adding CONFIG_MACH_OMAP_PALMTE=y)
Now I need to find what is missing (or in excess) in omap1_defconfig to made it boot

Another obstacle is the disabling of the initrd, perhaps by using sdcard as an "initrd" will do the trick, but the sdcard is ignored for the moment.

(I have added linux-kernel@vger.kernel.org for larger audience in case of someone have n800/n810 working)

Regards

qemu-system-arm -kernel zImage -nographic -machine sx1 -append 'console=ttyS0 root=/dev/sda' -m 256 -cpu ti925t -drive format=qcow2,file=disk.img,if=sd
omap_clkm_write: clocking scheme set to synchronous scalable
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.2.0-rc1-next-20190521-sx1+ (compile@Red) (gcc version 8.2.0 (Gentoo 8.2.0-r6 p1.7)) #7 Wed May 22 11:04:32 CEST 2019
[    0.000000] CPU: ARM925T [54029252] revision 2 (ARMv4T), cr=0000317f
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: OMAP310 based Siemens SX1
[    0.000000] Ignoring tag cmdline (using the default kernel command line)
[    0.000000] Memory policy: Data cache writethrough
[    0.000000] OMAP0310 revision 2 handled as 15xx id: a8858bfac9581f0e
[    0.000000] Clocks: ARM_SYSST: 0x003a DPLL_CTL: 0x2002 ARM_CKCTL: 0x3000
[    0.000000] Clocking rate (xtal/DPLL1/MPU): 12.0/12.0/12.0 MHz
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8128
[    0.000000] Kernel command line: mem=32M console=ttyS0,115200n8
[    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.000000] Memory: 30104K/32768K available (1680K kernel code, 91K rwdata, 292K rodata, 104K init, 62K bss, 2664K reserved, 0K cma-reserved)
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] Total of 64 interrupts in 2 interrupt banks
[    0.000435] sched_clock: 32 bits at 6MHz, resolution 166ns, wraps every 357913940908ns
[    0.000873] clocksource: mpu_timer2: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 318543407797 ns
[    0.003038] Calibrating delay loop... 469.40 BogoMIPS (lpj=2347008)
[    0.191676] pid_max: default: 4096 minimum: 301
[    0.192828] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.192886] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.206350] *** VALIDATE proc ***
[    0.206803] CPU: Testing write buffer coherency: ok
[    0.222891] Setting up static identity map for 0x10008400 - 0x1000842c
[    0.232941] devtmpfs: initialized
[    0.240739] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.240916] futex hash table entries: 16 (order: -5, 192 bytes)
[    0.245376] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.259782] omap_gpio omap_gpio.0: Runtime PM disabled, clock forced on.
[    0.265624] irq: Cannot allocate irq_descs @ IRQ80, assuming pre-allocated
[    0.273854] irq: Cannot allocate irq_descs @ IRQ96, assuming pre-allocated
[    0.276477] MUX: Setting register UART1_TX
[    0.276528]       FUNC_MUX_CTRL_9 (0xfffe1028) = 0x00000000 -> 0x00200000
[    0.276572]       PULL_DWN_CTRL_2 (0xfffe1048) = 0x00000000 -> 0x00000008
[    0.276616] MUX: Setting register UART1_RTS
[    0.276639]       FUNC_MUX_CTRL_9 (0xfffe1028) = 0x00200000 -> 0x00201000
[    0.276663]       PULL_DWN_CTRL_2 (0xfffe1048) = 0x00000008 -> 0x00000009
[    0.276689] MUX: Setting register UART2_TX
[    0.276713]       FUNC_MUX_CTRL_C (0xfffe1034) = 0x00000000 -> 0x08000000
[    0.276736]       PULL_DWN_CTRL_3 (0xfffe104c) = 0x00000000 -> 0x00000008
[    0.276765] MUX: Setting register UART2_RTS
[    0.276790]       FUNC_MUX_CTRL_C (0xfffe1034) = 0x08000000 -> 0x09000000
[    0.276813]       PULL_DWN_CTRL_3 (0xfffe104c) = 0x00000008 -> 0x0000000c
[    0.276839] MUX: Setting register UART3_TX
[    0.276863]       FUNC_MUX_CTRL_6 (0xfffe101c) = 0x00000000 -> 0x00000001
[    0.276886]       PULL_DWN_CTRL_0 (0xfffe1040) = 0x00000000 -> 0x40000000
[    0.278190] MUX: Setting register MMC_CMD
[    0.278220]       FUNC_MUX_CTRL_A (0xfffe102c) = 0x00000000 -> 0x00000000
[    0.278246]       PULL_DWN_CTRL_2 (0xfffe1048) = 0x00000009 -> 0x00000009
[    0.278275] MUX: Setting register MMC_CLK
[    0.278303]       FUNC_MUX_CTRL_A (0xfffe102c) = 0x00000000 -> 0x00000000
[    0.278333] MUX: Setting register MMC_DAT0
[    0.278359]       FUNC_MUX_CTRL_B (0xfffe1030) = 0x00000000 -> 0x00000000
[    0.278391]       PULL_DWN_CTRL_2 (0xfffe1048) = 0x00000009 -> 0x00000009
[    0.282369] Clocking rate (xtal/DPLL1/MPU): 12.0/120.0/120.0 MHz
[    0.284362] DMA support for OMAP15xx initialized
[    0.305623] omap-dma-engine omap-dma-engine: failed to get L1 IRQ: -6
[    0.345197] omap-dma-engine omap-dma-engine: OMAP DMA engine driver
[    0.350775] SCSI subsystem initialized
[    0.352338] omap_i2c omap_i2c.1: Runtime PM disabled, clock forced on.
[    0.352387] omap_i2c omap_i2c.1: Runtime PM disabled, clock forced on.
[    0.354801] omap_i2c omap_i2c.1: bus 1 rev1.1 at 100 kHz
[    0.356226] clocksource: Switched to clocksource mpu_timer2
[    0.373816] workingset: timestamp_bits=30 max_order=13 bucket_order=0
[    0.376643] io scheduler bfq registered
[    0.380205] Serial: 8250/16550 driver, 3 ports, IRQ sharing disabled
[    0.391718] printk: console [ttyS0] disabled
[    0.599303] serial8250.0: ttyS0 at MMIO 0xfffb0000 (irq = 62, base_baud = 750000) is a 16550A
[    0.632021] printk: console [ttyS0] enabled
[    0.837594] serial8250.0: ttyS1 at MMIO 0xfffb0800 (irq = 63, base_baud = 750000) is a 16550A
[    1.044254] serial8250.0: ttyS2 at MMIO 0xfffb9800 (irq = 31, base_baud = 750000) is a 16550A
[    1.047921] i2c /dev entries driver
[    1.050288] mmci-omap mmci-omap.0: Runtime PM disabled, clock forced on.
[    1.050782] mmci-omap mmci-omap.0: Runtime PM disabled, clock forced on.
[    1.090290] clock: disabling unused clocks to save power
[    1.090838] Skipping reset check for DSP domain clock "dsptim_ck"
[    1.091249] Skipping reset check for DSP domain clock "dspxor_ck"
[    1.091646] Skipping reset check for DSP domain clock "dspper_ck"
[    1.092421] random: get_random_bytes called from 0xc0018860 with crng_init=0
[    1.095384] mmci-omap mmci-omap.0: command timeout (CMD52)
[    1.096356] mmci-omap mmci-omap.0: command timeout (CMD52)
[    1.101963] hctosys: unable to open rtc device (rtc0)
[    1.113769] VFS: Cannot open root device "(null)" or unknown-block(0,0): error -6
[    1.114266] Please append a correct "root=" boot option; here are the available partitions:
[    1.115058] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[    1.116009] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0) ]---

