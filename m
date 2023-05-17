Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253CA70647E
	for <lists+linux-omap@lfdr.de>; Wed, 17 May 2023 11:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjEQJrr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 05:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjEQJrq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 05:47:46 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13FBA30F8
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 02:47:45 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-453859b6b18so223505e0c.3
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684316864; x=1686908864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukNjPAx9d0iOoRqrYjfOc+/Spp/uHfwiRW0HzoxFUwc=;
        b=34eJpNltFy5r3j7xyweF0m9LhAkBWwY8hKf978OR6oUwTfvXcjvpqgnZ2Ur2j8pthq
         nstsK4huk4yP8jVdO5Rk82lW8hrHBGAkj2Ecq+dliFLMEc8OUrgZ91GV50Fkup3eH70m
         dWi0OCdMMmRiNC3qNtARc2n13Uh70kzKexmsSmsVi2u1ZhGE/pf25PWTzF5ISGAXHj61
         H9PHh3qFoIjIlCwTs/UbeFGzSzJY1V6QorsWRyO6MxLaXqS8mO4L60K9RiH+O1zNpUGB
         D0Mx3mEEnVq/yjnGU89BXJHNdVyW3QWP1meUsYALrec4o93fLRD4CU/4Qwwjt2fPtUgy
         I8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684316864; x=1686908864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukNjPAx9d0iOoRqrYjfOc+/Spp/uHfwiRW0HzoxFUwc=;
        b=U3C0npJQg809EujiJoyGKNytzlMedIu9XlcBBW25Z1qtwpsHukfd8adTEVG4PJFY6u
         8tIxEzbMbiGQyR8QGwFZacDNOA7yx/vEPlyw3kokRJkP3N//PusJbRoWDyro4J6RTJei
         WrWcrxvPkODgz6gsflOVz174gEbAWu0fkAzarU2gRak/RjhL1JwHf8kwVJSqmUmAzKbc
         HIRho5UTFxLcMioBt1VTms3C0o0TUJsSyZzVAXWbJkKzd4eEBjUShEJIv5IrXk/easkl
         jvRg4zF77gRpUd3R9aF/hG1oI+NOGPySCi0fPHmVUBNiCrDa+UKboQt9xLfZ97gP/RK5
         ReMw==
X-Gm-Message-State: AC+VfDw5WuRVWRrbdltguMf5OC3zqZCTGSDkrvLjdpZplCkY3Gf9mlL8
        PvPTRw95tp8Q3PjJ6IJaezuBKgb5xM6Y4w0ZgYCpXg==
X-Google-Smtp-Source: ACHHUZ5r7AzilbbV6CXJQoruBvYwslqsCA+M6kdtvOBrPmxv6yIy2wtEjPw4XGksp8/Y6U1N51Lp6w4Qrx4XoVROyCc=
X-Received: by 2002:a05:6102:519:b0:430:9bc:e82 with SMTP id
 l25-20020a056102051900b0043009bc0e82mr14914119vsa.34.1684316864120; Wed, 17
 May 2023 02:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230504060421.804168-1-andreas@kemnade.info>
In-Reply-To: <20230504060421.804168-1-andreas@kemnade.info>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 17 May 2023 11:47:33 +0200
Message-ID: <CAMRc=Md9VJx9nZEXR9C5MQeo1PE_ugLbhBGjVL4_=pif0ERqJw@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: fix allocation of mixed dynamic/static GPIOs
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     linus.walleij@linaro.org, christophe.leroy@csgroup.eu,
        andy.shevchenko@gmail.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 4, 2023 at 8:04=E2=80=AFAM Andreas Kemnade <andreas@kemnade.inf=
o> wrote:
>
> If static allocation and dynamic allocation GPIOs are present,
> dynamic allocation pollutes the numberspace for static allocation,
> causing static allocation to fail.
> Enforce dynamic allocation above GPIO_DYNAMIC_BASE.
>
> Seen on a GTA04 when omap-gpio (static) and twl-gpio (dynamic)
> raced:
> [some successful registrations of omap_gpio instances]
> [    2.553833] twl4030_gpio twl4030-gpio: gpio (irq 145) chaining IRQs 16=
1..178
> [    2.561401] gpiochip_find_base: found new base at 160
> [    2.564392] gpio gpiochip5: (twl4030): added GPIO chardev (254:5)
> [    2.564544] gpio gpiochip5: registered GPIOs 160 to 177 on twl4030
> [...]
> [    2.692169] omap-gpmc 6e000000.gpmc: GPMC revision 5.0
> [    2.697357] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
> [    2.703643] gpiochip_find_base: found new base at 178
> [    2.704376] gpio gpiochip6: (omap-gpmc): added GPIO chardev (254:6)
> [    2.704589] gpio gpiochip6: registered GPIOs 178 to 181 on omap-gpmc
> [...]
> [    2.840393] gpio gpiochip7: Static allocation of GPIO base is deprecat=
ed, use dynamic allocation.
> [    2.849365] gpio gpiochip7: (gpio-160-191): GPIO integer space overlap=
, cannot add chip
> [    2.857513] gpiochip_add_data_with_key: GPIOs 160..191 (gpio-160-191) =
failed to register, -16
> [    2.866149] omap_gpio 48310000.gpio: error -EBUSY: Could not register =
gpio chip
>
> On that device it is fixed invasively by
> commit 92bf78b33b0b4 ("gpio: omap: use dynamic allocation of base")
> but let's also fix that for devices where there is still
> a mixture of static and dynamic allocation.
>
> Fixes: 7b61212f2a07 ("gpiolib: Get rid of ARCH_NR_GPIOS")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Reviewed-by: <christophe.leroy@csgroup.eu>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
> Changes in V3:
>    typos
>
> Changes in V2:
>    handle also the case of overlapping static allocation
>    across DYNAMIC_BASE
>
>  drivers/gpio/gpiolib.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 19bd23044b017..4472214fcd43a 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -193,6 +193,8 @@ static int gpiochip_find_base(int ngpio)
>                         break;
>                 /* nope, check the space right after the chip */
>                 base =3D gdev->base + gdev->ngpio;
> +               if (base < GPIO_DYNAMIC_BASE)
> +                       base =3D GPIO_DYNAMIC_BASE;
>         }
>
>         if (gpio_is_valid(base)) {
> --
> 2.39.2
>

Queued for fixes, thanks!

Bart
