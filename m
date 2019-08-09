Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F96887850
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 13:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbfHILXl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Aug 2019 07:23:41 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43210 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbfHILXk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 9 Aug 2019 07:23:40 -0400
Received: by mail-qt1-f193.google.com with SMTP id w17so14770656qto.10;
        Fri, 09 Aug 2019 04:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gRvZxPuek6JRQruqkUJVQMjk/VZ8xO7dmw6h4WlzFd8=;
        b=WuaD4yAT13VVQavIIanPYMWs5+oqp9KI29Q+xHlYVB7kU1d3Zww6FUKKWuzIx+8Ktl
         yFhaN69ky24Y+DsAc/997F3Xl3ggb4Wb5Dd2/mk1RhiuEChJfypa9YPl0vS/y6eB+2Se
         tfQ181d5FukxVH1ASnDRfBSxV3SrXHjKPqv3Wgv0XatKegTLK4Z/Hku3xpysOjWMxTer
         2ftZ0PYk9on7TntwuR2xA9cKHJJcBW03NRnEfOXVxDErysGr9GBcqou102NSjouL4td/
         sIqb3ekeKlBEGRZgodiMOImiOGmsUgMRfblRrq/XJdd+zH/ckKW4ZnwuuvB9qSOzWr63
         gzYg==
X-Gm-Message-State: APjAAAWwrlx+lQ20E8NqbfqMQZA0AuztnVm6ZDx0IgJcQC0vY+6vN5Pd
        jpXZjC7siOENGeQgOWEgVHmXRss/iMgo1GmvfMU=
X-Google-Smtp-Source: APXvYqwyfun0rS3dI0VPy9YQLTjb23p3p5REd7rS9TuRRKEk5l8WvDyNNaWtDch5+OMsqDgqQyJPBtXPE6lfaVR0VOI=
X-Received: by 2002:ac8:5311:: with SMTP id t17mr17162360qtn.304.1565349819769;
 Fri, 09 Aug 2019 04:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190808212234.2213262-1-arnd@arndb.de> <20190808212234.2213262-14-arnd@arndb.de>
 <20190808214257.GF178933@dtor-ws> <CAK8P3a2TOcjxwCBGkZAhMAf9HuTL=FAB1e0=FAg+oHB0U1nJ0A@mail.gmail.com>
 <20190808221950.GG178933@dtor-ws> <20190808233941.v6elo2mdji5awylu@earth.universe>
In-Reply-To: <20190808233941.v6elo2mdji5awylu@earth.universe>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 9 Aug 2019 13:23:23 +0200
Message-ID: <CAK8P3a1QUo=qCGMdojN2RZmpr_kmkqBcJXAOab06yRgSzz4VzQ@mail.gmail.com>
Subject: Re: [PATCH 13/22] input: omap: void using mach/*.h headers
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Aug 9, 2019 at 1:39 AM Sebastian Reichel <sre@kernel.org> wrote:
> On Thu, Aug 08, 2019 at 03:19:50PM -0700, Dmitry Torokhov wrote:
> > On Thu, Aug 08, 2019 at 11:46:45PM +0200, Arnd Bergmann wrote:
> > > On Thu, Aug 8, 2019 at 11:43 PM Dmitry Torokhov wrote:
> > > > On Thu, Aug 08, 2019 at 11:22:22PM +0200, Arnd Bergmann wrote:
> > > > > By using the new linux/soc/ti/omap1-io.h header instead,
> > > > > compile-testing can be enabled, and a CONFIG_ARCH_MULTIPLATFORM
> > > > > conversion of omap1 may eventually be possible.
> > > > >
> > > > > The warning in the header file gets removed in order to
> > > > > allow CONFIG_COMPILE_TEST.
> > > >
> > > > Given that we want to migrate people off this driver everywhere but
> > > > OMAP1 I wonder why we would want to improve compile coverage of it.
> > >
> > > Mainly for consistency: I'm converting all omap1 drivers in this series to
> > > not rely on mach/* headers and to let them be compiled standalone.
> > > The other drivers don't have a replacement, so I could treat this different
> > > from the rest and skip the Kconfig and platform_data changes if you
> > > prefer.
> >
> > Yes, because at least with the version you posted we are losing the
> > #warning telling people to move to matrix_keypad. We could do:
> >
> > #ifndef CONFIG_COMPILE_TEST
> > #warning ...
> > #endif
> >
> > if you really want to allow compiling standalone for testing.

No, I'll just drop the compile-test portion and leave the warning
untouched, leaving only the header file include as a preparation
for multiplatform support then.

> FWIW the driver depends on ARCH_OMAP1 and the warning is
> only printed for !ARCH_OMAP1. In other words: The warning
> is never printed at the moment. All OMAP2+ boards moved to
> matrix-keypad long time ago and the driver does not support
> OMAP2+ anymore since f799a3d8fe170 from 2012.

Right, it also seems extremely unlikely that any new platform
would start using the header, and it also doesn't look like
anyone is interested in moving omap1 over to matrix-keypad.

       Arnd
