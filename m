Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 041188DFA1
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 23:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728443AbfHNVKH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 17:10:07 -0400
Received: from emh01.mail.saunalahti.fi ([62.142.5.107]:51686 "EHLO
        emh01.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728395AbfHNVKH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Aug 2019 17:10:07 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-96-82-nat.elisa-mobile.fi [85.76.96.82])
        by emh01.mail.saunalahti.fi (Postfix) with ESMTP id A8FA6200B2;
        Thu, 15 Aug 2019 00:10:02 +0300 (EEST)
Date:   Thu, 15 Aug 2019 00:10:02 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>, Paul Walmsley <paul@pwsan.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 21/22] ARM: omap1: use common clk framework
Message-ID: <20190814211002.GA1952@darkstar.musicnaut.iki.fi>
References: <20190808212234.2213262-1-arnd@arndb.de>
 <20190808214347.2865294-1-arnd@arndb.de>
 <20190808214347.2865294-2-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808214347.2865294-2-arnd@arndb.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Thu, Aug 08, 2019 at 11:43:39PM +0200, Arnd Bergmann wrote:
> The omap1 clock driver now uses types and calling conventions
> that are compatible with the common clk core.
> 
> Turn on CONFIG_COMMON_CLK and remove all the code that is
> now duplicated.
> 
> Note: if this previous steps didn't already break it, this one
> most likely will, because the interfaces are very likely to
> have different semantics.

QEMU SX1 board works up to this patch (the I/O virtual address change
included). With this patch, it seems to fail to allocate memory during
omap1_init_early() (the log is a bit messy as I extracted it using QEMU
memory dumping):

swapper: page allocation failure: order:0, mode:0x0(), nodemask=(null)
CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.0-rc4-sx1-los_80efa++ #1
Hardware name: OMAP310 based Siemens SX1
[<c000dc44>] (unwind_backtrace) from [<c000cb00>] (show_stack+0x10/0x18)
[<c000cb00>] (show_stack) from [<c0172ba8>] (dump_stack+0x18/0x24)
[<c0172ba8>] (dump_stack) from [<c00844e8>] (warn_alloc+0x90/0x140)
[<c00844e8>] (warn_alloc) from [<c0084dcc>] (__alloc_pages_nodemask+0x7a4/0x9cc)
[<c0084dcc>] (__alloc_pages_nodemask) from [<c008df24>] (slob_new_pages.constpro
p.2+0x10/0x3c)
[<c008df24>] (slob_new_pages.constprop.2) from [<c008e208>] (slob_alloc.constprop.1+0xe4/0x1e8)
[<c008e208>] (slob_alloc.constprop.1) from [<c008e344>] (__kmalloc+0x38/0xb0)
[<c008e344>] (__kmalloc) from [<c0126514>] (__clk_register+0x20/0x62c)
[<c0126514>] (__clk_register) from [<c01f6614>] (omap1_clk_init+0x88/0x220)
[<c01f6614>] (omap1_clk_init) from [<c01f5820>] (omap1_init_early+0x20/0x30)
[<c01f5820>] (omap1_init_early) from [<c01f09e8>] (start_kernel+0x48/0x408)
[<c01f09e8>] (start_kernel) from [<00000000>] (0x0)
Clocks: ARM_SYSST: 0x003a DPLL_CTL: 0x2002 ARM_CKCTL: 0x3000
Clocking rate (xtal/DPLL1/MPU): 12.0/12.0/0.0 MHz
"8<--- cut here ---
"Unable to handle kernel NULL pointer dereference at virtual address 00000018
"pgd = (ptrval)
"[00000018] *pgd=00000000
Internal error: Oops: 5 [#1] ARM
CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.0-rc4-sx1-los_80efa++ #1
Hardware name: OMAP310 based Siemens SX1
PC is at clk_hw_get_parent+0x4/0x14
LR is at omap1_clk_enable+0xc/0xcc
OMAP310 based Siemens SX1
[    0.000000]  free:0 free_pcp:0 free_cma:0
pc : [<c0126cd0>]    lr : [<c00128d4>]    psr: 600001d3
sp : c03aff88  ip : 00000000  fp : 00000000
r10: 00000001  r9 : 54029252  r8 : 10000100
r7 : c03b1000  r6 : 00002002  r5 : 0000003a  r4 : c03b5444
r3 : 00000000  r2 : c03b9818  r1 : ff03ce08  r0 : c03b5444
Flags: nZCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM  Segment user
Control: 0000317f  Table: 10004000  DAC: 00000055
Process swapper (pid: 0, stack limit = 0x(ptrval))
Stack: (0xc03aff88 to 0xc03b0000)
ff80:                   c03b5438 0000003a 00002002 c01f6734 00000000 00000057
ffa0: 0000313d c01f5820 00000000 c01f09e8 00000000 00000000 00000000 00000000
ffc0: 00000000 00000000 00000000 c0201a38 00000000 c01f0330 00000057 0000313d
ffe0: 00000265 10000100 54029252 0000317f 00000000 00000000 00000000 00000000
[<c0126cd0>] (clk_hw_get_parent) from [<c00128d4>] (omap1_clk_enable+0xc/0xcc)
[<c00128d4>] (omap1_clk_enable) from [<c01f6734>] (omap1_clk_init+0x1a8/0x220)
[<c01f6734>] (omap1_clk_init) from [<c01f5820>] (omap1_init_early+0x20/0x30)
[<c01f5820>] (omap1_init_early) from [<c01f09e8>] (start_kernel+0x48/0x408)
[<c01f09e8>] (start_kernel) from [<00000000>] (0x0)

A.
