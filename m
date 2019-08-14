Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC758D51D
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 15:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfHNNkK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 09:40:10 -0400
Received: from muru.com ([72.249.23.125]:57752 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726722AbfHNNkK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Aug 2019 09:40:10 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D37C680C8;
        Wed, 14 Aug 2019 13:40:36 +0000 (UTC)
Date:   Wed, 14 Aug 2019 06:40:06 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 14/22] ARM: omap1: use pci_ioremap_io() for omap_cf
Message-ID: <20190814134006.GE52127@atomide.com>
References: <20190808212234.2213262-1-arnd@arndb.de>
 <20190808212234.2213262-15-arnd@arndb.de>
 <20190813103605.GL52127@atomide.com>
 <CAK8P3a0E+QUn9wcP5Obv-FitWyXCFwcp+oPConeO2p-NV1rqsw@mail.gmail.com>
 <20190813181158.GA26798@darkstar.musicnaut.iki.fi>
 <CAK8P3a0LjKrc+7c5Ht9OL7LfYyLnG9=y7u+w24ujA1xAid_yCQ@mail.gmail.com>
 <20190814074918.GA52127@atomide.com>
 <CAK8P3a3k_HOGqzMGjtc+7NSaK0Bsa_vxxRFLzY8aP6ev4wa9iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3k_HOGqzMGjtc+7NSaK0Bsa_vxxRFLzY8aP6ev4wa9iA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@arndb.de> [190814 10:37]:
> On Wed, Aug 14, 2019 at 9:49 AM Tony Lindgren <tony@atomide.com> wrote:
> > * Arnd Bergmann <arnd@arndb.de> [190813 19:34]:
> > > On Tue, Aug 13, 2019 at 8:12 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> > > diff --git a/arch/arm/mach-omap1/hardware.h b/arch/arm/mach-omap1/hardware.h
> > > index 232b8deef907..9fc76a3c9e57 100644
> > > --- a/arch/arm/mach-omap1/hardware.h
> > > +++ b/arch/arm/mach-omap1/hardware.h
> > > @@ -61,7 +61,7 @@ static inline u32 omap_cs3_phys(void)
> > >
> > >  #endif /* ifndef __ASSEMBLER__ */
> > >
> > > -#define OMAP1_IO_OFFSET                0x01000000      /* Virtual IO
> > > = 0xfefb0000 */
> > > +#define OMAP1_IO_OFFSET                0x00fb0000      /* Virtual IO
> > > = 0xff000000 */
> > >  #define OMAP1_IO_ADDRESS(pa)   IOMEM((pa) - OMAP1_IO_OFFSET)
> > >
> > >  #include "serial.h"
> >
> > Oh OK yeah sounds like that's the issue.
> >
> > > There may be additional locations that hardcode the virtual address.
> >
> > Those should be in mach-omap1/io.c, and I recall innovator had some
> > hardcoded fpga address that should also be checked.
> 
> I see four boards with hardcoded I/O addresses, but they are all below
> the PCI I/O virtual address range, and are not affected by that change.
> 
> For the innovator FPGA access, this was ok, it uses the correct address
> in the OMAP1_IO_OFFSET range.

OK thanks for checking. I tried to apply your virtual address patch to
test boot it, but could not get it to apply. What tree is it against?

Regards,

Tony
