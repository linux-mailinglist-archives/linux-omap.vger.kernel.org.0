Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6484454350
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 10:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234813AbhKQJKh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 04:10:37 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:48357 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234800AbhKQJKh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Nov 2021 04:10:37 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MSqbe-1nFHtf2vlu-00UI0I for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021
 10:07:37 +0100
Received: by mail-wr1-f54.google.com with SMTP id u1so3153991wru.13
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 01:07:37 -0800 (PST)
X-Gm-Message-State: AOAM530QxPDSqlB16DAoXKd5MDtyRgFv5RA9v8fTiSs1HUvVOlBzQ7sF
        1ODZmmXE+lNHpwi77oe/Fr5CUH/VoGVSMUim3h0=
X-Google-Smtp-Source: ABdhPJzTqx6tfatBbqxa6uN2y38GOiWZJ2rECMIUCl5FpN4x/yS1G2OIS9A5EznvSOoJMl2tP5VqYjkb5/6WoyWVHro=
X-Received: by 2002:adf:f088:: with SMTP id n8mr17903208wro.411.1637140057218;
 Wed, 17 Nov 2021 01:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20211115111816.3911213-1-ardb@kernel.org> <20211115111816.3911213-8-ardb@kernel.org>
 <d73b25ec-7ade-2090-9ab4-df4ff8d7db94@collabora.com> <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
 <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk> <CAMj1kXGZmTJiEUqgXn7ibi+UftjYRwMRFzfKUo=XDFKitn-Agg@mail.gmail.com>
 <YZS2eC0lmR+bonvc@atomide.com> <CAMj1kXFbpAgHk4Fe03_NfP6kL0zJhTWOYWBdQvfzfabu6XY1Sg@mail.gmail.com>
 <YZS+/Axb7u7FsvbK@atomide.com> <CAK8P3a02uZdu1Q8a9vw5+9u1s=MWm7Z-bGm51YtZveqoQJ0BZg@mail.gmail.com>
In-Reply-To: <CAK8P3a02uZdu1Q8a9vw5+9u1s=MWm7Z-bGm51YtZveqoQJ0BZg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 17 Nov 2021 10:07:21 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0mV7=mPSLe=9mOMfK3RvuPJ9z8=9CS75=7pG=A2ngZQg@mail.gmail.com>
Message-ID: <CAK8P3a0mV7=mPSLe=9mOMfK3RvuPJ9z8=9CS75=7pG=A2ngZQg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] ARM: implement support for vmap'ed stacks
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>, Ard Biesheuvel <ardb@kernel.org>,
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
X-Provags-ID: V03:K1:SBlCmDXAp6RLbFeq61Oy9KhQBUzELzE3SyDFhmP70sIHspV0jiH
 mQWnqS90QhAyx+wBFOaQPPVcLDlzEGnXmLPhMF7opvZ552zCn6Sq8U8p+fEg6u052Y4e/N+
 WJy7JrtLFppWE7K+FP0zSwJ24pFdKRp90l9ag2wwjqwLZP/BKH/b0r+0YITPXT7IIKBDh0u
 4mRj6tSx3bO8HiYDIt73A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GOyBXpQtZJE=:s7WW7UxcYUyLdGN6VW0QU/
 QqqHTAG8oe15Qp7w+hf8+44e1HD+D3uqf9P6ZW0EwD2iCGtXXmNuytwINSPFCa7aTGfeZw1wq
 PSK6+A/+Q2x8mcmiqLTHWle6ZAnKVc0v8Zj4pT7tf83+8pYYLS/qW4pt2qj6u2vFk36xITkV5
 FD3/o8V86bZWGmHnoGEPpbsDoRdi8UxgDBxZ+Q7w4qikW/nq4i/OWuJ7GWPB6tn0r3tT/BNZl
 ASaThL/w5S2qMh5LApmwaFGQJjiGStM7zXGnnRvklvDb9+/9SHHLOr7+1vg/kHWIMfKzoH6c1
 HndHJGRStSMZDLiqRfencDYmI3JLkAAZ/rT7Ys8R5oCpgUHcCEJ/JBS5pNh4VGEiETPvVzfLd
 MZ5RXeDB2y2bxcRP9APbJltDNlhQcnefMJJtzLoJvUvyqDaM0O7oBNFDHEk9B7YooOljPdEhE
 jSMxZ+oykENLjD05UrrWJbXLQkd9Low4D3TmGYIOX2NgC+jhc2dfkbmiMOlx3ld2prN1gC4rZ
 /M08grJjfoXQuX9/J6ER763Kcu9B7aAj+5Kdtb62ew3yl3SaApZKYgtZHlK5e8dhO5J+tv886
 gB9VQOxiBrOm2rxODbQUq4F+dvE3pw96BSkrSUGbOE16ZH/cSTWilO6vgiM0XJxdOdaDrAFD8
 Q8+7V9bZTZvuW9XMAVm8hImP++BTgNgPk1Xb03oGg/f92HIlevcTADE31WsjMR1L2YyGv8pOE
 HefepvMymC4gFrvVz1WfyAMJ+b5ufcUbh+m/plTHzziuK1xovg5dXzHc23xRlD+g30SOWhmQI
 V4lcz0oaI16DiofMabIqNmLlWrsKqWfzmNgaRXK8tHGnklDO8o=
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Nov 17, 2021 at 10:03 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Nov 17, 2021 at 9:36 AM Tony Lindgren <tony@atomide.com> wrote:
> > * Ard Biesheuvel <ardb@kernel.org> [211117 08:29]:
> > >
> > > Thanks Tony, that is very helpful. I have a Beaglebone white somewhere
> > > so I'll try and reproduce it locally as well.
> >
> > I think with Beaglebone you may hit this only with suspend/resume if at
> > all. On am335x cpuidle is not shutting down the CPU. And only some models
> > will suspend to deeper idle states as it depends on the PMIC.
> >
> > If you have some test patch to try, just let me know.
>
> I looked at how the sleep code is called and found that cpu_suspend()/
> __cpu_suspend() has interesting manipulation of the stack pointer to
> call the platform specific function with a simple 1:1 page table,
> I would expect the problem somewhere in there, haven't pinpointed
> the exact line yet, but if any of that code tries to local the physical
> address of the stack using virt_to_phys or its asm equivalent, this
> fails for a vmap stack.

and just after sending this I see

void __cpu_suspend_save(u32 *ptr, u32 ptrsz, u32 sp, u32 *save_ptr)
{
        *save_ptr = virt_to_phys(ptr);

'ptr' is a pointer to the stack here. It might not be the only place that
needs fixing, but this clearly has to do a page table walk like
vmalloc_to_page() does to get to the correct physical address.

        Arnd
