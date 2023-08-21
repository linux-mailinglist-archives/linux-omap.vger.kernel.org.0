Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2F817828AE
	for <lists+linux-omap@lfdr.de>; Mon, 21 Aug 2023 14:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234380AbjHUMMU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Aug 2023 08:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbjHUMMU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Aug 2023 08:12:20 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 717A4EC
        for <linux-omap@vger.kernel.org>; Mon, 21 Aug 2023 05:12:12 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-7a257fabae5so461805241.2
        for <linux-omap@vger.kernel.org>; Mon, 21 Aug 2023 05:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692619931; x=1693224731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCkbxK8SDHIlpboWoSgSQlBN5th7HtJtXxIERiulQiM=;
        b=APSyrpMPYPetYFPwGu8psh4/T58NHYXfo9EmQxVEB2eEqAtwPDsGR3yPcXtsEoDizg
         w1F8zZDM7Ptgp0oFHZ2Hv7K0RJ//2OdiynAnnVqrADpivsx2HvPJ3EMezJLjKanSq2wy
         yv3eYRNpLIZqZv1ePBKU5YvnlGXSq0YXZia2PpZdjJ/LsaRSmhezJXTQxVLByq4+RzOS
         DVCA7B//1n0TmHBocoy5pXrEnNg2cJsRIOxPu/E6Lg0C2ha+BT9MfZsU4a34l2Mc7vR2
         prDXeGEyloWpFbrL8/UaIrpNkvaHxkjUj0mwwuCyYnB8iO0FmwTjKdxGRiRgarandfsU
         jATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692619931; x=1693224731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCkbxK8SDHIlpboWoSgSQlBN5th7HtJtXxIERiulQiM=;
        b=avMOquQpXCPL6+BdvBeIARupjlexFCN3Nyb7tknVDi/CeIjQOUqDZZJTyixrrlLxul
         LhqwGW0/K2Ben+QGtQSvZ0RmJSvaUZ4Pvlvbdm9gkQqWgz97UQPKJn0sqa6YucoQBo7d
         9Eh83votM3upenmsmnxSChpceiAre5WpN5MKbJXIKsQQnHCiERANnZPdblebHE4nEpi2
         042zygjG3aYnwmMFMJM8y2RmuasPLAFmrFox1ARjSV6n3p9EF0gwzFdTPBnux42K9YxO
         l053PJScRWh2ywnPihRYLPIKomk0WxL2Yc1h1GO31X3PAf3EjLOGmn4UcFao7DdEH5uM
         iRhQ==
X-Gm-Message-State: AOJu0YwW1SnhzFICvSbDLUyUSzL5sxN0wAnlKHFCEOqof/lquJg7EOK3
        i32X9alW7nGws0TSMsp0iFTmcHSyQ+aMxD+cI6iq8Q==
X-Google-Smtp-Source: AGHT+IGHcHrwZNfxOKdf2tsjJKS8zYT08VjF5/gr7zXAHlAkKDYkTuAjyI5dqrEVndNjZDgESvqCukBqG1iovoR8L2s=
X-Received: by 2002:a67:ce9a:0:b0:443:9248:3410 with SMTP id
 c26-20020a67ce9a000000b0044392483410mr5577281vse.32.1692619931538; Mon, 21
 Aug 2023 05:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230818093018.1051434-1-lizetao1@huawei.com> <20230818093018.1051434-8-lizetao1@huawei.com>
In-Reply-To: <20230818093018.1051434-8-lizetao1@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 21 Aug 2023 14:12:00 +0200
Message-ID: <CAMRc=MesfV23yvYoXebuDJXuUxPAV2D8fNQcND0WQxexydgoAQ@mail.gmail.com>
Subject: Re: [PATCH -next 07/11] gpio: mxc: Use helper function devm_clk_get_optional_enabled()
To:     Li Zetao <lizetao1@huawei.com>
Cc:     linus.walleij@linaro.org, andy@kernel.org, j-keerthy@ti.com,
        vz@mleia.com, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, grygorii.strashko@ti.com,
        ssantosh@kernel.org, khilman@kernel.org,
        shubhrajyoti.datta@amd.com, srinivas.neeli@amd.com,
        michal.simek@amd.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
        linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Aug 18, 2023 at 11:30=E2=80=AFAM Li Zetao <lizetao1@huawei.com> wro=
te:
>
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for
> prepared and enabled clocks"), devm_clk_get_optional() and
> clk_prepare_enable() can now be replaced by
> devm_clk_get_optional_enabled() when the driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover,
> it is no longer necessary to unprepare and disable the clocks explicitly.
>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/gpio/gpio-mxc.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 004c6ad7ce52..4cb455b2bdee 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -452,16 +452,10 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)
>                 return port->irq;
>
>         /* the controller clock is optional */
> -       port->clk =3D devm_clk_get_optional(&pdev->dev, NULL);
> +       port->clk =3D devm_clk_get_optional_enabled(&pdev->dev, NULL);
>         if (IS_ERR(port->clk))
>                 return PTR_ERR(port->clk);
>
> -       err =3D clk_prepare_enable(port->clk);
> -       if (err) {
> -               dev_err(&pdev->dev, "Unable to enable clock.\n");
> -               return err;
> -       }
> -
>         if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
>                 port->power_off =3D true;
>
> @@ -535,7 +529,6 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>  out_bgio:
>         pm_runtime_disable(&pdev->dev);
>         pm_runtime_put_noidle(&pdev->dev);
> -       clk_disable_unprepare(port->clk);
>         dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
>         return err;
>  }
> --
> 2.34.1
>

Applied, thanks!

Bart
