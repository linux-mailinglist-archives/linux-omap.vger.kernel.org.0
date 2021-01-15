Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D14622F761A
	for <lists+linux-omap@lfdr.de>; Fri, 15 Jan 2021 10:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbhAOJ5s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Jan 2021 04:57:48 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:39761 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbhAOJ5p (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Jan 2021 04:57:45 -0500
Received: by mail-ot1-f45.google.com with SMTP id d8so8010397otq.6;
        Fri, 15 Jan 2021 01:57:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F0oP5Ub/C2cblUP5apzo/LR/VgI2R+aAERzhhFWW9v4=;
        b=DFrPB/KTDAcM5Fb03raBHvZCtIGXYyIFOo9wvKk3XZGV7oW/1fdPqvJLc10UuZDMa+
         h2R1osq/wa6C752sBFAK8QmRgHB4ViME6hSKTLeos8s/hmMQ92imqZPu+idQ2GcTntFq
         c0Ki2g1hzxLYw3h+zZubAiY4RzmUqipgsbJCNvQRiCvM5RDcD54D0+cizqbc5I3x1dF3
         EA+jfhlYKStNSZFpKsChEqMaWwTraF20veElWwK5lEe5tbHjIDlH/aJT2WcALZLna6uN
         K4lRVsmA44gH3edmsmnQpRdFtm6OcB0qnH7c5H9yEaDVwNQkKg2FeLPLxMNZ7FZv6d6s
         QEEg==
X-Gm-Message-State: AOAM531tCZla5OdpiULESISTlR4/NL7rTG03cNch7rJDmPh2p+NGl3qw
        ICXB2kAGXxg33Y2vluPaR+hpyWzeYmv4aJryFAg=
X-Google-Smtp-Source: ABdhPJxHlZfBOeWwlnZP6JNt2xdG0oogUS2hX/bbOV6iMCfGkcN7qBMXtPbCupS1K3mOxw2tHrWOiB38PEc9Cg06G7Q=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr7689066oth.250.1610704625286;
 Fri, 15 Jan 2021 01:57:05 -0800 (PST)
MIME-Version: 1.0
References: <20210115094231.62491-1-tony@atomide.com>
In-Reply-To: <20210115094231.62491-1-tony@atomide.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Jan 2021 10:56:54 +0100
Message-ID: <CAMuHMdXGvBDYe=Y3pvV9smhXUpo9daBsSD3ukn3N8M-fEKca5w@mail.gmail.com>
Subject: Re: [PATCH] drivers: bus: simple-pm-bus: Fix compability with
 simple-bus for auxdata
To:     ext Tony Lindgren <tony@atomide.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

CC DT

On Fri, Jan 15, 2021 at 10:42 AM Tony Lindgren <tony@atomide.com> wrote:
> After converting am335x to probe devices with simple-pm-bus I noticed
> that we are not passing auxdata for of_platform_populate() like we do
> with simple-bus.
>
> While device tree using SoCs should no longer need platform data, there
> are still quite a few drivers that still need it.
>
> Let's fix the issue by passing auxdata as platform data to simple-pm-bus.
> That way the SoCs needing this can pass the auxdata with OF_DEV_AUXDATA.
> And let's pass the auxdata for omaps to fix the issue for am335x.
>
> Later on we may want to consider handling simple-pm-bus directly in
> drivers/of/platform.c as then we no longer need the platform data for
> simple-pm-bus.
>
> Fixes: 5a230524f879 ("ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/mach-omap2/pdata-quirks.c | 1 +
>  drivers/bus/simple-pm-bus.c        | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
> --- a/arch/arm/mach-omap2/pdata-quirks.c
> +++ b/arch/arm/mach-omap2/pdata-quirks.c
> @@ -532,6 +532,7 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
>                        &dra7_ipu1_dsp_iommu_pdata),
>  #endif
>         /* Common auxdata */
> +       OF_DEV_AUXDATA("simple-pm-bus", 0, NULL, omap_auxdata_lookup),
>         OF_DEV_AUXDATA("ti,sysc", 0, NULL, &ti_sysc_pdata),
>         OF_DEV_AUXDATA("pinctrl-single", 0, NULL, &pcs_pdata),
>         OF_DEV_AUXDATA("ti,omap-prm-inst", 0, NULL, &ti_prm_pdata),
> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -16,6 +16,7 @@
>
>  static int simple_pm_bus_probe(struct platform_device *pdev)
>  {
> +       const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
>         struct device_node *np = pdev->dev.of_node;
>
>         dev_dbg(&pdev->dev, "%s\n", __func__);
> @@ -23,7 +24,7 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
>         pm_runtime_enable(&pdev->dev);
>
>         if (np)
> -               of_platform_populate(np, NULL, NULL, &pdev->dev);
> +               of_platform_populate(np, NULL, lookup, &pdev->dev);
>
>         return 0;
>  }
> --
> 2.30.0
