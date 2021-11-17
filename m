Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCA04542C1
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 09:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbhKQIjQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 03:39:16 -0500
Received: from muru.com ([72.249.23.125]:57144 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232473AbhKQIjM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 17 Nov 2021 03:39:12 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 76A3680F0;
        Wed, 17 Nov 2021 08:36:51 +0000 (UTC)
Date:   Wed, 17 Nov 2021 10:36:12 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
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
Subject: Re: [PATCH v3 7/7] ARM: implement support for vmap'ed stacks
Message-ID: <YZS+/Axb7u7FsvbK@atomide.com>
References: <20211115111816.3911213-1-ardb@kernel.org>
 <20211115111816.3911213-8-ardb@kernel.org>
 <d73b25ec-7ade-2090-9ab4-df4ff8d7db94@collabora.com>
 <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
 <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk>
 <CAMj1kXGZmTJiEUqgXn7ibi+UftjYRwMRFzfKUo=XDFKitn-Agg@mail.gmail.com>
 <YZS2eC0lmR+bonvc@atomide.com>
 <CAMj1kXFbpAgHk4Fe03_NfP6kL0zJhTWOYWBdQvfzfabu6XY1Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFbpAgHk4Fe03_NfP6kL0zJhTWOYWBdQvfzfabu6XY1Sg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ard Biesheuvel <ardb@kernel.org> [211117 08:29]:
> On Wed, 17 Nov 2021 at 08:59, Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Ard Biesheuvel <ardb@kernel.org> [211116 22:03]:
> > > Of course, I may have missed something, but I wouldn't expect a
> > > fundamental flaw in this logic to affect only OMAP3/4 based platforms
> > > in such a weird way. Perhaps there is something I missed in terms of
> > > TLB maintenance, although I would expect the existing fault handler to
> > > take care of that.
> >
> > Looks like disabling the deeper idle states for cpuidle where the CPUSs
> > get shut down and restored seems to work around the issue at least for
> > omap4. The assembly code is in arch/arm/mach-omap2/sleep44xx.S, and in
> > sleep34xx.S for omap3. No idea so far what might be causing this..
> >
> 
> Thanks Tony, that is very helpful. I have a Beaglebone white somewhere
> so I'll try and reproduce it locally as well.

I think with Beaglebone you may hit this only with suspend/resume if at
all. On am335x cpuidle is not shutting down the CPU. And only some models
will suspend to deeper idle states as it depends on the PMIC.

If you have some test patch to try, just let me know.

Regards,

Tony
