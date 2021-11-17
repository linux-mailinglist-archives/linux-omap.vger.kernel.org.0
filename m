Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6FEB45423C
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 08:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234332AbhKQICy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 03:02:54 -0500
Received: from muru.com ([72.249.23.125]:57096 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231967AbhKQICx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 17 Nov 2021 03:02:53 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 04A9E80F0;
        Wed, 17 Nov 2021 08:00:32 +0000 (UTC)
Date:   Wed, 17 Nov 2021 09:59:52 +0200
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
Message-ID: <YZS2eC0lmR+bonvc@atomide.com>
References: <20211115111816.3911213-1-ardb@kernel.org>
 <20211115111816.3911213-8-ardb@kernel.org>
 <d73b25ec-7ade-2090-9ab4-df4ff8d7db94@collabora.com>
 <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
 <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk>
 <CAMj1kXGZmTJiEUqgXn7ibi+UftjYRwMRFzfKUo=XDFKitn-Agg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGZmTJiEUqgXn7ibi+UftjYRwMRFzfKUo=XDFKitn-Agg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ard Biesheuvel <ardb@kernel.org> [211116 22:03]:
> Of course, I may have missed something, but I wouldn't expect a
> fundamental flaw in this logic to affect only OMAP3/4 based platforms
> in such a weird way. Perhaps there is something I missed in terms of
> TLB maintenance, although I would expect the existing fault handler to
> take care of that.

Looks like disabling the deeper idle states for cpuidle where the CPUSs
get shut down and restored seems to work around the issue at least for
omap4. The assembly code is in arch/arm/mach-omap2/sleep44xx.S, and in
sleep34xx.S for omap3. No idea so far what might be causing this..

Regards,

Tony
