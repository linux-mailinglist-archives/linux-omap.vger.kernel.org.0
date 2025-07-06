Return-Path: <linux-omap+bounces-4044-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3840AF75EC
	for <lists+linux-omap@lfdr.de>; Thu,  3 Jul 2025 15:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1FF8567A5F
	for <lists+linux-omap@lfdr.de>; Thu,  3 Jul 2025 13:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9653D2D5418;
	Thu,  3 Jul 2025 13:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="rVr2eKmr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4959918DB1A
	for <linux-omap@vger.kernel.org>; Thu,  3 Jul 2025 13:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751549959; cv=none; b=hNC4oMaUFSQxTLGDy5hfWUximVls/LXCv7IrQqd0vM73oRe8bhrDUuwJc9K08zlFcMI+rn7Fjh4mXoG4ttr4QgSbpoTUk2B4ByvU3wA4AnQiZ7ND1KdLIuUEYPYOkFBwuqHkpdI0K4APwpkGmI6Q3PR2jwL9AGbPZZGLxyM4/Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751549959; c=relaxed/simple;
	bh=pFgwiDwDqfck5imsX8w+piEd2mdNgYpDTzNlURHjtA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLOFMmxTlakY5TXOnEA/EhGiR/g7Q4SEmStgNFFtKKNG5ysaiL3YHqz4RMBa7bHZQbcs8quk4D0Vt+JeapG1e1rHlNIjsRcTKoOTDjJ0NWtqCpZFc1QxvREwW0VILToS7YFbhpO379/peVl5l4qc2Qk8g9Ddxermn4nFjI7xpWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=rVr2eKmr; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e4b1acf41so46538047b3.3
        for <linux-omap@vger.kernel.org>; Thu, 03 Jul 2025 06:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1751549956; x=1752154756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoZdlknzgmZkUeZ/Yj0fYsZNR/cs4f1zn4gyyLZmstI=;
        b=rVr2eKmrJ/fq5ZDbdhSm/kdpH0BdzVH0mZglXLFHGYR4fpw7mfAacnuYrM7tXgakoK
         14oHfzCLuIdjurl5R9OdwyglHY+mX1Lm2yt3VC+dLLDcuy5yS2fcZoRa62GKxuYzy6r9
         7NblbSqcw3Mi96ogPiGBENamhkwmXN4BLe2X+wRvaciLjlEtm3u5ZRai8qR2y+m5Gqj9
         2mcALAcqzZU8Gf2AXx4gbzlsiPoj+90gbMyDOAPW5We85zZM1e/oUCH8H8Z7bAkCVNVE
         qsYgrl78v4qQPAFu9q0I9N3OCEiiXj1hHRlk93vsmZXKw7P57wTQANNDBniHBjwMwdfF
         lydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751549956; x=1752154756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoZdlknzgmZkUeZ/Yj0fYsZNR/cs4f1zn4gyyLZmstI=;
        b=cajdcBNKeuU3a6nkv8233OdYXnbLD+RJCCmquMJ8SDoGk3SFI3+HQJue0CVjpiRnJc
         PySGI6vWbTyww2ogZSEm8QI8HTmuVhb7kuIIMB+awC5u06nJZxGqZYlpCPneVOC0BMat
         gedXva6VQzIG5OblLv3bi5Wl34x3LJv7plgQfbdocscIFFJOJ/MG0h2V1IOIImDEI0Rr
         yU+MwCL7UnFHCBzz45ajAch31bR1279LpzYCanEJrUu1cIvk19foz+yzBLiwW7Lv6Umz
         47xO9YWS3sZgwYaUiCYzWJHVrTF+RS1D4f34ZRzZ50XyLDe4mY5Ax9j+Cpb4Sv7LdLIR
         HqeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWCYCb68JXP4nRhaWtUgYT7sPakpybEnuleSN5+hF8q3S+X8gOrz0Eq+Qkm50s1k/piY5oaHrAYjc/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi+3rzgiDqGJNRBrBwmuWbNgoS3xDtrFH/U0pSsUpNQzSGdWgU
	N0e36WL1Ln3lY7ilqCfYdB9uuRjYR9pKdbPYfZx5z+2zMulkbifiRe6k/EsPrycDlkwbh6XmH2q
	5W3HlndZTmxEyfz5bRg63VWJvHstRhH66Ph6Av7r7
X-Gm-Gg: ASbGncvdsf8O/a7kGHjAxn2I0ln1ulqgSjet19rlT8SPE2sCCWfLWIusj8OYFlr3Feo
	dxnOpGRx8BJIrA10DYroLXJWIQcpeX74DLsbslYm0hr3jLPD/RBTDKX97RNzUh31SJFWOpS8aUq
	Q5tx0XO6kvGL+KTXriNvZj21sZXDj63FWukswsEnpBAA==
X-Google-Smtp-Source: AGHT+IE0Eg11G3mRDiQaGquoIM3tW8Ia+z8GNMQQUjIYIWmviZI1NXW08jOG1Lg1JWV4tAI871UD2+TTV8cCFLrZP3g=
X-Received: by 2002:a05:690c:6e04:b0:70a:2675:70b3 with SMTP id
 00721157ae682-716590c3752mr45827777b3.17.1751549956178; Thu, 03 Jul 2025
 06:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702164926.2990958-1-s-ramamoorthy@ti.com> <20250702164926.2990958-3-s-ramamoorthy@ti.com>
In-Reply-To: <20250702164926.2990958-3-s-ramamoorthy@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 3 Jul 2025 09:39:04 -0400
X-Gm-Features: Ac12FXxN1yI6o33vFNaWv2nIzzxoRw_PAFp-Q8nD7l0qw27GWLZVuBU0KguP09k
Message-ID: <CADL8D3Z1sAWRV7gqeGKunEo5rXZwiTZOP3BiTtbLiUKRyBY7NQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: tps65219: Add support for TI TPS65214 PMIC
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linus.walleij@linaro.org, brgl@bgdev.pl, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 12:49=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@ti=
.com> wrote:
>
> Add support for the TI TPS65214 PMIC with the addition of an id_table,
> separate TPS65214 template_chip, and device-specific _change_direction
> functions.
>
> - Use platform_get_device_id() to assign dev-specific information.
> - Use different change_direction() functions since TPS65214's GPIO
>   configuration bits are changeable during device operation through bit
>   GPIO_CONFIG in GENERAL_CONFIG register.
> - Remove MODULE_ALIAS since it is now generated by MODULE_DEVICE_TABLE.
>
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>

Reviewed-by: Jonathan Cormier <jcormier@criticallink.com>

Tested on our AM62x platform with TPS65219.  GPIO offsets remained
consistent and functional.
Tested-by: Jonathan Cormier <jcormier@criticallink.com>

> ---
>  drivers/gpio/gpio-tps65219.c | 93 +++++++++++++++++++++++++++++++++---
>  1 file changed, 87 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
> index 3c762103babc..7a62d490ad0a 100644
> --- a/drivers/gpio/gpio-tps65219.c
> +++ b/drivers/gpio/gpio-tps65219.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * GPIO driver for TI TPS65215/TPS65219 PMICs
> + * GPIO driver for TI TPS65214/TPS65215/TPS65219 PMICs
>   *
>   * Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com=
/
>   */
> @@ -13,10 +13,15 @@
>  #include <linux/regmap.h>
>
>  #define TPS65219_GPIO0_DIR_MASK                BIT(3)
> +#define TPS65214_GPIO0_DIR_MASK                BIT(1)
>  #define TPS6521X_GPIO0_OFFSET          2
>  #define TPS6521X_GPIO0_IDX             0
>
>  /*
> + * TPS65214 GPIO mapping
> + * Linux gpio offset 0 -> GPIO (pin16) -> bit_offset 2
> + * Linux gpio offset 1 -> GPO1 (pin9 ) -> bit_offset 0
> + *
>   * TPS65215 & TPS65219 GPIO mapping
>   * Linux gpio offset 0 -> GPIO (pin16) -> bit_offset 2
>   * Linux gpio offset 1 -> GPO1 (pin8 ) -> bit_offset 0
> @@ -24,10 +29,26 @@
>   */
>
>  struct tps65219_gpio {
> +       int (*change_dir)(struct gpio_chip *gc, unsigned int offset, unsi=
gned int dir);
>         struct gpio_chip gpio_chip;
>         struct tps65219 *tps;
>  };
>
> +static int tps65214_gpio_get_direction(struct gpio_chip *gc, unsigned in=
t offset)
> +{
> +       struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
> +       int ret, val;
> +
> +       if (offset !=3D TPS6521X_GPIO0_IDX)
> +               return GPIO_LINE_DIRECTION_OUT;
> +
> +       ret =3D regmap_read(gpio->tps->regmap, TPS65219_REG_GENERAL_CONFI=
G, &val);
> +       if (ret)
> +               return ret;
> +
> +       return !(val & TPS65214_GPIO0_DIR_MASK);
> +}
> +
>  static int tps65219_gpio_get_direction(struct gpio_chip *gc, unsigned in=
t offset)
>  {
>         struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
> @@ -119,6 +140,34 @@ static int tps65219_gpio_change_direction(struct gpi=
o_chip *gc, unsigned int off
>         return -ENOTSUPP;
>  }
>
> +static int tps65214_gpio_change_direction(struct gpio_chip *gc, unsigned=
 int offset,
> +                                         unsigned int direction)
> +{
> +       struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
> +       struct device *dev =3D gpio->tps->dev;
> +       int val, ret;
> +
> +       /* Verified if GPIO or GPO in parent function
> +        * Masked value: 0 =3D GPIO, 1 =3D VSEL
> +        */
> +       ret =3D regmap_read(gpio->tps->regmap, TPS65219_REG_MFP_1_CONFIG,=
 &val);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D !!(val & BIT(TPS65219_GPIO0_DIR_MASK));
> +       if (ret)
> +               dev_err(dev, "GPIO%d configured as VSEL, not GPIO\n", off=
set);
> +
> +       ret =3D regmap_update_bits(gpio->tps->regmap, TPS65219_REG_GENERA=
L_CONFIG,
> +                                TPS65214_GPIO0_DIR_MASK, direction);
> +       if (ret)
> +               dev_err(dev,
> +                       "Fail to change direction to %u for GPIO%d.\n",
> +                       direction, offset);
> +
> +       return ret;
> +}
> +
>  static int tps65219_gpio_direction_input(struct gpio_chip *gc, unsigned =
int offset)
>  {
>         struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
> @@ -132,11 +181,13 @@ static int tps65219_gpio_direction_input(struct gpi=
o_chip *gc, unsigned int offs
>         if (tps65219_gpio_get_direction(gc, offset) =3D=3D GPIO_LINE_DIRE=
CTION_IN)
>                 return 0;
>
> -       return tps65219_gpio_change_direction(gc, offset, GPIO_LINE_DIREC=
TION_IN);
> +       return gpio->change_dir(gc, offset, GPIO_LINE_DIRECTION_IN);
>  }
>
>  static int tps65219_gpio_direction_output(struct gpio_chip *gc, unsigned=
 int offset, int value)
>  {
> +       struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
> +
>         tps65219_gpio_set(gc, offset, value);
>         if (offset !=3D TPS6521X_GPIO0_IDX)
>                 return 0;
> @@ -144,9 +195,22 @@ static int tps65219_gpio_direction_output(struct gpi=
o_chip *gc, unsigned int off
>         if (tps65219_gpio_get_direction(gc, offset) =3D=3D GPIO_LINE_DIRE=
CTION_OUT)
>                 return 0;
>
> -       return tps65219_gpio_change_direction(gc, offset, GPIO_LINE_DIREC=
TION_OUT);
> +       return gpio->change_dir(gc, offset, GPIO_LINE_DIRECTION_OUT);
>  }
>
> +static const struct gpio_chip tps65214_template_chip =3D {
> +       .label                  =3D "tps65214-gpio",
> +       .owner                  =3D THIS_MODULE,
> +       .get_direction          =3D tps65214_gpio_get_direction,
> +       .direction_input        =3D tps65219_gpio_direction_input,
> +       .direction_output       =3D tps65219_gpio_direction_output,
> +       .get                    =3D tps65219_gpio_get,
> +       .set                    =3D tps65219_gpio_set,
> +       .base                   =3D -1,
> +       .ngpio                  =3D 2,
> +       .can_sleep              =3D true,
> +};
> +
>  static const struct gpio_chip tps65219_template_chip =3D {
>         .label                  =3D "tps65219-gpio",
>         .owner                  =3D THIS_MODULE,
> @@ -162,6 +226,7 @@ static const struct gpio_chip tps65219_template_chip =
=3D {
>
>  static int tps65219_gpio_probe(struct platform_device *pdev)
>  {
> +       enum pmic_id chip =3D platform_get_device_id(pdev)->driver_data;
>         struct tps65219 *tps =3D dev_get_drvdata(pdev->dev.parent);
>         struct tps65219_gpio *gpio;
>
> @@ -169,22 +234,38 @@ static int tps65219_gpio_probe(struct platform_devi=
ce *pdev)
>         if (!gpio)
>                 return -ENOMEM;
>
> +       if (chip =3D=3D TPS65214) {
> +               gpio->gpio_chip =3D tps65214_template_chip;
> +               gpio->change_dir =3D tps65214_gpio_change_direction;
> +       } else if (chip =3D=3D TPS65219) {
> +               gpio->gpio_chip =3D tps65219_template_chip;
> +               gpio->change_dir =3D tps65219_gpio_change_direction;
> +       } else {
> +               return -ENODATA;
> +       }
> +
>         gpio->tps =3D tps;
> -       gpio->gpio_chip =3D tps65219_template_chip;
>         gpio->gpio_chip.parent =3D tps->dev;
>
>         return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio)=
;
>  }
>
> +static const struct platform_device_id tps6521x_gpio_id_table[] =3D {
> +       { "tps65214-gpio", TPS65214 },
> +       { "tps65219-gpio", TPS65219 },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, tps6521x_gpio_id_table);
> +
>  static struct platform_driver tps65219_gpio_driver =3D {
>         .driver =3D {
>                 .name =3D "tps65219-gpio",
>         },
>         .probe =3D tps65219_gpio_probe,
> +       .id_table =3D tps6521x_gpio_id_table,
>  };
>  module_platform_driver(tps65219_gpio_driver);
>
> -MODULE_ALIAS("platform:tps65219-gpio");
>  MODULE_AUTHOR("Jonathan Cormier <jcormier@criticallink.com>");
> -MODULE_DESCRIPTION("TPS65215/TPS65219 GPIO driver");
> +MODULE_DESCRIPTION("TPS65214/TPS65215/TPS65219 GPIO driver");
>  MODULE_LICENSE("GPL");
> --
> 2.43.0
>


--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

