Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0AD7EFE40
	for <lists+linux-omap@lfdr.de>; Sat, 18 Nov 2023 08:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjKRHWG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 18 Nov 2023 02:22:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbjKRHWF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 18 Nov 2023 02:22:05 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35873D75
        for <linux-omap@vger.kernel.org>; Fri, 17 Nov 2023 23:22:01 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5099184f8a3so3974184e87.2
        for <linux-omap@vger.kernel.org>; Fri, 17 Nov 2023 23:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700292119; x=1700896919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ck4P2+ZKsmJo86GTwgisAYut3quxIggprqt+AHmxY3Q=;
        b=BNPKoSNcWHUbvE8qoFNll6YHOBwiJfNFjaZkYG2ogJICcuj8dL/62UZhA4TVgpJWQO
         4VI48CcBPuzK89sodsPR2BZ0O0IQ+ZtRLyNwMkSud6AYCWDh+0o3copqzNeNXoKoR82T
         c5++YTDmHyWgp0faxJNH7jZUK7jC/h3VNhr2WRj9wdrv6FSPqGRRqTXBfF4YgfmlFAm4
         LaEb87nzAeiCPiFzs9jXnzA6tOk63aaSOs/WEvVJGYi9kxPBrH3RfxvnropSz4RgY2hR
         cf5Xy08uzdmnQqyZPJxgCHmarwUfrbTdY6pdQ/YyHNLKkYvXeXhYpy7Rt986JT9OqiO7
         SSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700292119; x=1700896919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ck4P2+ZKsmJo86GTwgisAYut3quxIggprqt+AHmxY3Q=;
        b=U7Bv+PznYTD3+1dCDG/TxHcpf6OXO2u2mc+RX3U4ySiUuEtz/2PG2k4/5yleIwd46C
         UoKPA7pa0fwXlknsLk9xrqPAA77bFhWHNn+oY5rW/7wCyJA2CRqH3I2H3y/Wg4MYzY5G
         ZUbLGjE+b4dfRQzAlUs3y7TLET82Abd0QP1J4awvaFrfiwmHOtto7bhsNS3oKIK0UWRI
         5oTY6dliYH9bQNwuDR0/pmRoH+6ptLRczR2CQ9v6ZMcfy/LzZS51wPaltRU632ulxo7O
         is61VBBH3FBNOTslBqR9gV3u6+LkYuE8C7MrddHpPeO8quR41p7PyNQP3o3Y+9+VlwA2
         hNtQ==
X-Gm-Message-State: AOJu0YydPOD46NJg7F5i6NnUiGlZzvjpvzSdS7T5CIZTVaYI3p0ej3ek
        NbasllOaMtECLJuRKR3uaJZjKmxx9pyap+BqjO7KIg==
X-Google-Smtp-Source: AGHT+IGmCsPW2DtD/iX2I0p/vAioavmL3nUdlFm9LTuiQ8hEFhSVfZynWt3wCr0Ylq+E12kfdVP2MQpjE5tjjXdAwZI=
X-Received: by 2002:a05:6512:23aa:b0:507:b15b:8b92 with SMTP id
 c42-20020a05651223aa00b00507b15b8b92mr1551640lfv.59.1700292119299; Fri, 17
 Nov 2023 23:21:59 -0800 (PST)
MIME-Version: 1.0
References: <20231117091655.872426-1-u.kleine-koenig@pengutronix.de> <20231117091655.872426-4-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231117091655.872426-4-u.kleine-koenig@pengutronix.de>
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date:   Sat, 18 Nov 2023 09:21:23 +0200
Message-ID: <CAC_iWj+5MskeWaqa242zFsGRrgAxMGuVPHL6kYm1DUtH_jkDTg@mail.gmail.com>
Subject: Re: [PATCH 3/7] net: ethernet: ti: cpsw-new: Don't error out in .remove()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Siddharth Vadapalli <s-vadapalli@ti.com>,
        Ravi Gunasekaran <r-gunasekaran@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Marek Majtyka <alardam@gmail.com>,
        Gerhard Engleder <gerhard@engleder-embedded.com>,
        Rob Herring <robh@kernel.org>,
        Yunsheng Lin <linyunsheng@huawei.com>,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 17 Nov 2023 at 11:17, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Returning early from .remove() with an error code still results in the
> driver unbinding the device. So the driver core ignores the returned erro=
r
> code and the resources that were not freed are never catched up. In
> combination with devm this also often results in use-after-free bugs.
>
> If runtime resume fails, it's still important to free all resources, so
> don't return with an error code, but emit an error message and continue
> freeing acquired stuff.
>
> This prepares changing cpsw_remove() to return void.
>
> Fixes: ed3525eda4c4 ("net: ethernet: ti: introduce cpsw switchdev based d=
river part 1 - dual-emac")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/net/ethernet/ti/cpsw_new.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti=
/cpsw_new.c
> index 0e4f526b1753..a6ce409f563c 100644
> --- a/drivers/net/ethernet/ti/cpsw_new.c
> +++ b/drivers/net/ethernet/ti/cpsw_new.c
> @@ -2042,16 +2042,24 @@ static int cpsw_remove(struct platform_device *pd=
ev)
>         struct cpsw_common *cpsw =3D platform_get_drvdata(pdev);
>         int ret;
>
> -       ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +       ret =3D pm_runtime_get_sync(&pdev->dev);
>         if (ret < 0)
> -               return ret;
> +               /* There is no need to do something about that. The impor=
tant
> +                * thing is to not exit early, but do all cleanup that do=
esn't
> +                * requrie register access.
> +                */
> +               dev_err(&pdev->dev, "runtime resume failed (%pe)\n",
> +                       ERR_PTR(ret));
>
>         cpsw_unregister_notifiers(cpsw);
>         cpsw_unregister_devlink(cpsw);
>         cpsw_unregister_ports(cpsw);
>
> -       cpts_release(cpsw->cpts);
> -       cpdma_ctlr_destroy(cpsw->dma);
> +       if (ret >=3D 0) {
> +               cpts_release(cpsw->cpts);
> +               cpdma_ctlr_destroy(cpsw->dma);
> +       }
> +
>         cpsw_remove_dt(cpsw);
>         pm_runtime_put_sync(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
> --
> 2.42.0
>

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
