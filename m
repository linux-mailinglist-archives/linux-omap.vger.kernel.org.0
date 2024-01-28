Return-Path: <linux-omap+bounces-426-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B85BD83F26E
	for <lists+linux-omap@lfdr.de>; Sun, 28 Jan 2024 01:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CB391F232D9
	for <lists+linux-omap@lfdr.de>; Sun, 28 Jan 2024 00:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EA8ED9;
	Sun, 28 Jan 2024 00:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Knd4iKg1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9115391
	for <linux-omap@vger.kernel.org>; Sun, 28 Jan 2024 00:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706400783; cv=none; b=g12TCQCJdzx5DpxEzxMLYNXlvBVxZLf4RHLnbQQ8x4t+fE5f91iZfz2kY2YapTvn3xyAQRcYhgEPlIDiAFsOSn/4PqhptuVdCX6kQsrNhMygjX9nqXYYbs51ronc3vDIdbU+5E1d2+tZfIfp8Zjqq1eYDivmXtng2cTsfdH9K9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706400783; c=relaxed/simple;
	bh=s382zJRyJ6x/m0CqRGyW8m+O+mRKPthrymTT1vXT0ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=inUxsmIKKnpgGrXM2rpSbarASeCRHWamtFmYn14NZgRhelD4vdbmxnehCsVQ5GOMuy0NFToquRpXKyXDOp01FoUbwvAgsoYQFeLqdWjHgi+4vnp7lVB7/yU83dcwrj2mLTw0TV+TO3asviawYzhJmNeYTRCcTFiRl9fWGLm/cIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Knd4iKg1; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5ff7a8b5e61so15216067b3.2
        for <linux-omap@vger.kernel.org>; Sat, 27 Jan 2024 16:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706400781; x=1707005581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s382zJRyJ6x/m0CqRGyW8m+O+mRKPthrymTT1vXT0ds=;
        b=Knd4iKg18Z4f0c8GB15trf0zkYf10XvmbfR5oXYzrrhmQUjpmU9uoDvHZvi3hWtwUy
         pallI8zTdUyh0weWLu1Gfuer47d+3tUawW4tJjSrfmOBJ4asFkkNwGp1Gz2EAPtcS1LL
         x5goR1nqRi6Ib+VCLFygbtkPW3Tqao/24HSqOOrLerpHgX9LrebCCLT3IzfntwHLSf/l
         5OaJ+ZMj6QUT8rjl4XuTnEX9B3oe9trxxKOzpFCejA/2s/x3+TNkpjvDiS5kjl0PQt9y
         d8nCeUyjIPsnwz5gh5leGsrloqmj4Uhpfy16wAUhrvrdWelLB9/4ua7VfTzuB/2tYMoJ
         5CIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706400781; x=1707005581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s382zJRyJ6x/m0CqRGyW8m+O+mRKPthrymTT1vXT0ds=;
        b=k3G4GgUVNOWDTOuUozbHP9D7InHYhRz2+t9//puSwucTtuAErDhjm4tUtMUes8XDJ0
         kiB+UoRvNsXY+TCIaVrRVAUOjanMbjNOwT3JOQiKmo8BDSjUuu+DzCMVx7tDNGSrFymC
         Ekt65ktl6nRb8T9xlVKg+bQJWkxHvacgMckR/DczUsw6BQ1JQxl+nIjH3Wj85pn9c2NX
         naN9UmS7ZIvCAtjm1CQfbL5X1ZYNfkl4W/jsNNlGftXMbf7kYTYu+nbLJgmBhVUIjOKV
         qixgp8YAklMZbtuFqw6V6nSfuf88AVcK03g2i0LDvJRrg9ZoRVB1nNjT1gX1uF98ID3o
         1U2Q==
X-Gm-Message-State: AOJu0YwxHakS22RdvrRPHye7LNtu/0h00CK+3D7PnBXfWBHLDpF6BC2A
	6vqYCCQzmr9KH5MOhP4NxS7MXdBkaydgIryRV8Xeym5RZ4TipvG17hIRyHGdgveHQ7gINCeUoAF
	u4dcvrJv6myze2jtIheO5Sx3neRexNcxp2VmgjQ==
X-Google-Smtp-Source: AGHT+IEZVSZUzzjxzZn0Av2/7INObuTua3Mia5HKhwhoo7tJ2m/wqcv1w98aBP4XbcXGiLtyHqQ0OWN/g5UmL4382Eg=
X-Received: by 2002:a81:4426:0:b0:602:c9ad:f979 with SMTP id
 r38-20020a814426000000b00602c9adf979mr1944880ywa.75.1706400780839; Sat, 27
 Jan 2024 16:13:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-1-84e55da52400@bootlin.com> <20240116074333.GO5185@atomide.com>
 <31c42f08-7d5e-4b91-87e9-bfc7e2cfdefe@bootlin.com>
In-Reply-To: <31c42f08-7d5e-4b91-87e9-bfc7e2cfdefe@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 01:12:50 +0100
Message-ID: <CACRpkdYUVbFoDq91uLbUy8twtG_AiD+CY2+nqzCyHV7ZyBC3sA@mail.gmail.com>
Subject: Re: [PATCH 01/14] gpio: pca953x: move suspend/resume to suspend_noirq/resume_noirq
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
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

On Fri, Jan 19, 2024 at 6:01=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
> On 1/16/24 08:43, Tony Lindgren wrote:
> > * Thomas Richard <thomas.richard@bootlin.com> [240115 16:16]:
> >> Some IOs can be needed during suspend_noirq/resume_noirq.
> >> So move suspend/resume callbacks to noirq.
> >
> > So have you checked that the pca953x_save_context() and restore works
> > this way? There's i2c traffic and regulators may sleep.. I wonder if
> > you instead just need to leave gpio-pca953x enabled in some cases
> > instead?
> >
>
> Yes I tested it, and it works (with my setup).
> But this patch may have an impact for other people.
> How could I leave it enabled in some cases ?

I guess you could define both pca953x_suspend() and
pca953x_suspend_noirq() and selectively bail out on one
path on some systems?

Worst case using if (of_machine_is_compatible("my,machine"))...

Yours,
Linus Walleij

