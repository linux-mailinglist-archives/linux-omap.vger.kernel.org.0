Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C89306C67CF
	for <lists+linux-omap@lfdr.de>; Thu, 23 Mar 2023 13:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbjCWMOR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Mar 2023 08:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbjCWMN5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Mar 2023 08:13:57 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494DF15C8B
        for <linux-omap@vger.kernel.org>; Thu, 23 Mar 2023 05:13:44 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id k17so13739688ybm.11
        for <linux-omap@vger.kernel.org>; Thu, 23 Mar 2023 05:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679573622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ALFwvw50Oz+gjNGnlwxKeh+PF+7RPaNRR5vajpRayGA=;
        b=lQ/Luegj+SIyFETuhC0mhnn/jgRkpkvEHiFYjAEuHWuSSJvn2FRgMIudLEGhPQ+g/s
         qCKvIlkMea84aQzG0fNMn8cOfnzszxdcUzewbspuhaz6mEjeeqOY3FR+56+A9gnYRUc8
         XjTh07K5Mrn8OoUOHcCvzjCC1dzHqxECkNZgUDCDqhh15BkUpyWE6z0YOYxzKa3/DogH
         VOW6iLubS/7upy1Oik8vyhWoBsKwstOofF8l5P4Vl6lVuS6JHWTQOhv06QSgOyVoRNH1
         pKJCUItaEvXrsdV0G3mZJ6IAojR3EcC/oznO/s8MXymCml5E4k60REnqcaVX0t7jx7fa
         t6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679573622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALFwvw50Oz+gjNGnlwxKeh+PF+7RPaNRR5vajpRayGA=;
        b=hsDTe702TJfBKwg9LcMKuEcPHafi2lPIX73vwt5kKt9VChra9N38x1Hi4/Dp7JuEUl
         V/GBAQ+f5XEdYJX+mGPvrVVcp9Z7UWoWfs1IZ4Nd5rhm20GKq6xrD04lVL2HT9zyxS3T
         ZQh9NzmXjj/l6Fx1LRZAuv/RrM2E0nP9+Qs3DVUVHikbC82LBzcFAcZdEtJXKxq4wbgU
         5l//VvGaHMzHeMjd5AeeHZ3A1HKUj9x7j4LT9FFEvqSUxMvJWzvnS5iOaeT2+DUYzyyp
         OPGN7hCiggvE1Y8ExUbXU3Yd5ETbx4Jo0uy+7TvxI5x603Hmh3YEnIt3A+rkRXeRWDqh
         FsKA==
X-Gm-Message-State: AAQBX9fggrWsMMFQ/AcxJpg5GSksm28W4KPwkZM/JOEHTX7uTzQ7dwGo
        op4FjNfYRocaQq6Xv/Z53nDVzvDztuqcoPis1PJlu4aIMOP8MSN3
X-Google-Smtp-Source: AKy350ZmPZ6Bgl/nzWsMVVusfpOpXKH6gyaGevVQV5K60RTELmGqzP67HWjeBShZfhob5GCO1QOIGHoIxVmw/d31b5I=
X-Received: by 2002:a05:6902:1203:b0:b71:f49f:8d22 with SMTP id
 s3-20020a056902120300b00b71f49f8d22mr1977317ybu.3.1679573622701; Thu, 23 Mar
 2023 05:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230315053434.38316-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230315053434.38316-1-yang.lee@linux.alibaba.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 23 Mar 2023 13:13:07 +0100
Message-ID: <CAPDyKFrmrHa7vRAVak7PcxFUPn2TN1n6+s7NQDCNHBwi6_m4KA@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: omap: Use devm_platform_get_and_ioremap_resource()
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 15 Mar 2023 at 06:34, Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> According to commit 890cc39a8799 ("drivers: provide
> devm_platform_get_and_ioremap_resource()"), convert
> platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/omap.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
> index 57d39283924d..ce78edfb402b 100644
> --- a/drivers/mmc/host/omap.c
> +++ b/drivers/mmc/host/omap.c
> @@ -1345,8 +1345,7 @@ static int mmc_omap_probe(struct platform_device *pdev)
>         if (irq < 0)
>                 return -ENXIO;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       host->virt_base = devm_ioremap_resource(&pdev->dev, res);
> +       host->virt_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>         if (IS_ERR(host->virt_base))
>                 return PTR_ERR(host->virt_base);
>
> --
> 2.20.1.7.g153144c
>
