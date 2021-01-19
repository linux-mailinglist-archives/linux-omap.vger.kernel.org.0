Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A502FC58A
	for <lists+linux-omap@lfdr.de>; Wed, 20 Jan 2021 01:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbhATASc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Jan 2021 19:18:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391868AbhASNpo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Jan 2021 08:45:44 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA86C061794
        for <linux-omap@vger.kernel.org>; Tue, 19 Jan 2021 05:43:40 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id a16so352808uad.9
        for <linux-omap@vger.kernel.org>; Tue, 19 Jan 2021 05:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tNvEq5am+ikTvDsBrW7I06pSqyQwukR3vU3Lj1BRMZY=;
        b=SphubxSJTVl0TE0jAYvw8W8A2f9P9Mi5GZALEkVjbxipuCEaJJO53riF85DbU3rdL9
         LpNZQrLAsNSuebeng43zG7UM1hic6+NQ9gU+MTOYYARS80T+KdOjdIFIBjE8VE0zCEua
         bW2Pvf0Fa+Mo2mZMiMuHPCE6udwFMqiwjLf62PqwWVElt3ZNkYSND4twFP4dLdEUriAH
         Z4rRhq67ev1ZkcXUNYVfems6a109dchqMDFU3eejhu5xqhDNLIcU2uNhtkTV5pFotmrf
         aNQ7rhBiFMLAmc1cHEi+ITYc5WUw7A5fS7tmwdK1Dg7bLkvEkBtu6AKUzdlbt3yDtCnj
         HEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tNvEq5am+ikTvDsBrW7I06pSqyQwukR3vU3Lj1BRMZY=;
        b=Umga6fSelsolXh7U5CCxJhjx5QHXEYb6tUSLGtFrwVvFC5bVhFGn0t6E3wtOUj10hA
         dStVVdsBm1H7VpZbLlKo30uhd5vqnBx8+6f8sfGX5Ph1MmaZPOvLMpDJD0r55VKs1PsO
         kfQETgmUbSikqvgqbzOTNwxF59hGD5RMTGTqx2CwRD6cluidPgXl/KdtdY07kcoItbWM
         y9Ku7Dy1uHoOTz5fMKdNF5C+mHWvWSXmtDneHuf8QdWFJbG6uI1dpr3650IfQjKeEhUJ
         ImFRgkLGWiV5TgMiSy5/Iv9zsoCUc4gEn5QWI4GHhmhwea5zauIDDkmRg/mssptcId/X
         iUbg==
X-Gm-Message-State: AOAM530CWZ/7x0JtcfqWsvQaCOQ0J6nBFW02BWx3V4gM75wMg8p4QZH+
        ElJrn0zA3n7N79KNKMJHE6oIX8pzw/aook+0jA5Szw==
X-Google-Smtp-Source: ABdhPJx1sJ4xEgc4HsCtvWM79eqIKYNMrMBIhqmEXfnsfu1Ih9nGPi9MRPZTKWZwDPPcFTUk4CrGjvf2AzBXz2uxEvU=
X-Received: by 2002:ab0:768:: with SMTP id h95mr2267466uah.104.1611063819438;
 Tue, 19 Jan 2021 05:43:39 -0800 (PST)
MIME-Version: 1.0
References: <1610704281-11036-1-git-send-email-abaci-bugfix@linux.alibaba.com>
In-Reply-To: <1610704281-11036-1-git-send-email-abaci-bugfix@linux.alibaba.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 19 Jan 2021 14:43:03 +0100
Message-ID: <CAPDyKFpwF6gX3YhKGMF=YUGP1UQD=JSuNgvSxuJHG+Ochzv5Bg@mail.gmail.com>
Subject: Re: [PATCH v2] host: omap_hsmmc: style: Simplify bool comparison and conversion
To:     Yang Li <abaci-bugfix@linux.alibaba.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 15 Jan 2021 at 10:51, Yang Li <abaci-bugfix@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
> ./drivers/mmc/host/omap_hsmmc.c:297:6-25: WARNING: Comparison of 0/1 to
> bool variable
>
> According to the context, vqmmc_enabled is more suitable for bool
> type.
>
> Reported-by: Abaci Robot<abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <abaci-bugfix@linux.alibaba.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v2:
>  -clean up all use of "pbias_enabled", and do the same clean up for
> "vqmmc_enabled".
>
>  drivers/mmc/host/omap_hsmmc.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
> index aa9cc49..2f8038d 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -177,7 +177,7 @@ struct omap_hsmmc_host {
>         struct  regulator       *pbias;
>         bool                    pbias_enabled;
>         void    __iomem         *base;
> -       int                     vqmmc_enabled;
> +       bool                    vqmmc_enabled;
>         resource_size_t         mapbase;
>         spinlock_t              irq_lock; /* Prevent races with irq handler */
>         unsigned int            dma_len;
> @@ -232,7 +232,7 @@ static int omap_hsmmc_enable_supply(struct mmc_host *mmc)
>                         dev_err(mmc_dev(mmc), "vmmc_aux reg enable failed\n");
>                         goto err_vqmmc;
>                 }
> -               host->vqmmc_enabled = 1;
> +               host->vqmmc_enabled = true;
>         }
>
>         return 0;
> @@ -256,7 +256,7 @@ static int omap_hsmmc_disable_supply(struct mmc_host *mmc)
>                         dev_err(mmc_dev(mmc), "vmmc_aux reg disable failed\n");
>                         return ret;
>                 }
> -               host->vqmmc_enabled = 0;
> +               host->vqmmc_enabled = false;
>         }
>
>         if (!IS_ERR(mmc->supply.vmmc)) {
> @@ -285,22 +285,22 @@ static int omap_hsmmc_set_pbias(struct omap_hsmmc_host *host, bool power_on)
>                 return 0;
>
>         if (power_on) {
> -               if (host->pbias_enabled == 0) {
> +               if (!host->pbias_enabled) {
>                         ret = regulator_enable(host->pbias);
>                         if (ret) {
>                                 dev_err(host->dev, "pbias reg enable fail\n");
>                                 return ret;
>                         }
> -                       host->pbias_enabled = 1;
> +                       host->pbias_enabled = true;
>                 }
>         } else {
> -               if (host->pbias_enabled == 1) {
> +               if (host->pbias_enabled) {
>                         ret = regulator_disable(host->pbias);
>                         if (ret) {
>                                 dev_err(host->dev, "pbias reg disable fail\n");
>                                 return ret;
>                         }
> -                       host->pbias_enabled = 0;
> +                       host->pbias_enabled = false;
>                 }
>         }
>
> @@ -1861,8 +1861,8 @@ static int omap_hsmmc_probe(struct platform_device *pdev)
>         host->base      = base + pdata->reg_offset;
>         host->power_mode = MMC_POWER_OFF;
>         host->next_data.cookie = 1;
> -       host->pbias_enabled = 0;
> -       host->vqmmc_enabled = 0;
> +       host->pbias_enabled = false;
> +       host->vqmmc_enabled = false;
>
>         platform_set_drvdata(pdev, host);
>
> --
> 1.8.3.1
>
