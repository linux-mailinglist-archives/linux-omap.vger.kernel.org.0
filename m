Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D02486CAD
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390169AbfHHVrC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:47:02 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:34110 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbfHHVrC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:47:02 -0400
Received: by mail-qk1-f193.google.com with SMTP id z16so298018qka.1;
        Thu, 08 Aug 2019 14:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xVLCEyuU5pBNVx1TCmAc/TP4L1lHqIgkx7yJEE6tqjk=;
        b=BCvBytVBiVBvTWeCrKeUp33mup6tUYno83H4KQGBoUT35Lf60WKZ5zzGnJnWQEUb8k
         AbzkzhLNXLgXFReaKL5Sk3f9AIG2mg2J207aOv65NWwdKHmIMHWfUugbMWw/3DFDGbpH
         BXGlR/FeMumrkHAK1/JnBhaf0xNV7LvU4Mns7mEPVvhzfWc0q2sVhnisatmic+n3DWFY
         SQIgigB88OITj8iI2qMXFkeIQ7KSoGUu3d7gWGE1A52kGkpVqpLbd5kgfoq8MCdO6BBc
         0Ud3hvjinYhpuP+EWoVaoe9d5lizAz3ib5uJvXjQwom5nGfY8elSIpon4ae2Moxj/B/A
         u4Xg==
X-Gm-Message-State: APjAAAXGxKwe6MMO4Ay5Oan5esBJEybMC/5hN8KNSh+Z1deIw5INsJyj
        YYKq7W925Bi8iVItTC8j6hk0WLtrqQr63Xp/cjU=
X-Google-Smtp-Source: APXvYqy+B+qqsuvHb9p/Sjrie5IiMOZ5r/TClGgDChlxpboOO80aH3A3Oyu3iNJfjELi0RWYxk+y1/TmPK6BNCPDHbU=
X-Received: by 2002:a37:76c5:: with SMTP id r188mr15459896qkc.394.1565300821239;
 Thu, 08 Aug 2019 14:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190808212234.2213262-1-arnd@arndb.de> <20190808212234.2213262-14-arnd@arndb.de>
 <20190808214257.GF178933@dtor-ws>
In-Reply-To: <20190808214257.GF178933@dtor-ws>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 8 Aug 2019 23:46:45 +0200
Message-ID: <CAK8P3a2TOcjxwCBGkZAhMAf9HuTL=FAB1e0=FAg+oHB0U1nJ0A@mail.gmail.com>
Subject: Re: [PATCH 13/22] input: omap: void using mach/*.h headers
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Aug 8, 2019 at 11:43 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Arnd,
>
> On Thu, Aug 08, 2019 at 11:22:22PM +0200, Arnd Bergmann wrote:
> > By using the new linux/soc/ti/omap1-io.h header instead,
> > compile-testing can be enabled, and a CONFIG_ARCH_MULTIPLATFORM
> > conversion of omap1 may eventually be possible.
> >
> > The warning in the header file gets removed in order to
> > allow CONFIG_COMPILE_TEST.
>
> Given that we want to migrate people off this driver everywhere but
> OMAP1 I wonder why we would want to improve compile coverage of it.

Mainly for consistency: I'm converting all omap1 drivers in this series to
not rely on mach/* headers and to let them be compiled standalone.
The other drivers don't have a replacement, so I could treat this different
from the rest and skip the Kconfig and platform_data changes if you
prefer.

        Arnd
