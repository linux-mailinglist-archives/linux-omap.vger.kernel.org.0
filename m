Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAF6F8C063
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2019 20:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbfHMSSx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Aug 2019 14:18:53 -0400
Received: from emh06.mail.saunalahti.fi ([62.142.5.116]:57504 "EHLO
        emh06.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728575AbfHMSSv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Aug 2019 14:18:51 -0400
X-Greylist: delayed 407 seconds by postgrey-1.27 at vger.kernel.org; Tue, 13 Aug 2019 14:18:49 EDT
Received: from darkstar.musicnaut.iki.fi (85-76-96-82-nat.elisa-mobile.fi [85.76.96.82])
        by emh06.mail.saunalahti.fi (Postfix) with ESMTP id 3918430016;
        Tue, 13 Aug 2019 21:11:59 +0300 (EEST)
Date:   Tue, 13 Aug 2019 21:11:58 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 14/22] ARM: omap1: use pci_ioremap_io() for omap_cf
Message-ID: <20190813181158.GA26798@darkstar.musicnaut.iki.fi>
References: <20190808212234.2213262-1-arnd@arndb.de>
 <20190808212234.2213262-15-arnd@arndb.de>
 <20190813103605.GL52127@atomide.com>
 <CAK8P3a0E+QUn9wcP5Obv-FitWyXCFwcp+oPConeO2p-NV1rqsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0E+QUn9wcP5Obv-FitWyXCFwcp+oPConeO2p-NV1rqsw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Tue, Aug 13, 2019 at 01:02:16PM +0200, Arnd Bergmann wrote:
> On Tue, Aug 13, 2019 at 12:36 PM Tony Lindgren <tony@atomide.com> wrote:
> > * Arnd Bergmann <arnd@arndb.de> [190808 21:34]:
> > > The ISA I/O space handling in omap_cf is incompatible with
> > > PCI drivers in a multiplatform kernel, and requires a custom
> > > mach/io.h.
> > >
> > > Change the driver to use pci_ioremap_io() like PCI drivers do,
> > > so the generic ioport access can work across platforms.
> > >
> > > To actually use that code, we have to select CONFIG_PCI
> > > here.
> > >
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Looks like this series boots for me on 5912osk up to this
> > patch
> 
> Ok, that's something. Thanks for testing!
> 
> >, but this patch breaks booting somehow.
> >
> > Any ideas for fixes?
> 
> I can think of multiple possible issues:
> 
> - I force CONFIG_PCI to be enabled here in order to keep the
>   asm/io.h logic unchanged. If PCI support in itself is an issue,
>   then turning on CONFIG_PCI without the rest of this patch
>   should also break.

The board dies early, probably in pci_reserve_io():

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.3.0-rc4-osk-los_80efa+-00028-g09f6f22a63e9 (aaro@amd-fx-6350) (gcc version 8.3.0 (GCC)) #1 Tue Aug 13 20:50:11 EEST 2019
[    0.000000] CPU: ARM926EJ-S [41069263] revision 3 (ARMv5TEJ), cr=0005317f
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: TI-OSK
[    0.000000] Ignoring tag cmdline (using the default kernel command line)
[    0.000000] printk: bootconsole [earlycon0] enabled
[    0.000000] Memory policy: Data cache writeback
[    0.000000] Internal error: Oops - undefined instruction: 0 [#1] ARM
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.0-rc4-osk-los_80efa+-00028-g09f6f22a63e9 #1
[    0.000000] Hardware name: TI-OSK
[    0.000000] PC is at vm_area_add_early+0x1c/0x74
[    0.000000] LR is at 0x200000
[    0.000000] pc : [<c0419310>]    lr : [<00200000>]    psr: 800000d3
[    0.000000] sp : c05b5f14  ip : ff000000  fp : c05bad68
[    0.000000] r10: fefb0000  r9 : ffe00000  r8 : 001fffff
[    0.000000] r7 : c05bad88  r6 : c05db3d4  r5 : c05ca678  r4 : c1ffcf60
[    0.000000] r3 : c1ffcfd8  r2 : c1ffcfb0  r1 : fefb0000  r0 : c1ffcf60
[    0.000000] Flags: Nzcv  IRQs off  FIQs off  Mode SVC_32  ISA ARM  Segment none
[    0.000000] Control: 0005317f  Table: 10004000  DAC: 00000053
[    0.000000] Process swapper (pid: 0, stack limit = 0x(ptrval))
[    0.000000] Stack: (0xc05b5f14 to 0xc05b6000)
[    0.000000] 5f00:                                              c0411724 ff000000 c041260c
[    0.000000] 5f20: 00010000 00010600 c0428794 c05b7008 c042b000 00600000 00000000 ffff1000
[    0.000000] 5f40: 00011fff 00001000 00000007 00000000 00000000 c0428794 c0008000 c060ba7c
[    0.000000] 5f60: c0429a38 c05b5fc4 c05ca818 00053177 00000001 c04101fc 0000006c 0005317f
[    0.000000] 5f80: 00000000 00000000 00000053 00003135 c05b7008 c05b7000 41069263 00053177
[    0.000000] 5fa0: 00000001 c040da10 00000000 00000000 00000000 00000000 00000000 00000000
[    0.000000] 5fc0: 00000000 c0429a38 00000000 00000000 00000000 c040d330 00000053 00003135
[    0.000000] 5fe0: 00000203 10000100 41069263 00053177 00000000 00000000 00000000 00000000
[    0.000000] [<c0419310>] (vm_area_add_early) from [<c0411724>] (add_static_vm_early+0xc/0x5c)
[    0.000000] [<c0411724>] (add_static_vm_early) from [<c041260c>] (paging_init+0x2e0/0x5b4)
[    0.000000] [<c041260c>] (paging_init) from [<c04101fc>] (setup_arch+0x4c8/0x7cc)
[    0.000000] [<c04101fc>] (setup_arch) from [<c040da10>] (start_kernel+0x58/0x478)
[    0.000000] [<c040da10>] (start_kernel) from [<00000000>] (0x0)
[    0.000000] Code: e3530000 059f2058 05923000 0a000006 (e7f001f2) 
[    0.000000] random: get_random_bytes called from init_oops_id+0x20/0x3c with crng_init=0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

A.
