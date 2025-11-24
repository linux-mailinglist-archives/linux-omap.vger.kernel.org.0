Return-Path: <linux-omap+bounces-5031-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 45704C80DA4
	for <lists+linux-omap@lfdr.de>; Mon, 24 Nov 2025 14:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 361534E1880
	for <lists+linux-omap@lfdr.de>; Mon, 24 Nov 2025 13:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B93C30B53C;
	Mon, 24 Nov 2025 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNM8p1oq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E0D13790B
	for <linux-omap@vger.kernel.org>; Mon, 24 Nov 2025 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763992368; cv=none; b=maz3GTttg+JvQOpkX++AnoQHI/Kj0ojr1IbLntKlwYqLSOzYBBcIxdDto27+7+0MBPmBIpl6pyCq0j3l31rrBon6wQqkQgb5m40OHsH6PBWjCqIpyuHETyPWmyN5vG0Ad+0IRk7ftG3OFdBIHHRXJyh9Qegr9tiaz89bwEgfA5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763992368; c=relaxed/simple;
	bh=Grxi1FitEaNf298AS64XP+HFPYh/D2UTvN2jgca86T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+sWwJK5uuYLipoefx+aD2Bj5WEHY6gfbJ+imN1kqxXlCOm16vgwUlSqEZU2uAK3qf/eD39ybCSwRwLSNVw6A6793V7F9/tkvADYr9VDxPA1Rz2GcJPQZI3vUVKGWH151PHrhPRkGlNjQZAp7QddJULmFsL3XRQEyR/0fJakRPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNM8p1oq; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7373fba6d1so688303266b.3
        for <linux-omap@vger.kernel.org>; Mon, 24 Nov 2025 05:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763992365; x=1764597165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP/FY6KH/8vHEYoomKdq34/+A+H8nhmZ7rG1Fh9qu+Y=;
        b=nNM8p1oqOJdgmJi998S3O0Muq6FT1JPEnk5MPj9NDb2ykqNIne6+tqG1eNuBYws+HM
         sSAG0hcXrrePYVjUv6H9fgMYmz0TP0pSj8I2D2MVd4v8k7PwimuVr666y/GaqR6xR04w
         P86aIrlhQppUToHW6LsqhPfonnr75c45sybtPltz+D3ePV66fLrHOtdyIwgHWkm0doDk
         dpkzT82Cug0Xro1fUwa//E+ZREQcelb7GAADDhiYzktyL9RLwnvCVaIHSSTUPC7KieDP
         fi1zlEIa/cgjpk2IwFKPSTRlU49zUrwKlwvYbYepLsUOF518lp0zeCvK/2B9oexh856X
         MCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763992365; x=1764597165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JP/FY6KH/8vHEYoomKdq34/+A+H8nhmZ7rG1Fh9qu+Y=;
        b=lswZBorXSkKM1W4Y+d+7idHxjOilQYSSRbrKZmHdoVZ3YQbsBdHASdi1ekIjuLD4DU
         jUTYSNPwcrrzC1GV5DrGvY/5rdZ3ENth82nL0WYkMBaTOq3NtfHbfGjbNvXYmInxM1WD
         vi17S8JBC0H8ZAFexPsMHNm2TfGu17StHUk6Xan7xZkU1WijWsEAfMWlkbutDlUqWDB3
         AIzjQJu6YgRWEXz3ToezZvU2Hdr2wxjwf5l/EXNounzF+xuRKeYSDmMfAjgvrGETDVBC
         EbLQAX0NbA1TwL10Y/tO5PRMKFV5xgbLq1ovmIDYIhGXmh1T85zPX0dDHeWRUi2yl9fz
         AayQ==
X-Forwarded-Encrypted: i=1; AJvYcCVevKKDqdoIW+e8JUEllUnOqvCNnx9PgwupRjmtu9jDlhpnEp0jjlzDnaPyTMpM+X/or2HOQLAgcfom@vger.kernel.org
X-Gm-Message-State: AOJu0YxIcb1nPRR0Qjoxhe/0WyP76XpBO6LZIFc6jXmrxMpk+zDqZArb
	wgwd4j5cZnv41OaChuyfspwfmX1fOSGaH6tai498HzSBz2yTvUjAHeOAKje6kgb++2qEpxxqekf
	fz7bqbgJbsZZ8e8Qn2I1w7j6p5ZUB4GE=
X-Gm-Gg: ASbGncuDBhnpBbw8AMMzbcGXNgeXI573GChVgpMSnxOvBD9cOfXqze6ovedEq1/7EmU
	KDF8RhrvCRrngogfQYWP4fNgthtvsJ2436M98e1xtC1qhVviZNwzP6/6Twk4YWmD8+sJpei/ZxS
	MVlrKmGq7Ano/5Ti7ddvY0hw79PjBY7fdnGmybt010bH5msch3sqo021ELzQhE1HToUFXqW90J0
	R7pKOc+9FwUp1H5Epub8UWm3sc6Fr078k3IKlacNz9/O7C3IfrlYHq0BwjAOlqcWlDJybfYVbw2
	YlnUWsuj36QcKvJ5+8kSXP4v7pTh+WhEO0xS6q2QoOKoKqTqoc08qMh7tP3qXZZjHY3ojbM=
X-Google-Smtp-Source: AGHT+IHbYpoHWWQRtCEXegw2OC1ORK4p1rONYVKXwRB9RhnKrG4ujzsP4M5fg7GySo7VVhYPLZwcZKF+RtaqPvD4xlI=
X-Received: by 2002:a17:906:6a13:b0:b72:c261:3ad2 with SMTP id
 a640c23a62f3a-b7671ad9240mr1140942166b.50.1763992364480; Mon, 24 Nov 2025
 05:52:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124002105.25429-1-jszhang@kernel.org> <20251124002105.25429-3-jszhang@kernel.org>
 <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
In-Reply-To: <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 24 Nov 2025 15:52:08 +0200
X-Gm-Features: AWmQ_blafsIDEwQKFYXpYXLa3SZzKfbNXFzdND1Q9pD2iYZWVNrjXK4_jaogO3c
Message-ID: <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 2:40=E2=80=AFPM Jonas Gorski <jonas.gorski@gmail.co=
m> wrote:
> On Mon, Nov 24, 2025 at 1:39=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org=
> wrote:

...

> >  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {
> > -       .suspend_noirq  =3D brcmstb_gpio_suspend,
> > -       .resume_noirq =3D brcmstb_gpio_resume,
> > +       .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend),
> > +       .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),
> >  };

...

> > -               .pm =3D &brcmstb_gpio_pm_ops,
> > +               .pm =3D pm_sleep_ptr(&brcmstb_gpio_pm_ops),
>
> won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning for
> !CONFIG_PM_SLEEP?
>
> You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
> (which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
> all other *_DEV_PM_OPS() macros do).

Shouldn't it be covered by the same trick as pm_sleep_ptr() does for functi=
ons?

--=20
With Best Regards,
Andy Shevchenko

