Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91F188B61A
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2019 13:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfHMLCf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Aug 2019 07:02:35 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:34118 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfHMLCf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Aug 2019 07:02:35 -0400
Received: by mail-qk1-f193.google.com with SMTP id m10so4086812qkk.1;
        Tue, 13 Aug 2019 04:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WIVPRunU/w1dyBYpE62jjyhKpZiqDaIeAA95Lfp6mlw=;
        b=ZEudSP3Rw+qf2YvMwh5BDUd1UJgkmAtYV7pZokIHc27y3Px7SF4IJ3bB8RQHAGHsno
         Q+dPaa2AKkRutdAEhGgg7GCTcEWtG/xWU9KbKUZ+0HmhHH3mWz3aexD0fh6+x+YEC8ma
         PqDO5vlUKJkPwOAwKUo8E3eG3OSqwsc294aJ93CHtrUJ0mzWFzlizrWoJ52IBzCoBVep
         crW2F7pkqO8CmtzcCCeJL12gZeyXSP/kTLp2bcQL/oHAXKSagosQkO2SK8Q4lFZUGamN
         P8hmUlfU+XA/rRJXKCJ09VsrAyQtyHbPygzdI5jQG/i/dEdd8KVlQugqEahSVZuAdSyY
         GGKw==
X-Gm-Message-State: APjAAAVHPSleOEVHabzPjwy9z2iVk4XBYaHDp5J1V3pF2J3XZ/g2roLU
        NmGM0fAcxSxs6ajtvfTDekE2u/avrInGblb3Gtg=
X-Google-Smtp-Source: APXvYqy/CATnyfix26F5hVCSlz5bm0U3GsHRNm6L5LCpSh5nvRem8bN2wSesbPtcSYmDrOPrd5ebcEHN4QWXNlj1ZGw=
X-Received: by 2002:a05:620a:b:: with SMTP id j11mr33354187qki.352.1565694153731;
 Tue, 13 Aug 2019 04:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190808212234.2213262-1-arnd@arndb.de> <20190808212234.2213262-15-arnd@arndb.de>
 <20190813103605.GL52127@atomide.com>
In-Reply-To: <20190813103605.GL52127@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 13 Aug 2019 13:02:16 +0200
Message-ID: <CAK8P3a0E+QUn9wcP5Obv-FitWyXCFwcp+oPConeO2p-NV1rqsw@mail.gmail.com>
Subject: Re: [PATCH 14/22] ARM: omap1: use pci_ioremap_io() for omap_cf
To:     Tony Lindgren <tony@atomide.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
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

On Tue, Aug 13, 2019 at 12:36 PM Tony Lindgren <tony@atomide.com> wrote:

> * Arnd Bergmann <arnd@arndb.de> [190808 21:34]:
> > The ISA I/O space handling in omap_cf is incompatible with
> > PCI drivers in a multiplatform kernel, and requires a custom
> > mach/io.h.
> >
> > Change the driver to use pci_ioremap_io() like PCI drivers do,
> > so the generic ioport access can work across platforms.
> >
> > To actually use that code, we have to select CONFIG_PCI
> > here.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Looks like this series boots for me on 5912osk up to this
> patch

Ok, that's something. Thanks for testing!

>, but this patch breaks booting somehow.
>
> Any ideas for fixes?

I can think of multiple possible issues:

- I force CONFIG_PCI to be enabled here in order to keep the
  asm/io.h logic unchanged. If PCI support in itself is an issue,
  then turning on CONFIG_PCI without the rest of this patch
  should also break.

- I see that osk is the one board that actually has a CF slot.
  If it crashes while trying to access a CF device, then I most
  likely screwed up the I/O port mapping itself, so it uses the
  wrong virtual and/or physical address for the access.

- I made on the assumption that only CF devices use inb/outb
  on any OMAP1 machine. If there is a driver that uses inb/outb
  instead of readb/writeb, it would have worked by chance before
  but stopped working now.

        Arnd
