Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5DE91648EC
	for <lists+linux-omap@lfdr.de>; Wed, 19 Feb 2020 16:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgBSPlx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Feb 2020 10:41:53 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36296 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgBSPlx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Feb 2020 10:41:53 -0500
Received: by mail-lj1-f193.google.com with SMTP id r19so864973ljg.3
        for <linux-omap@vger.kernel.org>; Wed, 19 Feb 2020 07:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=C0pAMb9cWxL3c13jXCjmi4Oqbb9JWE9jeK5QKo/XUis=;
        b=cty4yFneIi3ATEUunQCu7gBz3YF5Y32/SFviVqFZeCIsQNWW6okOOX96a/diUFnYXs
         atufzs9oe831AJwbfCBcKoTYU1862amF/HxsLOS0RxrHOEGEUGWqnb/jl/XcacH4zG4+
         RnHT/8KhTYkPx+/rkrpn1xppaaxMY+psuffAu1nk5DseFUIJaG0YgirWXiV2pY+UAX71
         XyKFa6na925uEmb1LExeCm5Ab19IajJQFZZcuf4r+80CcGWYSCz+npV7qAEB+dwsZ/4D
         B+PDSyXCJzsH22x+3mpH254cmBJCWss+aw5xTwfXSZOFpdWHtzGEhqApCZuGgXxzWo58
         5/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=C0pAMb9cWxL3c13jXCjmi4Oqbb9JWE9jeK5QKo/XUis=;
        b=DD6fF1XDAzcxynJFbGQxfFtHfehg8zXLCP5v7Phf4rTa0qN4YNhSxv2TTHpvANgtT+
         QwioVrDbE+0e4zD3cLJ+Z+QqgvF3HADYecessAde5E51kw/eG7rk4twbjSt8mMVDQmRU
         88E2uqeKLkyRB9s6CENZiLUFf8P8gezq6hznvCv0xn7NglGDin4/kVMGnuLOmQ9xBzE0
         Ob/puTaJMP7PpV12qhMmFjCuVG43cmEOynBeHOtZANPjHbZKyz69SKEjHXPLiUk6PT3f
         Tko3Q671GTTN47ILNQBWfSf52S1Makk3G/Ac9ffn63WKjBC96CHR8gP2RyHT/Mfg/Rz+
         SwWQ==
X-Gm-Message-State: APjAAAXYvX1mcoJqOHtPRymPtgBEKSoFDYL8KGClLown6iljJEPNjWjN
        Fv+T5GYrJpXk3wZO2U5zv7En9PZsDuEdBOioLPUBAA==
X-Google-Smtp-Source: APXvYqy5BjoMqW4CdAK3lRPjJmw+Fthebx/XnjV0KtytXTq7qsppXt5C6wzKHeX0yFJczzikD0hm35Xh84ifHB4zKjU=
X-Received: by 2002:a2e:9e55:: with SMTP id g21mr16628135ljk.245.1582126910091;
 Wed, 19 Feb 2020 07:41:50 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 19 Feb 2020 21:11:38 +0530
Message-ID: <CA+G9fYv5NxK+F5DX_q1c_wvnhjT_WTZBFJQXLWFeqMXsEcASZg@mail.gmail.com>
Subject: OF: ERROR: Bad of_node_put() on /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/l4per-cm@1700/l4per-clkctrl@28
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

[ Sorry to spam all ]
The following error/warning noticed on arm beagleboard x15 running
linux next  and linux mainline.

[    0.000000] Linux version 5.6.0-rc1 (oe-user@oe-host) (gcc version
7.3.0 (GCC)) #1 SMP Fri Feb 14 21:54:55 UTC 2020
[    0.000000] CPU: ARMv7 Processor [412fc0f2] revision 2 (ARMv7), cr=30c5387d
...
[    0.000000] random: get_random_bytes called from
start_kernel+0x5d0/0x798 with crng_init=0
[    0.000000] OF: ERROR: Bad of_node_put() on
/ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/l4per-cm@1700/l4per-clkctrl@28
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
  5.6.0-rc1 #1
[    0.000000] Hardware name: Generic DRA74X (Flattened Device Tree)
[    0.000000] Backtrace:
[    0.000000] [<c040fabc>] (dump_backtrace) from [<c040fdf0>]
(show_stack+0x20/0x24)
[    0.000000]  r7:c23f1460 r6:00000000 r5:600000d3 r4:c23f1460
[    0.000000] [<c040fdd0>] (show_stack) from [<c13e0cf0>]
(dump_stack+0xe8/0x114)
[    0.000000] [<c13e0c08>] (dump_stack) from [<c1127c0c>]
(of_node_release+0xb4/0xcc)
[    0.000000]  r10:efca9a44 r9:00000001 r8:00000000 r7:00000000
r6:c23d1250 r5:efca9a44
[    0.000000]  r4:efca9a70 r3:aac0aa55
[    0.000000] [<c1127b58>] (of_node_release) from [<c13e6448>]
(kobject_put+0x11c/0x23c)
[    0.000000]  r5:c2421020 r4:efca9a70
[    0.000000] [<c13e632c>] (kobject_put) from [<c1126ed8>]
(of_node_put+0x24/0x28)
[    0.000000]  r7:e98f6940 r6:c2201ef4 r5:00000000 r4:e98f6900
[    0.000000] [<c1126eb4>] (of_node_put) from [<c2047540>]
(of_clk_init+0x1a4/0x248)
[    0.000000] [<c204739c>] (of_clk_init) from [<c20141bc>]
(omap_clk_init+0x4c/0x68)
[    0.000000]  r10:efc8b8c0 r9:c243129c r8:00000000 r7:c2208700
r6:00000066 r5:c20daf64
[    0.000000]  r4:c2432740
[    0.000000] [<c2014170>] (omap_clk_init) from [<c2014bdc>]
(omap4_sync32k_timer_init+0x18/0x3c)
[    0.000000]  r5:c20daf64 r4:c2431240
[    0.000000] [<c2014bc4>] (omap4_sync32k_timer_init) from
[<c2014ec8>] (omap5_realtime_timer_init+0x1c/0x258)
[    0.000000] [<c2014eac>] (omap5_realtime_timer_init) from
[<c2005a38>] (time_init+0x30/0x44)
[    0.000000]  r9:c243129c r8:00000000 r7:c2208700 r6:00000066
r5:c20daf64 r4:c2431240
[    0.000000] [<c2005a08>] (time_init) from [<c20013bc>]
(start_kernel+0x604/0x798)
[    0.000000] [<c2000db8>] (start_kernel) from [<00000000>] (0x0)
[    0.000000]  r10:30c5387d r9:412fc0f2 r8:8ffdc000 r7:00000000
r6:30c0387d r5:00000000
[    0.000000]  r4:c2000330
[    0.000000] OMAP clockevent source: timer1 at 32786 Hz
[    0.000000] arch_timer: cp15 timer(s) running at 6.14MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x16af5adb9, max_idle_ns: 440795202250 ns
[    0.000006] sched_clock: 56 bits at 6MHz, resolution 162ns, wraps
every 4398046511023ns
[    0.000028] Switching to timer-based delay loop, resolution 162ns
[    0.005242] clocksource: 32k_counter: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 58327039986419 ns
[    0.005261] OMAP clocksource: 32k_counter at 32768 Hz
[    0.012808] ------------[ cut here ]------------
[    0.012814] WARNING: CPU: 0 PID: 0 at
/usr/src/kernel/lib/refcount.c:25 refcount_warn_saturate+0x108/0x174
[    0.012818] refcount_t: addition on 0; use-after-free.
[    0.012821] Modules linked in:
[    0.012828] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc1 #1
[    0.012831] Hardware name: Generic DRA74X (Flattened Device Tree)
[    0.012834] Backtrace:
[    0.012841] [<c040fabc>] (dump_backtrace) from [<c040fdf0>]
(show_stack+0x20/0x24)
[    0.012844]  r7:c23f1460 r6:00000000 r5:600000d3 r4:c23f1460
[    0.012848] [<c040fdd0>] (show_stack) from [<c13e0cf0>]
(dump_stack+0xe8/0x114)
[    0.012852] [<c13e0c08>] (dump_stack) from [<c04595d0>] (__warn+0x100/0x118)
[    0.012856]  r10:efca9a50 r9:c09577c8 r8:00000019 r7:c1c1c6c0
r6:00000009 r5:00000000
[    0.012859]  r4:c2201b7c r3:aac0aa55
[    0.012862] [<c04594d0>] (__warn) from [<c045966c>]
(warn_slowpath_fmt+0x84/0xc0)
[    0.012866]  r9:00000009 r8:c09577c8 r7:00000019 r6:c1c1c6c0
r5:c1c1c6e0 r4:c2208708
[    0.012870] [<c04595ec>] (warn_slowpath_fmt) from [<c09577c8>]
(refcount_warn_saturate+0x108/0x174)
[    0.012873]  r9:c2a34254 r8:c2a33e96 r7:c2a33e96 r6:00000007
r5:efca9a50 r4:efca9a70
[    0.012877] [<c09576c0>] (refcount_warn_saturate) from [<c13e6250>]
(kobject_get+0xa8/0xac)
[    0.012881] [<c13e61a8>] (kobject_get) from [<c1126eac>]
(of_node_get+0x24/0x2c)
[    0.012884]  r4:efca9a44
[    0.012887] [<c1126e88>] (of_node_get) from [<c1125d3c>]
(of_fwnode_get+0x44/0x50)
[    0.012890]  r5:efca9a50 r4:00000007
[    0.012894] [<c1125cf8>] (of_fwnode_get) from [<c0cbc270>]
(fwnode_get_nth_parent+0x3c/0x6c)
[    0.012898] [<c0cbc234>] (fwnode_get_nth_parent) from [<c13f4e44>]
(fwnode_full_name_string+0x3c/0xa8)
[    0.012901]  r7:c2a33e96 r6:c1c4d59d r5:c189ae2c r4:00000007
[    0.012904] [<c13f4e08>] (fwnode_full_name_string) from
[<c13f686c>] (device_node_string+0x48c/0x4ec)
[    0.012908]  r10:ffffffff r9:c1bd7a4c r8:efca9a44 r7:c2a33e96
r6:c1c4d59d r5:c2a34254
[    0.012911]  r4:c2208708
[    0.012915] [<c13f63e4>] (device_node_string) from [<c13f843c>]
(pointer+0x43c/0x4e0)
[    0.012918]  r10:c2a34254 r9:c2201d3c r8:c2201e90 r7:00000002
r6:00000000 r5:c2a34254
[    0.012921]  r4:c2a33e96
[    0.012925] [<c13f8000>] (pointer) from [<c13f86a8>] (vsnprintf+0x1c8/0x414)
[    0.012928]  r7:00000002 r6:c1d5476c r5:c1d5476a r4:c2a33e96
[    0.012931] [<c13f84e0>] (vsnprintf) from [<c13f8908>] (vscnprintf+0x14/0x2c)
[    0.012935]  r10:00000000 r9:00000000 r8:ffffffff r7:c2a33528
r6:00000028 r5:600000d3
[    0.012938]  r4:000003e0
[    0.012942] [<c13f88f4>] (vscnprintf) from [<c04db308>]
(vprintk_store+0x44/0x220)
[    0.012945]  r5:600000d3 r4:c2a33528
[    0.012949] [<c04db2c4>] (vprintk_store) from [<c04db8a8>]
(vprintk_emit+0xa0/0x2fc)
[    0.012953]  r10:00000001 r9:ffffffff r8:00000000 r7:00000000
r6:00000028 r5:600000d3
[    0.012956]  r4:c2a33528
[    0.012959] [<c04db808>] (vprintk_emit) from [<c04dbb34>]
(vprintk_default+0x30/0x38)
[    0.012963]  r10:efca9a44 r9:00000001 r8:00000000 r7:ffffe000
r6:c2201e8c r5:c1d54748
[    0.012966]  r4:c21a8590
[    0.012970] [<c04dbb04>] (vprintk_default) from [<c04dc9dc>]
(vprintk_func+0xe0/0x168)
[    0.012974] [<c04dc8fc>] (vprintk_func) from [<c04dc1f4>] (printk+0x40/0x5c)
[    0.012977]  r7:00000000 r6:c23d1250 r5:efca9a44 r4:c2208708
[    0.012981] [<c04dc1b4>] (printk) from [<c1127c08>]
(of_node_release+0xb0/0xcc)
[    0.012984]  r3:00000008 r2:00000000 r1:efca9a44 r0:c1d54748
[    0.012987]  r4:efca9a70
[    0.012991] [<c1127b58>] (of_node_release) from [<c13e6448>]
(kobject_put+0x11c/0x23c)
[    0.012994]  r5:c2421020 r4:efca9a70
[    0.012998] [<c13e632c>] (kobject_put) from [<c1126ed8>]
(of_node_put+0x24/0x28)
[    0.013001]  r7:e98f6940 r6:c2201ef4 r5:00000000 r4:e98f6900
[    0.013005] [<c1126eb4>] (of_node_put) from [<c2047540>]
(of_clk_init+0x1a4/0x248)
[    0.013009] [<c204739c>] (of_clk_init) from [<c20141bc>]
(omap_clk_init+0x4c/0x68)
[    0.013013]  r10:efc8b8c0 r9:c243129c r8:00000000 r7:c2208700
r6:00000066 r5:c20daf64
[    0.013016]  r4:c2432740
[    0.013020] [<c2014170>] (omap_clk_init) from [<c2014bdc>]
(omap4_sync32k_timer_init+0x18/0x3c)
[    0.013023]  r5:c20daf64 r4:c2431240
[    0.013027] [<c2014bc4>] (omap4_sync32k_timer_init) from
[<c2014ec8>] (omap5_realtime_timer_init+0x1c/0x258)
[    0.013031] [<c2014eac>] (omap5_realtime_timer_init) from
[<c2005a38>] (time_init+0x30/0x44)
[    0.013034]  r9:c243129c r8:00000000 r7:c2208700 r6:00000066
r5:c20daf64 r4:c2431240
[    0.013038] [<c2005a08>] (time_init) from [<c20013bc>]
(start_kernel+0x604/0x798)
[    0.013042] [<c2000db8>] (start_kernel) from [<00000000>] (0x0)
[    0.013045]  r10:30c5387d r9:412fc0f2 r8:8ffdc000 r7:00000000
r6:30c0387d r5:00000000
[    0.013048]  r4:c2000330
[    0.013051] irq event stamp: 0
[    0.013055] hardirqs last  enabled at (0): [<00000000>] 0x0
[    0.013058] hardirqs last disabled at (0): [<00000000>] 0x0
[    0.013062] softirqs last  enabled at (0): [<00000000>] 0x0
[    0.013065] softirqs last disabled at (0): [<00000000>] 0x0
[    0.013069] ---[ end trace dc03abb39d272e33 ]---
[    0.013072] ------------[ cut here ]------------

ref:
https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v5.6-rc1-186-g2019fc96af22/testrun/1221060/log

--
Linaro LKFT
https://lkft.linaro.org
