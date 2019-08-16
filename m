Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E37C8FDE1
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2019 10:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfHPIeI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Aug 2019 04:34:08 -0400
Received: from emh01.mail.saunalahti.fi ([62.142.5.107]:49476 "EHLO
        emh01.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfHPIeI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Aug 2019 04:34:08 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-65-201-nat.elisa-mobile.fi [85.76.65.201])
        by emh01.mail.saunalahti.fi (Postfix) with ESMTP id 4776820418;
        Fri, 16 Aug 2019 11:34:04 +0300 (EEST)
Date:   Fri, 16 Aug 2019 11:34:03 +0300
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
Message-ID: <20190816083403.GB1952@darkstar.musicnaut.iki.fi>
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
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Wed, Aug 14, 2019 at 12:36:40PM +0200, Arnd Bergmann wrote:
> On Wed, Aug 14, 2019 at 9:49 AM Tony Lindgren <tony@atomide.com> wrote:
> > * Arnd Bergmann <arnd@arndb.de> [190813 19:34]:
> > > -#define OMAP1_IO_OFFSET                0x01000000      /* Virtual IO
> > > = 0xfefb0000 */
> > > +#define OMAP1_IO_OFFSET                0x00fb0000      /* Virtual IO
> > > = 0xff000000 */
> > >  #define OMAP1_IO_ADDRESS(pa)   IOMEM((pa) - OMAP1_IO_OFFSET)
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

I tried testing this on OSK board. If I boot with earlyprintk disabled,
it boots OK and everything works (also CF card) with your playground
commit 5723b6686943.

However with earlyprintk it seems to hang as soon as kernel tries to print
something. So something goes wrong with early DEBUG_LL mapping code when
CONFIG_DEBUG_UART_VIRT=0xff000000 is used?

A.
