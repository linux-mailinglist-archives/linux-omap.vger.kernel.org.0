Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 423E1454354
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 10:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234817AbhKQJMH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 04:12:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:52436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234800AbhKQJMG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 17 Nov 2021 04:12:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BA1F61BFE
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 09:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637140148;
        bh=Q8rPdGyWzHJbVy92iCnDVDVHbqtIz9MymTI2XMjaoyU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=G+jbf1IbLtGnkU8MSh1psnmnl/0VGjoIJcuLGYJjtiwzIacErJVnZJnXsWC+bJeou
         7fj7xX9F4OVmvodFDmLlu2TlUIfr6VmdIXPMnB4WA7EtnTv4KMfxWXSUV4/jNZI4Ti
         WNHm7nbqWuoT7NnTQKHdX9V3258IPZjZqWnnw5tnyNbLT3iQP09ndyLHpoSrNcvVGs
         Nk1vWq03CTBn1+vf7nwwkeaDx2/CG/70CaT93TRlhPpruVDzc7mfXcDc/v9IiYFjGQ
         7n16Ow19d9xuRIMgj8j3/0Y6W+f2JakrbSY7zbXSGGyB+L496RL5rccL7AhMlTf4Da
         46KiWgaFaLXVw==
Received: by mail-oi1-f181.google.com with SMTP id s139so4897738oie.13
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 01:09:08 -0800 (PST)
X-Gm-Message-State: AOAM532pXk5IdOPQ1iFPFms+TuOpR5btxPPqLa3G7hq9YzGf1Flu3VRV
        Ch8oIYZlFfIto4+h4dPVX6E/VMQCCUxFd/9wRVI=
X-Google-Smtp-Source: ABdhPJzS56N8O5cnI2a78lO4dXgpHdVPz6HBEAMhS/V2JnOVZpZx2ickPp3JwvH7Cer0L93O7jgaUOr9IvNBMFpcvVg=
X-Received: by 2002:a05:6808:12:: with SMTP id u18mr12948787oic.174.1637140147649;
 Wed, 17 Nov 2021 01:09:07 -0800 (PST)
MIME-Version: 1.0
References: <20211115111816.3911213-1-ardb@kernel.org> <20211115111816.3911213-8-ardb@kernel.org>
 <d73b25ec-7ade-2090-9ab4-df4ff8d7db94@collabora.com> <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
 <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk> <CAMj1kXGZmTJiEUqgXn7ibi+UftjYRwMRFzfKUo=XDFKitn-Agg@mail.gmail.com>
 <YZS2eC0lmR+bonvc@atomide.com> <CAMj1kXFbpAgHk4Fe03_NfP6kL0zJhTWOYWBdQvfzfabu6XY1Sg@mail.gmail.com>
 <YZS+/Axb7u7FsvbK@atomide.com> <CAK8P3a02uZdu1Q8a9vw5+9u1s=MWm7Z-bGm51YtZveqoQJ0BZg@mail.gmail.com>
 <CAK8P3a0mV7=mPSLe=9mOMfK3RvuPJ9z8=9CS75=7pG=A2ngZQg@mail.gmail.com>
In-Reply-To: <CAK8P3a0mV7=mPSLe=9mOMfK3RvuPJ9z8=9CS75=7pG=A2ngZQg@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 17 Nov 2021 10:08:56 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE_aVGN_T4MXkbECjh0ERFD7nZ6goL5mcg_ki46nqKcGQ@mail.gmail.com>
Message-ID: <CAMj1kXE_aVGN_T4MXkbECjh0ERFD7nZ6goL5mcg_ki46nqKcGQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] ARM: implement support for vmap'ed stacks
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>,
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

On Wed, 17 Nov 2021 at 10:07, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Nov 17, 2021 at 10:03 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, Nov 17, 2021 at 9:36 AM Tony Lindgren <tony@atomide.com> wrote:
> > > * Ard Biesheuvel <ardb@kernel.org> [211117 08:29]:
> > > >
> > > > Thanks Tony, that is very helpful. I have a Beaglebone white somewhere
> > > > so I'll try and reproduce it locally as well.
> > >
> > > I think with Beaglebone you may hit this only with suspend/resume if at
> > > all. On am335x cpuidle is not shutting down the CPU. And only some models
> > > will suspend to deeper idle states as it depends on the PMIC.
> > >
> > > If you have some test patch to try, just let me know.
> >
> > I looked at how the sleep code is called and found that cpu_suspend()/
> > __cpu_suspend() has interesting manipulation of the stack pointer to
> > call the platform specific function with a simple 1:1 page table,
> > I would expect the problem somewhere in there, haven't pinpointed
> > the exact line yet, but if any of that code tries to local the physical
> > address of the stack using virt_to_phys or its asm equivalent, this
> > fails for a vmap stack.
>
> and just after sending this I see
>
> void __cpu_suspend_save(u32 *ptr, u32 ptrsz, u32 sp, u32 *save_ptr)
> {
>         *save_ptr = virt_to_phys(ptr);
>
> 'ptr' is a pointer to the stack here. It might not be the only place that
> needs fixing, but this clearly has to do a page table walk like
> vmalloc_to_page() does to get to the correct physical address.
>

I had just arrived at the same conclusion. I'll fix this up and drop
it in kernelci.
