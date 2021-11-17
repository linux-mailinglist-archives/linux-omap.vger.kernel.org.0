Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B940045429F
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 09:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234519AbhKQIbX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 03:31:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:36934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229944AbhKQIbV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 17 Nov 2021 03:31:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8944E63237
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 08:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637137703;
        bh=EEwi98suFUkOpecKnPvj2I3fEn2JmSIAmlxwrKFUkd0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=o3QckvuzA8mpEV6fRd9sKuHUnCWNUndp/7LCysbug4+4DIivNfonL9okJlDhD4CGn
         d3/Bp6PpiGNzIOoFh675nr2uN1f/ZvUU0PHHHQPuiUTpfQpKhRuqzRwTb3iQAWagKf
         k+Zh2XhLQmZRmKP1ou15jBgOF+hrZMoEq53dYJek+Y6Rzi21WK/hP/xe29IHGVSgNX
         47mm3HROxX8BsWf5DvLXGYtbcxzfxd/Cj8kkMKTnnk+L1FX7F7xLOOITqjeAJ8SP0D
         6uCBePmbvrxX484YqNhHY2e/uHksQW2xAFkkdxrLFFiKWuHBAZ7VDF1kbYWni6EHPv
         h8iVenP6iLcTQ==
Received: by mail-ot1-f45.google.com with SMTP id z2-20020a9d71c2000000b0055c6a7d08b8so3413677otj.5
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 00:28:23 -0800 (PST)
X-Gm-Message-State: AOAM533jtzQIgysBzlFYG5jcXCfLcSOriaAXB9nQiWr1EPEHlahO8hSc
        OeZFN1Om2Tw3p6d4B7vjSSHe8Dc+u4krteT1hLo=
X-Google-Smtp-Source: ABdhPJx/b7HRhT22vCo1AH/EEpJxd003YV8nPA6wH2UAYeGw4sa4R7qtw2AzahGoeR8lkVCUERLTYZetK/SdutW3MqU=
X-Received: by 2002:a9d:6c54:: with SMTP id g20mr12299319otq.30.1637137702761;
 Wed, 17 Nov 2021 00:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20211115111816.3911213-1-ardb@kernel.org> <20211115111816.3911213-8-ardb@kernel.org>
 <d73b25ec-7ade-2090-9ab4-df4ff8d7db94@collabora.com> <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
 <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk> <CAMj1kXGZmTJiEUqgXn7ibi+UftjYRwMRFzfKUo=XDFKitn-Agg@mail.gmail.com>
 <YZS2eC0lmR+bonvc@atomide.com>
In-Reply-To: <YZS2eC0lmR+bonvc@atomide.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 17 Nov 2021 09:28:12 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFbpAgHk4Fe03_NfP6kL0zJhTWOYWBdQvfzfabu6XY1Sg@mail.gmail.com>
Message-ID: <CAMj1kXFbpAgHk4Fe03_NfP6kL0zJhTWOYWBdQvfzfabu6XY1Sg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] ARM: implement support for vmap'ed stacks
To:     Tony Lindgren <tony@atomide.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 17 Nov 2021 at 08:59, Tony Lindgren <tony@atomide.com> wrote:
>
> * Ard Biesheuvel <ardb@kernel.org> [211116 22:03]:
> > Of course, I may have missed something, but I wouldn't expect a
> > fundamental flaw in this logic to affect only OMAP3/4 based platforms
> > in such a weird way. Perhaps there is something I missed in terms of
> > TLB maintenance, although I would expect the existing fault handler to
> > take care of that.
>
> Looks like disabling the deeper idle states for cpuidle where the CPUSs
> get shut down and restored seems to work around the issue at least for
> omap4. The assembly code is in arch/arm/mach-omap2/sleep44xx.S, and in
> sleep34xx.S for omap3. No idea so far what might be causing this..
>

Thanks Tony, that is very helpful. I have a Beaglebone white somewhere
so I'll try and reproduce it locally as well.
