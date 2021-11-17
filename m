Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B366E454576
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 12:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236700AbhKQLQr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 06:16:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:37792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233710AbhKQLQr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 17 Nov 2021 06:16:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34AB863236
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 11:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637147629;
        bh=bscTElDBDsUUtGrgOnvkczWSIeoEMZEPosB32Ej00f8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pVfUr8GFMSmWsPHNY9Y5asHyb4a7KG5f/2UJPzpBxRaMUFEqKY3LTd1U7PF0mxxL6
         WBGZbsYmNUgNVLTLWcFRtZu+zmigji4EvbTr3QORgxycp/93j9F0NQX+1+t0yQVokq
         fIyYJp9fGTzMwcze4Z8X1qh2ATnKzcpwmI3Sspg4wKurOXtIfhes46l8Tz55WO2jyU
         BGJ1Y+l7LEta3dfa1a+Rb1U7ZaOajVkof0EKEIypcxPNDU+FL1WPqLlcrtCiIKG4gY
         rzYS3oWx+qhXEWhm/OqW0S7lkExGHTwYiZpRyoyfcjTn2XQtWllFSu5gPGC1WwE2WO
         6IzVPR1lSxYuw==
Received: by mail-oi1-f180.google.com with SMTP id r26so5645664oiw.5
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 03:13:49 -0800 (PST)
X-Gm-Message-State: AOAM533PBkVyUoAAjym5nVjNdSkALoEroUWd7tnYm8gNshL9t3VprpK1
        hPbmsvc5sCLQyx8LCpgAaT0md+eyg8iSz9Ou2TQ=
X-Google-Smtp-Source: ABdhPJzpSSgC57AR9HEuhLraXTJIeWmZcJf26efdcdMYr+DgOuHa492BHxIFcNINYWqqaYDmmX0VUFnk0W90MM4HIsI=
X-Received: by 2002:a05:6808:1919:: with SMTP id bf25mr13581494oib.33.1637147628393;
 Wed, 17 Nov 2021 03:13:48 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
 <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk> <CAMj1kXGZmTJiEUqgXn7ibi+UftjYRwMRFzfKUo=XDFKitn-Agg@mail.gmail.com>
 <YZS2eC0lmR+bonvc@atomide.com> <CAMj1kXFbpAgHk4Fe03_NfP6kL0zJhTWOYWBdQvfzfabu6XY1Sg@mail.gmail.com>
 <YZS+/Axb7u7FsvbK@atomide.com> <CAK8P3a02uZdu1Q8a9vw5+9u1s=MWm7Z-bGm51YtZveqoQJ0BZg@mail.gmail.com>
 <CAK8P3a0mV7=mPSLe=9mOMfK3RvuPJ9z8=9CS75=7pG=A2ngZQg@mail.gmail.com>
 <CAMj1kXE_aVGN_T4MXkbECjh0ERFD7nZ6goL5mcg_ki46nqKcGQ@mail.gmail.com>
 <CAMj1kXHRBCmNXVPjhe7KOGnf7j2-uOm94XjkSSQ844H6_QROFw@mail.gmail.com> <YZTjtY463f2HQwL6@atomide.com>
In-Reply-To: <YZTjtY463f2HQwL6@atomide.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 17 Nov 2021 12:13:36 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGfmwjqJCbnW0n6jDteA7DS+8Nt33pc_gBg5gs3H3uX5A@mail.gmail.com>
Message-ID: <CAMj1kXGfmwjqJCbnW0n6jDteA7DS+8Nt33pc_gBg5gs3H3uX5A@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] ARM: implement support for vmap'ed stacks
To:     Tony Lindgren <tony@atomide.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Guillaume Tucker <guillaume.tucker@collabora.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "kernelci@groups.io" <kernelci@groups.io>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 17 Nov 2021 at 12:12, Tony Lindgren <tony@atomide.com> wrote:
>
> * Ard Biesheuvel <ardb@kernel.org> [211117 10:49]:
> > On Wed, 17 Nov 2021 at 10:08, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Wed, 17 Nov 2021 at 10:07, Arnd Bergmann <arnd@arndb.de> wrote:
> > > >
> > > > On Wed, Nov 17, 2021 at 10:03 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > >
> > > > > On Wed, Nov 17, 2021 at 9:36 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > > > * Ard Biesheuvel <ardb@kernel.org> [211117 08:29]:
> > > > > > >
> > > > > > > Thanks Tony, that is very helpful. I have a Beaglebone white somewhere
> > > > > > > so I'll try and reproduce it locally as well.
> > > > > >
> > > > > > I think with Beaglebone you may hit this only with suspend/resume if at
> > > > > > all. On am335x cpuidle is not shutting down the CPU. And only some models
> > > > > > will suspend to deeper idle states as it depends on the PMIC.
> > > > > >
> > > > > > If you have some test patch to try, just let me know.
> > > > >
> > > > > I looked at how the sleep code is called and found that cpu_suspend()/
> > > > > __cpu_suspend() has interesting manipulation of the stack pointer to
> > > > > call the platform specific function with a simple 1:1 page table,
> > > > > I would expect the problem somewhere in there, haven't pinpointed
> > > > > the exact line yet, but if any of that code tries to local the physical
> > > > > address of the stack using virt_to_phys or its asm equivalent, this
> > > > > fails for a vmap stack.
> > > >
> > > > and just after sending this I see
> > > >
> > > > void __cpu_suspend_save(u32 *ptr, u32 ptrsz, u32 sp, u32 *save_ptr)
> > > > {
> > > >         *save_ptr = virt_to_phys(ptr);
> > > >
> > > > 'ptr' is a pointer to the stack here. It might not be the only place that
> > > > needs fixing, but this clearly has to do a page table walk like
> > > > vmalloc_to_page() does to get to the correct physical address.
> > > >
> > >
> > > I had just arrived at the same conclusion. I'll fix this up and drop
> > > it in kernelci.
> >
> > Updated branch here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?h=arm-vmap-stacks-v4
>
> Great that branch boots for me!
>

Thanks for testing!
