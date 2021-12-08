Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0288A46D512
	for <lists+linux-omap@lfdr.de>; Wed,  8 Dec 2021 15:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232640AbhLHOKp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Dec 2021 09:10:45 -0500
Received: from mail.archive.org ([207.241.224.6]:49510 "EHLO mail.archive.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231363AbhLHOKp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 8 Dec 2021 09:10:45 -0500
Received: from mail.archive.org (localhost [127.0.0.1])
        by mail.archive.org (Postfix) with ESMTP id A2D012F840;
        Wed,  8 Dec 2021 14:07:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.archive.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
        autolearn=disabled version=3.4.2
Received: from [0.0.0.0] (unknown [45.83.235.159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: merlijn@archive.org)
        by mail.archive.org (Postfix) with ESMTPSA id 077E22F543;
        Wed,  8 Dec 2021 14:07:10 +0000 (UTC)
Subject: Re: Oops while booting 5.15.2 on Nokia N900
From:   "Merlijn B.W. Wajer" <merlijn@archive.org>
To:     linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andreas Kemnade <andreas@kemnade.info>
References: <12e13327-3bb5-229e-d784-cd528db4b58e@archive.org>
 <6fa3d07a-28e5-7853-e6ca-fc405d3080e4@archive.org>
Message-ID: <c75ac850-7d9b-6263-a046-57c8f4435090@archive.org>
Date:   Wed, 8 Dec 2021 15:12:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6fa3d07a-28e5-7853-e6ca-fc405d3080e4@archive.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Envelope-From: <merlijn@archive.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello again,

I am back with a bit more news, but no solution.

I've been trying to figure out when this problem might have been
introduced. It looks like v5.9 did not have the problem yet, then v5.10
has a (different or similar?) problem which prevents booting [1], which
looks like it was addressed in Andreas' upstream commit
ec76c2eea903947202098090bbe07a739b5246e9 ("ARM: OMAP2+: omap_device: fix
idling of devices during probe"). No kernel after v5.10 is free of the
issue, but I am not sure how to continue the search.

It looks like the problem was likely introduced between v5.9 and v5.10.

If I take linux-5.10.y (5.10.84), I can boot some of the times, but the
problem occurs still (like with every kernel thereafter).

How would you suggest I bisect this issue now? v5.10 boot some of times
(like any anything after it) with commit
21b2cec61c04bd175f0860d9411a472d5a0e7ba1 ("mmc: Set
PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4") reverted.

That would suggest the problem is not introduced in any of the stable
patches to v5.10. Should I attempt to bisect (between v5.9 and v5.10)
this problem and revert 21b2cec61c04bd175f0860d9411a472d5a0e7ba1 where
appropriate (if it exists), or perhaps cherry pick commit
ec76c2eea903947202098090bbe07a739b5246e9 (when appropriate) ?

Regards,
Merlijn


[1]

> [    4.602050] omap_hsmmc 4809c000.mmc: omap_device_late_idle: enabled but no driver.  Idling
> [    4.610778] omap_hsmmc 480b4000.mmc: omap_device_late_idle: enabled but no driver.  Idling
> [    4.622741] In-band Error seen by MPU  at address 0
> [    4.627685] ------------[ cut here ]------------
> [    4.632354] WARNING: CPU: 0 PID: 7 at drivers/bus/omap_l3_smx.c:152 omap3_l3_app_irq+0x10c/0x130
> [    4.641204] Modules linked in:
> [    4.644287] CPU: 0 PID: 7 Comm: kworker/u2:0 Not tainted 5.10.0 #9
> [    4.650512] Hardware name: Nokia RX-51 board
> [    4.654846] Workqueue: events_unbound async_run_entry_fn
> [    4.660247] [<c0110924>] (unwind_backtrace) from [<c010b1f4>] (show_stack+0x10/0x14)
> [    4.668060] [<c010b1f4>] (show_stack) from [<c09c8478>] (dump_stack+0xc0/0xdc)
> [    4.675354] [<c09c8478>] (dump_stack) from [<c0138564>] (__warn+0xd4/0x140)
> [    4.682373] [<c0138564>] (__warn) from [<c09c3f3c>] (warn_slowpath_fmt+0x60/0xbc)
> [    4.689910] [<c09c3f3c>] (warn_slowpath_fmt) from [<c05a444c>] (omap3_l3_app_irq+0x10c/0x130)
> [    4.698486] [<c05a444c>] (omap3_l3_app_irq) from [<c019d3f8>] (__handle_irq_event_percpu+0x58/0x208)
> [    4.707702] [<c019d3f8>] (__handle_irq_event_percpu) from [<c019d694>] (handle_irq_event+0x68/0xd4)
> [    4.716827] [<c019d694>] (handle_irq_event) from [<c01a1c4c>] (handle_level_irq+0xc4/0x1c8)
> [    4.725219] [<c01a1c4c>] (handle_level_irq) from [<c019cc90>] (__handle_domain_irq+0x84/0xfc)
> [    4.733825] [<c019cc90>] (__handle_domain_irq) from [<c0100b6c>] (__irq_svc+0x6c/0x90)
> [    4.741790] Exception stack(0xc10d3df8 to 0xc10d3e40)
> [    4.746856] 3de0:                                                       c17ef3b0 20000013
> [    4.755096] 3e00: 00000000 00000002 c17ef000 00000000 c17ef3b0 00000000 c124e810 00000000
> [    4.763336] 3e20: c1248f40 00000066 00000000 c10d3e48 c07c3fd8 c09d5f20 60000013 ffffffff
> [    4.771575] [<c0100b6c>] (__irq_svc) from [<c09d5f20>] (_raw_spin_unlock_irqrestore+0x20/0x24)
> [    4.780273] [<c09d5f20>] (_raw_spin_unlock_irqrestore) from [<c07c3fd8>] (omap_hsmmc_probe+0x4ec/0x9cc)
> [    4.789733] [<c07c3fd8>] (omap_hsmmc_probe) from [<c0685ba4>] (platform_drv_probe+0x48/0x98)
> [    4.798248] [<c0685ba4>] (platform_drv_probe) from [<c06839b4>] (really_probe+0x208/0x4a0)
> [    4.806579] [<c06839b4>] (really_probe) from [<c0683f40>] (driver_probe_device+0x58/0xb4)
> [    4.814819] [<c0683f40>] (driver_probe_device) from [<c06819c8>] (bus_for_each_drv+0x84/0xc8)
> [    4.823394] [<c06819c8>] (bus_for_each_drv) from [<c0683198>] (__device_attach_async_helper+0xa0/0xd0)
> [    4.832763] [<c0683198>] (__device_attach_async_helper) from [<c0160458>] (async_run_entry_fn+0x3c/0x100)
> [    4.842407] [<c0160458>] (async_run_entry_fn) from [<c0155660>] (process_one_work+0x1ec/0x53c)
> [    4.851074] [<c0155660>] (process_one_work) from [<c01559f8>] (worker_thread+0x48/0x594)
> [    4.859222] [<c01559f8>] (worker_thread) from [<c015b738>] (kthread+0x130/0x144)
> [    4.866699] [<c015b738>] (kthread) from [<c0100168>] (ret_from_fork+0x14/0x2c)
> [    4.873962] Exception stack(0xc10d3fb0 to 0xc10d3ff8)
> [    4.879058] 3fa0:                                     00000000 00000000 00000000 00000000
> [    4.887268] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    4.895507] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    4.902160] ---[ end trace c76b7828d6f2f576 ]---
> [    4.908721] In-band Error seen by MPU  at address 0
> [    4.913635] ------------[ cut here ]------------
> [    4.918304] WARNING: CPU: 0 PID: 50 at drivers/bus/omap_l3_smx.c:152 omap3_l3_app_irq+0x10c/0x130
> [    4.927246] Modules linked in:
> [    4.930328] CPU: 0 PID: 50 Comm: kworker/u2:1 Tainted: G        W         5.10.0 #9
> [    4.938049] Hardware name: Nokia RX-51 board
> [    4.942352] Workqueue: events_unbound async_run_entry_fn
> [    4.947753] [<c0110924>] (unwind_backtrace) from [<c010b1f4>] (show_stack+0x10/0x14)
> [    4.955566] [<c010b1f4>] (show_stack) from [<c09c8478>] (dump_stack+0xc0/0xdc)
> [    4.962829] [<c09c8478>] (dump_stack) from [<c0138564>] (__warn+0xd4/0x140)
> [    4.969848] [<c0138564>] (__warn) from [<c09c3f3c>] (warn_slowpath_fmt+0x60/0xbc)
> [    4.977386] [<c09c3f3c>] (warn_slowpath_fmt) from [<c05a444c>] (omap3_l3_app_irq+0x10c/0x130)
> [    4.985992] [<c05a444c>] (omap3_l3_app_irq) from [<c019d3f8>] (__handle_irq_event_percpu+0x58/0x208)
> [    4.995178] [<c019d3f8>] (__handle_irq_event_percpu) from [<c019d694>] (handle_irq_event+0x68/0xd4)
> [    5.004302] [<c019d694>] (handle_irq_event) from [<c01a1c4c>] (handle_level_irq+0xc4/0x1c8)
> [    5.012725] [<c01a1c4c>] (handle_level_irq) from [<c019cc90>] (__handle_domain_irq+0x84/0xfc)
> [    5.021301] [<c019cc90>] (__handle_domain_irq) from [<c0100b6c>] (__irq_svc+0x6c/0x90)
> [    5.029266] Exception stack(0xc160ddf8 to 0xc160de40)
> [    5.034362] dde0:                                                       c28a7bb0 20000013
> [    5.042572] de00: 00000000 00000002 c28a7800 00000000 c28a7bb0 00000000 c124c410 00000000
> [    5.050811] de20: c1248400 00000063 00000000 c160de48 c07c3fd8 c09d5f20 60000013 ffffffff
> [    5.059051] [<c0100b6c>] (__irq_svc) from [<c09d5f20>] (_raw_spin_unlock_irqrestore+0x20/0x24)
> [    5.067749] [<c09d5f20>] (_raw_spin_unlock_irqrestore) from [<c07c3fd8>] (omap_hsmmc_probe+0x4ec/0x9cc)
> [    5.077209] [<c07c3fd8>] (omap_hsmmc_probe) from [<c0685ba4>] (platform_drv_probe+0x48/0x98)
> [    5.085723] [<c0685ba4>] (platform_drv_probe) from [<c06839b4>] (really_probe+0x208/0x4a0)
> [    5.094024] [<c06839b4>] (really_probe) from [<c0683f40>] (driver_probe_device+0x58/0xb4)
> [    5.102264] [<c0683f40>] (driver_probe_device) from [<c06819c8>] (bus_for_each_drv+0x84/0xc8)
> [    5.110870] [<c06819c8>] (bus_for_each_drv) from [<c0683198>] (__device_attach_async_helper+0xa0/0xd0)
> [    5.120239] [<c0683198>] (__device_attach_async_helper) from [<c0160458>] (async_run_entry_fn+0x3c/0x100)
> [    5.129882] [<c0160458>] (async_run_entry_fn) from [<c0155660>] (process_one_work+0x1ec/0x53c)
> [    5.138549] [<c0155660>] (process_one_work) from [<c01559f8>] (worker_thread+0x48/0x594)
> [    5.146697] [<c01559f8>] (worker_thread) from [<c015b738>] (kthread+0x130/0x144)
> [    5.154144] [<c015b738>] (kthread) from [<c0100168>] (ret_from_fork+0x14/0x2c)
> [    5.161407] Exception stack(0xc160dfb0 to 0xc160dff8)
> [    5.166503] dfa0:                                     00000000 00000000 00000000 00000000
> [    5.174743] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    5.182952] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    5.189605] ---[ end trace c76b7828d6f2f577 ]---
> [    5.198516] 8<--- cut here ---
> [    5.201599] Unhandled fault: external abort on non-linefetch (0x1028) at 0xfa0b402c
> [    5.209320] pgd = (ptrval)
> [    5.212036] [fa0b402c] *pgd=48011452(bad)
> [    5.216125] Internal error: : 1028 [#1] SMP ARM
> [    5.220672] Modules linked in:
> [    5.223785] CPU: 0 PID: 7 Comm: kworker/u2:0 Tainted: G        W         5.10.0 #9
> [    5.231384] Hardware name: Nokia RX-51 board
> [    5.235717] Workqueue: events_unbound async_run_entry_fn
> [    5.241088] PC is at omap_hsmmc_set_bus_width+0x8/0x78
> [    5.246276] LR is at omap_hsmmc_set_ios+0x44/0x23c
> [    5.251098] pc : [<c07c23f0>]    lr : [<c07c377c>]    psr: 20000013
> [    5.257385] sp : c10d3e00  ip : c17ef000  fp : 00000066
> [    5.262664] r10: c1248f40  r9 : 00000000  r8 : c124e810
> [    5.267913] r7 : 00000000  r6 : c17ef380  r5 : c17ef258  r4 : c17ef000
> [    5.274475] r3 : 00000001  r2 : 54192eb7  r1 : fa0b4000  r0 : c17ef380
> [    5.281036] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [    5.288238] Control: 10c5387d  Table: 80004019  DAC: 00000051
> [    5.294006] Process kworker/u2:0 (pid: 7, stack limit = 0x(ptrval))
> [    5.300323] Stack: (0xc10d3e00 to 0xc10d4000)
> [    5.304718] 3e00: c17ef000 00000012 00000001 00000000 c124e810 c07a4ccc c17ef000 00000000
> [    5.312957] 3e20: c17ef3b0 00000000 c124e810 c07a5f9c c17ef000 c07a7138 c17ef000 00000000
> [    5.321197] 3e40: c17ef3b0 c07c4034 00000000 c2857a00 c17ef380 54192eb7 00000000 00000000
> [    5.329406] 3e60: c124e810 c0edb05c c0f38c2c 00000000 c0edb05c 00000020 c1009400 c0685ba4
> [    5.337646] 3e80: c124e810 c0f38c24 00000000 c0f38c2c 00000000 c06839b4 00000000 c124e810
> [    5.345886] 3ea0: c0edb05c c10d2000 c068409c 00000000 00000000 c0efa620 c1009400 c0683f40
> [    5.354125] 3ec0: 00000000 c10d3efc c10d2000 c06819c8 c2857100 c1039e6c c1604e38 54192eb7
> [    5.362365] 3ee0: c1009400 c124e810 c10d2000 c124e854 c2857100 c0683198 c1009430 c124e810
> [    5.370605] 3f00: 00010101 54192eb7 c2857110 c0f02018 c1009400 c0160458 c2857110 c10bdf80
> [    5.378845] 3f20: c1009400 c100f000 00000000 c0155660 c10d2000 c1009400 c1009418 c10bdf80
> [    5.387054] 3f40: c1009400 c10bdf94 c1009418 c0e03d00 00000088 c10d2000 c1009400 c01559f8
> [    5.395294] 3f60: 00000000 c10b3c40 c10b3dc0 00000000 c10d2000 c01559b0 c10bdf80 c10c5e9c
> [    5.403533] 3f80: c10b3c64 c015b738 00000001 c10b3dc0 c015b608 00000000 00000000 00000000
> [    5.411773] 3fa0: 00000000 00000000 00000000 c0100168 00000000 00000000 00000000 00000000
> [    5.420013] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    5.428253] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> [    5.436492] [<c07c23f0>] (omap_hsmmc_set_bus_width) from [<c07c377c>] (omap_hsmmc_set_ios+0x44/0x23c)
> [    5.445770] [<c07c377c>] (omap_hsmmc_set_ios) from [<c07a4ccc>] (mmc_power_up.part.0+0x3c/0x154)
> [    5.454620] [<c07a4ccc>] (mmc_power_up.part.0) from [<c07a5f9c>] (mmc_start_host+0x88/0x9c)
> [    5.463043] [<c07a5f9c>] (mmc_start_host) from [<c07a7138>] (mmc_add_host+0x58/0x84)
> [    5.470855] [<c07a7138>] (mmc_add_host) from [<c07c4034>] (omap_hsmmc_probe+0x548/0x9cc)
> [    5.479003] [<c07c4034>] (omap_hsmmc_probe) from [<c0685ba4>] (platform_drv_probe+0x48/0x98)
> [    5.487518] [<c0685ba4>] (platform_drv_probe) from [<c06839b4>] (really_probe+0x208/0x4a0)
> [    5.495819] [<c06839b4>] (really_probe) from [<c0683f40>] (driver_probe_device+0x58/0xb4)
> [    5.504058] [<c0683f40>] (driver_probe_device) from [<c06819c8>] (bus_for_each_drv+0x84/0xc8)
> [    5.512664] [<c06819c8>] (bus_for_each_drv) from [<c0683198>] (__device_attach_async_helper+0xa0/0xd0)
> [    5.522033] [<c0683198>] (__device_attach_async_helper) from [<c0160458>] (async_run_entry_fn+0x3c/0x100)
> [    5.531677] [<c0160458>] (async_run_entry_fn) from [<c0155660>] (process_one_work+0x1ec/0x53c)
> [    5.540344] [<c0155660>] (process_one_work) from [<c01559f8>] (worker_thread+0x48/0x594)
> [    5.548492] [<c01559f8>] (worker_thread) from [<c015b738>] (kthread+0x130/0x144)
> [    5.555938] [<c015b738>] (kthread) from [<c0100168>] (ret_from_fork+0x14/0x2c)
> [    5.563201] Exception stack(0xc10d3fb0 to 0xc10d3ff8)
> [    5.568298] 3fa0:                                     00000000 00000000 00000000 00000000
> [    5.576538] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    5.584777] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    5.591430] Code: e7f001f2 c0ba858c e590c004 e5901024 (e591302c)
> [    5.597595] ---[ end trace c76b7828d6f2f578 ]---
> [    5.602264] In-band Error seen by MPU  at address 0
> [    5.607177] ------------[ cut here ]------------
> [    5.611846] WARNING: CPU: 0 PID: 7 at drivers/bus/omap_l3_smx.c:152 omap3_l3_app_irq+0x10c/0x130
> [    5.620666] Modules linked in:
> [    5.623748] CPU: 0 PID: 7 Comm: kworker/u2:0 Tainted: G      D W         5.10.0 #9
> [    5.631378] Hardware name: Nokia RX-51 board
> [    5.635681] Workqueue: events_unbound async_run_entry_fn
> [    5.641052] [<c0110924>] (unwind_backtrace) from [<c010b1f4>] (show_stack+0x10/0x14)
> [    5.648864] [<c010b1f4>] (show_stack) from [<c09c8478>] (dump_stack+0xc0/0xdc)
> [    5.656158] [<c09c8478>] (dump_stack) from [<c0138564>] (__warn+0xd4/0x140)
> [    5.663177] [<c0138564>] (__warn) from [<c09c3f3c>] (warn_slowpath_fmt+0x60/0xbc)
> [    5.670715] [<c09c3f3c>] (warn_slowpath_fmt) from [<c05a444c>] (omap3_l3_app_irq+0x10c/0x130)
> [    5.679321] [<c05a444c>] (omap3_l3_app_irq) from [<c019d3f8>] (__handle_irq_event_percpu+0x58/0x208)
> [    5.688507] [<c019d3f8>] (__handle_irq_event_percpu) from [<c019d694>] (handle_irq_event+0x68/0xd4)
> [    5.697631] [<c019d694>] (handle_irq_event) from [<c01a1c4c>] (handle_level_irq+0xc4/0x1c8)
> [    5.706024] [<c01a1c4c>] (handle_level_irq) from [<c019cc90>] (__handle_domain_irq+0x84/0xfc)
> [    5.714630] [<c019cc90>] (__handle_domain_irq) from [<c0100b6c>] (__irq_svc+0x6c/0x90)
> [    5.722564] Exception stack(0xc10d3cd8 to 0xc10d3d20)
> [    5.727661] 3cc0:                                                       00000000 00000000
> [    5.735900] 3ce0: c10bfa80 00000002 c10c6b40 00000000 0000000b ffffe000 c0e09fec 00000000
> [    5.744140] 3d00: bf000000 c10d3d58 08f0d180 c10d3d28 00000000 c01e342c 00000113 ffffffff
> [    5.752380] [<c0100b6c>] (__irq_svc) from [<c01e342c>] (acct_collect+0x1b0/0x1cc)
> [    5.759918] [<c01e342c>] (acct_collect) from [<c013d79c>] (do_exit+0x174/0xa40)
> [    5.767303] [<c013d79c>] (do_exit) from [<c010b510>] (die+0x318/0x354)
> [    5.773864] [<c010b510>] (die) from [<c01154e4>] (do_DataAbort+0xa4/0xbc)
> [    5.780700] [<c01154e4>] (do_DataAbort) from [<c0100ac0>] (__dabt_svc+0x60/0xa0)
> [    5.788146] Exception stack(0xc10d3db0 to 0xc10d3df8)
> [    5.793243] 3da0:                                     c17ef380 fa0b4000 54192eb7 00000001
> [    5.801483] 3dc0: c17ef000 c17ef258 c17ef380 00000000 c124e810 00000000 c1248f40 00000066
> [    5.809692] 3de0: c17ef000 c10d3e00 c07c377c c07c23f0 20000013 ffffffff
> [    5.816375] [<c0100ac0>] (__dabt_svc) from [<c07c23f0>] (omap_hsmmc_set_bus_width+0x8/0x78)
> [    5.824798] [<c07c23f0>] (omap_hsmmc_set_bus_width) from [<c07c377c>] (omap_hsmmc_set_ios+0x44/0x23c)
> [    5.834075] [<c07c377c>] (omap_hsmmc_set_ios) from [<c07a4ccc>] (mmc_power_up.part.0+0x3c/0x154)
> [    5.842926] [<c07a4ccc>] (mmc_power_up.part.0) from [<c07a5f9c>] (mmc_start_host+0x88/0x9c)
> [    5.851348] [<c07a5f9c>] (mmc_start_host) from [<c07a7138>] (mmc_add_host+0x58/0x84)
> [    5.859130] [<c07a7138>] (mmc_add_host) from [<c07c4034>] (omap_hsmmc_probe+0x548/0x9cc)
> [    5.867279] [<c07c4034>] (omap_hsmmc_probe) from [<c0685ba4>] (platform_drv_probe+0x48/0x98)
> [    5.875793] [<c0685ba4>] (platform_drv_probe) from [<c06839b4>] (really_probe+0x208/0x4a0)
> [    5.884124] [<c06839b4>] (really_probe) from [<c0683f40>] (driver_probe_device+0x58/0xb4)
> [    5.892364] [<c0683f40>] (driver_probe_device) from [<c06819c8>] (bus_for_each_drv+0x84/0xc8)
> [    5.900939] [<c06819c8>] (bus_for_each_drv) from [<c0683198>] (__device_attach_async_helper+0xa0/0xd0)
> [    5.910308] [<c0683198>] (__device_attach_async_helper) from [<c0160458>] (async_run_entry_fn+0x3c/0x100)
> [    5.919952] [<c0160458>] (async_run_entry_fn) from [<c0155660>] (process_one_work+0x1ec/0x53c)
> [    5.928619] [<c0155660>] (process_one_work) from [<c01559f8>] (worker_thread+0x48/0x594)
> [    5.936767] [<c01559f8>] (worker_thread) from [<c015b738>] (kthread+0x130/0x144)
> [    5.944213] [<c015b738>] (kthread) from [<c0100168>] (ret_from_fork+0x14/0x2c)
> [    5.951477] Exception stack(0xc10d3fb0 to 0xc10d3ff8)
> [    5.956573] 3fa0:                                     00000000 00000000 00000000 00000000
> [    5.964813] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    5.973052] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    5.979705] ---[ end trace c76b7828d6f2f579 ]---
> [    5.990539] 8<--- cut here ---
> [    5.993682] Unhandled fault: external abort on non-linefetch (0x1028) at 0xfa09c02c
> [    6.001373] pgd = (ptrval)
> [    6.004119] [fa09c02c] *pgd=48011452(bad)
> [    6.008178] Internal error: : 1028 [#2] SMP ARM
> [    6.012756] Modules linked in:
> [    6.015838] CPU: 0 PID: 50 Comm: kworker/u2:1 Tainted: G      D W         5.10.0 #9
> [    6.023559] Hardware name: Nokia RX-51 board
> [    6.027893] Workqueue: events_unbound async_run_entry_fn
> [    6.033264] PC is at omap_hsmmc_set_bus_width+0x8/0x78
> [    6.038452] LR is at omap_hsmmc_set_ios+0x44/0x23c
> [    6.043273] pc : [<c07c23f0>]    lr : [<c07c377c>]    psr: 60000113
> [    6.049560] sp : c160de00  ip : c28a7800  fp : 00000063
> [    6.054840] r10: c1248400  r9 : 00000000  r8 : c124c410
> [    6.060089] r7 : 00000000  r6 : c28a7b80  r5 : c28a7a58  r4 : c28a7800
> [    6.066650] r3 : 00000001  r2 : 24f1df74  r1 : fa09c000  r0 : c28a7b80
> [    6.073211] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [    6.080413] Control: 10c5387d  Table: 80004019  DAC: 00000051
> [    6.086181] Process kworker/u2:1 (pid: 50, stack limit = 0x(ptrval))
> [    6.092590] Stack: (0xc160de00 to 0xc160e000)
> [    6.096984] de00: c28a7800 00000013 00000001 00000000 c124c410 c07a4ccc c28a7800 00000000
> [    6.105224] de20: c28a7bb0 00000000 c124c410 c07a5f9c c28a7800 c07a7138 c28a7800 00000000
> [    6.113464] de40: c28a7bb0 c07c4034 00000000 c28a1980 c28a7b80 24f1df74 00000000 00000000
> [    6.121673] de60: c124c410 c0edb05c c0f38c2c 00000000 c0edb05c 00000020 c1009400 c0685ba4
> [    6.129913] de80: c124c410 c0f38c24 00000000 c0f38c2c 00000000 c06839b4 00000000 c124c410
> [    6.138153] dea0: c0edb05c c160c000 c068409c 00000000 00000000 c0efa620 c1009400 c0683f40
> [    6.146392] dec0: 00000000 c160defc c160c000 c06819c8 c2857040 c1039e6c c1604e38 24f1df74
> [    6.154632] dee0: c1009400 c124c410 c160c000 c124c454 c2857040 c0683198 c1009400 c124c410
> [    6.162872] df00: 00010101 24f1df74 c2857050 c0f02018 c1009400 c0160458 c2857050 c1604d00
> [    6.171112] df20: c1009400 c100f000 00000000 c0155660 c160c000 c1009400 c1009418 c1604d00
> [    6.179321] df40: c1009400 c1604d14 c1009418 c0e03d00 00000088 c160c000 c1009400 c01559f8
> [    6.187561] df60: 00000000 c16029c0 c1602a00 00000000 c160c000 c01559b0 c1604d00 c10d3ebc
> [    6.195800] df80: c16029e4 c015b738 00000001 c1602a00 c015b608 00000000 00000000 00000000
> [    6.204040] dfa0: 00000000 00000000 00000000 c0100168 00000000 00000000 00000000 00000000
> [    6.212280] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    6.220520] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> [    6.228759] [<c07c23f0>] (omap_hsmmc_set_bus_width) from [<c07c377c>] (omap_hsmmc_set_ios+0x44/0x23c)
> [    6.238067] [<c07c377c>] (omap_hsmmc_set_ios) from [<c07a4ccc>] (mmc_power_up.part.0+0x3c/0x154)
> [    6.246887] [<c07a4ccc>] (mmc_power_up.part.0) from [<c07a5f9c>] (mmc_start_host+0x88/0x9c)
> [    6.255310] [<c07a5f9c>] (mmc_start_host) from [<c07a7138>] (mmc_add_host+0x58/0x84)
> [    6.263122] [<c07a7138>] (mmc_add_host) from [<c07c4034>] (omap_hsmmc_probe+0x548/0x9cc)
> [    6.271270] [<c07c4034>] (omap_hsmmc_probe) from [<c0685ba4>] (platform_drv_probe+0x48/0x98)
> [    6.279785] [<c0685ba4>] (platform_drv_probe) from [<c06839b4>] (really_probe+0x208/0x4a0)
> [    6.288116] [<c06839b4>] (really_probe) from [<c0683f40>] (driver_probe_device+0x58/0xb4)
> [    6.296356] [<c0683f40>] (driver_probe_device) from [<c06819c8>] (bus_for_each_drv+0x84/0xc8)
> [    6.304931] [<c06819c8>] (bus_for_each_drv) from [<c0683198>] (__device_attach_async_helper+0xa0/0xd0)
> [    6.314300] [<c0683198>] (__device_attach_async_helper) from [<c0160458>] (async_run_entry_fn+0x3c/0x100)
> [    6.323944] [<c0160458>] (async_run_entry_fn) from [<c0155660>] (process_one_work+0x1ec/0x53c)
> [    6.332641] [<c0155660>] (process_one_work) from [<c01559f8>] (worker_thread+0x48/0x594)
> [    6.340789] [<c01559f8>] (worker_thread) from [<c015b738>] (kthread+0x130/0x144)
> [    6.348236] [<c015b738>] (kthread) from [<c0100168>] (ret_from_fork+0x14/0x2c)
> [    6.355499] Exception stack(0xc160dfb0 to 0xc160dff8)
> [    6.360595] dfa0:                                     00000000 00000000 00000000 00000000
> [    6.368835] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    6.377044] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    6.383728] Code: e7f001f2 c0ba858c e590c004 e5901024 (e591302c)
> [    6.389862] ---[ end trace c76b7828d6f2f57a ]---
> [    6.394561] In-band Error seen by MPU  at address 0
> [    6.399475] ------------[ cut here ]------------
> [    6.404113] WARNING: CPU: 0 PID: 50 at drivers/bus/omap_l3_smx.c:152 omap3_l3_app_irq+0x10c/0x130
> [    6.413055] Modules linked in:
> [    6.416137] CPU: 0 PID: 50 Comm: kworker/u2:1 Tainted: G      D W         5.10.0 #9
> [    6.423828] Hardware name: Nokia RX-51 board
> [    6.428161] Workqueue: events_unbound async_run_entry_fn
> [    6.433532] [<c0110924>] (unwind_backtrace) from [<c010b1f4>] (show_stack+0x10/0x14)
> [    6.441345] [<c010b1f4>] (show_stack) from [<c09c8478>] (dump_stack+0xc0/0xdc)
> [    6.448638] [<c09c8478>] (dump_stack) from [<c0138564>] (__warn+0xd4/0x140)
> [    6.455657] [<c0138564>] (__warn) from [<c09c3f3c>] (warn_slowpath_fmt+0x60/0xbc)
> [    6.463195] [<c09c3f3c>] (warn_slowpath_fmt) from [<c05a444c>] (omap3_l3_app_irq+0x10c/0x130)
> [    6.471801] [<c05a444c>] (omap3_l3_app_irq) from [<c019d3f8>] (__handle_irq_event_percpu+0x58/0x208)
> [    6.480987] [<c019d3f8>] (__handle_irq_event_percpu) from [<c019d694>] (handle_irq_event+0x68/0xd4)
> [    6.490112] [<c019d694>] (handle_irq_event) from [<c01a1c4c>] (handle_level_irq+0xc4/0x1c8)
> [    6.498504] [<c01a1c4c>] (handle_level_irq) from [<c019cc90>] (__handle_domain_irq+0x84/0xfc)
> [    6.507110] [<c019cc90>] (__handle_domain_irq) from [<c0100b6c>] (__irq_svc+0x6c/0x90)
> [    6.515075] Exception stack(0xc160dcd8 to 0xc160dd20)
> [    6.520141] dcc0:                                                       00000000 00000000
> [    6.528381] dce0: c15bb000 00000002 c12ad6c0 00000000 0000000b ffffe000 c0e09fec 00000000
> [    6.536621] dd00: bf000000 c160dd58 09896800 c160dd28 00000000 c01e342c 00000113 ffffffff
> [    6.544860] [<c0100b6c>] (__irq_svc) from [<c01e342c>] (acct_collect+0x1b0/0x1cc)
> [    6.552398] [<c01e342c>] (acct_collect) from [<c013d79c>] (do_exit+0x174/0xa40)
> [    6.559783] [<c013d79c>] (do_exit) from [<c010b510>] (die+0x318/0x354)
> [    6.566345] [<c010b510>] (die) from [<c01154e4>] (do_DataAbort+0xa4/0xbc)
> [    6.573181] [<c01154e4>] (do_DataAbort) from [<c0100ac0>] (__dabt_svc+0x60/0xa0)
> [    6.580627] Exception stack(0xc160ddb0 to 0xc160ddf8)
> [    6.585723] dda0:                                     c28a7b80 fa09c000 24f1df74 00000001
> [    6.593963] ddc0: c28a7800 c28a7a58 c28a7b80 00000000 c124c410 00000000 c1248400 00000063
> [    6.602203] dde0: c28a7800 c160de00 c07c377c c07c23f0 60000113 ffffffff
> [    6.608856] [<c0100ac0>] (__dabt_svc) from [<c07c23f0>] (omap_hsmmc_set_bus_width+0x8/0x78)
> [    6.617279] [<c07c23f0>] (omap_hsmmc_set_bus_width) from [<c07c377c>] (omap_hsmmc_set_ios+0x44/0x23c)
> [    6.626556] [<c07c377c>] (omap_hsmmc_set_ios) from [<c07a4ccc>] (mmc_power_up.part.0+0x3c/0x154)
> [    6.635406] [<c07a4ccc>] (mmc_power_up.part.0) from [<c07a5f9c>] (mmc_start_host+0x88/0x9c)
> [    6.643829] [<c07a5f9c>] (mmc_start_host) from [<c07a7138>] (mmc_add_host+0x58/0x84)
> [    6.651611] [<c07a7138>] (mmc_add_host) from [<c07c4034>] (omap_hsmmc_probe+0x548/0x9cc)
> [    6.659759] [<c07c4034>] (omap_hsmmc_probe) from [<c0685ba4>] (platform_drv_probe+0x48/0x98)
> [    6.668273] [<c0685ba4>] (platform_drv_probe) from [<c06839b4>] (really_probe+0x208/0x4a0)
> [    6.676605] [<c06839b4>] (really_probe) from [<c0683f40>] (driver_probe_device+0x58/0xb4)
> [    6.684844] [<c0683f40>] (driver_probe_device) from [<c06819c8>] (bus_for_each_drv+0x84/0xc8)
> [    6.693420] [<c06819c8>] (bus_for_each_drv) from [<c0683198>] (__device_attach_async_helper+0xa0/0xd0)
> [    6.702789] [<c0683198>] (__device_attach_async_helper) from [<c0160458>] (async_run_entry_fn+0x3c/0x100)
> [    6.712432] [<c0160458>] (async_run_entry_fn) from [<c0155660>] (process_one_work+0x1ec/0x53c)
> [    6.721099] [<c0155660>] (process_one_work) from [<c01559f8>] (worker_thread+0x48/0x594)
> [    6.729248] [<c01559f8>] (worker_thread) from [<c015b738>] (kthread+0x130/0x144)
> [    6.736694] [<c015b738>] (kthread) from [<c0100168>] (ret_from_fork+0x14/0x2c)
> [    6.743957] Exception stack(0xc160dfb0 to 0xc160dff8)
> [    6.749053] dfa0:                                     00000000 00000000 00000000 00000000
> [    6.757293] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    6.765533] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    6.772186] ---[ end trace c76b7828d6f2f57b ]---
