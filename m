Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38AB64040D3
	for <lists+linux-omap@lfdr.de>; Thu,  9 Sep 2021 00:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235896AbhIHWDA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Sep 2021 18:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234515AbhIHWDA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Sep 2021 18:03:00 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F08C061575
        for <linux-omap@vger.kernel.org>; Wed,  8 Sep 2021 15:01:51 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id z18so7253548ybg.8
        for <linux-omap@vger.kernel.org>; Wed, 08 Sep 2021 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QrmGu/DrfyoJRjpghd3iKC2qArp95acLTRr1DpVzOXw=;
        b=HtOCYnqF+XNFihpSSOGepIIhsy0mk604rHmTDijAxbnCqHuL3964QWi8+AeYU4XsyM
         CIZPEbQeMeabtupTgTi6YAHyfgULH1rAMDazCcsTyO7+2h2Ew0XLMEXEiEQ7xYL06f+D
         ujnKxZXqc/J2NgGH2DAu/Jaz51Skk4SWS5R4W6o9n/9wUa7JFfrNFPykqON0rsfM6aIy
         oQPtuw48u3Gfbq2UI2739jAqRIw1QJC+K0bAIhW4qQFasPRzM7zGIhF1b6JDZTQ32aSr
         +erojPB0cSP2kaV9IxfbGgAWyMCiORgKpbh7f+84tLWov+D2Zc7Apg80uruu2zVqqgpX
         fXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QrmGu/DrfyoJRjpghd3iKC2qArp95acLTRr1DpVzOXw=;
        b=n4f/CdCdgvW1cXLZ0l/1g3I8G5cCoQMUfGT4iNaXe3CpvPxteVIJrVE7j9/geWEna2
         dpKysyDq55LztJK94jEJYoJD2WpX3zhhwOVvOKN59XcWADQmRbot7Jq6599ME7ggxUIK
         UJb+wYdeJP8DujiZV767NN41izcPqkab5K0O+yeI4ohkouDZqFjBdRooib+Q2kgJd3uG
         DbqXm7gj8l9jx7AToWZA+GaAY76mvVDWxk4T9izh3w5a4xe2GUzQA/ACGFtCgxBpMZwI
         bcSJCcYPR+XvnEOtYsqPHO2kiCaZBGsnFllHJOzpQ3d2cl3kgebqtrMSwqvuJ0EYcZ6D
         ObdA==
X-Gm-Message-State: AOAM530jfkLv3x8ITU6DO9fJdpKUeCtehusdbWzhzsryC+gnbg7zTkdB
        GEQ5FvXFDBrfPn0xcy+8XlWuDr0wFplKXvWkqCM2Tg==
X-Google-Smtp-Source: ABdhPJzcrGOFhcWqvJKmXAgREc3Jl+IJVplHAN9b5rURTUIIgccy4UFyMg6V6WbeOAMJPrDtQs11Lw3yJ0JnWwEIeB4=
X-Received: by 2002:a25:b94:: with SMTP id 142mr565239ybl.508.1631138510833;
 Wed, 08 Sep 2021 15:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-3-saravanak@google.com> <CAPDyKFqO9PLygSnNWSPg9OhnfFfiSUXsEmj7juYjNyYSn2C6og@mail.gmail.com>
In-Reply-To: <CAPDyKFqO9PLygSnNWSPg9OhnfFfiSUXsEmj7juYjNyYSn2C6og@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 8 Sep 2021 15:01:14 -0700
Message-ID: <CAGETcx-0-DN5U6JY0xTahAje0SkdhwAesdAwi2Lp19meLsfe8g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-oxnas@groups.io,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 7, 2021 at 3:29 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Sat, 4 Sept 2021 at 02:05, Saravana Kannan <saravanak@google.com> wrote:
> >
> > The simple-pm-bus driver is mandatory for CONFIG_OF based platforms to
> > work with fw_devlink. So, always compile it in for CONFIG_OF and delete
> > the config since it's no longer necessary.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>
> Some comments, see below. Nevertheless, feel free to add:
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks.

>
> Kind regards
> Uffe
>
> > ---
> >  arch/arm/configs/multi_v7_defconfig |  1 -
> >  arch/arm/configs/oxnas_v6_defconfig |  1 -
> >  arch/arm/configs/shmobile_defconfig |  1 -
> >  arch/arm/mach-omap2/Kconfig         |  1 -
> >  arch/arm64/configs/defconfig        |  1 -
> >  drivers/bus/Kconfig                 | 12 ------------
> >  drivers/bus/Makefile                |  2 +-
> >  drivers/soc/canaan/Kconfig          |  1 -
> >  8 files changed, 1 insertion(+), 19 deletions(-)
>
> Not sure what other people think (and it's not my call to make), but I
> would suggest to split this up in four pieces (drivers/bus,
> drivers/soc, arm, arm64)
>
> The important part is that the change in drivers/bus gets merged as
> part of your series, to make sure we don't break anything.

I think it'll be better if it's one commit like this and we have Greg
up the series. That way, there's no chance of broken trees anywhere.

-Saravana

>
> >
> > diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> > index d9abaae118dd..362720ae8d65 100644
> > --- a/arch/arm/configs/multi_v7_defconfig
> > +++ b/arch/arm/configs/multi_v7_defconfig
> > @@ -196,7 +196,6 @@ CONFIG_PCI_EPF_TEST=m
> >  CONFIG_DEVTMPFS=y
> >  CONFIG_DEVTMPFS_MOUNT=y
> >  CONFIG_OMAP_OCP2SCP=y
> > -CONFIG_SIMPLE_PM_BUS=y
> >  CONFIG_MTD=y
> >  CONFIG_MTD_CMDLINE_PARTS=y
> >  CONFIG_MTD_BLOCK=y
> > diff --git a/arch/arm/configs/oxnas_v6_defconfig b/arch/arm/configs/oxnas_v6_defconfig
> > index cae0db6b4eaf..de37f7e90999 100644
> > --- a/arch/arm/configs/oxnas_v6_defconfig
> > +++ b/arch/arm/configs/oxnas_v6_defconfig
> > @@ -46,7 +46,6 @@ CONFIG_DEVTMPFS=y
> >  CONFIG_DEVTMPFS_MOUNT=y
> >  CONFIG_DMA_CMA=y
> >  CONFIG_CMA_SIZE_MBYTES=64
> > -CONFIG_SIMPLE_PM_BUS=y
> >  CONFIG_MTD=y
> >  CONFIG_MTD_CMDLINE_PARTS=y
> >  CONFIG_MTD_BLOCK=y
> > diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> > index d9a27e4e0914..18d2a960b2d2 100644
> > --- a/arch/arm/configs/shmobile_defconfig
> > +++ b/arch/arm/configs/shmobile_defconfig
> > @@ -40,7 +40,6 @@ CONFIG_PCI_RCAR_GEN2=y
> >  CONFIG_PCIE_RCAR_HOST=y
> >  CONFIG_DEVTMPFS=y
> >  CONFIG_DEVTMPFS_MOUNT=y
> > -CONFIG_SIMPLE_PM_BUS=y
> >  CONFIG_MTD=y
> >  CONFIG_MTD_BLOCK=y
> >  CONFIG_MTD_CFI=y
> > diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
> > index 7df8f5276ddf..02f2f3157f07 100644
> > --- a/arch/arm/mach-omap2/Kconfig
> > +++ b/arch/arm/mach-omap2/Kconfig
> > @@ -112,7 +112,6 @@ config ARCH_OMAP2PLUS
> >         select PM_GENERIC_DOMAINS
> >         select PM_GENERIC_DOMAINS_OF
> >         select RESET_CONTROLLER
> > -       select SIMPLE_PM_BUS
> >         select SOC_BUS
> >         select TI_SYSC
> >         select OMAP_IRQCHIP
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index f423d08b9a71..474b1f2e3f06 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -245,7 +245,6 @@ CONFIG_DEVTMPFS_MOUNT=y
> >  CONFIG_FW_LOADER_USER_HELPER=y
> >  CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
> >  CONFIG_HISILICON_LPC=y
> > -CONFIG_SIMPLE_PM_BUS=y
> >  CONFIG_FSL_MC_BUS=y
> >  CONFIG_TEGRA_ACONNECT=m
> >  CONFIG_GNSS=m
> > diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> > index e7f7eee6ee9a..dc3801369488 100644
> > --- a/drivers/bus/Kconfig
> > +++ b/drivers/bus/Kconfig
> > @@ -141,18 +141,6 @@ config QCOM_EBI2
> >           Interface 2, which can be used to connect things like NAND Flash,
> >           SRAM, ethernet adapters, FPGAs and LCD displays.
> >
> > -config SIMPLE_PM_BUS
> > -       tristate "Simple Power-Managed Bus Driver"
> > -       depends on OF && PM
> > -       help
> > -         Driver for transparent busses that don't need a real driver, but
> > -         where the bus controller is part of a PM domain, or under the control
> > -         of a functional clock, and thus relies on runtime PM for managing
> > -         this PM domain and/or clock.
> > -         An example of such a bus controller is the Renesas Bus State
> > -         Controller (BSC, sometimes called "LBSC within Bus Bridge", or
> > -         "External Bus Interface") as found on several Renesas ARM SoCs.
> > -
> >  config SUN50I_DE2_BUS
> >         bool "Allwinner A64 DE2 Bus Driver"
> >           default ARM64
> > diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> > index 397e35392bff..86aacd36a56d 100644
> > --- a/drivers/bus/Makefile
> > +++ b/drivers/bus/Makefile
> > @@ -26,7 +26,7 @@ obj-$(CONFIG_OMAP_OCP2SCP)    += omap-ocp2scp.o
> >  obj-$(CONFIG_QCOM_EBI2)                += qcom-ebi2.o
> >  obj-$(CONFIG_SUN50I_DE2_BUS)   += sun50i-de2.o
> >  obj-$(CONFIG_SUNXI_RSB)                += sunxi-rsb.o
> > -obj-$(CONFIG_SIMPLE_PM_BUS)    += simple-pm-bus.o
> > +obj-$(CONFIG_OF)               += simple-pm-bus.o
> >  obj-$(CONFIG_TEGRA_ACONNECT)   += tegra-aconnect.o
> >  obj-$(CONFIG_TEGRA_GMI)                += tegra-gmi.o
> >  obj-$(CONFIG_TI_PWMSS)         += ti-pwmss.o
> > diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
> > index 8179b69518b4..853096b7e84c 100644
> > --- a/drivers/soc/canaan/Kconfig
> > +++ b/drivers/soc/canaan/Kconfig
> > @@ -5,7 +5,6 @@ config SOC_K210_SYSCTL
> >         depends on RISCV && SOC_CANAAN && OF
> >         default SOC_CANAAN
> >          select PM
> > -        select SIMPLE_PM_BUS
> >          select SYSCON
> >          select MFD_SYSCON
> >         help
> > --
> > 2.33.0.153.gba50c8fa24-goog
> >
