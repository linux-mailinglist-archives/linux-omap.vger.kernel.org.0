Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1278E53E
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2019 09:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730535AbfHOHKt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Aug 2019 03:10:49 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:33440 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730404AbfHOHKs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Aug 2019 03:10:48 -0400
Received: by mail-qt1-f196.google.com with SMTP id v38so1469004qtb.0;
        Thu, 15 Aug 2019 00:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+XZYmbsnbr0sSwIKTeFZGEhcqBxG1btN9f5DRyi29Vc=;
        b=DfO8MQ8L3aUWOnTlbTG1bpnKD4q2MFa849saZYTebOqTqoUI4bA7jI453gfyE8dCQT
         m33owpPqbUtBwzyI9wLH0dCaQnQLg0xdIy3U7CI7fXtu/OVleoYHLlP7scCEgUY3fOjF
         H6BFgaIerNa6IUaWt9qQ9bzAT58kwtH+POhCvfxpGybZLrCxtGz73BH4QT2Kw4sRsZ9b
         LLnWu42T0rkK9b8ilCdOyC90P3ZD23E03gn8sF80PyfnDtLQOxItTAeLzHxkOyDd7XSf
         4lghyBWJYZ81mSgao52TbX6y7Wa8W6skagPs3HpKz2pqnAUDJBiH9PYG56wfO4nk0j5K
         BEJQ==
X-Gm-Message-State: APjAAAU32kcxfXUNksln0EyFECCWaj/+GHbWrn9vybPkDD9ZxfUrecPN
        +2vqSy5s+MWMIl47bhXz4t+ckmrTm+Fr19GgjPU=
X-Google-Smtp-Source: APXvYqzes2xrmqdbClCROX/Q+PfszKVeI1DW0ZX+TIylT9deTu0v9IMyny/8McBlEj0PozeCVXwlC25l9yO+FLH9dOM=
X-Received: by 2002:ac8:117:: with SMTP id e23mr2752639qtg.18.1565853047353;
 Thu, 15 Aug 2019 00:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190808212234.2213262-1-arnd@arndb.de> <20190808214347.2865294-1-arnd@arndb.de>
 <20190808214347.2865294-2-arnd@arndb.de> <20190814211002.GA1952@darkstar.musicnaut.iki.fi>
In-Reply-To: <20190814211002.GA1952@darkstar.musicnaut.iki.fi>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 15 Aug 2019 09:10:31 +0200
Message-ID: <CAK8P3a36dztkctUD2jZND9gR7zo2joZu4PPzVozDJCi9gLcmkg@mail.gmail.com>
Subject: Re: [PATCH 21/22] ARM: omap1: use common clk framework
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Tony Lindgren <tony@atomide.com>, Paul Walmsley <paul@pwsan.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 14, 2019 at 11:10 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
>
> Hi,
>
> On Thu, Aug 08, 2019 at 11:43:39PM +0200, Arnd Bergmann wrote:
> > The omap1 clock driver now uses types and calling conventions
> > that are compatible with the common clk core.
> >
> > Turn on CONFIG_COMMON_CLK and remove all the code that is
> > now duplicated.
> >
> > Note: if this previous steps didn't already break it, this one
> > most likely will, because the interfaces are very likely to
> > have different semantics.
>
> QEMU SX1 board works up to this patch (the I/O virtual address change
> included). With this patch, it seems to fail to allocate memory during
> omap1_init_early() (the log is a bit messy as I extracted it using QEMU
> memory dumping):

That sounds pretty good, I definitely did not expect this patch
to work without first dealing with a few bugs, and it it did not break
earlier, I'm willing to call that success ;-)

Unfortunately, doing it in qemu does not guarantee that the clocks
are set up right at this point: if any of the clocks are disabled when
they should not be, qemu won't care as much as real hardware  would.

> swapper: page allocation failure: order:0, mode:0x0(), nodemask=(null)
> CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.0-rc4-sx1-los_80efa++ #1
> Hardware name: OMAP310 based Siemens SX1
> [<c000dc44>] (unwind_backtrace) from [<c000cb00>] (show_stack+0x10/0x18)
> [<c000cb00>] (show_stack) from [<c0172ba8>] (dump_stack+0x18/0x24)
> [<c0172ba8>] (dump_stack) from [<c00844e8>] (warn_alloc+0x90/0x140)
> [<c00844e8>] (warn_alloc) from [<c0084dcc>] (__alloc_pages_nodemask+0x7a4/0x9cc)
> [<c0084dcc>] (__alloc_pages_nodemask) from [<c008df24>] (slob_new_pages.constpro
> p.2+0x10/0x3c)
> [<c008df24>] (slob_new_pages.constprop.2) from [<c008e208>] (slob_alloc.constprop.1+0xe4/0x1e8)
> [<c008e208>] (slob_alloc.constprop.1) from [<c008e344>] (__kmalloc+0x38/0xb0)
> [<c008e344>] (__kmalloc) from [<c0126514>] (__clk_register+0x20/0x62c)
> [<c0126514>] (__clk_register) from [<c01f6614>] (omap1_clk_init+0x88/0x220)
> [<c01f6614>] (omap1_clk_init) from [<c01f5820>] (omap1_init_early+0x20/0x30)
> [<c01f5820>] (omap1_init_early) from [<c01f09e8>] (start_kernel+0x48/0x408)
> [<c01f09e8>] (start_kernel) from [<00000000>] (0x0)
> Clocks: ARM_SYSST: 0x003a DPLL_CTL: 0x2002 ARM_CKCTL: 0x3000
> Clocking rate (xtal/DPLL1/MPU): 12.0/12.0/0.0 MHz

Ok, so here the problem is that we call the omap1_clk_init() function from
setup_arch(), which is before we can even allocate memory with kmalloc.

Most other machines do it from init_time(), which comes after the initialization
of the memory allocator.

Something like this would be needed:

diff --git a/arch/arm/mach-omap1/io.c b/arch/arm/mach-omap1/io.c
index b0465a956ea8..17ba8dfd8e19 100644
--- a/arch/arm/mach-omap1/io.c
+++ b/arch/arm/mach-omap1/io.c
@@ -125,9 +125,6 @@ void __init omap1_init_early(void)
        omap_writew(0x0, MPU_PUBLIC_TIPB_CNTL);
        omap_writew(0x0, MPU_PRIVATE_TIPB_CNTL);

-       /* Must init clocks early to assure that timer interrupt works
-        */
-       omap1_clk_init();
        omap1_mux_init();
 }

diff --git a/arch/arm/mach-omap1/time.c b/arch/arm/mach-omap1/time.c
index 7cc1a968230e..4e5ddd1db429 100644
--- a/arch/arm/mach-omap1/time.c
+++ b/arch/arm/mach-omap1/time.c
@@ -228,6 +228,8 @@ static inline void omap_mpu_timer_init(void)
  */
 void __init omap1_timer_init(void)
 {
+       omap1_clk_init();
+
        if (omap_32k_timer_init() != 0)
                omap_mpu_timer_init();
 }

but the removed comment up there makes me suspect that it introduces
a different issue.

> "8<--- cut here ---
> "Unable to handle kernel NULL pointer dereference at virtual address 00000018
> "pgd = (ptrval)
> "[00000018] *pgd=00000000
> Internal error: Oops: 5 [#1] ARM
> CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.0-rc4-sx1-los_80efa++ #1
> Hardware name: OMAP310 based Siemens SX1
> PC is at clk_hw_get_parent+0x4/0x14
> LR is at omap1_clk_enable+0xc/0xcc
> OMAP310 based Siemens SX1
> [    0.000000]  free:0 free_pcp:0 free_cma:0
> pc : [<c0126cd0>]    lr : [<c00128d4>]    psr: 600001d3
> sp : c03aff88  ip : 00000000  fp : 00000000
> r10: 00000001  r9 : 54029252  r8 : 10000100
> r7 : c03b1000  r6 : 00002002  r5 : 0000003a  r4 : c03b5444
> r3 : 00000000  r2 : c03b9818  r1 : ff03ce08  r0 : c03b5444
> Flags: nZCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM  Segment user
> Control: 0000317f  Table: 10004000  DAC: 00000055
> Process swapper (pid: 0, stack limit = 0x(ptrval))
> Stack: (0xc03aff88 to 0xc03b0000)
> ff80:                   c03b5438 0000003a 00002002 c01f6734 00000000 00000057
> ffa0: 0000313d c01f5820 00000000 c01f09e8 00000000 00000000 00000000 00000000
> ffc0: 00000000 00000000 00000000 c0201a38 00000000 c01f0330 00000057 0000313d
> ffe0: 00000265 10000100 54029252 0000317f 00000000 00000000 00000000 00000000
> [<c0126cd0>] (clk_hw_get_parent) from [<c00128d4>] (omap1_clk_enable+0xc/0xcc)
> [<c00128d4>] (omap1_clk_enable) from [<c01f6734>] (omap1_clk_init+0x1a8/0x220)
> [<c01f6734>] (omap1_clk_init) from [<c01f5820>] (omap1_init_early+0x20/0x30)
> [<c01f5820>] (omap1_init_early) from [<c01f09e8>] (start_kernel+0x48/0x408)
> [<c01f09e8>] (start_kernel) from [<00000000>] (0x0)

clk_hw->core is NULL here, presumably as a result of the first issue.

      Arnd
