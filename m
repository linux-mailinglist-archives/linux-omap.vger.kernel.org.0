Return-Path: <linux-omap+bounces-3906-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B6DADF349
	for <lists+linux-omap@lfdr.de>; Wed, 18 Jun 2025 19:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55ECC188624D
	for <lists+linux-omap@lfdr.de>; Wed, 18 Jun 2025 17:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0FA2EA738;
	Wed, 18 Jun 2025 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gLlzbqTP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644661A9B48
	for <linux-omap@vger.kernel.org>; Wed, 18 Jun 2025 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750266033; cv=none; b=YNU8sctiM5xdbZtZ+HYPJEg7pKL+EKa2aGW5kCdrO2l1j2u2hkvqzpkjBI60JnHfTBd1IEva87IYGJDo1HkqrlHlLg8o5V/77q5mcYAj2poVLgc25K+3F21GdoZOWSnoABq64ZJQWB2u4z0JMycXLMr/NqWUCJcMtvdhdXbuHDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750266033; c=relaxed/simple;
	bh=+8Xdqwb6MvOa9JgOjMPmutzEepHU6LBWPxhoVAtdHHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EREAorp2q0eojDsP2Wokt75yjEp1uiNENI2A3b9LHWprg2nzi1gT1PN1LCLqNq+IA9jJb2Cq1PEEijDZ9hKhKkjlC3YqWRI52/C5gZ5O4j2SygFWHp5oBFW556fhT/+7reAlrJk1MGfBWVaQQGq6pIDT4yA0T/DRYxJG0OPKX60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gLlzbqTP; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so8100939e87.1
        for <linux-omap@vger.kernel.org>; Wed, 18 Jun 2025 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750266029; x=1750870829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=;
        b=gLlzbqTPf/GdtLrDXOO1UxqicEoY8LKaUh1Hck/2/j6M7gHgMw14kX/GildZRh/9zf
         nAC51FFNJkA8qY4KcDgA+zaz+8rJPC9W30WytThRwAP3Fv6k4mwK4yMqaSMlKw0AeNtk
         4sFqa0liiR0XrECqxPTxvefJ6+fui69u4huVAriuIiu+SggLO16eG7RU9WiJnJToWT/E
         JqdtyRKPA1mCVXBN7PaSD0euGTSP0jQ4MF4/AgU196BoF7ew7D3DC8B2ZbNW7p1r9u2d
         q5q2g0ibe/4zcOc81a0kCFjMhNyggezAx4wzvqbfk8Ae/iz5pYkeIlveRaqeGwSLX7MD
         9HrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750266029; x=1750870829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxTtuzusVWGqXpGsGysxbx2Frn0OYva/hDBE1FUWIBE=;
        b=XwtA3VXGvXqRBn6HMHr26EADGg7bQXgtiPoQR2V7E0d+gDz8p9MQCf8GuCRpCP2c5S
         D0AcFN6CdKAIzsTh4/Q2o1rICeFy0HlfvH53DkrF2IY8PtdbABVRYsvoAGdbvOUuSwpT
         +29e6oTUZWSCiVuerRwno1CJdzfR3q2et+XIYHmnHNbzlFu604AAUnLj/6L1WDBsBHgI
         /Om+L+fbPyT+u1RIlp2Y1MtAc2Jj28SKi9RJwFGiBEb1ynnivM8+3FiPGOJbshisaJLq
         BIcq18jQAIP0HkKo5w+9zTHn5mbokMMplvgaQ7Om5d26EAFlYW+RypVX3iDPXxY3gKnl
         tSXg==
X-Forwarded-Encrypted: i=1; AJvYcCUD/2inVAPZhdoVF+AI2QiVXnKB8T//EaUoTnEUcC3pt+Y2UP+XwgPUsEQPu4FxwFgHRUwTFQ1iFu/W@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/9EHC2CJLSRxm/s4IKyNmgw7PxXG9vCkGFkoYhNDGfd0DuT/a
	BbV8ZWTdQ+RyC1c+4xUnwsvzojmufOZ4CJkX6XpMBmY0E6mfGQf1L5mZAqHrXg4DGiKkYycoalG
	5zQK3n1ydMppXM1FxFV+VpBb5vUpix7sD5T1xpeR5aw==
X-Gm-Gg: ASbGncvqzowz1OiWHS4eNhCllBki3F0pf4M1EOQQVNA2E1tk5dUeJrKEQPMxd2egFUx
	UEFF5Ykeg4XrqbmSG+g31uUXPrjuwQAq9/myv0gQhjDd6pZRTErkA2f8Iy4aNeisU6P1Ww3oa9w
	I/1eLoRE2HzwjUTqmRQIw/NTU/PYZyByFFlrwzIh8bUn5xev9s0WF5kyZE82r0RBUSGYyB0N67w
	w==
X-Google-Smtp-Source: AGHT+IFrk7wjLo0FScAaHSeULurkvYIZ6q3poIqbDoop4mdMvyFf4GdTA027YlkMWkLw9hocI1+ULYkfCsJCJgw5Ht4=
X-Received: by 2002:a05:6512:6ca:b0:553:25b2:fd2d with SMTP id
 2adb3069b0e04-553b6f16e9cmr4855031e87.30.1750266029272; Wed, 18 Jun 2025
 10:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <CGME20250618164320eucas1p28174732f38fd279fbba72f07887e5da5@eucas1p2.samsung.com>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
In-Reply-To: <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 19:00:17 +0200
X-Gm-Features: AX0GCFsZ9BzqvDbhrAHxtqvk55yr6p1JWPmW5O8GtAIoAiziZFdZwWCX10LDhDU
Message-ID: <CAMRc=MfWD7XGuuiLd5_Sh1vODfE-v6suM3w=qdufxXPtkW+HVg@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Marek Szyprowski <m.szyprowski@samsung.com>
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

On Wed, Jun 18, 2025 at 6:43=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> A few more changes are needed to avoid NULL pointer dereference
> (observed on RasbperrryPi5), because this driver calls ->set method
> internally:
>
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 9169eccadb23..57622f45d33e 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc,
> unsigned int gpio,
>   static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio=
,
>                                  int val)
>   {
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>
>          return bgpio_dir_return(gc, gpio, true);
>   }
> @@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct
> gpio_chip *gc, unsigned int gpio,
>                                     int val)
>   {
>          bgpio_dir_out(gc, gpio, val);
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>          return bgpio_dir_return(gc, gpio, true);
>   }
>
>   static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int
> gpio,
>                                     int val)
>   {
> -       gc->set(gc, gpio, val);
> +       gc->set_rv(gc, gpio, val);
>          bgpio_dir_out(gc, gpio, val);
>          return bgpio_dir_return(gc, gpio, true);
>   }
>
> Do You want a formal patch with the above changes, or will You just
> amend them to the updated patch?
>

Thanks, a patch[1] is already up for review. Please give it a try and
leave your Tested-by: if you can.

Bartosz

[1] https://lore.kernel.org/all/20250618-gpio-mmio-fix-setter-v1-2-2578ffb7=
7019@linaro.org/

