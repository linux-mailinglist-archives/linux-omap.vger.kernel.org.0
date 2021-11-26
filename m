Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DFB45F728
	for <lists+linux-omap@lfdr.de>; Sat, 27 Nov 2021 00:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhKZXVm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Nov 2021 18:21:42 -0500
Received: from mail.archive.org ([207.241.224.6]:41876 "EHLO mail.archive.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234019AbhKZXTl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Nov 2021 18:19:41 -0500
X-Greylist: delayed 628 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Nov 2021 18:19:41 EST
Received: from mail.archive.org (localhost [127.0.0.1])
        by mail.archive.org (Postfix) with ESMTP id A2B2A2E9D7;
        Fri, 26 Nov 2021 23:06:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.archive.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
        autolearn=disabled version=3.4.2
Received: from [0.0.0.0] (unknown [45.83.235.159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: merlijn@archive.org)
        by mail.archive.org (Postfix) with ESMTPSA id 2A1DC2BFA1;
        Fri, 26 Nov 2021 23:05:58 +0000 (UTC)
To:     linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
From:   "Merlijn B.W. Wajer" <merlijn@archive.org>
Cc:     Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: Oops while booting 5.15.2 on Nokia N900
Message-ID: <12e13327-3bb5-229e-d784-cd528db4b58e@archive.org>
Date:   Sat, 27 Nov 2021 00:11:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Envelope-From: <merlijn@archive.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Moving from Linux 5.1 to 5.15 (not very helpful, I know), I'm now
occasionally seeing this problem [1] during boot. Whether or not it
happens seems to mostly be random.

The kernel is patched with the experimental and out of tree SGX patches
[2], but I am pretty sure they are not relevant here, since the modules
aren't even loaded at this point.

Any ideas what could cause this? Please let me know if I should provide
additional debug info.

Regards,
Merlijn

[1]

> [   10.256835] Internal error: Oops - undefined instruction: 0 [#1] PREEMPT SMP ARM
> [   10.264343] Modules linked in:
> [   10.267456] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.15.2-218694-g19b9514dd867-dirty #1
> [   10.275787] Hardware name: Nokia RX-51 board
> [   10.280090] PC is at omap3_l3_app_irq+0x100/0x120
> [   10.284851] LR is at __handle_irq_event_percpu+0x48/0x250
> [   10.290313] pc : [<c05b0ac8>]    lr : [<c019c2a4>]    psr: 20030193
> [   10.296600] sp : c0f01e10  ip : 3ccf0000  fp : c1834200
> [   10.301879] r10: c0ff8760  r9 : c0ff8780  r8 : 0000001a
> [   10.307128] r7 : 00000000  r6 : 00080000  r5 : 00000000  r4 : f8000000
> [   10.313720] r3 : 00080000  r2 : a3b464b6  r1 : 00000000  r0 : 00080000
> [   10.320281] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [   10.327575] Control: 10c5387d  Table: 83398019  DAC: 00000051
> [   10.333343] Register r0 information: non-paged memory
> [   10.338439] Register r1 information: NULL pointer
> [   10.343200] Register r2 information: non-paged memory
> [   10.348297] Register r3 information: non-paged memory
> [   10.353393] Register r4 information: 0-page vmalloc region starting at 0xf8000000 allocated at iotable_init+0x0/0xf4
> [   10.364013] Register r5 information: NULL pointer
> [   10.368774] Register r6 information: non-paged memory
> [   10.373870] Register r7 information: NULL pointer
> [   10.378631] Register r8 information: non-paged memory
> [   10.383728] Register r9 information: non-slab/vmalloc memory
> [   10.389434] Register r10 information: non-slab/vmalloc memory
> [   10.395233] Register r11 information: slab kmalloc-256 start c1834200 pointer offset 0 size 256
> [   10.404022] Register r12 information: non-paged memory
> [   10.409210] Process swapper/0 (pid: 0, stack limit = 0x(ptrval))
> [   10.415283] Stack: (0xc0f01e10 to 0xc0f02000)
> [   10.419677] 1e00:                                     c0627a10 c1fc5d80 c0f04dc8 c1a47500
> [   10.427917] 1e20: c0f04dc8 00000000 c0f01e68 0000001a c0ff8780 c019c2a4 00000000 a3b464b6
> [   10.436157] 1e40: 625a0000 c1834200 c0f04dc8 00000000 c1805a00 0000000a c0f01ec0 63597fc0
> [   10.444396] 1e60: 00000002 c019c4d4 00000000 a3b464b6 c1834200 c183426c 00000000 c019c55c
> [   10.452636] 1e80: c1834200 c183426c 00000000 c01a0d60 c0e6d5b0 00000000 00000000 c019bba8
> [   10.460876] 1ea0: c07af038 20030013 ffffffff c0f01ef4 cfb63a78 c0f00000 63597fc0 c0100b3c
> [   10.469116] 1ec0: 00000000 c0f0b798 ffffe000 0ecf6000 00000004 c0f0b618 00000000 00000004
> [   10.477325] 1ee0: cfb63a78 c0ff94c0 63597fc0 00000002 00000001 c0f01f10 c07aef64 c07af038
> [   10.485565] 1f00: 20030013 ffffffff 00000051 c07aef3c cfb63d70 cfb63a78 633d8f31 00000000
> [   10.493804] 1f20: c0f01f73 00000002 61c16980 00000002 7aca1a80 cfb63a78 c0f0b618 00000004
> [   10.502044] 1f40: c0f04e64 cfb63a78 c0f04dc8 c0f0b618 c0e6da70 c07af2fc ffffe000 c0f04e10
> [   10.510284] 1f60: 00000001 c016e754 00000004 c0f04dc0 01000000 a3b464b6 c0f084ac 000000e4
> [   10.518524] 1f80: c0e43a60 cfdff0d4 c0f04dc0 00000000 cfdff0c0 c0f084ac c0ccdbc8 c016eae8
> [   10.526763] 1fa0: c1000068 c0e00f0c ffffffff ffffffff 00000000 c0e00598 00000000 c0f04dc8
> [   10.535003] 1fc0: 00000000 c0e43a60 a3b16bb4 00000000 00000000 c0e00330 00000051 10c0387d
> [   10.543243] 1fe0: 000007a3 8249b600 411fc083 10c5387d 00000000 00000000 00000000 00000000
> [   10.551483] [<c05b0ac8>] (omap3_l3_app_irq) from [<c019c2a4>] (__handle_irq_event_percpu+0x48/0x250)
> [   10.560699] [<c019c2a4>] (__handle_irq_event_percpu) from [<c019c4d4>] (handle_irq_event_percpu+0x28/0x78)
> [   10.570465] [<c019c4d4>] (handle_irq_event_percpu) from [<c019c55c>] (handle_irq_event+0x38/0x5c)
> [   10.579406] [<c019c55c>] (handle_irq_event) from [<c01a0d60>] (handle_level_irq+0xc0/0x14c)
> [   10.587829] [<c01a0d60>] (handle_level_irq) from [<c019bba8>] (handle_domain_irq+0x70/0xac)
> [   10.596282] [<c019bba8>] (handle_domain_irq) from [<c0100b3c>] (__irq_svc+0x5c/0x90)
> [   10.604095] Exception stack(0xc0f01ec0 to 0xc0f01f08)
> [   10.609191] 1ec0: 00000000 c0f0b798 ffffe000 0ecf6000 00000004 c0f0b618 00000000 00000004
> [   10.617431] 1ee0: cfb63a78 c0ff94c0 63597fc0 00000002 00000001 c0f01f10 c07aef64 c07af038
> [   10.625671] 1f00: 20030013 ffffffff
> [   10.629180] [<c0100b3c>] (__irq_svc) from [<c07af038>] (cpuidle_enter_state+0x258/0x4b8)
> [   10.637359] [<c07af038>] (cpuidle_enter_state) from [<c07af2fc>] (cpuidle_enter+0x50/0x54)
> [   10.645690] [<c07af2fc>] (cpuidle_enter) from [<c016e754>] (do_idle+0x224/0x284)
> [   10.653167] [<c016e754>] (do_idle) from [<c016eae8>] (cpu_startup_entry+0x18/0x20)
> [   10.660827] [<c016eae8>] (cpu_startup_entry) from [<c0e00f0c>] (start_kernel+0x5c8/0x6c8)
> [   10.669067] Code: e3c0003c e007100c e1903001 0affffc9 (e7f001f2)
> [   10.675231] ---[ end trace 737d680415879d80 ]---
> [   10.679901] Kernel panic - not syncing: Fatal exception in interrupt
> [   10.686309] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

[2]
https://github.com/tmlind/linux_openpvrsgx/commits/droid4-pending-pvr-omapdrm-v5.15
