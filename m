Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA5EF2F9B48
	for <lists+linux-omap@lfdr.de>; Mon, 18 Jan 2021 09:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387659AbhARIbG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Jan 2021 03:31:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:36966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387762AbhARIbF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Jan 2021 03:31:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12005229C4;
        Mon, 18 Jan 2021 08:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610958624;
        bh=G3g8ccSLtuvhTl60lHfmT7S7bjEzSTABporbVH6+n+U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fkcgMup31XGT1Z5K8zlsvezWWy/jsPz6BxcK4s/s66tfkfD/Y9SdbEDQhBzpdl7gn
         AP9+4SjGW9r1TcYrwDwPeBleK2VLFEwy0ZXStjoLStGRSonS3kDFuzBRE7JpGmQdyi
         xu952exggDCV6wlBAMrAPr+mion7WOGY44sCYgdtECGptX1Etfelj0U56ig5ggNTbG
         eO7uleg21m2AfyeUk2AVOsk9vN6Be0JAV8YPJlTLTmrlrBjBwIjBvQXKwxthwWn7fW
         ZBEP9rJPV4KX5S0eV/r3L9Qlvdb2vVD9nk9z6L7cw1XEOJ8vJt9vqI3OehCCDLHwyw
         fAbkyFfcHEy9g==
Received: by mail-oi1-f180.google.com with SMTP id x71so1144464oia.9;
        Mon, 18 Jan 2021 00:30:24 -0800 (PST)
X-Gm-Message-State: AOAM533ydJqGKOtivl0rC84z0lNdbd1JN2WXFmjraFw1Y84PyXswgDDO
        BfZacL9sH5Et4Unq2ZhgDwssXApB9xfWNockK78=
X-Google-Smtp-Source: ABdhPJxocP0lzyO5eastZR7W498dSoutGIJLzsAbhLz7NT/RJ0W67cuDPaPOteUii2SmOroZ5Ohy9ddjtnE0FzB0rqU=
X-Received: by 2002:aca:be54:: with SMTP id o81mr7853744oif.67.1610958623304;
 Mon, 18 Jan 2021 00:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20210118073340.62141-1-tony@atomide.com>
In-Reply-To: <20210118073340.62141-1-tony@atomide.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 18 Jan 2021 09:30:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Eec1cAOdxNQ=8LORop+ESqx_=dg1uhJwpXhknxOydsg@mail.gmail.com>
Message-ID: <CAK8P3a1Eec1cAOdxNQ=8LORop+ESqx_=dg1uhJwpXhknxOydsg@mail.gmail.com>
Subject: Re: [PATCHv2] drivers: bus: simple-pm-bus: Fix compatibility with
 simple-bus for auxdata
To:     Tony Lindgren <tony@atomide.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jan 18, 2021 at 8:33 AM Tony Lindgren <tony@atomide.com> wrote:
>
> After converting am335x to probe devices with simple-pm-bus I noticed
> that we are not passing auxdata for of_platform_populate() like we do
> with simple-bus.
>
> While device tree using SoCs should no longer need platform data, there
> are still quite a few drivers that still need it as can be seen with
> git grep OF_DEV_AUXDATA. We want to have simple-pm-bus be usable as a
> replacement for simple-bus also for cases where OF_DEV_AUXDATA is still
> needed.
>
> Let's fix the issue by passing auxdata as platform data to simple-pm-bus.
> That way the SoCs needing this can pass the auxdata with OF_DEV_AUXDATA.
> And let's pass the auxdata for omaps to fix the issue for am335x.
>
> As an alternative solution, adding simple-pm-bus handling directly to
> drivers/of/platform.c was considered, but we would still need simple-pm-bus
> device driver. So passing auxdata as platform data seems like the simplest
> solution.
>
> Fixes: 5a230524f879 ("ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> Changes since v1: Updated description, added devicetree list to Cc

This looks fine to me for now

Acked-by: Arnd Bergmann <arnd@arndb.de>

But I think we should take the time to discuss how to phase out auxdata
over time. There are still a number of users, but it's not that many in the
end. For some of them I see a clear solution, for other ones I do not:

lpc32xx: Used only for pl080 DMA data with the old method, needs to
    be converted to use the proper DT binding that was added a few years
    ago.

kirkwood: I don't see what this does at all, as there is no pdata, and
    there is no clkdev lookup for "mvebu-audio"

orion: similar to kirkwood, these seem to have been added for
    clkdev lookup, but the orion_clkdev_init() function seems to
    not be called for the orion5x_dt variant.

omap2: I'll leave these for Tony to comment

spear3xx: pl022 and pl080 should just use the normal DT
   binding, see lpc32xx.

u300: platform is scheduled for removal

integrator_ap: pl010_set_mctrl() needs a callback to
    integrator_uart_set_mctrl(). I see no good alternative, but
    a workaround might be to call into syscon directly from the
    driver on versatile machines. For all I can tell, pl010 is only
    used on versatile and ep93xx, so that would not harm a
    commonly used driver.

versatile/integrator_cp: similar problem but for mmci, which is
    used more widely. Used for card detection, which could
    theoretically be implemented with a fake gpio driver, but that
    might be excessive.

mips/pic32: used for setting up DMA for sdhci, could be done
   in a platform-specific sdhci front-end.

arm-cci: used to pass cci address after ioremap(), avoiding
   this would revert e9c112c94b01 ("perf/arm-cci: Untangle
   global cci_ctrl_base").

           Arnd
