Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497952F74C8
	for <lists+linux-omap@lfdr.de>; Fri, 15 Jan 2021 09:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbhAOI7i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Jan 2021 03:59:38 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:46029 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbhAOI7h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Jan 2021 03:59:37 -0500
Received: by mail-oi1-f171.google.com with SMTP id f132so8810651oib.12
        for <linux-omap@vger.kernel.org>; Fri, 15 Jan 2021 00:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qJV+1926tgg2sGcuugwVC817HeoK4roBGmtqVnY0F/Q=;
        b=pZ3ncvlexFiMxrZ+b4ZiAcJ7J06mRY7FKWx2ot8kfQ+ncZqu7xyNh+KvYP1P3sbjbc
         OkTdxe8QIUux7RbLIahLjo6zeDjw2EzGrc/OQuUiKYjAcC87nM4yRaC4hkwjzbcGe88I
         hbWt4I57flNq//BafWOWcpnU5FlFnkffGueCBcGw/xzgwkvfS1RITYbRkfL82H7lZKv1
         tp8tFiLjV0b5S5J2cOAXFoaCOLSYBQJ2E9aRR74Afr0VJ5029xc6vpLAMBW5PyD1gjTs
         u0q4+pOX40/IJdUNtSm4f3GdvDPfZHjsm3FIlMVXW3DqvPCXoB7rgofsffs0nQvBBIzW
         VA3g==
X-Gm-Message-State: AOAM533XqIYgLA6omAjRRdx/H2w9uSNgDi2ztz4toD8Wk2mYWl+sh97N
        VdiP56vDB/qrvzN93FpvEMxo1mpjAYO053/7PM1j3w4q
X-Google-Smtp-Source: ABdhPJx/5EiK8AlkmDf0gZQ0R6PVSijLqc+gxbJeqX3rMWwC6+kGxelks4ELbf2Cl2Usqa/iubTk2lcUimoTwhn077g=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr5119952oia.54.1610701136962;
 Fri, 15 Jan 2021 00:58:56 -0800 (PST)
MIME-Version: 1.0
References: <20210115082936.44923-1-tony@atomide.com>
In-Reply-To: <20210115082936.44923-1-tony@atomide.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Jan 2021 09:58:46 +0100
Message-ID: <CAMuHMdUtdMQwwP+k86mzavQVAq8EAHwwoOFM_yqT6zY7Mz-jOw@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: Fix booting for am335x after moving to simple-pm-bus
To:     ext Tony Lindgren <tony@atomide.com>
Cc:     "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Fri, Jan 15, 2021 at 9:29 AM Tony Lindgren <tony@atomide.com> wrote:
> We now depend on SIMPLE_PM_BUS for probing devices. While we have it
> selected in omap2plus_defconfig, custom configs can fail if it's missing.
>
> As SIMPLE_PM_BUS depends on OF and PM, we must now select them in Kconfig.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Fixes: 5a230524f879 ("ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup")
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Thanks for your patch!

> --- a/arch/arm/mach-omap2/Kconfig
> +++ b/arch/arm/mach-omap2/Kconfig
> @@ -105,8 +105,10 @@ config ARCH_OMAP2PLUS
>         select OMAP_DM_TIMER
>         select OMAP_GPMC
>         select PINCTRL
> +       select PM
>         select PM_GENERIC_DOMAINS if PM
>         select PM_GENERIC_DOMAINS_OF if PM
> +       select SIMPLE_PM_BUS if OF && PM

PM is selected above, so those 3 dependencies on PM can be removed.
ARCH_OMAP2PLUS depends on ARCH_MULTIPLATFORM, which
selects USE_OF and thus OF?


>         select RESET_CONTROLLER
>         select SOC_BUS
>         select TI_SYSC
> @@ -133,7 +135,6 @@ config ARCH_OMAP2PLUS_TYPICAL
>         select I2C_OMAP
>         select MENELAUS if ARCH_OMAP2
>         select NEON if CPU_V7
> -       select PM
>         select REGULATOR
>         select REGULATOR_FIXED_VOLTAGE
>         select TWL4030_CORE if ARCH_OMAP3 || ARCH_OMAP4
> --
> 2.30.0



--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
