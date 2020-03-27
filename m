Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27A74195B56
	for <lists+linux-omap@lfdr.de>; Fri, 27 Mar 2020 17:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbgC0Qn6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Mar 2020 12:43:58 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33243 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbgC0Qn5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Mar 2020 12:43:57 -0400
Received: by mail-lj1-f196.google.com with SMTP id f20so10934826ljm.0
        for <linux-omap@vger.kernel.org>; Fri, 27 Mar 2020 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/as+JmASInELkwgMMroyTytycvdO80e/O5XQm7EVJ04=;
        b=N94PB/az/5ogUkEN2H5bSUX/pt39lLxP6TGokNcH47TODKfVNSFWelt+L2lhTIKQtI
         RvVsggxZZqOfj4avuouhfKgFn+jGs5UQSDjPN7kwLmCnKp++4cZYfcFGb2jEGbnHQgOu
         PiU/YZ9gUnHqFV9xF/0jtiPkupWenYH9NgsCN7Q2hn4YYF7IRTnTraedmM/PmRq7MSSi
         PstbSqqfi4tVSDsEQlRlHkERcM3fw/dF4IQxr29o+vGaerHwvdddujg8x2nx4LJBRceU
         iIpIU8bOKijqJJGvJIySuSLVI2fW3NMH2gxT7w2lzJUhF4OkJXtu79+u9b9DSnQsT0Po
         FpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/as+JmASInELkwgMMroyTytycvdO80e/O5XQm7EVJ04=;
        b=jXioLBhNEOjKsdYA1125fxQnPGqYyIgX8yY5TS1rWN0NmhT/RFQ/GA9kutiRHywwfU
         Urp+vPqlVMSbkAcmPaJnisJxQGe959h7gRI/rGRLNdpCaGPdTIJudTmoFvvuqQlc+YDm
         0793B9VBqDcAz91TIjzcbp4DbydUSQsHrByEfPQ5WMNHuCv0TCMfr+SL405aFaKlFRpP
         Sh27QjNCWw+ux+7+9CSck4SpPgsjjxpfRpGHdLILm1Of2ohP8KG3beMzsTj5xr7+BLQY
         S3aQYWwLEVNgM3Fmo3TewUY2gjFNt9Y/cUwSgWIlhaGUrMcdzAHSkVMcpeRcQxuGCO4P
         RTmg==
X-Gm-Message-State: ANhLgQ0L1GmBOQ3mCrPVhi9SvMjOrsM8Eq0zvYYKkZ/BxNTHcUQQD7Ur
        9YdAWwnZGmzqWeUSo2h5ZYrM6nS55QDk3AS7SNKAng==
X-Google-Smtp-Source: APiQypLiDOdZo24P4irE2iCOBbxz0P/Ae40vM0rZyGQiaVc8txobsuxM3AssXxPTAa/sZUhJvWeerCEsmPjhG7t3LXc=
X-Received: by 2002:a2e:8015:: with SMTP id j21mr8570425ljg.165.1585327434686;
 Fri, 27 Mar 2020 09:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv5NxK+F5DX_q1c_wvnhjT_WTZBFJQXLWFeqMXsEcASZg@mail.gmail.com>
In-Reply-To: <CA+G9fYv5NxK+F5DX_q1c_wvnhjT_WTZBFJQXLWFeqMXsEcASZg@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 27 Mar 2020 22:13:43 +0530
Message-ID: <CA+G9fYu-qYP2wJw4p1p_C6_ttwK0fvw+qUnsN9mDuKOv3zGEBw@mail.gmail.com>
Subject: Re: OF: ERROR: Bad of_node_put() on /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/l4per-cm@1700/l4per-clkctrl@28
To:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org
Cc:     lkft-triage@lists.linaro.org, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Benoit Cousson <bcousson@baylibre.com>,
        Carlos Hernandez <ceh@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>, t-kristo@ti.com,
        Olof Johansson <olof@lixom.net>, tomi.valkeinen@ti.com,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The reported problem still happening on arm beagle board x15 device
running Linux next kernel 20200327.

[    0.000000] Linux version 5.6.0-rc7-next-20200327
(TuxBuild@63c63a28ad60) (gcc version 9.2.1 20191130 (Debian 9.2.1-21))
#1 SMP Fri Mar 27 08:19:49 UTC 2020
[    0.000000] CPU: ARMv7 Processor [412fc0f2] revision 2 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] OF: fdt: Machine model: TI AM5728 BeagleBoard-X15
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 64 MiB at 0xfb800000
[    0.000000] OMAP4: Map 0xafe00000 to (ptrval) for dram barrier
[    0.000000] DRA752 ES2.0
[    0.000000] percpu: Embedded 20 pages/cpu s49484 r8192 d24244 u81920
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 522051
[    0.000000] Kernel command line: console=ttyS2,115200n8
root=PARTUUID=faec2ecf-8544-e241-b19d-757e796da607 rw rootfstype=ext4
rootwait
[    0.000000] Dentry cache hash table entries: 131072 (order: 7,
524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 1985888K/2095100K available (13312K kernel
code, 1844K rwdata, 5676K rodata, 2048K init, 424K bss, 43676K
reserved, 65536K cma-reserved, 1245180K highmem)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: RCU event tracing is enabled.
[    0.000000] rcu: RCU restricting CPUs from NR_CPUS=16 to nr_cpu_ids=2.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] random: get_random_bytes called from
start_kernel+0x300/0x4b8 with crng_init=0
[    0.000000] OF: ERROR: Bad of_node_put() on
/ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/ipu-cm@500/ipu1-clkctrl@20
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
  5.6.0-rc7-next-20200327 #1
[    0.000000] Hardware name: Generic DRA74X (Flattened Device Tree)
[    0.000000] [<c0311810>] (unwind_backtrace) from [<c030ba14>]
(show_stack+0x10/0x14)
[    0.000000] [<c030ba14>] (show_stack) from [<c0fb6604>]
(dump_stack+0xbc/0xd0)
[    0.000000] [<c0fb6604>] (dump_stack) from [<c0fbb07c>]
(kobject_put+0xc0/0x104)
[    0.000000] [<c0fbb07c>] (kobject_put) from [<c1639e4c>]
(of_clk_init+0x18c/0x228)
[    0.000000] [<c1639e4c>] (of_clk_init) from [<c1611544>]
(omap_clk_init+0x3c/0x58)
[    0.000000] [<c1611544>] (omap_clk_init) from [<c1611ea8>]
(omap4_sync32k_timer_init+0x8/0x2c)
[    0.000000] [<c1611ea8>] (omap4_sync32k_timer_init) from
[<c161213c>] (omap5_realtime_timer_init+0x8/0x234)
[    0.000000] [<c161213c>] (omap5_realtime_timer_init) from
[<c1600c88>] (start_kernel+0x330/0x4b8)
[    0.000000] [<c1600c88>] (start_kernel) from [<00000000>] (0x0)
[    0.000000] OF: ERROR: Bad of_node_put() on
/ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/l4per-cm@1700/l4per-clkctrl@28
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
  5.6.0-rc7-next-20200327 #1
[    0.000000] Hardware name: Generic DRA74X (Flattened Device Tree)
[    0.000000] [<c0311810>] (unwind_backtrace) from [<c030ba14>]
(show_stack+0x10/0x14)
[    0.000000] [<c030ba14>] (show_stack) from [<c0fb6604>]
(dump_stack+0xbc/0xd0)
[    0.000000] [<c0fb6604>] (dump_stack) from [<c0fbb07c>]
(kobject_put+0xc0/0x104)
[    0.000000] [<c0fbb07c>] (kobject_put) from [<c1639e4c>]
(of_clk_init+0x18c/0x228)
[    0.000000] [<c1639e4c>] (of_clk_init) from [<c1611544>]
(omap_clk_init+0x3c/0x58)
[    0.000000] [<c1611544>] (omap_clk_init) from [<c1611ea8>]
(omap4_sync32k_timer_init+0x8/0x2c)
[    0.000000] [<c1611ea8>] (omap4_sync32k_timer_init) from
[<c161213c>] (omap5_realtime_timer_init+0x8/0x234)
[    0.000000] [<c161213c>] (omap5_realtime_timer_init) from
[<c1600c88>] (start_kernel+0x330/0x4b8)
[    0.000000] [<c1600c88>] (start_kernel) from [<00000000>] (0x0)
[    0.000000] OMAP clockevent source: timer1 at 32786 Hz
[    0.000000] arch_timer: cp15 timer(s) running at 6.14MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x16af5adb9, max_idle_ns: 440795202250 ns
[    0.000005] sched_clock: 56 bits at 6MHz, resolution 162ns, wraps
every 4398046511023ns
[    0.000016] Switching to timer-based delay loop, resolution 162ns
[    0.004217] clocksource: 32k_counter: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 58327039986419 ns
[    0.004225] OMAP clocksource: 32k_counter at 32768 Hz
[    0.010420] ------------[ cut here ]------------


https://lkft.validation.linaro.org/scheduler/job/1317004#L3449

- Naresh
On Wed, 19 Feb 2020 at 21:11, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following error/warning noticed on arm beagleboard x15 running
> linux next  and linux mainline.
>
> [    0.000000] Linux version 5.6.0-rc1 (oe-user@oe-host) (gcc version
> 7.3.0 (GCC)) #1 SMP Fri Feb 14 21:54:55 UTC 2020
> [    0.000000] CPU: ARMv7 Processor [412fc0f2] revision 2 (ARMv7), cr=30c5387d
> ...
> [    0.000000] random: get_random_bytes called from
> start_kernel+0x5d0/0x798 with crng_init=0
> [    0.000000] OF: ERROR: Bad of_node_put() on
> /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/l4per-cm@1700/l4per-clkctrl@28
> [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
>   5.6.0-rc1 #1
> [    0.000000] Hardware name: Generic DRA74X (Flattened Device Tree)
> [    0.000000] Backtrace:
> [    0.000000] [<c040fabc>] (dump_backtrace) from [<c040fdf0>]
> (show_stack+0x20/0x24)
> [    0.000000]  r7:c23f1460 r6:00000000 r5:600000d3 r4:c23f1460
> [    0.000000] [<c040fdd0>] (show_stack) from [<c13e0cf0>]
> (dump_stack+0xe8/0x114)
> [    0.000000] [<c13e0c08>] (dump_stack) from [<c1127c0c>]
> (of_node_release+0xb4/0xcc)
> [    0.000000]  r10:efca9a44 r9:00000001 r8:00000000 r7:00000000
> r6:c23d1250 r5:efca9a44
> [    0.000000]  r4:efca9a70 r3:aac0aa55
> [    0.000000] [<c1127b58>] (of_node_release) from [<c13e6448>]
> (kobject_put+0x11c/0x23c)
> [    0.000000]  r5:c2421020 r4:efca9a70
> [    0.000000] [<c13e632c>] (kobject_put) from [<c1126ed8>]
> (of_node_put+0x24/0x28)
> [    0.000000]  r7:e98f6940 r6:c2201ef4 r5:00000000 r4:e98f6900
> [    0.000000] [<c1126eb4>] (of_node_put) from [<c2047540>]
> (of_clk_init+0x1a4/0x248)
> [    0.000000] [<c204739c>] (of_clk_init) from [<c20141bc>]
> (omap_clk_init+0x4c/0x68)
> [    0.000000]  r10:efc8b8c0 r9:c243129c r8:00000000 r7:c2208700
> r6:00000066 r5:c20daf64
> [    0.000000]  r4:c2432740
> [    0.000000] [<c2014170>] (omap_clk_init) from [<c2014bdc>]
> (omap4_sync32k_timer_init+0x18/0x3c)
> [    0.000000]  r5:c20daf64 r4:c2431240
> [    0.000000] [<c2014bc4>] (omap4_sync32k_timer_init) from
> [<c2014ec8>] (omap5_realtime_timer_init+0x1c/0x258)
> [    0.000000] [<c2014eac>] (omap5_realtime_timer_init) from
> [<c2005a38>] (time_init+0x30/0x44)
> [    0.000000]  r9:c243129c r8:00000000 r7:c2208700 r6:00000066
> r5:c20daf64 r4:c2431240
> [    0.000000] [<c2005a08>] (time_init) from [<c20013bc>]
> (start_kernel+0x604/0x798)
> [    0.000000] [<c2000db8>] (start_kernel) from [<00000000>] (0x0)
> [    0.000000]  r10:30c5387d r9:412fc0f2 r8:8ffdc000 r7:00000000
> r6:30c0387d r5:00000000
> [    0.000000]  r4:c2000330
> [    0.000000] OMAP clockevent source: timer1 at 32786 Hz
> [    0.000000] arch_timer: cp15 timer(s) running at 6.14MHz (phys).
> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
> max_cycles: 0x16af5adb9, max_idle_ns: 440795202250 ns
> [    0.000006] sched_clock: 56 bits at 6MHz, resolution 162ns, wraps
> every 4398046511023ns
> [    0.000028] Switching to timer-based delay loop, resolution 162ns
> [    0.005242] clocksource: 32k_counter: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 58327039986419 ns
> [    0.005261] OMAP clocksource: 32k_counter at 32768 Hz
> [    0.012808] ------------[ cut here ]------------
> [    0.012814] WARNING: CPU: 0 PID: 0 at
> /usr/src/kernel/lib/refcount.c:25 refcount_warn_saturate+0x108/0x174
> [    0.012818] refcount_t: addition on 0; use-after-free.
> [    0.012821] Modules linked in:
> [    0.012828] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc1 #1
> [    0.012831] Hardware name: Generic DRA74X (Flattened Device Tree)
> [    0.012834] Backtrace:
> [    0.012841] [<c040fabc>] (dump_backtrace) from [<c040fdf0>]
> (show_stack+0x20/0x24)
> [    0.012844]  r7:c23f1460 r6:00000000 r5:600000d3 r4:c23f1460
> [    0.012848] [<c040fdd0>] (show_stack) from [<c13e0cf0>]
> (dump_stack+0xe8/0x114)
> [    0.012852] [<c13e0c08>] (dump_stack) from [<c04595d0>] (__warn+0x100/0x118)
> [    0.012856]  r10:efca9a50 r9:c09577c8 r8:00000019 r7:c1c1c6c0
> r6:00000009 r5:00000000
> [    0.012859]  r4:c2201b7c r3:aac0aa55
> [    0.012862] [<c04594d0>] (__warn) from [<c045966c>]
> (warn_slowpath_fmt+0x84/0xc0)
> [    0.012866]  r9:00000009 r8:c09577c8 r7:00000019 r6:c1c1c6c0
> r5:c1c1c6e0 r4:c2208708
> [    0.012870] [<c04595ec>] (warn_slowpath_fmt) from [<c09577c8>]
> (refcount_warn_saturate+0x108/0x174)
> [    0.012873]  r9:c2a34254 r8:c2a33e96 r7:c2a33e96 r6:00000007
> r5:efca9a50 r4:efca9a70
> [    0.012877] [<c09576c0>] (refcount_warn_saturate) from [<c13e6250>]
> (kobject_get+0xa8/0xac)
> [    0.012881] [<c13e61a8>] (kobject_get) from [<c1126eac>]
> (of_node_get+0x24/0x2c)
> [    0.012884]  r4:efca9a44
> [    0.012887] [<c1126e88>] (of_node_get) from [<c1125d3c>]
> (of_fwnode_get+0x44/0x50)
> [    0.012890]  r5:efca9a50 r4:00000007
> [    0.012894] [<c1125cf8>] (of_fwnode_get) from [<c0cbc270>]
> (fwnode_get_nth_parent+0x3c/0x6c)
> [    0.012898] [<c0cbc234>] (fwnode_get_nth_parent) from [<c13f4e44>]
> (fwnode_full_name_string+0x3c/0xa8)
> [    0.012901]  r7:c2a33e96 r6:c1c4d59d r5:c189ae2c r4:00000007
> [    0.012904] [<c13f4e08>] (fwnode_full_name_string) from
> [<c13f686c>] (device_node_string+0x48c/0x4ec)
> [    0.012908]  r10:ffffffff r9:c1bd7a4c r8:efca9a44 r7:c2a33e96
> r6:c1c4d59d r5:c2a34254
> [    0.012911]  r4:c2208708
> [    0.012915] [<c13f63e4>] (device_node_string) from [<c13f843c>]
> (pointer+0x43c/0x4e0)
> [    0.012918]  r10:c2a34254 r9:c2201d3c r8:c2201e90 r7:00000002
> r6:00000000 r5:c2a34254
> [    0.012921]  r4:c2a33e96
> [    0.012925] [<c13f8000>] (pointer) from [<c13f86a8>] (vsnprintf+0x1c8/0x414)
> [    0.012928]  r7:00000002 r6:c1d5476c r5:c1d5476a r4:c2a33e96
> [    0.012931] [<c13f84e0>] (vsnprintf) from [<c13f8908>] (vscnprintf+0x14/0x2c)
> [    0.012935]  r10:00000000 r9:00000000 r8:ffffffff r7:c2a33528
> r6:00000028 r5:600000d3
> [    0.012938]  r4:000003e0
> [    0.012942] [<c13f88f4>] (vscnprintf) from [<c04db308>]
> (vprintk_store+0x44/0x220)
> [    0.012945]  r5:600000d3 r4:c2a33528
> [    0.012949] [<c04db2c4>] (vprintk_store) from [<c04db8a8>]
> (vprintk_emit+0xa0/0x2fc)
> [    0.012953]  r10:00000001 r9:ffffffff r8:00000000 r7:00000000
> r6:00000028 r5:600000d3
> [    0.012956]  r4:c2a33528
> [    0.012959] [<c04db808>] (vprintk_emit) from [<c04dbb34>]
> (vprintk_default+0x30/0x38)
> [    0.012963]  r10:efca9a44 r9:00000001 r8:00000000 r7:ffffe000
> r6:c2201e8c r5:c1d54748
> [    0.012966]  r4:c21a8590
> [    0.012970] [<c04dbb04>] (vprintk_default) from [<c04dc9dc>]
> (vprintk_func+0xe0/0x168)
> [    0.012974] [<c04dc8fc>] (vprintk_func) from [<c04dc1f4>] (printk+0x40/0x5c)
> [    0.012977]  r7:00000000 r6:c23d1250 r5:efca9a44 r4:c2208708
> [    0.012981] [<c04dc1b4>] (printk) from [<c1127c08>]
> (of_node_release+0xb0/0xcc)
> [    0.012984]  r3:00000008 r2:00000000 r1:efca9a44 r0:c1d54748
> [    0.012987]  r4:efca9a70
> [    0.012991] [<c1127b58>] (of_node_release) from [<c13e6448>]
> (kobject_put+0x11c/0x23c)
> [    0.012994]  r5:c2421020 r4:efca9a70
> [    0.012998] [<c13e632c>] (kobject_put) from [<c1126ed8>]
> (of_node_put+0x24/0x28)
> [    0.013001]  r7:e98f6940 r6:c2201ef4 r5:00000000 r4:e98f6900
> [    0.013005] [<c1126eb4>] (of_node_put) from [<c2047540>]
> (of_clk_init+0x1a4/0x248)
> [    0.013009] [<c204739c>] (of_clk_init) from [<c20141bc>]
> (omap_clk_init+0x4c/0x68)
> [    0.013013]  r10:efc8b8c0 r9:c243129c r8:00000000 r7:c2208700
> r6:00000066 r5:c20daf64
> [    0.013016]  r4:c2432740
> [    0.013020] [<c2014170>] (omap_clk_init) from [<c2014bdc>]
> (omap4_sync32k_timer_init+0x18/0x3c)
> [    0.013023]  r5:c20daf64 r4:c2431240
> [    0.013027] [<c2014bc4>] (omap4_sync32k_timer_init) from
> [<c2014ec8>] (omap5_realtime_timer_init+0x1c/0x258)
> [    0.013031] [<c2014eac>] (omap5_realtime_timer_init) from
> [<c2005a38>] (time_init+0x30/0x44)
> [    0.013034]  r9:c243129c r8:00000000 r7:c2208700 r6:00000066
> r5:c20daf64 r4:c2431240
> [    0.013038] [<c2005a08>] (time_init) from [<c20013bc>]
> (start_kernel+0x604/0x798)
> [    0.013042] [<c2000db8>] (start_kernel) from [<00000000>] (0x0)
> [    0.013045]  r10:30c5387d r9:412fc0f2 r8:8ffdc000 r7:00000000
> r6:30c0387d r5:00000000
> [    0.013048]  r4:c2000330
> [    0.013051] irq event stamp: 0
> [    0.013055] hardirqs last  enabled at (0): [<00000000>] 0x0
> [    0.013058] hardirqs last disabled at (0): [<00000000>] 0x0
> [    0.013062] softirqs last  enabled at (0): [<00000000>] 0x0
> [    0.013065] softirqs last disabled at (0): [<00000000>] 0x0
> [    0.013069] ---[ end trace dc03abb39d272e33 ]---
> [    0.013072] ------------[ cut here ]------------
>
> ref:
> https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v5.6-rc1-186-g2019fc96af22/testrun/1221060/log
>
> --
> Linaro LKFT
> https://lkft.linaro.org
