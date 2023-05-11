Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB236FFB89
	for <lists+linux-omap@lfdr.de>; Thu, 11 May 2023 22:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239064AbjEKU6A (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 May 2023 16:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238875AbjEKU6A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 11 May 2023 16:58:00 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C12C83F3
        for <linux-omap@vger.kernel.org>; Thu, 11 May 2023 13:57:58 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-559e317eef1so134794337b3.0
        for <linux-omap@vger.kernel.org>; Thu, 11 May 2023 13:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683838677; x=1686430677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz02z/ThyjpX0LKTQ8oYmnrLC6kyoGFXG/YjGLfaNeE=;
        b=tZ27P4Q8s5TUk2UDELLo5fEBRXC4T/qiZk0g7SeiyIRw2ZViuSud3+C9Wd2+ypw92C
         ipih7nmrhqfh8F1sOgdIR5wsckpGjFy5BTuWO4WmDHm1GmVhax4UP3P9nECFvenRxL7r
         IKDPHCltmKrxzo1Zohps7I+QdVIqNTmLzrcNmMGx6SPcoyQ/PiE5W+CCzwXpihymmbR+
         mULEVBiO25de9xqmGMpLsPu5cCHRI0iqEwqSheNg7GzmKktD6iAZ1wHGtdndCbj5Km1T
         pgWUMDhl/Epq+lE7+/Yyiv/hBtjMLy5yNFVJro8YZ0W465DvkfZLH0pUqCkQhax8dM7V
         sz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683838677; x=1686430677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fz02z/ThyjpX0LKTQ8oYmnrLC6kyoGFXG/YjGLfaNeE=;
        b=ZPxpiuoOdYgEjJ+bLBjGaGwB50GD1SByK4Q8IH+SrBs3+jCwNUFcFd3mrHbhNFCnBo
         NP+uHMLXhn2S8+nkrARNn3M2SwqYARk00MhLwf4ZxSrmGVcnXos+9iqhiSgT6j59zlsj
         n0akGpi2GQZjFoxt7691JFbPy0w/rGLea8zOVk6HYwBdEfRTdcH/Kio4ZLryOSRJdxCU
         xthe7BNbFO8tsE9fg2T7KQJlVMUw8cJcso6fMlIK1pL3h+uQxzkLX+Rcjnq8y0wFcPBi
         b76IJmcAjDOBY5HJQW2cdfrXoKIwSArTMj0uwX+G932rJOkAL4lo0M4wiqmvP+tuAogX
         WhiQ==
X-Gm-Message-State: AC+VfDwGPo41h+qX+4Bky2qO7c9khZHjSPrY64/PPBGGqNAD/f+BYRwi
        cONYKwzi50Z1eQiscrebE049E/NT9A0pTCU1En968Q==
X-Google-Smtp-Source: ACHHUZ4527t4XW5ZrevLVhfRzEvrtRLVv8S0pmsldk3mJPQ6idq90TTbYO9n5Ora5okdEVW0uPJHdGrznrGbhWz5ebA=
X-Received: by 2002:a05:6902:702:b0:b9e:5aad:edda with SMTP id
 k2-20020a056902070200b00b9e5aadeddamr24679402ybt.4.1683838677612; Thu, 11 May
 2023 13:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230511-tps65219-add-gpio-support-v2-0-60feb64d649a@baylibre.com>
 <20230511-tps65219-add-gpio-support-v2-1-60feb64d649a@baylibre.com>
In-Reply-To: <20230511-tps65219-add-gpio-support-v2-1-60feb64d649a@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 May 2023 22:57:46 +0200
Message-ID: <CACRpkdbjjoOoGeaqv9yQ4fTKqxt5eLDBjZCnNAYQnng3L+n8TQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: tps65219: add GPIO support for TPS65219 PMIC
To:     Jerome Neanne <jneanne@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Jonathan Cormier <jcormier@criticallink.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 11, 2023 at 4:09=E2=80=AFPM Jerome Neanne <jneanne@baylibre.com=
> wrote:

> Add support for TPS65219 PMICs GPIO interface.
>
> 3 GPIO pins:
> - GPIO0 only is IO but input mode reserved for MULTI_DEVICE_ENABLE usage
> - GPIO1 and GPIO2 are Output only and referred as GPO1 and GPO2 in spec
>
> GPIO0 is statically configured as input or output prior to Linux boot.
> it is used for MULTI_DEVICE_ENABLE function.
> This setting is statically configured by NVM.
> GPIO0 can't be used as a generic GPIO (specification Table 8-34).
> It's either a GPO when MULTI_DEVICE_EN=3D0,
> or a GPI when MULTI_DEVICE_EN=3D1.
>
> Datasheet describes specific usage for non standard GPIO.
> Link: https://www.ti.com/lit/ds/symlink/tps65219.pdf
>
> Co-developed-by: Jonathan Cormier <jcormier@criticallink.com>
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
(...)

This overall looks fine.

> +static int tps65219_gpio_change_direction(struct gpio_chip *gc, unsigned=
 int offset,
> +                                         unsigned int direction)
> +{
> +       struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
> +
> +       /* Documentation is stating that GPIO0 direction must not be chan=
ged in Linux:
> +        * Table 8-34. MFP_1_CONFIG(3): MULTI_DEVICE_ENABLE,
> +        * Should only be changed in INITIALIZE state (prior to ON Reques=
t).
> +        * Set statically by NVM, changing direction in application can c=
ause a hang.
> +        * Below can be used for test purpose only:
> +        */
> +
> +#if 0
> +       int ret =3D regmap_update_bits(gpio->tps->regmap, TPS65219_REG_MF=
P_1_CONFIG,
> +                                TPS65219_GPIO0_DIR_MASK, direction);
> +       if (ret)
> +               return ret;
> +#endif
> +       dev_err(gpio->tps->dev,
> +               "GPIO%d direction set by NVM, change to %u failed, not al=
lowed by specification\n",
> +                offset, direction);
> +       return -EOPNOTSUPP;
> +}

Normally people would complain about #if 0 code.

But this is a special case!

I definitely want the code to be in there somehow.

What about:

if (IS_ENABLED(DEBUG))?

If someone enables debug with an explicit -DDEBUG to the compiler
this could be allowed.

Yours,
Linus Walleij

Yours,
Linus Walleij
