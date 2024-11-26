Return-Path: <linux-omap+bounces-2732-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B5A9D9E6E
	for <lists+linux-omap@lfdr.de>; Tue, 26 Nov 2024 21:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DBAAB24B0A
	for <lists+linux-omap@lfdr.de>; Tue, 26 Nov 2024 20:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DC21DED7F;
	Tue, 26 Nov 2024 20:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xXv/rkjI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8C48831
	for <linux-omap@vger.kernel.org>; Tue, 26 Nov 2024 20:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732653470; cv=none; b=U/eiYcvHuHmW2K0Qbs+xs6L/5MlxFoH7dxjHXxK/5aO9RZ3FD+swW0Tb9dByoajwdpUYHZ7vPDnANuu23pDGLqzXdvVUHpNucD1xggKL3ErvQyxetKaG6l37ISVA2Ql8JjyXSycogc+5Arf27OEkFJUDkIrex/HulVK+TfFD+gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732653470; c=relaxed/simple;
	bh=gzhq4ilM7xN7prkyZTKgjVhpZmSHKljfQPpJ89u0Pyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OaAcL6YGqtPCZeA6/jAl532XyHe/hTWgYxbPaR4ES2vQD0p+rL/T3LPxNPN4RE417r//MdCQ/vvwGfqa8nvgBKlCRBA1/1RqY06R07iCDA2LX/PunymbxlAD/fb3SMCSsCneD1vJsDBqS01bgSsEbXWPoSqjAVI8/enhysSs26Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xXv/rkjI; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53de8ecafeeso1369053e87.1
        for <linux-omap@vger.kernel.org>; Tue, 26 Nov 2024 12:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732653466; x=1733258266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQ4t32M7ZLI4FzUfwQOyTzpokW/diWfMjxkLkUMro8Y=;
        b=xXv/rkjI07kLV8yGxkoG5A0VB7XO+FgkQZL30zakKeXdGczTOopstzyLABzdvjCaTj
         V4GtAJUKR21wBDaqZoAetmYJ6dD2W10MRUqC+QM34BBahjsGXol+ONS4D7MC7tk4QMYG
         AYAPv7anitqT/04lTEao+MF1PLJyU5bol2gUAU2dJghDNS657C0rm8+JeiyEoH7WfpBh
         AJKKTepw6hA16krOm8EyjPokEC/AdFTt4azxw4pysz7SHzvKpu7P00FaLxehTM2sXFZ6
         dD6IBDK4bXbRBtRRU5ShZsW+bitAlR2EcI8bk2Bw2DGro4kkUqN+MYiKG43KWa80HKu4
         vAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732653466; x=1733258266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQ4t32M7ZLI4FzUfwQOyTzpokW/diWfMjxkLkUMro8Y=;
        b=v0pAG/1Gm4Srkq9HoejHiteCO7geOMjvlDHmi2pK77iA2NylHeMO75WQC6mYkD6M13
         gv1KlX8xWDCZSD1TQoesOe0HhibsdoeJw6LC3QTaSGKsU2c31GoOusnTA2T4JQvglwtc
         Eb/B6nYoYA+bW3pwaj5zlg0+IGo/ThLLHNAdPZ95GVolJKh0Vtft9FL6sHqH/5t42tBI
         lFuDm/Q7ooPD1cjaKfElEqMszxd0mEjMqEbD1dCQuLsNnc3x1E9cHVfO/1BCHGBeb9dD
         WqWhib3jkG0JaVHw32j6+WzsdCVgzG65syt0r01+YMo24Y2APJUnEiX5IvgAql9eWATA
         0Tjg==
X-Forwarded-Encrypted: i=1; AJvYcCWb7PsNinOAfm0Y1cI71SNdGn4DuF9Fut2Uj8k6x70gl4Y9BdQvFyHAtfIQaxVwV0eNGZKLK8Nf9sQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YwTDSxpe2MyTt/Ph3vBZfHUp66/cPqg3K72U3Iys2CIsT4kMVd2
	aPjhLVRb8vpMUjCU5CCBqQbYmragribDBwiCvmGe2TuFad7MjetKqBVjyVDKAIKxiC8KbNQJhkd
	ac+EC7JcGCGsxgAz9aOXG4MF8OvR94DTXGZO1Hw==
X-Gm-Gg: ASbGncvi9I36q31dKbNve9+oL5Oi8sNPDFno4G6cAgxYSRKgCiC/rGf+UsyMWftBlKk
	NIqFolWeiYMtglOqNQbSCDYACsY4ypRy4R8c6GlH9R6B0aTeTUiQh9IYQvLPDPT0=
X-Google-Smtp-Source: AGHT+IGtNEUmmvQvrgJEmVFBB9IHb0jzO2pINcF0Q83qO5PrA2QFYfRJPml54xlqW0P5qIpEu4IPZAkb7Kbr7kN0zOA=
X-Received: by 2002:a05:6512:3b08:b0:539:e2cc:d380 with SMTP id
 2adb3069b0e04-53df00d9559mr192239e87.27.1732653466233; Tue, 26 Nov 2024
 12:37:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241125080530.777123-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20241125080530.777123-1-alexander.sverdlin@siemens.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Nov 2024 21:37:35 +0100
Message-ID: <CAMRc=Md03oSc6jkib=g9B7C51i4aAD6LdXGHsmXuRxB7VjDxaA@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: Silence lockdep "Invalid wait context"
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-gpio@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-omap@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 9:05=E2=80=AFAM A. Sverdlin
<alexander.sverdlin@siemens.com> wrote:
>
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> The problem apparetly has been known since the conversion to
> raw_spin_lock() (commit 4dbada2be460
> ("gpio: omap: use raw locks for locking")).
>
> Symptom:
>
> [ BUG: Invalid wait context ]
> 5.10.214
> -----------------------------
> swapper/1 is trying to lock:
> (enable_lock){....}-{3:3}, at: clk_enable_lock
> other info that might help us debug this:
> context-{5:5}
> 2 locks held by swapper/1:
>  #0: (&dev->mutex){....}-{4:4}, at: device_driver_attach
>  #1: (&bank->lock){....}-{2:2}, at: omap_gpio_set_config
> stack backtrace:
> CPU: 0 PID: 1 Comm: swapper Not tainted 5.10.214
> Hardware name: Generic AM33XX (Flattened Device Tree)
> unwind_backtrace
> show_stack
> __lock_acquire
> lock_acquire.part.0
> _raw_spin_lock_irqsave
> clk_enable_lock
> clk_enable
> omap_gpio_set_config
> gpio_keys_setup_key
> gpio_keys_probe
> platform_drv_probe
> really_probe
> driver_probe_device
> device_driver_attach
> __driver_attach
> bus_for_each_dev
> bus_add_driver
> driver_register
> do_one_initcall
> do_initcalls
> kernel_init_freeable
> kernel_init
>
> Problematic spin_lock_irqsave(&enable_lock, ...) is being called by
> clk_enable()/clk_disable() in omap2_set_gpio_debounce() and
> omap_clear_gpio_debounce().
>
> For omap2_set_gpio_debounce() it's possible to move
> raw_spin_lock_irqsave(&bank->lock, ...) inside omap2_set_gpio_debounce()
> so that the locks nest as follows:
>
>   clk_enable(bank->dbck)
>   raw_spin_lock_irqsave(&bank->lock, ...)
>   raw_spin_unlock_irqrestore()
>   clk_disable()
>
> Two call-sites of omap_clear_gpio_debounce() are more convoluted, but one
> can take the advantage of the nesting nature of clk_enable()/clk_disable(=
),
> so that the inner clk_disable() becomes lockless:
>
>   clk_enable(bank->dbck)                <-- only to clk_enable_lock()
>   raw_spin_lock_irqsave(&bank->lock, ...)
>   omap_clear_gpio_debounce()
>     clk_disable()                       <-- becomes lockless
>   raw_spin_unlock_irqrestore()
>   clk_disable()
>
> Cc: stable@vger.kernel.org
> Fixes: 4dbada2be460 ("gpio: omap: use raw locks for locking")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>  drivers/gpio/gpio-omap.c | 35 ++++++++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index 7ad4534054962..f9e502aa57753 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -181,6 +181,7 @@ static inline void omap_gpio_dbck_disable(struct gpio=
_bank *bank)
>  static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offs=
et,
>                                    unsigned debounce)
>  {
> +       unsigned long           flags;
>         u32                     val;
>         u32                     l;
>         bool                    enable =3D !!debounce;
> @@ -196,13 +197,18 @@ static int omap2_set_gpio_debounce(struct gpio_bank=
 *bank, unsigned offset,
>
>         l =3D BIT(offset);
>
> +       /*
> +        * Ordering is important here: clk_enable() calls spin_lock_irqsa=
ve(),
> +        * therefore it must be outside of the following raw_spin_lock_ir=
qsave()
> +        */
>         clk_enable(bank->dbck);
> +       raw_spin_lock_irqsave(&bank->lock, flags);
> +
>         writel_relaxed(debounce, bank->base + bank->regs->debounce);
>
>         val =3D omap_gpio_rmw(bank->base + bank->regs->debounce_en, l, en=
able);
>         bank->dbck_enable_mask =3D val;
>
> -       clk_disable(bank->dbck);
>         /*
>          * Enable debounce clock per module.
>          * This call is mandatory because in omap_gpio_request() when
> @@ -217,6 +223,9 @@ static int omap2_set_gpio_debounce(struct gpio_bank *=
bank, unsigned offset,
>                 bank->context.debounce_en =3D val;
>         }
>
> +       raw_spin_unlock_irqrestore(&bank->lock, flags);
> +       clk_disable(bank->dbck);
> +

This part looks pretty clear to me.

>         return 0;
>  }
>
> @@ -647,6 +656,13 @@ static void omap_gpio_irq_shutdown(struct irq_data *=
d)
>         unsigned long flags;
>         unsigned offset =3D d->hwirq;
>
> +       /*
> +        * Enable the clock here so that the nested clk_disable() in the
> +        * following omap_clear_gpio_debounce() is lockless
> +        */
> +       if (bank->dbck_flag)
> +               clk_enable(bank->dbck);
> +

But this looks like a functional change. You effectively bump the
clock enable count but don't add a corresponding clk_disable() in the
affected path. Is the clock ever actually disabled then?

Am I not getting something?

Bart

>         raw_spin_lock_irqsave(&bank->lock, flags);
>         bank->irq_usage &=3D ~(BIT(offset));
>         omap_set_gpio_triggering(bank, offset, IRQ_TYPE_NONE);
> @@ -656,6 +672,9 @@ static void omap_gpio_irq_shutdown(struct irq_data *d=
)
>                 omap_clear_gpio_debounce(bank, offset);
>         omap_disable_gpio_module(bank, offset);
>         raw_spin_unlock_irqrestore(&bank->lock, flags);
> +
> +       if (bank->dbck_flag)
> +               clk_disable(bank->dbck);
>  }
>
>  static void omap_gpio_irq_bus_lock(struct irq_data *data)
> @@ -827,6 +846,13 @@ static void omap_gpio_free(struct gpio_chip *chip, u=
nsigned offset)
>         struct gpio_bank *bank =3D gpiochip_get_data(chip);
>         unsigned long flags;
>
> +       /*
> +        * Enable the clock here so that the nested clk_disable() in the
> +        * following omap_clear_gpio_debounce() is lockless
> +        */
> +       if (bank->dbck_flag)
> +               clk_enable(bank->dbck);
> +
>         raw_spin_lock_irqsave(&bank->lock, flags);
>         bank->mod_usage &=3D ~(BIT(offset));
>         if (!LINE_USED(bank->irq_usage, offset)) {
> @@ -836,6 +862,9 @@ static void omap_gpio_free(struct gpio_chip *chip, un=
signed offset)
>         omap_disable_gpio_module(bank, offset);
>         raw_spin_unlock_irqrestore(&bank->lock, flags);
>
> +       if (bank->dbck_flag)
> +               clk_disable(bank->dbck);
> +
>         pm_runtime_put(chip->parent);
>  }
>
> @@ -913,15 +942,11 @@ static int omap_gpio_debounce(struct gpio_chip *chi=
p, unsigned offset,
>                               unsigned debounce)
>  {
>         struct gpio_bank *bank;
> -       unsigned long flags;
>         int ret;
>
>         bank =3D gpiochip_get_data(chip);
>
> -       raw_spin_lock_irqsave(&bank->lock, flags);
>         ret =3D omap2_set_gpio_debounce(bank, offset, debounce);
> -       raw_spin_unlock_irqrestore(&bank->lock, flags);
> -
>         if (ret)
>                 dev_info(chip->parent,
>                          "Could not set line %u debounce to %u microsecon=
ds (%d)",
> --
> 2.47.0
>

