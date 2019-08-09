Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6CD88382
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 21:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfHITzZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Aug 2019 15:55:25 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:37337 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfHITzZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 9 Aug 2019 15:55:25 -0400
Received: by mail-qk1-f194.google.com with SMTP id s14so2175561qkm.4;
        Fri, 09 Aug 2019 12:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dnOilxMk2SUL76Uue/BpGe79hjdo4enHEg4ADIUo9fQ=;
        b=rdGrp1ubfX6NWQYb6HqUhk2L8V9iDyYxp8j6ml2JDs4JDn8cqBAaUTZRFARG2Gi+E/
         FBHo8nqlGbAq1NlHRlQYgk66c1EdK3WtZX/WkE3BbQfMo+5icTLUfLSQdPlBZ96O852w
         8KZ0PeriB2ngDPr/cGMpa5JD1erZANLuAkejKJEeoeDAN+XDZ98wAFx6v9VwPYTEhY8N
         P7DekPKSc8ZjQXZpk40zso0GvwMkXbLGlDmkGUaFpyDERP11HSMbWLBC0wM255PHWSuu
         R1UGUcK/np9N6NC2EuEBvY4CbftOXr4L4iHupv7cMCxTschj1Yx1Jr3tm9zlj1Q9PGt7
         SsIg==
X-Gm-Message-State: APjAAAW+PpR4Rrf6tJEPYK8O3LJY93tkxOmmooZYim/9chcyx13BfBZU
        OF8/yI7wLB9ou1hd5dcLtmR7DRzXzDCh5c8UjfU=
X-Google-Smtp-Source: APXvYqwAu5/r0mHWormPvLY7YMy/YQGg6b0vzBOW6n/lxhXedE7IhmTuQUWTlOO73gdZw7G2QGBV7Ro3F8/PmGWkabE=
X-Received: by 2002:a05:620a:b:: with SMTP id j11mr20047492qki.352.1565380523825;
 Fri, 09 Aug 2019 12:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190808212234.2213262-1-arnd@arndb.de> <CGME20190808212453epcas2p44ff418662ee1acf428c6842ee4488f9f@epcas2p4.samsung.com>
 <20190808212234.2213262-3-arnd@arndb.de> <55c9608d-68c4-17f6-2682-7668d5d7720a@samsung.com>
 <CAK8P3a3grFEGr33s327yNMabK5=1kCJc3k7y55dhzQx9sTvkyQ@mail.gmail.com> <487da98d-a862-0207-289a-bca8ff18e51a@samsung.com>
In-Reply-To: <487da98d-a862-0207-289a-bca8ff18e51a@samsung.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 9 Aug 2019 21:55:07 +0200
Message-ID: <CAK8P3a0_v1XM-fH5TOr-osrdLOsfYGbG8VCqktuSgUU7jKtgNQ@mail.gmail.com>
Subject: Re: [PATCH 02/22] ARM: omap1: make omapfb standalone compilable
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Aug 9, 2019 at 4:36 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> On 8/9/19 1:43 PM, Arnd Bergmann wrote:

> >
> > That would have been ok as well, but having the addition here was
> > intentional and seems more logical to me as this is where the headers
> > get moved around.
> I see that this is an optimization for making the patch series more
> compact but I think that this addition logically belongs to patch #9
> (which adds support for COMPILE_TEST) where the new code is required.
>
> Moreover patch description for patch #2 lacks any comment about this
> addition being a preparation for changes in patch #9 so I was quite
> puzzled about its purpose when seeing it first.
>
> Therefore please have mercy on the poor/stupid reviewer and don't do
> such optimizations intentionally (or at least describe them properly
> somewhere).. ;-)

Ok, I looked at it some more and agree that you are right. I've split it
up further now into patches that make more sense by themselves:

commit ad71cdc54404ecde2e88678ee6bc7ae7fb8aec97
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue Aug 6 16:08:34 2019 +0200

    fbdev: omap: avoid using mach/*.h files

    All the headers we actually need are now in include/linux/soc,
    so use those versions instead and allow compile-testing on
    other architectures.

    Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

 drivers/video/backlight/Kconfig          | 4 ++--
 drivers/video/backlight/omap1_bl.c       | 4 ++--
 drivers/video/fbdev/omap/Kconfig         | 4 ++--
 drivers/video/fbdev/omap/lcd_ams_delta.c | 2 +-
 drivers/video/fbdev/omap/lcd_dma.c       | 3 ++-
 drivers/video/fbdev/omap/lcd_inn1510.c   | 2 +-
 drivers/video/fbdev/omap/lcd_osk.c       | 4 ++--
 drivers/video/fbdev/omap/lcdc.c          | 2 ++
 drivers/video/fbdev/omap/omapfb_main.c   | 3 +--
 drivers/video/fbdev/omap/sossi.c         | 1 +
 10 files changed, 16 insertions(+), 13 deletions(-)

commit 959e0d68751757e84dd703f60405c7268763dba4
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Fri Aug 9 21:27:01 2019 +0200

    fbdev: omap: pass irqs as resource

    To avoid relying on the mach/irqs.h header, stop using
    OMAP_LCDC_IRQ and INT_1610_SoSSI_MATCH directly in the driver
    code, but instead pass these as resources.

    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

 arch/arm/mach-omap1/fb.c               | 19 ++++++++++++++++++-
 drivers/video/fbdev/omap/lcdc.c        |  6 +++---
 drivers/video/fbdev/omap/omapfb.h      |  2 ++
 drivers/video/fbdev/omap/omapfb_main.c | 16 +++++++++++++++-
 drivers/video/fbdev/omap/sossi.c       |  2 +-
 5 files changed, 39 insertions(+), 6 deletions(-)


commit 6643f7a7da3ca7ce8f2ff094fecab7a0fd706acf
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Fri Aug 9 21:42:31 2019 +0200

    ARM: omap1: declare a dummy omap_set_dma_priority

    omapfb calls directly into the omap_set_dma_priority() function in
    the DMA driver. This prevents compile-testing omapfb on other
    architectures. Add an inline function next to the other ones
    for non-omap configurations.

    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

 include/linux/omap-dma.h | 3 +++
 1 file changed, 3 insertions(+)

commit 154bfb7ddcecdbca66d9a086776a3108831ef0b9
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Mon Aug 5 23:15:37 2019 +0200

    ARM: omap1: move lcd_dma code into omapfb driver

    The omapfb driver is split into platform specific code for omap1, and
    driver code that is also specific to omap1.

    Moving both parts into the driver directory simplifies the structure
    and avoids the dependency on certain omap machine header files.

    As mach/lcd_dma.h can not be included from include/linux/omap-dma.h
    any more now, move the omap_lcd_dma_running() declaration into the
    omap-dma header, which matches where it is defined.

    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

 arch/arm/mach-omap1/Makefile
   |  4 ----
 arch/arm/mach-omap1/include/mach/lcdc.h
   | 44 --------------------------------------------
 drivers/video/fbdev/Makefile
   |  2 +-
 drivers/video/fbdev/omap/Makefile
   |  5 +++++
 {arch/arm/mach-omap1 => drivers/video/fbdev/omap}/lcd_dma.c
   |  4 +++-
 {arch/arm/mach-omap1/include/mach =>
drivers/video/fbdev/omap}/lcd_dma.h |  2 --
 drivers/video/fbdev/omap/lcdc.c
   |  2 +-
 drivers/video/fbdev/omap/lcdc.h
   | 35 +++++++++++++++++++++++++++++++++++
 drivers/video/fbdev/omap/sossi.c                                         |  1 +
 include/linux/omap-dma.h
   |  4 ++--
 10 files changed, 48 insertions(+), 55 deletions(-)

commit b8ddb98d29a43fecb4387d0d8218935cb1997a28
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue Aug 6 14:59:00 2019 +0200

    ARM: omap1: innovator: pass lcd control address as pdata

    To avoid using the mach/omap1510.h header file, pass the correct
    address as platform data.

    Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

 arch/arm/mach-omap1/board-innovator.c  | 3 +++
 drivers/video/fbdev/omap/lcd_inn1510.c | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

The resulting code is the same as before, I'll post that again along
the rest of the series next week. Should I add your Ack to each
patch already?

       Arnd
