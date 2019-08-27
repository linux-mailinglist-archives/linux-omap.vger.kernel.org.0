Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB49B9F041
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 18:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730454AbfH0QdT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 12:33:19 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43584 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730456AbfH0QdT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 12:33:19 -0400
Received: by mail-qk1-f194.google.com with SMTP id m2so17499736qkd.10;
        Tue, 27 Aug 2019 09:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/zg0bV3qxRrrZ8M4aU2pwZR/A1NqBI7vpxBYLuL1/5c=;
        b=j3Jiius+Z8WuK32G/Nqm5EWD7Hu04KbAui3teuc2W9F3B33LNQ3x0Qyq2DY4/aAxJz
         Rb8KSp090PhHShKf9HUSSgqHF8cQhqrKNcxhJhkicAWAvTn4CGUTHd/SDyCvu3PP27k4
         m5kz6L0SbhFspLVvpbxjPU3hlesg67K4+c/az440bca6KKR1SI/e8Bw0Srt0CnNP8hn8
         s5SjsSt+DFuP3fKKBiWejb+JQ08Sl9xtJUPkwcB33FN5zxHc1DcRwBQqGA5MVGg9K4ji
         OViPaEA5rlXsEo6qz8GdIBqHFwYnxJj3B+ZL6m6YVz5aOGunDS/5K7tpu3vdrLUzPtyl
         dX9g==
X-Gm-Message-State: APjAAAWxCWbCu4BMq6/ZeT4KRa86f0V9+RyTA59el84cAJKtI+lM0A+W
        aHq507TKYmzcNN6ZKiAEn/a1+0dcKWPQnolv4Pw=
X-Google-Smtp-Source: APXvYqxmXX+KSa+dqu82Y9804plYSWjLPoR2eL0zXepUxEM9uaGcvZ5C/ITNAAIVCt20lQg/KUKT+p99sfbOHZrATd8=
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr22291349qka.3.1566923597978;
 Tue, 27 Aug 2019 09:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190808212234.2213262-1-arnd@arndb.de> <20190808212234.2213262-15-arnd@arndb.de>
 <20190813103605.GL52127@atomide.com> <CAK8P3a0E+QUn9wcP5Obv-FitWyXCFwcp+oPConeO2p-NV1rqsw@mail.gmail.com>
 <20190813181158.GA26798@darkstar.musicnaut.iki.fi> <CAK8P3a0LjKrc+7c5Ht9OL7LfYyLnG9=y7u+w24ujA1xAid_yCQ@mail.gmail.com>
 <20190814074918.GA52127@atomide.com> <CAK8P3a3k_HOGqzMGjtc+7NSaK0Bsa_vxxRFLzY8aP6ev4wa9iA@mail.gmail.com>
 <20190816083403.GB1952@darkstar.musicnaut.iki.fi>
In-Reply-To: <20190816083403.GB1952@darkstar.musicnaut.iki.fi>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 27 Aug 2019 18:33:01 +0200
Message-ID: <CAK8P3a3jqNxoihQ+UFvOZMg=AcF2yzHXs5ay6X1TZX8L3zQ3rg@mail.gmail.com>
Subject: Re: [PATCH 14/22] ARM: omap1: use pci_ioremap_io() for omap_cf
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Tony Lindgren <tony@atomide.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
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

On Fri, Aug 16, 2019 at 10:34 AM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> On Wed, Aug 14, 2019 at 12:36:40PM +0200, Arnd Bergmann wrote:
> > On Wed, Aug 14, 2019 at 9:49 AM Tony Lindgren <tony@atomide.com> wrote:
> > > * Arnd Bergmann <arnd@arndb.de> [190813 19:34]:
> > > > -#define OMAP1_IO_OFFSET                0x01000000      /* Virtual IO
> > > > = 0xfefb0000 */
> > > > +#define OMAP1_IO_OFFSET                0x00fb0000      /* Virtual IO
> > > > = 0xff000000 */
> > > >  #define OMAP1_IO_ADDRESS(pa)   IOMEM((pa) - OMAP1_IO_OFFSET)
> > >
> > > Oh OK yeah sounds like that's the issue.
> > >
> > > > There may be additional locations that hardcode the virtual address.
> > >
> > > Those should be in mach-omap1/io.c, and I recall innovator had some
> > > hardcoded fpga address that should also be checked.
> >
> > I see four boards with hardcoded I/O addresses, but they are all below
> > the PCI I/O virtual address range, and are not affected by that change.
> >
> > For the innovator FPGA access, this was ok, it uses the correct address
> > in the OMAP1_IO_OFFSET range.
>
> I tried testing this on OSK board. If I boot with earlyprintk disabled,
> it boots OK and everything works (also CF card) with your playground
> commit 5723b6686943.
>
> However with earlyprintk it seems to hang as soon as kernel tries to print
> something. So something goes wrong with early DEBUG_LL mapping code when
> CONFIG_DEBUG_UART_VIRT=0xff000000 is used?

I just redid the calculation and came out with the same address, so I
don't think I put the wrong one there. The address also does not
conflict with the PCI mapping, and the address is the same one that
is installed later, so that should also be fine.

Are you sure you used the correct address in the .config file? If you
ran 'make oldconfig', the virtual address would not be changed here
as I just modify the default for a fresh 'make omap1_defconfig'
run or similar.

        Arnd
