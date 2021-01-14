Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFC12F5CA8
	for <lists+linux-omap@lfdr.de>; Thu, 14 Jan 2021 09:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbhANIxE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Jan 2021 03:53:04 -0500
Received: from mail-qk1-f170.google.com ([209.85.222.170]:35722 "EHLO
        mail-qk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726806AbhANIxE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Jan 2021 03:53:04 -0500
Received: by mail-qk1-f170.google.com with SMTP id n142so6498495qkn.2;
        Thu, 14 Jan 2021 00:52:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HlBaHdxvqlzszUO9WtwA8HvpkLJPNI4bofipRM5bvUg=;
        b=YsVZB9IZJ+wyV6cLaYHXAW3xhP67fq3tv4ymFAE0ONvVIvtijDr3mh4Qvz0HzbAF6l
         /0S8mCSWco6MYhR1Na33rrtvbM5RYqCHJOIV2z2E13dnyz8Wm3B3hEkrbuSETIVeUELz
         V9nSKFkfuxQ66Mz2I0jFLiijr7/sB/uehM2s6DDv0cueKmpC1l1O9dXsZeXuy07ZVolk
         XoRZI7GciM99DV+DSbjhyAd+s57YX1G+bPzyx9cnK1rtByHB5V+lCON9GAGiEpeZBTGb
         8AEea0LMVLabzQC2ad/hLMX7vlYXVGFk8FKtbNMe2H+PgntsRvmtzjuu0/6uVsoVdTDh
         Ycrg==
X-Gm-Message-State: AOAM530SVeG6LEheTOub0MZSp+bm5YynmwxLCHcNUHDWtcgwdBG8pOky
        k7nXPlj9GyO7vlUWUwZNzBNKijSUsSwJspRWczo=
X-Google-Smtp-Source: ABdhPJyX11LtHruuOdQOgSW9Ns/toa4urlaHd1qB/Yr1v7lqleoUcnOZLvTJp4pC8894UFCDCV7YmeIHe5EEXBuD0FM=
X-Received: by 2002:a05:620a:2017:: with SMTP id c23mr6243644qka.114.1610614342577;
 Thu, 14 Jan 2021 00:52:22 -0800 (PST)
MIME-Version: 1.0
References: <20201026112222.56894-1-tony@atomide.com> <20201026112222.56894-14-tony@atomide.com>
 <CAMuHMdWribr=eg1LkKce=Hamm+JwSz5UFEXLKUmKkqqz1RpL_w@mail.gmail.com>
 <X/8ei0o9ULpRdx7T@atomide.com> <CAMuHMdW+y5Y+0U1beebq7EGiarBKYdHszL+vW5r4xG6HBspVgQ@mail.gmail.com>
 <X/8kDzoADvcnNHxC@atomide.com> <X/8tz/2v4bnbF0TZ@atomide.com>
 <X//wx/oSTpXKpY75@atomide.com> <1c7301145600dabbb95402c7df0cf00b7bdd7fdd.camel@fi.rohmeurope.com>
 <X//799pSjH9bL39s@atomide.com>
In-Reply-To: <X//799pSjH9bL39s@atomide.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Jan 2021 09:52:10 +0100
Message-ID: <CAMuHMdUhiFuE=mFbnOBWVZvJ1BhRMYGQmT4LeJLbfMCVUW=SmA@mail.gmail.com>
Subject: Re: [PATCH 13/18] ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup
To:     Tony Lindgren <tony@atomide.com>
Cc:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "rogerq@ti.com" <rogerq@ti.com>, "s-anna@ti.com" <s-anna@ti.com>,
        "bcousson@baylibre.com" <bcousson@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "d-gerlach@ti.com" <d-gerlach@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "t-kristo@ti.com" <t-kristo@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Thu, Jan 14, 2021 at 9:08 AM Tony Lindgren <tony@atomide.com> wrote:
> * Vaittinen, Matti <Matti.Vaittinen@fi.rohmeurope.com> [210114 07:58]:
> > I do also experience the boot problem described by Geert.
> >
> > Head being:
> > b0625afe305253d0831af9289b37c906c18a781b
> > ARM: OMAP2+: Drop legacy platform data for am3 mpuss
> >
> > => BBB boots Ok.
> >
> > Head being:
> > 5a230524f87926f24d637fe62fd689f7f86f5036
> > ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup
> >
> > => BBB boot fails. (I don't have any debug parameters => last thing I
> > see in UART is from uBoot:
>
> Looking at the .config Geert sent me, at least CONFIG_SIMPLE_PM_BUS=y
> is now needed, and probably should be selected or default y for omaps.
>
> Adding that removes the -512 errors at least that I started seeing with
> Geert's config too.
>
> Can you guys check if adding CONFIG_SIMPLE_PM_BUS=y fixes the problem?

Thanks, that did the trick!
Sorry for not realizing that myself.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
