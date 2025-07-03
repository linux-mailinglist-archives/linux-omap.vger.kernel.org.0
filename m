Return-Path: <linux-omap+bounces-4043-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04447AF75DC
	for <lists+linux-omap@lfdr.de>; Thu,  3 Jul 2025 15:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 016BA565904
	for <lists+linux-omap@lfdr.de>; Thu,  3 Jul 2025 13:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E082D5418;
	Thu,  3 Jul 2025 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="dvjY3Aq+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C023418DB1A
	for <linux-omap@vger.kernel.org>; Thu,  3 Jul 2025 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751549815; cv=none; b=QAOFOFA+GGyn9eyCFJDxVcJPFw2b4v/tAKvGMFGTNcyW56ti//H4k65MVpaO1GtX0DbDdTb/yjxCTnlT96rSFJqkV+seoUbOBPWZQ2LIsdzAp9/izc4PrI6vXxc1bLfBKiLCVPkax5AwRrXZliZcncBiS1AF296UVJja39cN0o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751549815; c=relaxed/simple;
	bh=QcYEbOcAUAAcx49jz95XgHUgtihwpn2gj4zLe9LO+rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n6HLhTgqyypqxcUFYa5BjC3Z+yb5UvYUVY8PFrObYKREZPY09fEtzDGwj41wEG9nElWjzkFcyq015tRPHjsvE1nea13yfgFhnUCNdKRgxRPq6UFYI1vsP4Nxv2Sobk28CvL4r6ECIQ36I8mSZOEc3APF9guCjFrVVTWXJnb5kh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=dvjY3Aq+; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-710e344bbf9so56616477b3.2
        for <linux-omap@vger.kernel.org>; Thu, 03 Jul 2025 06:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1751549812; x=1752154612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Pa1E42imXzEppSh60Pt3n9Kcxaz89TjQ5VMNqR0H6o=;
        b=dvjY3Aq+cTZyKJ3EKDp1GP9oDUfeGQj+CpXt5KBkTsR7P2FM7RwhRQOPigDWeI4jGm
         g9EzF6zH5lMi6G5C4I/8Qw9G2QmLwv1eCBBhC80QtAInD/fsMjhdEAaTll9g7oBb6N07
         4lAGDxOZq5pbXUWnef6VzoHXTwUIfZz9630+8ayxqwBebrE/3dLdYtbyDQNOX7+OsXZa
         nwQrkYdUu6dqzFO55l6hkXHo/8GtsbQP4V7exYJNkJEvi2WbWN+ltSt3F4pQFEsroQdt
         NM55h70YzCGQpYWKuscTyVoe3MeUpyIAq+nPvkdBWB88JCxOK/WvzURc6OfBx77OgoUv
         JlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751549812; x=1752154612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Pa1E42imXzEppSh60Pt3n9Kcxaz89TjQ5VMNqR0H6o=;
        b=LIqFjvauoI6FkYavzGr0ZSk6FA+/Xb1OMi6jupdk3qOAvkIyMUQkOLu+ASCcRUVnbA
         DmKiWsDf7ilTTwWR6c1uRpWw9yO+5NPbfvn55iXKgK9Q3EoMvKBvrJTnLXObvu6RcKUe
         ub6bZnbJ1CaejkliyakJFFIjeacmq9bs/yNDDT45KNSGQgf/DWIx6m3xtOaxHqsjbivM
         uGgjgeFn4xc0uPTcMGiGLSKPsF/SDicW9oFCScpcgXgVmZS+HoGP9Z5XxwwwYhi+flzW
         fD/cxThX/sgoshsgnTzQ1W/Z+YvpsD/Z7b/cD0g6WQvrUf0av4VbuzVvpXMyOWOGlMiM
         mnWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHDRo8MxLcLtE1rQ5XYs6d27X7iXSsU1S+dF989GWk6DEwwcIQMu/FWL1/zSuHnhP2ur5+6RJ6BSbx@vger.kernel.org
X-Gm-Message-State: AOJu0YwQwmGIYCrqi810UEGlW3HupkG5rsANW0VdnoIZOKEak48AuUgA
	OxLj5ZHc7or5HUwTSsPHoL/cDPY3bq4/ha8gbsCd9aRTTyZLCm23Y1QNo9R31nxeSb7o2SLgezs
	RiJkK/jxZICQQtNoOavfaW4qoqE/DUvaFfN3d3mRZ
X-Gm-Gg: ASbGncs1H9LvJ/3g7cJgjCTBANYJugaW+RkXz31pU16bdVnPoujrS8k2bRWSpfTt/pT
	xN9ehAHe2W2pRekXFjxtbfSb8sg7TEOsX0zcqDqpUvI37SmHPu5kjQcREaxBacGcVE5Za7C55z7
	v4jMhmxsFKfiNen2M+sQyuUPHrCsN4pH8TWk4nOa1WvVzyNQHQQ8dy
X-Google-Smtp-Source: AGHT+IFPcRpzmHXQSJxoX3k/ToHbl1IES0n24poBBCf559T3PMHo+hJcvP1KxLowwGhrEZSDnSiIgaoj9AtH399wcQI=
X-Received: by 2002:a05:690c:930f:10b0:70f:84c8:311a with SMTP id
 00721157ae682-7164d26dd0fmr57930917b3.5.1751549812499; Thu, 03 Jul 2025
 06:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702164926.2990958-1-s-ramamoorthy@ti.com> <20250702164926.2990958-2-s-ramamoorthy@ti.com>
In-Reply-To: <20250702164926.2990958-2-s-ramamoorthy@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 3 Jul 2025 09:36:41 -0400
X-Gm-Features: Ac12FXy2zQFI6mRDTso8dA6ZiKpXB6flvP9ZnKFZlc6xV7haoVtmkKufuRBRABQ
Message-ID: <CADL8D3bunxRXvoDOK-y=iy28CLQrfNCvmXarcH_kQO1j=zkm4A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: tps65219: Update _IDX & _OFFSET macro prefix
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
> TPS65215 and TPS65219 are overlapping PMIC devices. While their regulator
> features differe, the GPIO features are the same. In the TPS65219 MFD
> driver, the 2 PMICs share the same "tps65219-gpio" compatible string to
> limit support for TPS65215 in this GPIO driver to comments.
>
> The TPS6521X_GPIO0_IDX and TPS6521X_GPIO0_OFFSET macro name prefixes are
> updated to indicate these macros apply to both PMICs.
>
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Jonathan Cormier <jcormier@criticallink.com>
> ---
>  drivers/gpio/gpio-tps65219.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
> index 526640c39a11..3c762103babc 100644
> --- a/drivers/gpio/gpio-tps65219.c
> +++ b/drivers/gpio/gpio-tps65219.c
> @@ -1,8 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * GPIO driver for TI TPS65219 PMICs
> + * GPIO driver for TI TPS65215/TPS65219 PMICs
>   *
> - * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com=
/
> + * Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com=
/
>   */
>
>  #include <linux/bits.h>
> @@ -13,8 +13,15 @@
>  #include <linux/regmap.h>
>
>  #define TPS65219_GPIO0_DIR_MASK                BIT(3)
> -#define TPS65219_GPIO0_OFFSET          2
> -#define TPS65219_GPIO0_IDX             0
> +#define TPS6521X_GPIO0_OFFSET          2
> +#define TPS6521X_GPIO0_IDX             0
> +
> +/*
> + * TPS65215 & TPS65219 GPIO mapping
> + * Linux gpio offset 0 -> GPIO (pin16) -> bit_offset 2
> + * Linux gpio offset 1 -> GPO1 (pin8 ) -> bit_offset 0
> + * Linux gpio offset 2 -> GPO2 (pin17) -> bit_offset 1
> + */
>
>  struct tps65219_gpio {
>         struct gpio_chip gpio_chip;
> @@ -26,7 +33,7 @@ static int tps65219_gpio_get_direction(struct gpio_chip=
 *gc, unsigned int offset
>         struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
>         int ret, val;
>
> -       if (offset !=3D TPS65219_GPIO0_IDX)
> +       if (offset !=3D TPS6521X_GPIO0_IDX)
>                 return GPIO_LINE_DIRECTION_OUT;
>
>         ret =3D regmap_read(gpio->tps->regmap, TPS65219_REG_MFP_1_CONFIG,=
 &val);
> @@ -42,7 +49,7 @@ static int tps65219_gpio_get(struct gpio_chip *gc, unsi=
gned int offset)
>         struct device *dev =3D gpio->tps->dev;
>         int ret, val;
>
> -       if (offset !=3D TPS65219_GPIO0_IDX) {
> +       if (offset !=3D TPS6521X_GPIO0_IDX) {
>                 dev_err(dev, "GPIO%d is output only, cannot get\n", offse=
t);
>                 return -ENOTSUPP;
>         }
> @@ -71,7 +78,7 @@ static void tps65219_gpio_set(struct gpio_chip *gc, uns=
igned int offset, int val
>         struct device *dev =3D gpio->tps->dev;
>         int v, mask, bit;
>
> -       bit =3D (offset =3D=3D TPS65219_GPIO0_IDX) ? TPS65219_GPIO0_OFFSE=
T : offset - 1;
> +       bit =3D (offset =3D=3D TPS6521X_GPIO0_IDX) ? TPS6521X_GPIO0_OFFSE=
T : offset - 1;
>
>         mask =3D BIT(bit);
>         v =3D value ? mask : 0;
> @@ -117,7 +124,7 @@ static int tps65219_gpio_direction_input(struct gpio_=
chip *gc, unsigned int offs
>         struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
>         struct device *dev =3D gpio->tps->dev;
>
> -       if (offset !=3D TPS65219_GPIO0_IDX) {
> +       if (offset !=3D TPS6521X_GPIO0_IDX) {
>                 dev_err(dev, "GPIO%d is output only, cannot change to inp=
ut\n", offset);
>                 return -ENOTSUPP;
>         }
> @@ -131,7 +138,7 @@ static int tps65219_gpio_direction_input(struct gpio_=
chip *gc, unsigned int offs
>  static int tps65219_gpio_direction_output(struct gpio_chip *gc, unsigned=
 int offset, int value)
>  {
>         tps65219_gpio_set(gc, offset, value);
> -       if (offset !=3D TPS65219_GPIO0_IDX)
> +       if (offset !=3D TPS6521X_GPIO0_IDX)
>                 return 0;
>
>         if (tps65219_gpio_get_direction(gc, offset) =3D=3D GPIO_LINE_DIRE=
CTION_OUT)
> @@ -179,5 +186,5 @@ module_platform_driver(tps65219_gpio_driver);
>
>  MODULE_ALIAS("platform:tps65219-gpio");
>  MODULE_AUTHOR("Jonathan Cormier <jcormier@criticallink.com>");
> -MODULE_DESCRIPTION("TPS65219 GPIO driver");
> +MODULE_DESCRIPTION("TPS65215/TPS65219 GPIO driver");
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

