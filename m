Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 928E4393CBD
	for <lists+linux-omap@lfdr.de>; Fri, 28 May 2021 07:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233629AbhE1Flb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 May 2021 01:41:31 -0400
Received: from muru.com ([72.249.23.125]:33102 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229749AbhE1Fla (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 28 May 2021 01:41:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4F1B380A8;
        Fri, 28 May 2021 05:40:00 +0000 (UTC)
Date:   Fri, 28 May 2021 08:39:51 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: 8250: 8250_omap: Fix possible interrupt storm
Message-ID: <YLCCJzkkB4N7LTQS@atomide.com>
References: <20210511151955.28071-1-vigneshr@ti.com>
 <YJ008MjjewRUTn9Z@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJ008MjjewRUTn9Z@kroah.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Greg, Vignesh & Jan,

* Greg Kroah-Hartman <gregkh@linuxfoundation.org> [210513 14:17]:
> On Tue, May 11, 2021 at 08:49:55PM +0530, Vignesh Raghavendra wrote:
> > It is possible that RX TIMEOUT is signalled after RX FIFO has been
> > drained, in which case a dummy read of RX FIFO is required to clear RX
> > TIMEOUT condition. Otherwise, RX TIMEOUT condition is not cleared
> > leading to an interrupt storm
> > 
> > Cc: stable@vger.kernel.org
> 
> How far back does this need to go?  What commit id does this fix?  What
> caused this to just show up now vs. previously?

I just noticed this causes the following regression in Linux next when
pressing a key on uart console after boot at least on omap3. This seems
to happen on serial_port_in(port, UART_RX) in the quirk handling.

Vignesh, it seems this quirk needs some soc specific flag added to
it maybe? Or maybe UART_OMAP_RX_LVL register is not available for
all the SoCs?

I think it's best to drop this patch until the issues are resolved,
also there are some open comments above that might be answered by
limiting this quirk to a specific range of SoCs :)

Regards,

Tony

8< ------------------------
#regzb introduced: 31fae7c8b18c ("serial: 8250: 8250_omap: Fix possible interrupt storm")

Internal error: : 1028 [#1] SMP ARM
Modules linked in:
CPU: 0 PID: 870 Comm: syslog Not tainted 5.13.0-rc3-next-20210527-00001-g9b545469a50f #34
Hardware name: Generic OMAP36xx (Flattened Device Tree)
PC is at mem_serial_in+0xc/0x20
LR is at omap8250_irq+0x258/0x2d4
pc : [<c06762f0>]    lr : [<c0681720>]    psr: 60000193
sp : c2975c90  ip : 00000000  fp : c1836000
r10: c0ff7f20  r9 : c0ff7f40  r8 : 00000058
r7 : c2975ce0  r6 : 00000000  r5 : 00000001  r4 : c1031a24
r3 : fa06a000  r2 : 00000002  r1 : 00000000  r0 : c1031a24
Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 829cc019  DAC: 00000051
Register r0 information: non-slab/vmalloc memory
Register r1 information: NULL pointer
Register r2 information: non-paged memory
Register r3 information: 0-page vmalloc region starting at 0xfa000000 allocated at iotable_init+0x0/0xf4
Register r4 information: non-slab/vmalloc memory
Register r5 information: non-paged memory
Register r6 information: NULL pointer
Register r7 information: non-slab/vmalloc memory
Register r8 information: non-paged memory
Register r9 information: non-slab/vmalloc memory
Register r10 information: non-slab/vmalloc memory
Register r11 information: slab kmalloc-256 start c1836000 pointer offset 0 size 256
Register r12 information: NULL pointer
Process syslog (pid: 870, stack limit = 0x64988e4e)
...
[<c06762f0>] (mem_serial_in) from [<c0681720>] (omap8250_irq+0x258/0x2d4)
[<c0681720>] (omap8250_irq) from [<c01a00b8>] (__handle_irq_event_percpu+0x58/0x1f0)
[<c01a00b8>] (__handle_irq_event_percpu) from [<c01a0334>] (handle_irq_event+0x68/0xcc)
[<c01a0334>] (handle_irq_event) from [<c01a4b6c>] (handle_level_irq+0xc4/0x1c8)
[<c01a4b6c>] (handle_level_irq) from [<c019f968>] (__handle_domain_irq+0x84/0xfc)
[<c019f968>] (__handle_domain_irq) from [<c0100b6c>] (__irq_svc+0x6c/0x90)
Exception stack(0xc2975d28 to 0xc2975d70)
5d20:                   c2532990 c25328a8 00000006 c289a015 c2532888 c2532990
5d40: 00000002 00000000 00000006 64407df7 c2532880 64407df7 00000006 c2975d78
5d60: c02ef31c c030097c 60000013 ffffffff
[<c0100b6c>] (__irq_svc) from [<c030097c>] (__d_lookup_rcu+0xbc/0x1b8)
[<c030097c>] (__d_lookup_rcu) from [<c02ef31c>] (lookup_fast+0x48/0x180)
[<c02ef31c>] (lookup_fast) from [<c02f23b8>] (walk_component+0x3c/0x1c8)
[<c02f23b8>] (walk_component) from [<c02f2780>] (link_path_walk.part.0+0x23c/0x364)
[<c02f2780>] (link_path_walk.part.0) from [<c02f28dc>] (path_parentat+0x34/0x74)
[<c02f28dc>] (path_parentat) from [<c02f48c8>] (filename_parentat+0x88/0x19c)
[<c02f48c8>] (filename_parentat) from [<c02f4a20>] (filename_create+0x44/0x150)
[<c02f4a20>] (filename_create) from [<c02f4c2c>] (do_mkdirat+0x58/0x11c)
[<c02f4c2c>] (do_mkdirat) from [<c0100080>] (ret_fast_syscall+0x0/0x58)
