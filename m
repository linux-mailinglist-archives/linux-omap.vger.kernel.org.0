Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A2F1F830F
	for <lists+linux-omap@lfdr.de>; Sat, 13 Jun 2020 13:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgFMLKv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 13 Jun 2020 07:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgFMLKt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 13 Jun 2020 07:10:49 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32193C03E96F;
        Sat, 13 Jun 2020 04:10:48 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id x189so3861281iof.9;
        Sat, 13 Jun 2020 04:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OfwgZGxqgOQqlfdsbrVmrJYBmDVjYO5l26ONiG/HNmI=;
        b=hTzviXfnQMMBsbnXT/MMCNfVogrI2B8Q81Hyf4gKf+mEg0SvNCdFaphFvyWTxmWuUW
         PKDZao280LrHa5+AHZLQGqnFnC0pM3xAiBe5EM4e7BGWCY89GtPWpHW4jtmqTmNl22ja
         Q5lF1GCifXqPSKUNxmXduqrvSDGo1SXi0boGEdHD7g5lzTrfUrFkYLw0M73nsO5WUJ61
         aiB0x0l4HMt6K+msOHSDJnHnNCEcvvIh6oFiLey0dtigyYc3qCsus4CO1pqC9Kla1FKR
         b/OD+eHjgvitj6mcH9ayQ72zR+rO9KvVUOyxRFq8Nva0XvF3n8x43nCxXx3Poq7pmjP8
         gVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OfwgZGxqgOQqlfdsbrVmrJYBmDVjYO5l26ONiG/HNmI=;
        b=jNTu15gygEF+fB89THDJvw62uT3nPZsX4JQwI6yimF8FwACAax5ZqhKT7yHZSUm2ij
         BobRSUFSVbzrSz7hggN4tF2WZk3tQM/qwBOSPSkCtDaddvSO0Infa3i1waRnA5tJ0VSY
         g+LfqymmNXawy8tcomUvp3QlqLumCZCIcdxVY2Rg6IRvQqDROQU439iTl+H4M50cc0mB
         H5N0YLDuIIc5EeqSrWd+6lGRC69Yy5UjBa9JKAvrNuKYUhVTcSrz8Q2BGabgA5qjXylc
         67tZhk56pJC4jniL/3R+pv0J8R8rAyPM0CWIc9jGO1kMLdGoRwWwAXdP4mRF+lz9PmB8
         k+jA==
X-Gm-Message-State: AOAM533JJiES1kejEbj50b6I2b5WfsktAS9Ky0vH3SpD6XBZL9ZmOATR
        NtdeBaqvWvvOoAs7uhFEdXDLT412DwepATRa8oI=
X-Google-Smtp-Source: ABdhPJzfNmWpmXODYBXE9MO17hXKsSRyxKjtcDMu6I34oal91Ru8QR474bDJlRYWV2P67w77MQOE75EWxC200ucPdSQ=
X-Received: by 2002:a02:b0c4:: with SMTP id w4mr11941834jah.45.1592046647428;
 Sat, 13 Jun 2020 04:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200504230100.181926-1-aford173@gmail.com> <20200505184223.GR37466@atomide.com>
 <CAHCN7xJxg+uO4h2RcapyjormTMzXFwoMUOi7rh2hUsScJtK56Q@mail.gmail.com> <20200505233408.GS37466@atomide.com>
In-Reply-To: <20200505233408.GS37466@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 13 Jun 2020 06:10:36 -0500
Message-ID: <CAHCN7xJnBkihY0XwNw+7xj5qZhwz_Up-b_LEt3PY8aFWVYsnrQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: omap3: Migrate AES from hwmods to sysc-omap2
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul@pwsan.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 5, 2020 at 6:34 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Adam Ford <aford173@gmail.com> [200505 21:18]:
> > On Tue, May 5, 2020 at 1:42 PM Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > * Adam Ford <aford173@gmail.com> [200504 16:02]:
> > > > Various OMAP3 boards have two AES blocks, but only one is currently
> > > > available, because the hwmods are only configured for one.
> > > >
> > > > This patch migrates the hwmods for the AES engine to sysc-omap2
> > > > which allows the second AES crypto engine to become available.
> > > >
> > > >   omap-aes 480a6000.aes1: OMAP AES hw accel rev: 2.6
> > > >   omap-aes 480a6000.aes1: will run requests pump with realtime priority
> > > >   omap-aes 480c5000.aes2: OMAP AES hw accel rev: 2.6
> > > >   omap-aes 480c5000.aes2: will run requests pump with realtime priority
> > >
> > > Great :) Looks like I'm getting the following though:
> > >
> > > DTC     arch/arm/boot/dts/am3517-craneboard.dtb
> > > arch/arm/boot/dts/omap3.dtsi:160.39-184.5: ERROR (phandle_references):
> > > /ocp@68000000/target-module@480a6000:
> > > Reference to non-existent node or label "aes1_ick"
> > >
> > > Is this patch maybe missing a change for am3717 for the aes1_ick?
> >
> > I am guessing it's the same issue that plagues the am3517 with a note
> > in the hwmods that stated noone seems to know which am3517's support
> > it and which don't.  The RNG was disabled on the 3517, so I am
> > guessing I'll do the same for AES.
>
> OK, I have no idea what modules might be there on am3517.

I'm going to repost a V2 with the node removed on am3517.

>
> > I should have posted it as an RFC, because I don't have the proper IRQ
> > setup for the newly supported AES engine.  The interrupts that are
> > used for the original AES are listed as 'Reserved' in the AM3517 TRM.

Through trial and error, I think I have the right IRQ for OMAP3630 for
the 2nd instance.

> > I assume the second engine uses different interrupts.  I don't suppose
> > anyone know what it should be?
>
> Sorry no idea, usually the secure accelerator documentation is just
> left out it seems. My guess the values are the same as on omap3.

Tony - Could you review the hwmod transition I did for the first
engine to make sure I did it right?

If you think I did it right, I'll post my V2.

adam
>
> Regards,
>
> Tony
