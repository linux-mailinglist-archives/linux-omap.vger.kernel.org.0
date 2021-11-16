Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE25D453C16
	for <lists+linux-omap@lfdr.de>; Tue, 16 Nov 2021 23:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhKPWFh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Nov 2021 17:05:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:41164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229597AbhKPWFg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 16 Nov 2021 17:05:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FA0963225
        for <linux-omap@vger.kernel.org>; Tue, 16 Nov 2021 22:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637100159;
        bh=srPgqhsTlVTk5sTdV+i02cuw0ZC1dGKBq4SDKhS42DI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HL6X8+QXAx3Oqy7SocDxG9qxz4o2KpqryF1y605XdFoOXxAgnAw7mGhuf/oGFQj8h
         GOkRsA9kH1ZFwGwh8fyAb/QmAj7Y2wZzpIg83NN4RIEJYcztTdin2f2qMyLn5T/XVy
         W3ja2pCW8gi9UaHIlW6k337ZWzAgYjOxDktTWOtsWsFLp4a9lscCzOx80d1zV5vIqy
         pWlp1X8HwrdjiSYHYmrjDijvH8pqgEmPjEZeGTse1bSYYHE7RlMWgpbIXdCGCf+7Cu
         wcaJ9a31EUDfuCAiRFvcoaoOkYqXWcgI8l7K75cKKRZn50BVWa8nHTe1/UV9MqtpMF
         gHFCiyG+5/Wkg==
Received: by mail-ot1-f54.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso854443otj.11
        for <linux-omap@vger.kernel.org>; Tue, 16 Nov 2021 14:02:39 -0800 (PST)
X-Gm-Message-State: AOAM530iae0RDQufVoBPn8sDRjWuiKvzATmeLP0mrZ5fWrU3Xx85ywX6
        1TFjZE7BOzl659UmIFMRPVp+Q/A06qBzbVYBzFo=
X-Google-Smtp-Source: ABdhPJxtpuAju26ed5cEA8CF8eMq4N+v+Apj2D6X1ETX/5j1uuisyZY5AQ1fShskmNcL9vFco3xdR43g+D8q2f9Qamo=
X-Received: by 2002:a05:6830:1445:: with SMTP id w5mr9087591otp.112.1637100158441;
 Tue, 16 Nov 2021 14:02:38 -0800 (PST)
MIME-Version: 1.0
References: <20211115111816.3911213-1-ardb@kernel.org> <20211115111816.3911213-8-ardb@kernel.org>
 <d73b25ec-7ade-2090-9ab4-df4ff8d7db94@collabora.com> <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
 <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk>
In-Reply-To: <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 16 Nov 2021 23:02:26 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGZmTJiEUqgXn7ibi+UftjYRwMRFzfKUo=XDFKitn-Agg@mail.gmail.com>
Message-ID: <CAMj1kXGZmTJiEUqgXn7ibi+UftjYRwMRFzfKUo=XDFKitn-Agg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] ARM: implement support for vmap'ed stacks
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "kernelci@groups.io" <kernelci@groups.io>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 16 Nov 2021 at 21:06, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Nov 16, 2021 at 08:28:02PM +0100, Ard Biesheuvel wrote:
> > (+ Tony and linux-omap@)
> >
> > On Tue, 16 Nov 2021 at 10:23, Guillaume Tucker
> > <guillaume.tucker@collabora.com> wrote:
> > >
> > > Hi Ard,
> > >
> > > Please see the bisection report below about a boot failure on
> > > omap4-panda which is pointing to this patch.
> > >
> > > Reports aren't automatically sent to the public while we're
> > > trialing new bisection features on kernelci.org but this one
> > > looks valid.
> > >
> > > Some more details can be found here:
> > >
> > >   https://linux.kernelci.org/test/case/id/6191b1b97c175a5ade335948/
> > >
> > > It seems like the kernel just froze after about 3 seconds without
> > > any obvious errors in the log.
> > >
> > > Please let us know if you need any help debugging this issue or
> > > if you have a fix to try.
> > >
> >
> > Thanks for the report.
> >
> > I wonder if this might be related to low level platform code running
> > off a different stack (maybe in SRAM?) when an interrupt is taken? Or
> > using a different set of page tables that are out of sync in terms of
> > VMALLOC space mappings?
> >
> > Could anyone who speaks OMAP please take a look at the linked boot
> > log, and hopefully make sense of it?
> >
> > For background, this series enables vmap'ed stacks support for ARMv7,
> > which means that the entry code checks whether the stack pointer may
> > be pointing into the guard region before the vmalloc'ed stack, and
> > kills the task if it looks like the kernel stack overflowed.
> >
> > Here's another instance:
> > https://linux.kernelci.org/build/id/6193fa5c6c4e1d02bd3358ff/
> >
> > Everything builds and boots happily, but odd things happen on OMAP
> > based devices: Panda just gives up right after discovering the USB
> > controller, and Beagle-XM just starts showing all kinds of weird
> > crashes at roughly the same point in the boot.
>
> I haven't looked at the logs yet... but there may be a more
> fundamental reason that it may be stalling.
>
> vmalloc space is lazily mapped to process page tables that the
> allocation did not happen inside - specifically the L1 entries.
>
> When a new thread is created, you're vmalloc()ing a kernel stack.
> This is done in the parent task for the child task. If the child
> task doesn't contain the L1 entry for its vmalloc'd stack, then
> the first stack access by the child will fault.
>
> The fault processing will be done in the child's context, so we
> immediately try to save the state to the child's kernel stack,
> which is not yet mapped. The result is another fault, which
> triggers yet another fault, etc.
>

I deal with this condition specifically in two different places:
- at context switch time, there is a dummy read from the new stack
while running from the old one, to ensure that the fault takes place
while SP points to a valid mapping;
- at mm_switch() time, the vmalloc_seq counter is used to ensure that
the new MM is synced to init_mm in terms of vmalloc PMD entries.

Of course, I may have missed something, but I wouldn't expect a
fundamental flaw in this logic to affect only OMAP3/4 based platforms
in such a weird way. Perhaps there is something I missed in terms of
TLB maintenance, although I would expect the existing fault handler to
take care of that.
