Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5998C273D30
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 10:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgIVIWq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Sep 2020 04:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbgIVIWp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Sep 2020 04:22:45 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6379C061755;
        Tue, 22 Sep 2020 01:22:45 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x123so11737670pfc.7;
        Tue, 22 Sep 2020 01:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IRBIpZozw6VBGdp6Z6B+Cbie+RecJ/RdOYOp4JhiRRk=;
        b=qb96eCXIyf9FDCF6NtpK1sNAbtykfFlgq4eXYhlIev+MJjrUIjCPfcwVmzj1+znXG+
         TzZTWl2fTHIGAxVWUHclA8w6OEu3FtaPZx7U3Xl/TzXP5Vj3LsH4KL5vwEuG08VZevLe
         8fgUTPqI4molIZuFuV+SyEbkL/0v30u/OqCLv/Hzo6lHFxP4EQnQDbAqS9dPROo9+mXl
         F4o0qQv0wpzpv/aY/WvoQDVlifJSnfH/8uIl9yC7LinyQJHzfX6i5VfIx2M5lWJcOVFG
         4sv2juFKfrn/GR1WLU5Ei/aGrJkztK82pmj1ky+gtR3KkhEC+i60/l0frRf1P6bNcUsj
         DM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IRBIpZozw6VBGdp6Z6B+Cbie+RecJ/RdOYOp4JhiRRk=;
        b=r2xc9ng/mNtbmc301bC8KsNjGfhKqS9L3EQY6IBL2wDc0FCQX2bETvdgeLyqhaWzK+
         qv44Ydgwc/W13zWtRLg35ocMFPciDwmDQuJ/bDoedSYx/91yd4SuMrCJO934SOx3ZvpB
         Xsa4F+qh5CZJVQnFqu+3jzGCRWAOHjtH++bml+hICf1zGK81eL8XDmCz5cuqc66GJapH
         iXUoXuspaf4kOVp/l6iVxtvF6XtVtLz1bYrV9B8/Z8yqVV7OfcTK6xvYWYvewE4SitBO
         ekbL33ebjCzq+55wJGBcomVLlSYh2cUTFWIozHo6aY9oaXGMstPH57kMmEk64VFy3RzF
         NvoA==
X-Gm-Message-State: AOAM533/Sz/rAbYPZtf2FwuiB0nffdv5wgqNfXFtGsjBhiSFQarRqOet
        Gdh0M0NvveHpmHWbC5hSVj+GrU9JvT/2zOE7jrI=
X-Google-Smtp-Source: ABdhPJwtwwEErqWEdtfkmflQiZNFOB9Z4kaB6SoQ63Z9t1SZ2x6pZRsTxuy1Okw074pmAyBZdoffjdWRCH6dww9xrcg=
X-Received: by 2002:aa7:9201:0:b029:13e:d13d:a10c with SMTP id
 1-20020aa792010000b029013ed13da10cmr3030367pfo.40.1600762965399; Tue, 22 Sep
 2020 01:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200921205016.20461-1-krzk@kernel.org> <20200921205016.20461-10-krzk@kernel.org>
In-Reply-To: <20200921205016.20461-10-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 22 Sep 2020 11:22:28 +0300
Message-ID: <CAHp75Veb3NAS+GekwQvL2_Y-jRbiJNM6W4JhH6o3R8GjSC8uww@mail.gmail.com>
Subject: Re: [PATCH 10/42] mfd: intel_msic: use PLATFORM_DEVID_NONE
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 21, 2020 at 11:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Use PLATFORM_DEVID_NONE define instead of "-1" value because:
>  - it brings some meaning,
>  - it might point attention why auto device ID was not used.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mfd/intel_msic.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mfd/intel_msic.c b/drivers/mfd/intel_msic.c
> index bb24c2a07900..e9944a81dc44 100644
> --- a/drivers/mfd/intel_msic.c
> +++ b/drivers/mfd/intel_msic.c
> @@ -317,8 +317,9 @@ static int intel_msic_init_devices(struct intel_msic *msic)
>                 if (!pdata->irq[i])
>                         continue;
>
> -               ret = mfd_add_devices(&pdev->dev, -1, &msic_devs[i], 1, NULL,
> -                                     pdata->irq[i], NULL);
> +               ret = mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
> +                                     &msic_devs[i], 1, NULL, pdata->irq[i],
> +                                     NULL);
>                 if (ret)
>                         goto fail;
>         }
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
