Return-Path: <linux-omap+bounces-3823-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C5AD458C
	for <lists+linux-omap@lfdr.de>; Wed, 11 Jun 2025 00:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC54C189D990
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 22:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C75286881;
	Tue, 10 Jun 2025 22:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="darL0WaF"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8294285401
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 22:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749592923; cv=none; b=Tx/r1uWbop9iHSIqd20LtVdcoymFFA93kZwFoXCMGDotN1Tk3nAyOc5oXE2mKANObT5iRBwcfVyLgNY1HIjKz3U0vJSUhVqZ4qwmq0Z2ZNAjvUh4gd/pXEDK1lwb+Q0jj1D4VH/qq1JRuume7q4rnt/W4l+e5tc6culG2jIVa18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749592923; c=relaxed/simple;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bnQbkJ4UsoXp9KzSKwWuZBFDOMkDM7Cvjz6CiFAobyOPpD4McH2DB4kRSzOyE5wjnTdxgfeBXnmi3H0TZNx4gCgObzwwvvOdmFlZ8xb5FtTiXZ2rOPAG6uNE/R9nxj+oeFKuD/0mLxN6qDgYBWSjms4pk/NftwVTzBGD1wnQpqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=darL0WaF; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5535e35b059so300019e87.1
        for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749592920; x=1750197720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=darL0WaFnqXsN60//KyNJtt83dkUlHHZa7TiQytwBwMfvg8t0Bs5VmCa4OdUdkOKcK
         3KCxkXaBD/KLi+JQ8KUhosrpIA1k9+tlptkt2QwxVgNGib31KzwFfYdc2jVqcLPN3JMC
         hP0QjgBAIU2VbTSnTIzbG3f4boMFIPDnGka2gTEuLgpGhfUu+R4cPQLV1EeXJlSFf/j9
         GAYJ6POlPW+B3Zzd4rbTI83BVhQi/WQilVQVuDz+adCtIPFVrjao3dJV7fA/zQrn/AL0
         NWIPHwvEiRgeyNdi3Fs7eMMlnR2nVCFdGstfo0b/HPtgr5+I5ostEaAmybKca7b7g+Y0
         kBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749592920; x=1750197720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=Xyc0sUMACDDHpN1Roxdr0jD5Y5rT1fR5irLO/c+yXGwEXsyS+n0IBs8MgeTbda8UcP
         m7/cqfGFrknMFWrq0bJHnc5yowRXkqUo6z3UZjaajfWk75EioSv5DGm/G3yv5gZiXN15
         lvcAQ/HDCH+MwrctALqT1yl/AUagUyYck2vbzNhsm2+YJncPGokiynLG7zTUINNjrfRE
         02Q2of3iyAxEprWTsn8QEXFGj34+ZEn4FEd2pqfVLne6+B5A9bh7Zs1SF4+mN3kdQPQM
         u6XaFbEkeWidmRL9wMqHM9At4uMZkdMtOmj+VgizVEWKApFw0+RJ5MsYR2RWPypgy/UM
         IzGA==
X-Forwarded-Encrypted: i=1; AJvYcCVvBf7VnnpRHb+SZ48KWcEnJ8cpjjvktClGjXLjdVrR2eGEjU9kbUC5treQEnZAYc3h6xsrej1HMlMw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Ne6h1YHgnKrS4KV/AZ3WMsca5GFeYY+NGbG9YIpXFJk0qS7n
	OkVXZXZUik8gv+Sj/Cyq5lvH9L9CHPYmgio50wdONyOM+pX7KyYZoHXyCz0RIChsO3SbTQA4uAu
	1mW3eIW6EHd8NjVJRsOAxGTFVQj1zwaU/CihVE8UO1g==
X-Gm-Gg: ASbGnctXGzver9ZfLy3phIz+JOnx8NteAPsWt4QDuPgDR3osn4QxQSvxp+c6fNAhbO5
	pEJbiz15dMF0jkhdWv3wIm0cwQDkS/bxQkCsypC0UAE/TFMjLDgKAFzR+mq2IBr6cxVF+Pw6M5q
	ea+6603kIe3FTDww2S/SQikWX051XmuBqStUvriHXVQI4=
X-Google-Smtp-Source: AGHT+IHHOhOUj30OWDDSx+2F42g2fLc3I9bcRSXhW2UcQzuablZdDsnZ46Wc3GihsOmkn7ZczCyHo2K03K0tk80OU04=
X-Received: by 2002:a05:6512:1504:10b0:551:f166:bbb with SMTP id
 2adb3069b0e04-5539c5ff09amr174150e87.13.1749592919907; Tue, 10 Jun 2025
 15:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:01:49 +0200
X-Gm-Features: AX0GCFufuH4LiWDSgWF_9h-zk6BcvJ0Do0hqFlGAZPq_9bZnp7tz4BcqtgZHIfw
Message-ID: <CACRpkdaK=Ua0=Jgnff4xXxVx9W=LcLg7RykR7CozhqtAb+8XQw@mail.gmail.com>
Subject: Re: [PATCH 02/12] gpio: mm-lantiq: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
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

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

