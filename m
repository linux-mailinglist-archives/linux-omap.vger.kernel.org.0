Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25A17454342
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 10:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhKQJGq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 04:06:46 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:41841 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbhKQJGq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Nov 2021 04:06:46 -0500
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MtO4E-1mX7eO42By-00uodY for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021
 10:03:47 +0100
Received: by mail-wr1-f46.google.com with SMTP id d27so3193352wrb.6
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 01:03:46 -0800 (PST)
X-Gm-Message-State: AOAM530lYkovpFOo2hct/Jw7IdkT6w/KXAJGEnqoTdmQFjgYH3BDwq9s
        ropM57ekqI4PGhHIcSb9VzO4lQDVtaNZEnszVqI=
X-Google-Smtp-Source: ABdhPJyZ82B8sSfeqa/TtX/Pu/WgS8dWF75L248Ix9mceRxYb/w+jueVIOtVLiM0OncmzyFdrW6JDUWi5mOjzd/fsB0=
X-Received: by 2002:adf:f088:: with SMTP id n8mr17873835wro.411.1637139826630;
 Wed, 17 Nov 2021 01:03:46 -0800 (PST)
MIME-Version: 1.0
References: <20211115111816.3911213-1-ardb@kernel.org> <20211115111816.3911213-8-ardb@kernel.org>
 <d73b25ec-7ade-2090-9ab4-df4ff8d7db94@collabora.com> <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
 <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk> <CAMj1kXGZmTJiEUqgXn7ibi+UftjYRwMRFzfKUo=XDFKitn-Agg@mail.gmail.com>
 <YZS2eC0lmR+bonvc@atomide.com> <CAMj1kXFbpAgHk4Fe03_NfP6kL0zJhTWOYWBdQvfzfabu6XY1Sg@mail.gmail.com>
 <YZS+/Axb7u7FsvbK@atomide.com>
In-Reply-To: <YZS+/Axb7u7FsvbK@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 17 Nov 2021 10:03:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a02uZdu1Q8a9vw5+9u1s=MWm7Z-bGm51YtZveqoQJ0BZg@mail.gmail.com>
Message-ID: <CAK8P3a02uZdu1Q8a9vw5+9u1s=MWm7Z-bGm51YtZveqoQJ0BZg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] ARM: implement support for vmap'ed stacks
To:     Tony Lindgren <tony@atomide.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Guillaume Tucker <guillaume.tucker@collabora.com>,
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
X-Provags-ID: V03:K1:2yUIM5GS5YUamRgKIV8k/UrkYuqScsfU9Um3ysXAJUy67A5sIoa
 dzM9hKResgAvsl6YtAaKVNLESnS/CwFwranDNLnB+nKNCxa/95KyWsQkFTe2bdzGBfmQ2cQ
 WsTLB1QGvyLkJcUf1hYoxMpcJxHDDzELTRxe6b/BgSybVuefbhhaBb2y1w9Jj+d0nG/vv5W
 mDJYHQWNnBHgn9FriCm3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NCnmUsITBcU=:SsU711TScOnfSda85GVocl
 +48WES3GMpfQdeXexhZMT48rk8tWOmfEAEOctRBu+a/Gh00PQI+g36fEWVN15OftgE3QIrtkj
 EKu4Nu0YuCqYWoYmwzmbVSpVBq3hd4EKDGn/u5SrJbbHuTmyzNUBkyAGgwF374K3yXbG0BMLw
 cIycmdOeJK99rZ/7/78J+mi3UJQZR/0JGOCmNXAvDAr16XWFl+ME5eZa20dkXKCgsihmN+Yw1
 z1Qxt6eEXxsxVg7qs7NSrGPi85P+A2Hg3RHZV630iDzUd78av4tpC5cbEW+PmsM9qXC0GYear
 BgzS6XPepFtIh6TzGblFsIk4dFY8XPGVS2yJS0pf28vWmESA5PmnP20JaZkCu+N0rCzEc9rEE
 BykJrQaZ/NRJjd7kpO673M6pURnJcf/Oqv+vD7J0gQPR5xZ9rABPGnBg094ITjZ3I7rF7l40l
 mWYIOuX/1B4G9nSzE1B1mEkfYBuHY70ib52wCp/ap53mYisdVOCCo6MQx4DONBKLwz92mEo9s
 MEkz9AH3uGT/j1nx9hnQYWqV5pds144ETIojSuUHpqI0VWVn7homnwzTQUcleYzfB1sMWbUwj
 lcjuYLLwP5bchoOObvit3RbLl2yasbd4eMt1mWOtMBUl9pUkPyCktdXNxQdBmUNSf45dna+7T
 vKla2WJuHPDerRLCnqQkD+lloIUpUGiU6gSNCI90Q1jzscFh5CAsVaef7c3WI/dehebokqC40
 L3vnZbjAkcBZNqsJYR3TdGNVtbKaTM4ygGMK3M9bYnSX9Cm6aFZHhOsVQHAze9HjHWfqxESVD
 VHch4vwx+H00PosksoyG/5rSJNN9TRw0i+tNidU7cEfUNCU7KQ=
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Nov 17, 2021 at 9:36 AM Tony Lindgren <tony@atomide.com> wrote:
> * Ard Biesheuvel <ardb@kernel.org> [211117 08:29]:
> >
> > Thanks Tony, that is very helpful. I have a Beaglebone white somewhere
> > so I'll try and reproduce it locally as well.
>
> I think with Beaglebone you may hit this only with suspend/resume if at
> all. On am335x cpuidle is not shutting down the CPU. And only some models
> will suspend to deeper idle states as it depends on the PMIC.
>
> If you have some test patch to try, just let me know.

I looked at how the sleep code is called and found that cpu_suspend()/
__cpu_suspend() has interesting manipulation of the stack pointer to
call the platform specific function with a simple 1:1 page table,
I would expect the problem somewhere in there, haven't pinpointed
the exact line yet, but if any of that code tries to local the physical
address of the stack using virt_to_phys or its asm equivalent, this
fails for a vmap stack.

        Arnd
