Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22860A095C
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 20:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfH1SXY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 14:23:24 -0400
Received: from emh04.mail.saunalahti.fi ([62.142.5.110]:41908 "EHLO
        emh04.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfH1SXX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 14:23:23 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-76-175-nat.elisa-mobile.fi [85.76.76.175])
        by emh04.mail.saunalahti.fi (Postfix) with ESMTP id 40CF5300A0;
        Wed, 28 Aug 2019 21:23:19 +0300 (EEST)
Date:   Wed, 28 Aug 2019 21:23:19 +0300
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
Message-ID: <20190828182318.GL30291@darkstar.musicnaut.iki.fi>
References: <20190813103605.GL52127@atomide.com>
 <CAK8P3a0E+QUn9wcP5Obv-FitWyXCFwcp+oPConeO2p-NV1rqsw@mail.gmail.com>
 <20190813181158.GA26798@darkstar.musicnaut.iki.fi>
 <CAK8P3a0LjKrc+7c5Ht9OL7LfYyLnG9=y7u+w24ujA1xAid_yCQ@mail.gmail.com>
 <20190814074918.GA52127@atomide.com>
 <CAK8P3a3k_HOGqzMGjtc+7NSaK0Bsa_vxxRFLzY8aP6ev4wa9iA@mail.gmail.com>
 <20190816083403.GB1952@darkstar.musicnaut.iki.fi>
 <CAK8P3a3jqNxoihQ+UFvOZMg=AcF2yzHXs5ay6X1TZX8L3zQ3rg@mail.gmail.com>
 <20190827190453.GJ30291@darkstar.musicnaut.iki.fi>
 <CAK8P3a1PeBMRuweAmzrTQC85CmwdZPirG3HPg9aJ99p2U7zknQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1PeBMRuweAmzrTQC85CmwdZPirG3HPg9aJ99p2U7zknQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Wed, Aug 28, 2019 at 03:02:36PM +0200, Arnd Bergmann wrote:
> On Tue, Aug 27, 2019 at 9:05 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> > On Tue, Aug 27, 2019 at 06:33:01PM +0200, Arnd Bergmann wrote:
> > > On Fri, Aug 16, 2019 at 10:34 AM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> > > > However with earlyprintk it seems to hang as soon as kernel tries to print
> > > > something. So something goes wrong with early DEBUG_LL mapping code when
> > > > CONFIG_DEBUG_UART_VIRT=0xff000000 is used?
> > >
> > > I just redid the calculation and came out with the same address, so I
> > > don't think I put the wrong one there. The address also does not
> > > conflict with the PCI mapping, and the address is the same one that
> > > is installed later, so that should also be fine.
> > >
> > > Are you sure you used the correct address in the .config file? If you
> > > ran 'make oldconfig', the virtual address would not be changed here
> > > as I just modify the default for a fresh 'make omap1_defconfig'
> > > run or similar.
> >
> > Yes... You should be able to try this out also in QEMU to see the hang:
> 
> Haven't tried yet, but I took a look at the dump:
> 
> > $ qemu-system-arm -M sx1 -kernel sx1-zImage -nographic
> >
> > [ Hangs silently, press Ctrl-a c to enter monitor. ]
> >
> > QEMU 4.1.0 monitor - type 'help' for more information
> > (qemu) info registers
> > R00=c0379de1 R01=0000005b R02=00000000 R03=ff000000
> > R04=00000000 R05=00000031 R06=c038f119 R07=00000000
> > R08=00000000 R09=c038f50e R10=600001d3 R11=00000001
> > R12=00000010 R13=c0379de0 R14=c000e07c R15=c000dfcc
> > PSR=000001d3 ---- A svc32
> > FPSCR: 00000000
> >
> > from System.map:
> > c000df7c T printascii
> > c000dfe0 T printch
> 
> Ok, that is clearly the "busyloop" macro in
> arch/arm/include/debug/8250.S, checking if the data got sent.
> 
> The 'r2' register contains zero, so UART_LSR_TEMT and
> UART_LSR_THRE are not set, but presumably the mapping
> was installed right since you did not get a page fault.
> 
> I assume you checked that the uart output wasn't already broken
> by one of the earlier patches, right?

Correct, it's only with the mapping change patch it hangs.

> Also, looking at arch/arm/mach-omap1/include/mach/uncompress.h
> it seems that SX1 normally uses UART3, not UART1.
> Is that different in qemu?

In QEMU all uarts can be used, trying with UART3 as early console
hangs as well. (It prints Uncompressing... done. but I guess that's
done with the physical address.)

A.
