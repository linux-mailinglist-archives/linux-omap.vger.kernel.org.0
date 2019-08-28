Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5697A0270
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 15:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfH1NCy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 09:02:54 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39443 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfH1NCy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 09:02:54 -0400
Received: by mail-qt1-f195.google.com with SMTP id n7so12760qtb.6;
        Wed, 28 Aug 2019 06:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IGBGJGSXKu1XI7QCTZRx+ka85VzBENyC+3JcanBjN3E=;
        b=kels8ahvdbtG6I/zeXlp2TPncvBGw+0OZ6yveDN/QHjqt66v/KTiuxyDkNH4mLAeeh
         f4ScJWKCH9HhgAeK5giljAYVR6RQMe+JteLC7CHuOyyO0+3mcHmpfvh7kf68Nz6RMsN5
         YYSzrG3uDUhrmC6Rv1976zwvnIpAXCMsFxQ2YjMe12Za0vHYsB1V9nF18Cc0mH/euCZw
         hnIuy3VF2KbylkfR7KiP9BKoQiLnnXIvKZhfzE62MzvoQX+7jyo8yRWg7fOkUFAjGTiH
         A71nmS8U18m5SbtwUrJJIWSiQAIvWivEPQaKaYc5GdYU8WBReyZYNfWCJbgbI0raVmJy
         pROw==
X-Gm-Message-State: APjAAAU7irnUz74pNRden1djY0tbvT8j37oku3imyo9clV7f9A55d91X
        LnNhvzU0aGkofzSGu8Pu4yA0KmYDpLHDdT5cV6M=
X-Google-Smtp-Source: APXvYqwFs2+ff1HO4EmjqAOCzKXa7tMdrsXizeCnfMrVB5CqO4/vjsoIDKOUj+3CtQPhIKsdnKwWMimhgoCxxhSPV9c=
X-Received: by 2002:ac8:239d:: with SMTP id q29mr4036253qtq.304.1566997372955;
 Wed, 28 Aug 2019 06:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190808212234.2213262-1-arnd@arndb.de> <20190808212234.2213262-15-arnd@arndb.de>
 <20190813103605.GL52127@atomide.com> <CAK8P3a0E+QUn9wcP5Obv-FitWyXCFwcp+oPConeO2p-NV1rqsw@mail.gmail.com>
 <20190813181158.GA26798@darkstar.musicnaut.iki.fi> <CAK8P3a0LjKrc+7c5Ht9OL7LfYyLnG9=y7u+w24ujA1xAid_yCQ@mail.gmail.com>
 <20190814074918.GA52127@atomide.com> <CAK8P3a3k_HOGqzMGjtc+7NSaK0Bsa_vxxRFLzY8aP6ev4wa9iA@mail.gmail.com>
 <20190816083403.GB1952@darkstar.musicnaut.iki.fi> <CAK8P3a3jqNxoihQ+UFvOZMg=AcF2yzHXs5ay6X1TZX8L3zQ3rg@mail.gmail.com>
 <20190827190453.GJ30291@darkstar.musicnaut.iki.fi>
In-Reply-To: <20190827190453.GJ30291@darkstar.musicnaut.iki.fi>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 28 Aug 2019 15:02:36 +0200
Message-ID: <CAK8P3a1PeBMRuweAmzrTQC85CmwdZPirG3HPg9aJ99p2U7zknQ@mail.gmail.com>
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

On Tue, Aug 27, 2019 at 9:05 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> On Tue, Aug 27, 2019 at 06:33:01PM +0200, Arnd Bergmann wrote:
> > On Fri, Aug 16, 2019 at 10:34 AM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> > > However with earlyprintk it seems to hang as soon as kernel tries to print
> > > something. So something goes wrong with early DEBUG_LL mapping code when
> > > CONFIG_DEBUG_UART_VIRT=0xff000000 is used?
> >
> > I just redid the calculation and came out with the same address, so I
> > don't think I put the wrong one there. The address also does not
> > conflict with the PCI mapping, and the address is the same one that
> > is installed later, so that should also be fine.
> >
> > Are you sure you used the correct address in the .config file? If you
> > ran 'make oldconfig', the virtual address would not be changed here
> > as I just modify the default for a fresh 'make omap1_defconfig'
> > run or similar.
>
> Yes... You should be able to try this out also in QEMU to see the hang:

Haven't tried yet, but I took a look at the dump:

> $ qemu-system-arm -M sx1 -kernel sx1-zImage -nographic
>
> [ Hangs silently, press Ctrl-a c to enter monitor. ]
>
> QEMU 4.1.0 monitor - type 'help' for more information
> (qemu) info registers
> R00=c0379de1 R01=0000005b R02=00000000 R03=ff000000
> R04=00000000 R05=00000031 R06=c038f119 R07=00000000
> R08=00000000 R09=c038f50e R10=600001d3 R11=00000001
> R12=00000010 R13=c0379de0 R14=c000e07c R15=c000dfcc
> PSR=000001d3 ---- A svc32
> FPSCR: 00000000
>
> from System.map:
> c000df7c T printascii
> c000dfe0 T printch

Ok, that is clearly the "busyloop" macro in
arch/arm/include/debug/8250.S, checking if the data got sent.

The 'r2' register contains zero, so UART_LSR_TEMT and
UART_LSR_THRE are not set, but presumably the mapping
was installed right since you did not get a page fault.

I assume you checked that the uart output wasn't already broken
by one of the earlier patches, right?

Also, looking at arch/arm/mach-omap1/include/mach/uncompress.h
it seems that SX1 normally uses UART3, not UART1.
Is that different in qemu?

        Arnd
