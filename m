Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10C45767FDA
	for <lists+linux-omap@lfdr.de>; Sat, 29 Jul 2023 15:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbjG2N7F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 29 Jul 2023 09:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbjG2N7D (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 29 Jul 2023 09:59:03 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4911980
        for <linux-omap@vger.kernel.org>; Sat, 29 Jul 2023 06:59:02 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4866be648ffso984019e0c.2
        for <linux-omap@vger.kernel.org>; Sat, 29 Jul 2023 06:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690639141; x=1691243941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pKQ5uDa7ZswByLDltZ/DIqkWaRF0i1kVyEyWDjv/VM=;
        b=oKM4pjutzQ1oJ9k2sA0kxxXX5BtM9MULRtW/njEpiRaLkqO72uWbDJoVhfgA9FW7kZ
         YhPoljgXRkyrGtqw0i+zK5aMRUhxQYSmA2Vw9byp0dpNPpFLhGBk0DEJ0ub9LwFl+GTG
         CfAIKi1q5VuC7v7eyoLIyxRqLFMkp6FKx4U6JCwUY4fB/hVP0noFtFKrUUwuiTUR7Lyw
         8YleX/jDisN5fIEZG+s8TtyI0X1DmuBKOeV4iC/6xJ3ku1Pu8dGUo5zgCd0mJKJxYQCo
         sQjalSpRCl8CJv7e7PO49IAMvl5gzdnR8STYH7imaoFmx1wDeuK9ffn+1Y6Mf5YrXYq9
         uoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690639141; x=1691243941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pKQ5uDa7ZswByLDltZ/DIqkWaRF0i1kVyEyWDjv/VM=;
        b=ajuVAVW3dNQIaVBCppqM+pn50lgR0dA/Ag3sRKoFuNKSC3OQnyqFkZjqjH+UUElG3Q
         Uctzhg1XbPf9BxKRMIMCOcIkuhxWmn2brAynCYIlCQRJiyRJ8OYOFGgQb8s08KBU0uDM
         4z/4HIq8A8n2HD4WP9y+sNqtzzeSx70Kl4OwHpRaEyAVFT1V3x4EyuPZp82I7Scck/U3
         4WZceuaoAn3EA0C6Dnityz3p1Hm2S79VKuJ1LjCC4q/koUlbfIPUz9N3ZlTA4z290CTU
         +3QSsDFsEaX1gmGHwdkbqDXOrTjVBt3tRjv+FitSAZnpgpRCErCe+hX0+SP6Jhh21hCo
         UtOQ==
X-Gm-Message-State: ABy/qLbChqYCxGgocMKKTjaRBQ/UxEES0ykNhQ+I/uRfvWEQa0zCEO2T
        I49oKPwJ+MpiGS5tfULiqdGcIy3D4eXIkdhKg+Flbn+p4arxmOGZz5g=
X-Google-Smtp-Source: APBJJlHRY5Z/K7f4tQSecZOnTxmIXQ3MC1aWdGPujOI/R/apUpaNRiVsv0Mo/iodDKNjhZTlBABKxSaK/fRp1bmdRwA=
X-Received: by 2002:a1f:c404:0:b0:486:4b43:b94a with SMTP id
 u4-20020a1fc404000000b004864b43b94amr3567714vkf.6.1690639141691; Sat, 29 Jul
 2023 06:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230727115726.2666041-1-ruanjinjie@huawei.com>
In-Reply-To: <20230727115726.2666041-1-ruanjinjie@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 29 Jul 2023 15:58:50 +0200
Message-ID: <CAMRc=MemnFPB3Q96jFRTb5_anJG+iU0hNPUYAK8OFvJ_-1Tr8Q@mail.gmail.com>
Subject: Re: [PATCH -next v2] gpio: davinci: Remove redundant dev_err_probe()
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     j-keerthy@ti.com, linus.walleij@linaro.org, andy@kernel.org,
        grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 27, 2023 at 1:58=E2=80=AFPM Ruan Jinjie <ruanjinjie@huawei.com>=
 wrote:
>
> There is no need to call the dev_err_probe() function directly to print
> a custom message when handling an error from platform_get_irq() function =
as
> it is going to display an appropriate error message in case of a failure.
>
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> ---
> v2:
> - split into 2 patches on per-driver basis
> ---
>  drivers/gpio/gpio-davinci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index fff510d86e31..8db5717bdabe 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -236,7 +236,7 @@ static int davinci_gpio_probe(struct platform_device =
*pdev)
>         for (i =3D 0; i < nirq; i++) {
>                 chips->irqs[i] =3D platform_get_irq(pdev, i);
>                 if (chips->irqs[i] < 0)
> -                       return dev_err_probe(dev, chips->irqs[i], "IRQ no=
t populated\n");
> +                       return chips->irqs[i];
>         }
>
>         chips->chip.label =3D dev_name(dev);
> --
> 2.34.1
>

Applied, thanks!

Bartosz
