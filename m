Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199BD2FBE1C
	for <lists+linux-omap@lfdr.de>; Tue, 19 Jan 2021 18:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391376AbhASPdf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Jan 2021 10:33:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:48866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388999AbhASPKs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 Jan 2021 10:10:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C421B23135;
        Tue, 19 Jan 2021 15:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611069007;
        bh=tujrG9Me8GcuwbvJoBlpOZZDK5rhXCB/ZsDuhMpneTc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kukxcTcK68tYNhXg0JrBBz1Swd0ITrzW6B1n1KtWl5Dx4VtBvXRBymsaEn4UNAeX0
         +QNHxB0cjZxSpFWBbDvZx/JpEWHBwqROFrt8GGRjfJutyq+o4SoJLFgRnYa3+ImMLf
         mCzRKLGz5mEdqgfnCsmiM8ywdVdBmIc3qbXGVgO4LiJ6nVDE4+cE1sHvUS/RmpQAZT
         v0Ns1LodHkqoUxcihQmuDmZ5TlYn9QxWY2nw9tk1I4M8RoPSJLQ5PA+6jCznX0Gb+J
         SXtctoIFFeV9+miL5IRCLlyvf/ieSs6sXWqHBvzOJBntvIidtYtc3JFMxC0Jor++Y7
         Y/jYI19qWADMQ==
Received: by mail-ed1-f46.google.com with SMTP id c6so14794891ede.0;
        Tue, 19 Jan 2021 07:10:06 -0800 (PST)
X-Gm-Message-State: AOAM5314RlRkkkylInn5OBGor44ctBx8mtBVo12z1ShKZDoV9WVGfhD/
        rIx130B+r/kQGGb7smBZnJxDRgZdTknlQGWg3g==
X-Google-Smtp-Source: ABdhPJzIDLsQw+ZJBToPFJHIKOR8/yNxcIbFQDixAfzF4A2i09TM5FH3rBt23cPA/y6TPGYq/CTIGF1sNC4c/U++d8E=
X-Received: by 2002:a05:6402:1751:: with SMTP id v17mr3857788edx.289.1611069005313;
 Tue, 19 Jan 2021 07:10:05 -0800 (PST)
MIME-Version: 1.0
References: <20210118073340.62141-1-tony@atomide.com> <CAK8P3a1Eec1cAOdxNQ=8LORop+ESqx_=dg1uhJwpXhknxOydsg@mail.gmail.com>
In-Reply-To: <CAK8P3a1Eec1cAOdxNQ=8LORop+ESqx_=dg1uhJwpXhknxOydsg@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 19 Jan 2021 09:09:51 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+h5AOBbgpZX-xQwrnjDk6QB2A6oZs6AKUt=rCugsN-BA@mail.gmail.com>
Message-ID: <CAL_Jsq+h5AOBbgpZX-xQwrnjDk6QB2A6oZs6AKUt=rCugsN-BA@mail.gmail.com>
Subject: Re: [PATCHv2] drivers: bus: simple-pm-bus: Fix compatibility with
 simple-bus for auxdata
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

+Linus W

On Mon, Jan 18, 2021 at 2:30 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Jan 18, 2021 at 8:33 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > After converting am335x to probe devices with simple-pm-bus I noticed
> > that we are not passing auxdata for of_platform_populate() like we do
> > with simple-bus.
> >
> > While device tree using SoCs should no longer need platform data, there
> > are still quite a few drivers that still need it as can be seen with
> > git grep OF_DEV_AUXDATA. We want to have simple-pm-bus be usable as a
> > replacement for simple-bus also for cases where OF_DEV_AUXDATA is still
> > needed.
> >
> > Let's fix the issue by passing auxdata as platform data to simple-pm-bus.
> > That way the SoCs needing this can pass the auxdata with OF_DEV_AUXDATA.
> > And let's pass the auxdata for omaps to fix the issue for am335x.
> >
> > As an alternative solution, adding simple-pm-bus handling directly to
> > drivers/of/platform.c was considered, but we would still need simple-pm-bus
> > device driver. So passing auxdata as platform data seems like the simplest
> > solution.
> >
> > Fixes: 5a230524f879 ("ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup")
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> > Changes since v1: Updated description, added devicetree list to Cc
>
> This looks fine to me for now
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> But I think we should take the time to discuss how to phase out auxdata
> over time. There are still a number of users, but it's not that many in the
> end. For some of them I see a clear solution, for other ones I do not:

Thanks for summarizing.

> lpc32xx: Used only for pl080 DMA data with the old method, needs to
>     be converted to use the proper DT binding that was added a few years
>     ago.
>
> kirkwood: I don't see what this does at all, as there is no pdata, and
>     there is no clkdev lookup for "mvebu-audio"

Probably nothing. I reached that conclusion on u300 too. Clocks got
added in DT and someone forgot to remove auxdata. Granted, it's pretty
non-obvious what the purpose is if there is no platform_data.

>
> orion: similar to kirkwood, these seem to have been added for
>     clkdev lookup, but the orion_clkdev_init() function seems to
>     not be called for the orion5x_dt variant.
>
> omap2: I'll leave these for Tony to comment
>
> spear3xx: pl022 and pl080 should just use the normal DT
>    binding, see lpc32xx.
>
> u300: platform is scheduled for removal
>
> integrator_ap: pl010_set_mctrl() needs a callback to
>     integrator_uart_set_mctrl(). I see no good alternative, but
>     a workaround might be to call into syscon directly from the
>     driver on versatile machines. For all I can tell, pl010 is only
>     used on versatile and ep93xx, so that would not harm a
>     commonly used driver.

That was my conclusion.

> versatile/integrator_cp: similar problem but for mmci, which is
>     used more widely. Used for card detection, which could
>     theoretically be implemented with a fake gpio driver, but that
>     might be excessive.
>
> mips/pic32: used for setting up DMA for sdhci, could be done
>    in a platform-specific sdhci front-end.
>
> arm-cci: used to pass cci address after ioremap(), avoiding
>    this would revert e9c112c94b01 ("perf/arm-cci: Untangle
>    global cci_ctrl_base").

Create a regmap and then secondary drivers needing register access can
lookup the regmap? Or just ioremap it twice... I'll take a closer look
at this one.

Rob
