Return-Path: <linux-omap+bounces-3904-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE27ADF289
	for <lists+linux-omap@lfdr.de>; Wed, 18 Jun 2025 18:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 323EB3A5C39
	for <lists+linux-omap@lfdr.de>; Wed, 18 Jun 2025 16:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173C81C861F;
	Wed, 18 Jun 2025 16:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b+Fy1SSO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A54C2E9ED5
	for <linux-omap@vger.kernel.org>; Wed, 18 Jun 2025 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750263903; cv=none; b=rL+TVHGAXm/Fxs6bzEBc3x+0WpB2nyBIBeEOuTSt8IEmuos1eV1frWeVfHHuIgixDZbkhVvU0sHRFezFTUmDVjuiqZDBclH1xHsxq8ujH57K6ZqIp7hduK9DXNExDRUu2ZTIq2msURHPTlOin14AbR/BiF3dHMKMJvVvrxGIq7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750263903; c=relaxed/simple;
	bh=8SUTZJISnPl+cWNBsdFUwAF6yhxTIcuSAa64ljM8uh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kD5xUAmKW/36l/3zJRGAYBcTCN1tbI2ZFloDDP63r27KoOtDnszR8Il+NJjRmI6mGvii6YVZOAgLl+AGyx5L7qd+aLuAIHahBoYZ23FXim1qvQcs3YXpSbmSZsqPrOs3AS4DAKgtNIHmN1e8X2NeuZ2Gvfar6nL7eEYT7YOUNIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=b+Fy1SSO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b82f3767so4741411e87.3
        for <linux-omap@vger.kernel.org>; Wed, 18 Jun 2025 09:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750263900; x=1750868700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLFD+2psb7xXjgfHWtkDfvPX+FPgGIjapr64yFarvW4=;
        b=b+Fy1SSODIdcsGDr6ecOEB04p2+Ivr+mEQFfcU/VJy1ohU+FwU+UPXf3Kf+N4kPxro
         Lo8Y8ZkOE9a7FYsnuTlN9CitAmlT3MuzWuAGZi61DFlccQ6Ki+Du46vdgdzTzE4WTTgs
         WifZW7OX8H2qys2ux8Um7G8fo37wQ45p+q1olU7eij0EfaGO3bDbxuTUiCvma1ptEQnI
         6P2skv1Q2EFFXdBq3WrH4Czfa+f6h7uT6AcPHB3LKe7CH/NAylWq1anSZkrb3QqCVN4n
         fkmQJzlOGgoyZA3AQ7RDt5FFVRyKAqnoylsLtcF+Drn3a+LjEmQNSDVsLA704tgs1+8O
         X/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750263900; x=1750868700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLFD+2psb7xXjgfHWtkDfvPX+FPgGIjapr64yFarvW4=;
        b=hyA7cuWebvacgzPTh/K93nyGX/LJV58WsYNDIe9iCazksC12ncCjIN/jG4GZA77+gR
         +K+6PY9EqlrRk3XoOVwNYuYYDp+KrwHj4Vgmau6bzlDOZTIGMhdLSry7FNwIjDr8oVxI
         dr6r3PSJG5iFurzu8HkCBeOEnGi4ozxsQKOHpEqCwJCGm3a9Pspv9isyc3T2whRfC/wJ
         Q5sAe5pgilrHTzkNLTowui0KaxAZNHy94imqgpcfr7UsMaur1XLaQWCjZ27gTcVrIfc2
         I5EzGUwCzqarxTPufgoeQPRHZdQyHICW2ZksUb71ZxNzNKDRwdpLTIuxe4ydYfsPUYDU
         P3Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWYi0PaPfAoQAQ3rw2z0mYnyF92k+/y0IPRyHvI+oVIlfnAAOgu8/jVvJD90aLPugnwgcvlhnop4J2C@vger.kernel.org
X-Gm-Message-State: AOJu0YxVPJjyUh/w+dMaxv5PzzkJ66kqRgcH7u+UVlO0A8TLUYafHhM5
	wApYB9GDZDLt+/gaq7CkVdgjnOZaWmqsXOrq0PcOt7zI7hWQzpvpRyiDIh7Dx6ufM+lOz0cMtAs
	SDEDwM50iFNunXkaH3R0NszTvUv4mZln5+eWT9sXWBA==
X-Gm-Gg: ASbGncuh7YC8gtSjpjs2VFTWeYPSAvy9A/orkTUbz72kfqeoBMFC8TGQvhKUPZ7gjnx
	s1ZPUvkpwL4VdFGXaoc5MuIKoXI2GeKTtaAhMd93KyldVg9RDy693rxKXV3JGyUKSCR6oym4Ccl
	PCzOfzWRTd+a03KxA7IWnm+A63g6Ipr+VFc/vvDcPpI5YDugcpzxJsDdBvrCU4gMH/22XpKmDs8
	g==
X-Google-Smtp-Source: AGHT+IFasWzMx4vvKMGThkbIPZ5HFR/Wr5hiH9hJMS02hBIeQh8p7hArmnTCvxt1VaP57eg2rHdU67rWBwbdr9GK3qY=
X-Received: by 2002:a05:6512:1193:b0:553:2ed2:15b5 with SMTP id
 2adb3069b0e04-553b6f50256mr5473373e87.57.1750263900278; Wed, 18 Jun 2025
 09:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <95f63f24-2c8f-4f0b-89a9-ddf39a8f2e12@sirena.org.uk>
In-Reply-To: <95f63f24-2c8f-4f0b-89a9-ddf39a8f2e12@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 18:24:48 +0200
X-Gm-Features: AX0GCFtQiRTdcvRzM4v3bXKNF4ikUT4N9NzJhHCtHKKqoMjJz7WLf-25661k3ho
Message-ID: <CAMRc=Mc9_V8bkD_FyNkxkNoD3Fe7q-CC7ifq3TrD=r8+D_UgKA@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 6:21=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Jun 10, 2025 at 02:33:11PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
>
> I'm seeing boot failures on a UDOOq (an i.MX6 based board) in -next
> today which bisect to this patch (in -next as b908d35d0003cc7).  We get
> a NULL pointer dereference during boot while probing the poweroff driver
> for the system:
>
> [    0.443319] Unable to handle kernel NULL pointer dereference at virtua=
l address 00000000 when execute
> [    0.443330] [00000000] *pgd=3D00000000
> [    0.443347] Internal error: Oops: 80000005 [#2] SMP ARM
>
> ...
>
> [    2.522761]  bgpio_dir_out_val_first from gpiod_direction_output_raw_c=
ommit+0x194/0x390
> [    2.533330]  gpiod_direction_output_raw_commit from gpiod_find_and_req=
uest+0x134/0x434
> [    2.541276]  gpiod_find_and_request from gpiod_get_index+0x58/0x70
> [    2.547482]  gpiod_get_index from devm_gpiod_get_index+0x10/0x78
> [    2.553516]  devm_gpiod_get_index from gpio_poweroff_probe+0xe8/0x174
> [    2.559990]  gpio_poweroff_probe from platform_probe+0x5c/0xb4
>

Thanks, a patch[1] is already up for review. Please give it a try and
leave your Tested-by: if you can.

Bartosz

[1] https://lore.kernel.org/all/20250618-gpio-mmio-fix-setter-v1-2-2578ffb7=
7019@linaro.org/

