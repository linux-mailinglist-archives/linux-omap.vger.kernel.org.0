Return-Path: <linux-omap+bounces-2769-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDD39E2E74
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 22:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C97AB45B64
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 20:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B17D208990;
	Tue,  3 Dec 2024 20:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0crTEutL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EC1189F56
	for <linux-omap@vger.kernel.org>; Tue,  3 Dec 2024 20:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733258197; cv=none; b=G6DaPsUydEj0bWnomwJqjYduvYIh3HNBhMLrPbVRu1W8iBHarvQmfEeFUoy9rqtRHGuqHfhJyaHGYYtqiV28YKzKL5UknpeDUth+/tLJ+MiU9RZQ0aW/COpABHyTFPBoXN/S4PAFTwPBGgWnmpB1xEeiXMa0eFWLS6ch+5QWhW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733258197; c=relaxed/simple;
	bh=QXiY9wlQDTfv2r6SXwdbtfGBrrPbZQtGf2mESKg2h3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LCpUZegWeyvgWc7CfYIqwfLPR5qrAfsE4zgQ2YJAPPnMG3QT41PYBIXSxXpdfDICfPbnU6kW3clqYFQo7VQL9rqXU46xr7m7efCczBkuKN6ArPm1yhMubXGS3iCrRu76b70fKZFjS8AXvqh36qX2hC8Wxq5z5Jabm8R/ZE3vtWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0crTEutL; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53dd668c5easo206183e87.1
        for <linux-omap@vger.kernel.org>; Tue, 03 Dec 2024 12:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733258193; x=1733862993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa9RpnKEiAEb345qyNd4ttye0dPD2P0U26CPhxLTwvc=;
        b=0crTEutLtBqBaWRpl024fndkbwQ+2RODNRscfXx35dXw+oXj/qbjTHjHTNxJNoS4ZO
         W75kdQM1AHdzASfA709BVQpcXxtuTTIHELWxd0nYsIwUEyIggk/yUEPolRN3+hveL/Jv
         IGQApW2Z/ES7UORtEWE979mZiFLTDeuIapCe1zma1xhcAWfDZKS+fUGzgbtuwiDgWSdG
         NKAiT9IEPMY1kyL07N8EJDo4+Z5sgwjmRKE9L8MR/1AaJvneegG6M5lNskNrZGoljF4i
         qqCnJeqcC3tBYvwdNCHChXVi96DSp26IGVHUavsB0iLywEQdC+oajjsavlG7mtqOopPV
         N/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733258193; x=1733862993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pa9RpnKEiAEb345qyNd4ttye0dPD2P0U26CPhxLTwvc=;
        b=AMQ/yRJ4nmY4iJbjH6G5eu0AfLAd9/w8Wt7PLT3EMkbQpOiyx1/HiLptVdTmWPknM8
         pAofDsaf0KYiO0cVrXvJH32Zqa0tsLShnSjEReAVr5xF2OXOKFYxCPF91CpbgYsWaMb+
         kHEGbecDwbqhX7G7KrgA9DWtvJsO3PE+/T1cqGguqAar5smaSqWUomsa3ikf5cufr2Br
         +xa4TYQyLqGeFhjJ0a7aXWTqh5vCu+9qYkCrSOdVdBXTmO+qtI+ppM9MVhbzEil3lzfx
         ZRMNvnAqH4Tijjch0Qztj1URXB7Q0cdgfgqwZ2QV44PmfDBRO7WwdG8rIzDFf29bQKZ6
         olNg==
X-Forwarded-Encrypted: i=1; AJvYcCWNYTtx7O4ZkrYXfXvUQHit/rQKuDyCVmd7CYbst8JDIBdQq3l18pSgqrxuv8n/euODbsk3q5NfxFby@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ZcB5TfGNLqjZUFxcoiPPOTINAoyih30Dwm2jkVUyCWUCqrjh
	DHwKbuzW6cXVk3GTxnqSjBUu8gsogcaqQhHzUBsWtDFk70P5kmIrtqvy1O6t+WGlmlJcyWpqrLB
	IIsFBunqEmTHxpC67QvUmy25oNZoZlXXhrYXFRg==
X-Gm-Gg: ASbGncsI4GlH+8HEu3Ux6JU0MdSL8XB0oCrnOMKTd1vMNonKVwktEok9Bwa5+/CrZBy
	R6VfZ6nLBPMWps7otZlUS0JSd6MhLnkU=
X-Google-Smtp-Source: AGHT+IF6YBoTwuBdgOpOWSXBiCbuv39rcLfGYwu6MbkSKePQciRdJZe7vgR4xcYOBqeUDoPaXH34OpbnkcC3pC4LtKo=
X-Received: by 2002:a05:6512:e8a:b0:53d:f3af:748d with SMTP id
 2adb3069b0e04-53e12da8bffmr1452545e87.4.1733258192614; Tue, 03 Dec 2024
 12:36:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203164143.29852-1-brgl@bgdev.pl> <213de4bc-3706-4bb0-a827-06c63bfe0294@ti.com>
In-Reply-To: <213de4bc-3706-4bb0-a827-06c63bfe0294@ti.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Dec 2024 21:36:20 +0100
Message-ID: <CAMRc=Md_u3YmseW5kV5VH4F99_0P=tc4pWty_fB3dVfv_JDxWQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: omap: allow building the module with COMPILE_TEST=y
To: Andrew Davis <afd@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 7:41=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> On 12/3/24 10:41 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > For better build coverage, allow building the gpio-omap driver with
> > COMPILE_TEST Kconfig option enabled.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   drivers/gpio/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 56fee58e281e7..fb923ccd79028 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -530,7 +530,7 @@ config GPIO_OCTEON
> >   config GPIO_OMAP
> >       tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
> >       default y if ARCH_OMAP
> > -     depends on ARM
> > +     depends on ARM || COMPILE_TEST
>
> Why do we have this depends on ARM at all? It already has that condition
> above on ARCH_OMAP2PLUS which limits to ARM outside of compile testing.
>
> And anything that selects ARCH_OMAP2PLUS also selects ARCH_OMAP, so we
> could just do this:
>

I agree we can drop that bit.

> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -528,9 +528,9 @@ config GPIO_OCTEON
>            family of SOCs.
>
>   config GPIO_OMAP
> -       tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
> -       default y if ARCH_OMAP
> -       depends on ARM
> +       tristate "TI OMAP GPIO support"
> +       default y
> +       depends on ARCH_OMAP2PLUS || COMPILE_TEST

This would default to y with COMPILE_TEST. We definitely don't want
that. IMO it should be:

tristate "TI OMAP GPIO support"
depends on ARCH_OMAP2PLUS || COMPILE_TEST
default y if ARCH_OMAP2PLUS

Bartosz

