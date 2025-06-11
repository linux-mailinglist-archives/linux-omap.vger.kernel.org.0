Return-Path: <linux-omap+bounces-3830-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D0CAD6257
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 00:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6237917F28B
	for <lists+linux-omap@lfdr.de>; Wed, 11 Jun 2025 22:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9548624A06B;
	Wed, 11 Jun 2025 22:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="CQP/2RSc"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F43185B61
	for <linux-omap@vger.kernel.org>; Wed, 11 Jun 2025 22:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749680533; cv=none; b=fDA0vbv2tPAWZC+kyS80LyoNkXzAtYRW77zDp5CGsdtGWD+ahYPbvYs3w3xGn9Mo7As0qv0Dc6IECgax250jcVYm9Q6Xl+K3AKll9LVHmL6eVGsdYSQgooG5UnOL2/fMjQ9t4zs8kwrsieos4rY/+ES0V+gLYvSowrEE/EK334w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749680533; c=relaxed/simple;
	bh=J1+vvNnJkt9XAUeHMDEtolpBQ4940dsHU+99an2m8Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXJfkp1xD6jpeLrWjUsRH/45scDBqSJz6q7Y1qd1Ov2/HfLwRcPAmwr+h0H1VOy+zHNbBvDBCFMFQ0qul8hgehbva9bby/l9Gbw+0qTM9KD9+MQfxJQwlI8fgoHU7J3RCOypIF6nHiDwZvqu8SLUcuWuAtIdzkq0u7LN68r1Cak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=CQP/2RSc; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74800b81f1bso357342b3a.1
        for <linux-omap@vger.kernel.org>; Wed, 11 Jun 2025 15:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1749680530; x=1750285330; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=;
        b=CQP/2RSc3bQlG/mG3+ynatwTRxaQ9ozhRhvIv+554F43gDqqnvygxACE//ULcgIXrs
         pM3lyLmbkMGmSZJMn0w43OQL17SsaNEQ8hUTYTVK25caPy9a1ONqCjZwvy/nItNeS2u1
         ZRtpmC7WPYFt1+UYUFPejvvseu0dro91N8WrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749680530; x=1750285330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=;
        b=RlgLbv+Bly1TXsib0UL8pObkOX29ooOhR1ldu1rkk7CCrfEk5oHfJe/VJv1vLAaC0U
         sB1OdgTekpHzqkc5gap2U8gGKRpZncp4t4k/gm5xJcS+b1dHgVOEdJ9V/wPEzrVJXw4q
         ffXA19gup+1Tr7Llo9Jdvm6xExcPXeV6opaM/KRaoBwZwdIqmWQ2BrCvaNc3/2ovTHuU
         iImFjQHCWYPpthlJtBph4ct9S1NhtphAwXU0W+eC67mcyZySO2ZC37Eg/4DlKTSg6Xmv
         6Esanh6WtFIxA2EMjSeH8iuuAiY+hJ7F7Iq5wOnHg1VK4WUPTvIazgxcZbHkC1syf0Ea
         jMyg==
X-Forwarded-Encrypted: i=1; AJvYcCWU7KFBDqi9nZr3qKqWsajEX6XGTKaGESiDXX0XdYvBxYhUC5sXGv7uJU/8FwWN1dKa1PGY0IuePT9f@vger.kernel.org
X-Gm-Message-State: AOJu0YzKPCOuMfBoeKUuvxpaSFFMe7H03G2C1dn5Whw/25ZDsVIsyU/h
	mCUZMWihTLGnpZjSMSl4LYDZeORcHeYXdNvSizPjsVy4Q7uQv3ouQipi3BowHoJrPuOtIGPxB6/
	GmG5+eYgjydGxFaUQ2m3WY2qfm5a4tjjlgDIgULoHtA==
X-Gm-Gg: ASbGncsbn6MBphznv6ZMIX2sf6dpBPYJ4p5zjxgjgQQpCJXagp6qADWxh6QYarxxqkX
	jvz6PSLT/lRu+IZ1jQN00K0PMdlS5QIojFhkeqJlds3lit30Je26BxIgqd1LQQ7Dl2S6JNVrVTs
	fpswBymzsiDFPCVvz6608k8pbUoFxJfzmxIc04U73Pl6H55VROJ1GHOqff4x1L2gB/e408RfcXV
	1TB
X-Google-Smtp-Source: AGHT+IE8FknUC40PscBGYY7OPNelZLLkTFE7qxHwumbpWqTQtgyRPt7nCSuQoA+6xvyngwoaYT3v2ByQ5TtYzKrW9d8=
X-Received: by 2002:a17:90b:2892:b0:312:26d9:d5b6 with SMTP id
 98e67ed59e1d1-313bfba12a1mr1389789a91.3.1749680529907; Wed, 11 Jun 2025
 15:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Thu, 12 Jun 2025 07:21:56 +0900
X-Gm-Features: AX0GCFuAPMzR2tj8IuIF1_MflSdk31p_mu_qD7qQzgmBFTWEvU6XX8YEN4mo1dI
Message-ID: <CAFr9PXmeYETV5FSAnEacFCo7LiS3cYBpPqraexLC7=MTzshfNg@mail.gmail.com>
Subject: Re: [PATCH 07/12] gpio: msc313: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Romain Perier <romain.perier@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Tue, 10 Jun 2025 at 21:33, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-msc313.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
> index 6db9e469e0dc254e791d497b89a4c6d329d0add4..992339a89d19840fc03ccf849972a83cb86415ae 100644
> --- a/drivers/gpio/gpio-msc313.c
> +++ b/drivers/gpio/gpio-msc313.c
> @@ -486,7 +486,7 @@ struct msc313_gpio {
>         u8 *saved;
>  };
>
> -static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>  {
>         struct msc313_gpio *gpio = gpiochip_get_data(chip);
>         u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> @@ -497,6 +497,8 @@ static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
>                 gpioreg &= ~MSC313_GPIO_OUT;
>
>         writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
> +
> +       return 0;
>  }
>
>  static int msc313_gpio_get(struct gpio_chip *chip, unsigned int offset)
> @@ -656,7 +658,7 @@ static int msc313_gpio_probe(struct platform_device *pdev)
>         gpiochip->direction_input = msc313_gpio_direction_input;
>         gpiochip->direction_output = msc313_gpio_direction_output;
>         gpiochip->get = msc313_gpio_get;
> -       gpiochip->set = msc313_gpio_set;
> +       gpiochip->set_rv = msc313_gpio_set;
>         gpiochip->base = -1;
>         gpiochip->ngpio = gpio->gpio_data->num;
>         gpiochip->names = gpio->gpio_data->names;
>
> --
> 2.48.1
>

Reviewed-by: Daniel Palmer <daniel@thingy.jp>

Cheers,

Daniel

