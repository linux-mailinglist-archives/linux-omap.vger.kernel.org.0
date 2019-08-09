Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A31E9878E9
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 13:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406388AbfHILna (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Aug 2019 07:43:30 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33743 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbfHILna (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 9 Aug 2019 07:43:30 -0400
Received: by mail-qk1-f195.google.com with SMTP id r6so71395269qkc.0;
        Fri, 09 Aug 2019 04:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VVKEn1uhwnct32QQNQWKMMQwz1IKox/lIkY41QXr3n4=;
        b=pCcFPrfdJR3psG1WSF4SqBcVO9efXbGlDkZnISOeV48IJOlST7hCwEbNOmGCMbbME9
         4sKynNmZKh45UuwLnbPw3vRvkUvHtyW+wj6KvnNeMKPb1CuyiUyYO7/RY8EXYdTgopcc
         pXA0vaCQS4yyjeAUYa5ioHJ8IhnkcHzPM/CjWXpBio6xnthFrColZM75jAjebVvx3SL/
         filj+B4a9nQDcuYiDoUqLmyeKBP1blIAAp7kiwVJ2Mkd3I6TF1vUK2NYPIgbbAwo4gBb
         3sq2D2z/K8nUwedJDV4mn1+pYxV0r5jND8v+BI3s4QlDYG6ixG3d/1gE97Wsefrc6faN
         htOA==
X-Gm-Message-State: APjAAAUh4oqO4ohfs4yKMOFD3UDhtJ4rqdoVi8O+DO/p/bAwzS5u15Lz
        3QOkQxjFqTkfoeFfJ/hg2LLbe0FKSOhgcxh/ycM=
X-Google-Smtp-Source: APXvYqz3y2NTzxkuXgdthyLbml49Ah52Sn2rqR//B9FnkAzFwcen/MazMdX5ZFS3FoRo2xISosV/96/4q4XOkHiRGAw=
X-Received: by 2002:a05:620a:b:: with SMTP id j11mr17853054qki.352.1565351009257;
 Fri, 09 Aug 2019 04:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190808212234.2213262-1-arnd@arndb.de> <CGME20190808212453epcas2p44ff418662ee1acf428c6842ee4488f9f@epcas2p4.samsung.com>
 <20190808212234.2213262-3-arnd@arndb.de> <55c9608d-68c4-17f6-2682-7668d5d7720a@samsung.com>
In-Reply-To: <55c9608d-68c4-17f6-2682-7668d5d7720a@samsung.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 9 Aug 2019 13:43:13 +0200
Message-ID: <CAK8P3a3grFEGr33s327yNMabK5=1kCJc3k7y55dhzQx9sTvkyQ@mail.gmail.com>
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

On Fri, Aug 9, 2019 at 1:32 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> On 8/8/19 11:22 PM, Arnd Bergmann wrote:
> > The omapfb driver is split into platform specific code for omap1, and
> > driver code that is also specific to omap1.
> >
> > Moving both parts into the driver directory simplifies the structure
> > and avoids the dependency on certain omap machine header files.
> >
> > The interrupt numbers in particular however must not be referenced
> > directly from the driver to allow building in a multiplatform
> > configuration, so these have to be passed through resources, is
> > done for all other omap drivers.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> For fbdev part:
>
> Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Thanks for taking a look.

> [ It seems that adding of static inline for omap_set_dma_priority()
>   when ARCH_OMAP=n should be in patch #9 but this is a minor issue. ]

That would have been ok as well, but having the addition here was
intentional and seems more logical to me as this is where the headers
get moved around.

      Arnd
