Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34F63622BA5
	for <lists+linux-omap@lfdr.de>; Wed,  9 Nov 2022 13:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbiKIMfF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Nov 2022 07:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiKIMfC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Nov 2022 07:35:02 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1369F17E3F
        for <linux-omap@vger.kernel.org>; Wed,  9 Nov 2022 04:34:56 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso1749128pjc.5
        for <linux-omap@vger.kernel.org>; Wed, 09 Nov 2022 04:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ztgH1o0pwITYmXVZJPR07txzGdGGG1TWg3A61Ivfn+s=;
        b=ETaRDD549dFCxiJOTDiRQ23tQOviWAoapqAR2kKHuffNB7HTc1hFkXc8p32AbnyRyR
         tlX85jy9SEX9O+LC881YIeuP98I44p4aPR+tgGF/Kn9Nul8lPEaOlwp6W+/9aApV5uXw
         rFT3UC7236pDyoyzpgr+rE7GNrN81DfiEu3w5hp28jntQaPzo7Bog+sjrC4RK1V4kfA6
         S5VB4h3BDFQkmC9yeQ7KojiIxCCRcvksl6+vH3vbD/WRGpCjS+hIupa1GA7mxgZHgRzf
         yMDQ1zQBVuxX6PDSfeXuQB8qCMl6gRFNLKzg3zZGnPKfFUJ5WQWKyP2NLF2B2k7vEm8e
         RTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztgH1o0pwITYmXVZJPR07txzGdGGG1TWg3A61Ivfn+s=;
        b=Ml2YRA62z6stcBHnqa6heVVG4+Ht4SkSKgOciNe3GfU1y+3w2L3EP5g1/GoH6JeNoA
         Zpj0UB5O7by8Jk47ZsrpO+4V8JflWEmTb3Ba9PXMrg1mPoi8CvXVPTXoyofm2NHw+tmu
         r9uQnP2QOVE0oHhOetFwYXhm/yg7AgP0BHhb3zpPGpv/Iobv8ggMLxXP34e+je9vxO55
         uifJZWT8Si9GjjsTZponK5sEC5Yhi9C+aaH3j2aRxj/jy2e1rPebNpHt2U+aJq8slfc9
         6B0CoF/L5JU94HTMEQ7B6nGtXtf9twKOSE+ZOWNP8BSGc9/Pl8UNW2XSn4hAVRmIxA32
         B8sw==
X-Gm-Message-State: ACrzQf1p9eGDGI004ZaVcA6TRXisMoOlLImNGdJM2D1/7qdno06fyk55
        Oy7sLJHhPfEtrJ/zE+nwTWzqdUvR3/p+smyI7+gBnlEQ6Iw=
X-Google-Smtp-Source: AMsMyM4j7gi14FkgHNiGW/qCTYxiXVpTC+o5Qj87pnSJIO4iN7IiggYgvfnS+Y1cd7LbkwYSUmwK1lZCKKe7Nu4Oq5Y=
X-Received: by 2002:a17:903:100c:b0:186:63a1:3b5d with SMTP id
 a12-20020a170903100c00b0018663a13b5dmr61928978plb.148.1667997295578; Wed, 09
 Nov 2022 04:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20221108121316.340354-1-yangyingliang@huawei.com>
In-Reply-To: <20221108121316.340354-1-yangyingliang@huawei.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 9 Nov 2022 13:34:18 +0100
Message-ID: <CAPDyKFpi-2uHxsEk7Eza2L=VPEr1UOUN31kLRERw24329rEcog@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: omap_hsmmc: fix return value check of mmc_add_host()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 8 Nov 2022 at 13:14, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> mmc_add_host() may return error, if we ignore its return value,
> it will lead two issues:
> 1. The memory that allocated in mmc_alloc_host() is leaked.
> 2. In the remove() path, mmc_remove_host() will be called to
>    delete device, but it's not added yet, it will lead a kernel
>    crash because of null-ptr-deref in device_del().
>
> Fix this by checking the return value and goto error path wihch
> will call mmc_free_host().
>
> Fixes: a45c6cb81647 ("[ARM] 5369/1: omap mmc: Add new omap hsmmc controller for 2430 and 34xx, v3")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/omap_hsmmc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
> index fca30add563e..4bd744755205 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -1946,7 +1946,9 @@ static int omap_hsmmc_probe(struct platform_device *pdev)
>         if (!ret)
>                 mmc->caps |= MMC_CAP_SDIO_IRQ;
>
> -       mmc_add_host(mmc);
> +       ret = mmc_add_host(mmc);
> +       if (ret)
> +               goto err_irq;
>
>         if (mmc_pdata(host)->name != NULL) {
>                 ret = device_create_file(&mmc->class_dev, &dev_attr_slot_name);
> --
> 2.25.1
>
