Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A29D4F660B
	for <lists+linux-omap@lfdr.de>; Wed,  6 Apr 2022 18:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238035AbiDFQxE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Apr 2022 12:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238428AbiDFQwu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Apr 2022 12:52:50 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F55286A75
        for <linux-omap@vger.kernel.org>; Wed,  6 Apr 2022 07:56:39 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id p10so4493074lfa.12
        for <linux-omap@vger.kernel.org>; Wed, 06 Apr 2022 07:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gFpgrsnLnc4iDOPupsDr/hfYxK6Z0h6eWyrz3p261dM=;
        b=lkZwtdvoeffsynG0Cm8wN/TWC2xr9vAgsTqIgZchJO+Xnqv4FT0qZU1mb2+ikd5GgZ
         ugQsTJEUnRZJcA0NT3P/EHMztqQAMW23LkZaFaH/s5QTkPT+8Mpdb57rGttNOJZQoLEy
         3E5PLMFWoENkWYrP7/LbcR4EBAb3IJfIxlytRozBrMfUtExLuE8magxgvkP20/wNSoy2
         CGD1EeggTVMfBnZZ9i9pYp4lcjREdh9ZVcFxihGLfL+R2OWiuyGwSRNhTacDyQPD1w6J
         XK3x/aR/iAPJMtxkMIWEtGF88Xj656MjKKMyVvwNC9b1mBrOBKyBM86gTgYqcMT2NosD
         7XNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gFpgrsnLnc4iDOPupsDr/hfYxK6Z0h6eWyrz3p261dM=;
        b=iOTiGKf/BXxmEr2j+of+Q4CHmM6g9trQf06IGTwJe1AUyImazyICIP3yyLuyUplY2L
         sBEHfkOezjGfN4YoT4RKTFZN/Rh2slQlGjqjvLmM8XhVF450vXqt94gOgRI+CfAUpcmX
         m5vd/4uoC1j+PdwQnZZ3OiVIlwzWzc/3x49IPcb5N9Ugt9JV9Bp9oTg1I/fMTD4lIKQm
         Fz49Vjp1PPAzNfeckuXtUtHNZCvAvMqTDMM+FhB7OMW6P2/2KMo05MlmrgxobSqO9Mlo
         gdFzM9SXSUxfyDEMMfCvAe/AceZSIyYDTxlxOeYZbz0uqPH5Whz/zqmYSPH7MN5I/KPp
         l3VQ==
X-Gm-Message-State: AOAM530FylMDBLyCv0s/0l160JqpYnaInpGozm4AozkqthyEczqQaP+o
        xLGOhIuJ1XlUpXHL4ZUlGPqJfNl1cb/1N1oeWkehsoczZuY=
X-Google-Smtp-Source: ABdhPJy+0Vn/oa5vvN/2kOPrZDZXG5mFUd14JNKQ/X2A2nnXBgXrA0jAleJzbKDmd+rPEJod8YDmRWQRljZOFnLmaW4=
X-Received: by 2002:a05:6512:b19:b0:44a:b7c4:3d94 with SMTP id
 w25-20020a0565120b1900b0044ab7c43d94mr6109325lfu.358.1649256990277; Wed, 06
 Apr 2022 07:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220402112004.129886-1-jmkrzyszt@gmail.com>
In-Reply-To: <20220402112004.129886-1-jmkrzyszt@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 6 Apr 2022 16:55:54 +0200
Message-ID: <CAPDyKFrci4owyLo48FKe-_kcyaYU+C2k42Wwco_52wo_X=Z2Kw@mail.gmail.com>
Subject: Re: [PATCH] mmc: omap: Make it CCF clk API compatible
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>, linux-mmc@vger.kernel.org,
        linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 2 Apr 2022 at 13:20, Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
>
> The driver, OMAP specific, now omits clk_prepare/unprepare() steps, not
> supported by OMAP custom implementation of clock API.  However, non-CCF
> stubs of those functions exist for use on such platforms until converted
> to CCF.
>
> Update the driver to be compatible with CCF implementation of clock API.
>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/omap.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
> index 5e5af34090f1..57d39283924d 100644
> --- a/drivers/mmc/host/omap.c
> +++ b/drivers/mmc/host/omap.c
> @@ -1374,7 +1374,7 @@ static int mmc_omap_probe(struct platform_device *pdev)
>         host->iclk = clk_get(&pdev->dev, "ick");
>         if (IS_ERR(host->iclk))
>                 return PTR_ERR(host->iclk);
> -       clk_enable(host->iclk);
> +       clk_prepare_enable(host->iclk);
>
>         host->fclk = clk_get(&pdev->dev, "fck");
>         if (IS_ERR(host->fclk)) {
> @@ -1382,16 +1382,18 @@ static int mmc_omap_probe(struct platform_device *pdev)
>                 goto err_free_iclk;
>         }
>
> +       ret = clk_prepare(host->fclk);
> +       if (ret)
> +               goto err_put_fclk;
> +
>         host->dma_tx_burst = -1;
>         host->dma_rx_burst = -1;
>
>         host->dma_tx = dma_request_chan(&pdev->dev, "tx");
>         if (IS_ERR(host->dma_tx)) {
>                 ret = PTR_ERR(host->dma_tx);
> -               if (ret == -EPROBE_DEFER) {
> -                       clk_put(host->fclk);
> -                       goto err_free_iclk;
> -               }
> +               if (ret == -EPROBE_DEFER)
> +                       goto err_free_fclk;
>
>                 host->dma_tx = NULL;
>                 dev_warn(host->dev, "TX DMA channel request failed\n");
> @@ -1403,8 +1405,7 @@ static int mmc_omap_probe(struct platform_device *pdev)
>                 if (ret == -EPROBE_DEFER) {
>                         if (host->dma_tx)
>                                 dma_release_channel(host->dma_tx);
> -                       clk_put(host->fclk);
> -                       goto err_free_iclk;
> +                       goto err_free_fclk;
>                 }
>
>                 host->dma_rx = NULL;
> @@ -1454,9 +1455,12 @@ static int mmc_omap_probe(struct platform_device *pdev)
>                 dma_release_channel(host->dma_tx);
>         if (host->dma_rx)
>                 dma_release_channel(host->dma_rx);
> +err_free_fclk:
> +       clk_unprepare(host->fclk);
> +err_put_fclk:
>         clk_put(host->fclk);
>  err_free_iclk:
> -       clk_disable(host->iclk);
> +       clk_disable_unprepare(host->iclk);
>         clk_put(host->iclk);
>         return ret;
>  }
> @@ -1476,8 +1480,9 @@ static int mmc_omap_remove(struct platform_device *pdev)
>
>         mmc_omap_fclk_enable(host, 0);
>         free_irq(host->irq, host);
> +       clk_unprepare(host->fclk);
>         clk_put(host->fclk);
> -       clk_disable(host->iclk);
> +       clk_disable_unprepare(host->iclk);
>         clk_put(host->iclk);
>
>         if (host->dma_tx)
> --
> 2.35.1
>
