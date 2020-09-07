Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 674CA25F744
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 12:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbgIGKHq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 06:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728415AbgIGKHo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 06:07:44 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66FA7C061574
        for <linux-omap@vger.kernel.org>; Mon,  7 Sep 2020 03:07:44 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id j185so7103094vsc.3
        for <linux-omap@vger.kernel.org>; Mon, 07 Sep 2020 03:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ce6obAoY06qb3yfC15lC/wYcbO24HR4Ggz8VlArYV5I=;
        b=gpG2iBWSdQ5eahHqJWkR0z9Znx1jhPqheJ1ciSe4hCMHTL9NyEPjrAb+nC0AtfZVMF
         iX3JbaU10TsRqgFHKITh5NU86iQcIlIfRTQOR62AQqb/8MeRJ8kNYSui+PYqCXoxnzLG
         PFKWzjBzT81bfnVq2yFpbmA7gp7VxxmwoyofYsl2Sq6J7Bt2gxyptwnky2biQZpY2ae1
         TJkWumpJPbtatrVQuZxIihT0UjmJrMCtsYw0twy/yXroZrrHCgfFjJ7X84TCw+MjjaeZ
         t5B2fRvYmP5FYuDqaUa+q7Vthib56jvWeECcJi2vVjl40w8peFKT06ty53K4n6XRfvM1
         Yy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ce6obAoY06qb3yfC15lC/wYcbO24HR4Ggz8VlArYV5I=;
        b=rdCqJ5cde7Xs7RNimdpAK0BQkEEAUPijG9WTLsVG9O4GQh+wgZraL5pwEc7EaCX781
         VCsTcRihFz8KW/WDGuU0LsMke5Ji0/BFHL9ascj6ey4/ecBWWpqL/akqC7VcpbS/cqOy
         7iQcHOICYpZQbcZIZoiB9I02AjJG/sEUTq0VBo92JxyFE6KMd+h1gTKzSzUfMlb9ZQzd
         6X0saQhfqboxPxXx6kHlNeO7Ye4K+vN6DS92vQar5Ir/0Ny7nGuKRT631eW24ss7jRcK
         AyDr3fCtZr2IGntQwuKrj3WlX3IACmj1d5VV+sqcTHvuglEdYWXYXOyXktW5GVbZvxP9
         YryQ==
X-Gm-Message-State: AOAM5313Xebhc2gu86hUGZXn60jrG17RiIhXd8KXz4NA6PXSx43BynPd
        +ztRBUpBzcJshnLJejkmrXkFaNUcJYRwUiv0bT6pgw==
X-Google-Smtp-Source: ABdhPJwDJaI3759+fZr6m+VSJRYg+e8v1KCPXZUCXbChfkQ7zkupTb2pUy+KivsGmeJZ4vk4HulUd5jk+xtdLdPpiPw=
X-Received: by 2002:a67:e197:: with SMTP id e23mr11355927vsl.7.1599473263611;
 Mon, 07 Sep 2020 03:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200903084825.85616-1-vulab@iscas.ac.cn>
In-Reply-To: <20200903084825.85616-1-vulab@iscas.ac.cn>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 7 Sep 2020 12:07:06 +0200
Message-ID: <CAPDyKFrADVAs2zK2FY5sOh0R=8Kgsm9GwAKkbV9pfdczt07QOg@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: omap-hsmmc: remove redundant null check
To:     Xu Wang <vulab@iscas.ac.cn>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Dr. H. Nikolaus Schaller" <hns@goldelico.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 3 Sep 2020 at 10:48, Xu Wang <vulab@iscas.ac.cn> wrote:
>
> Because clk_disable_unprepare already checked NULL clock
> parameter, so the additional checks are unnecessary, just remove them.
>
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/omap_hsmmc.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
> index 37b8740513f5..d02983e23ed1 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -1114,8 +1114,7 @@ static int omap_hsmmc_switch_opcond(struct omap_hsmmc_host *host, int vdd)
>         int ret;
>
>         /* Disable the clocks */
> -       if (host->dbclk)
> -               clk_disable_unprepare(host->dbclk);
> +       clk_disable_unprepare(host->dbclk);
>
>         /* Turn the power off */
>         ret = omap_hsmmc_set_power(host, 0);
> @@ -1123,8 +1122,7 @@ static int omap_hsmmc_switch_opcond(struct omap_hsmmc_host *host, int vdd)
>         /* Turn the power ON with given VDD 1.8 or 3.0v */
>         if (!ret)
>                 ret = omap_hsmmc_set_power(host, 1);
> -       if (host->dbclk)
> -               clk_prepare_enable(host->dbclk);
> +       clk_prepare_enable(host->dbclk);
>
>         if (ret != 0)
>                 goto err;
> @@ -2014,8 +2012,7 @@ static int omap_hsmmc_probe(struct platform_device *pdev)
>         pm_runtime_dont_use_autosuspend(host->dev);
>         pm_runtime_put_sync(host->dev);
>         pm_runtime_disable(host->dev);
> -       if (host->dbclk)
> -               clk_disable_unprepare(host->dbclk);
> +       clk_disable_unprepare(host->dbclk);
>  err1:
>         mmc_free_host(mmc);
>  err:
> @@ -2037,8 +2034,7 @@ static int omap_hsmmc_remove(struct platform_device *pdev)
>         pm_runtime_put_sync(host->dev);
>         pm_runtime_disable(host->dev);
>         device_init_wakeup(&pdev->dev, false);
> -       if (host->dbclk)
> -               clk_disable_unprepare(host->dbclk);
> +       clk_disable_unprepare(host->dbclk);
>
>         mmc_free_host(host->mmc);
>
> @@ -2063,8 +2059,7 @@ static int omap_hsmmc_suspend(struct device *dev)
>                                 OMAP_HSMMC_READ(host->base, HCTL) & ~SDBP);
>         }
>
> -       if (host->dbclk)
> -               clk_disable_unprepare(host->dbclk);
> +       clk_disable_unprepare(host->dbclk);
>
>         pm_runtime_put_sync(host->dev);
>         return 0;
> @@ -2080,8 +2075,7 @@ static int omap_hsmmc_resume(struct device *dev)
>
>         pm_runtime_get_sync(host->dev);
>
> -       if (host->dbclk)
> -               clk_prepare_enable(host->dbclk);
> +       clk_prepare_enable(host->dbclk);
>
>         if (!(host->mmc->pm_flags & MMC_PM_KEEP_POWER))
>                 omap_hsmmc_conf_bus_power(host);
> --
> 2.17.1
>
