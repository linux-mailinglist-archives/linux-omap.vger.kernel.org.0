Return-Path: <linux-omap+bounces-422-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D02B83F00F
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 21:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 034A6285052
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 20:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3EA18E2C;
	Sat, 27 Jan 2024 20:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LE0BRl6u"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696F4199A0
	for <linux-omap@vger.kernel.org>; Sat, 27 Jan 2024 20:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706389175; cv=none; b=ld7XOy9oq8FUX/aVpEnvPsNTzaOuSNgqLCf2HyV9bVaJL4AGw8Hm50yf6SYU3i68t1l5yIITB9S3EfiKhdIlKvef4uQHFAfFkzctKKry9tiGJECP/UR+zQYcets8P4qrY7rNnkd1e2f7S+a5JffpMNO7FqFM7qZ/Qr/MARvwkBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706389175; c=relaxed/simple;
	bh=X7sfGFwjXzv3hDjZ7pBOcFdlwJFwBoQuoJ8UWnTjxa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0dRoGSQTjAVwjFzyphJzgh9QbYwhowE9WsKbMVfMySRWuBPGaKh56Q6WZHP04HAdvCKuJTwSMKl41q2uwTF3065L+3M0ktdqg9lKZqokkY7yg0J+OHZ6y9Y33gTlwDsRZkEGxOFdr5p4JIc0j4+vJID81EXbMh9JdL9j+0V3rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LE0BRl6u; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-68c427136b0so3222506d6.1
        for <linux-omap@vger.kernel.org>; Sat, 27 Jan 2024 12:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706389172; x=1706993972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xi+XXGXLtGOnaTnHAzpID7MnZZG5IPUxmL4L9FGcLVk=;
        b=LE0BRl6u8pGAYbXPj2TltHHMj5sgjsvlRiXMPjku3ejzVRa74uhaY9HkJxhUoNZ7FB
         gJA27MdJNPaQSGYaRm+DrNgFLj52sbOAj581XOJktHeHu2bbG0M5v0QE5kADi3WGWKdR
         fF7UOFRaeEbL3Rctx8TH2RelGg/lEs7XIOvhixiRgKmWrHP1YabP4uLofVYF9hFRbdEC
         l+p+03d9MJT6xjSwhDUFJ6J7EZRiZVyvcxzI6rh35Yu/Qlti3CQ9DkLH/A44yI5ksJwA
         A63VbGTMWJFqq3rKTaecturOD8PanVubpBdsUOLu1fx4yirmAiM/pB71a6wi95b3hEB0
         ni9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706389172; x=1706993972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xi+XXGXLtGOnaTnHAzpID7MnZZG5IPUxmL4L9FGcLVk=;
        b=rL+oG2kuEuTmUyIgh9Vxw4sLQg4cNzicSc9/b4S/SX7ohgiytKGBB/jWkMSBGahcug
         p8JatM7dFbXeyKs4GPhFvu1JBrSYX7arZ9BtJiuig2Akn15wTZM7VsKanuE9ngGXIl6T
         UbhFcfcf+fgXECJtw6oWjk0Jesh5mTo8x3L0uVUqxIQuqOV8mqxOQYo6bkhDlrS4fagS
         koD6m3Zzaf3Qp9kIM1eSiKP4/bq1zWuiTySZErFuyLm/U4whVcQJvGh4THPsXuXCufnH
         OUdiUf4cCLsD5hOsfUeAYEw2Dd+fXJB1+DKX6qMKvP2xdqXeaEd/Zb+OsRbnA9tDZTd0
         aYCA==
X-Gm-Message-State: AOJu0YydbacrI+zRfosd63BiBILNrfkBJwyM5IyibtsRaqxJrs25iSWB
	AcFwwuPzaACLCPNK2G/0RcTadt/q0hzFnPAuIYtFV8QdW8kOQE9u9vAyH0o+XjJjx77+bJxgBIp
	mgEYgvHFSRySFeXSb3yINHDgBXqsywEOC6+sXMw==
X-Google-Smtp-Source: AGHT+IHfJzVeJM2xkAmUTr8ZLVYE1O6BzSpTjAVfgyKB0IlYK7KettRLZzpgOBAYKoyC3tCT7jMMH6X40Yjsa9zTcz0=
X-Received: by 2002:ac8:5893:0:b0:42a:96ef:6deb with SMTP id
 t19-20020ac85893000000b0042a96ef6debmr1350096qta.61.1706389172118; Sat, 27
 Jan 2024 12:59:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-1-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-1-8e4f7d228ec2@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 27 Jan 2024 21:59:21 +0100
Message-ID: <CAMRc=MepTF6vV=MwqDNL2_PRjymn18b-RH7TN5TYAGaO=VGDWw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] gpio: pca953x: move suspend()/resume() to suspend_noirq()/resume_noirq()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 3:37=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Some IOs can be needed during suspend_noirq()/resume_noirq().
> So move suspend()/resume() to noirq.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 00ffa168e405..6e495fc67a93 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1234,7 +1234,7 @@ static void pca953x_save_context(struct pca953x_chi=
p *chip)
>         regcache_cache_only(chip->regmap, true);
>  }
>
> -static int pca953x_suspend(struct device *dev)
> +static int pca953x_suspend_noirq(struct device *dev)
>  {
>         struct pca953x_chip *chip =3D dev_get_drvdata(dev);
>
> @@ -1248,7 +1248,7 @@ static int pca953x_suspend(struct device *dev)
>         return 0;
>  }
>
> -static int pca953x_resume(struct device *dev)
> +static int pca953x_resume_noirq(struct device *dev)
>  {
>         struct pca953x_chip *chip =3D dev_get_drvdata(dev);
>         int ret;
> @@ -1268,7 +1268,8 @@ static int pca953x_resume(struct device *dev)
>         return ret;
>  }
>
> -static DEFINE_SIMPLE_DEV_PM_OPS(pca953x_pm_ops, pca953x_suspend, pca953x=
_resume);
> +static DEFINE_NOIRQ_DEV_PM_OPS(pca953x_pm_ops,
> +                              pca953x_suspend_noirq, pca953x_resume_noir=
q);
>
>  /* convenience to stop overlong match-table lines */
>  #define OF_653X(__nrgpio, __int) ((void *)(__nrgpio | PCAL653X_TYPE | __=
int))
>
> --
> 2.39.2
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

