Return-Path: <linux-omap+bounces-3969-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 211A7AE78C4
	for <lists+linux-omap@lfdr.de>; Wed, 25 Jun 2025 09:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B52AE160F68
	for <lists+linux-omap@lfdr.de>; Wed, 25 Jun 2025 07:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375D122259E;
	Wed, 25 Jun 2025 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="srAV+ug0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0590B20E031
	for <linux-omap@vger.kernel.org>; Wed, 25 Jun 2025 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836922; cv=none; b=UhA/LaVAuz9jbT6HscZ32UdE4GKFESj4bUPjo7q/Np9geKDoViMWbsOwtwc2ta6v0XksUNribHnJ9P9mwmvupS++8BffmC79DBLcm3hTgWARrV+9WPxtzgycIR0l/6QZ6Zo7+qldXAdtjmixjYzWgAQzlROCY36/J+pPvHJBxyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836922; c=relaxed/simple;
	bh=2DymnnvE184jkZ20uTvSiiI7+Y+QW2i9b6WEZQ2DOJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scI4YRfYqwJ+WHX5QKTsX8Knf6yvyVICsxHbrJMt0rMxg/MKIfaYSYbcmvu36Dn2jwwaOniVY8cBmc2gjTosAoLRSyCW/7q3NhuA/FKkc626PnNIxd34shihaBWIFFyZKpeUdz5xnSZKkpTcq7KVsbHSjNY3p+o0URoVL0OqkBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=srAV+ug0; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so1343530a12.1
        for <linux-omap@vger.kernel.org>; Wed, 25 Jun 2025 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750836918; x=1751441718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DymnnvE184jkZ20uTvSiiI7+Y+QW2i9b6WEZQ2DOJs=;
        b=srAV+ug0q+0w5chyQ7ijAx/duJp13PTzdHzxqz03njor3fxDjKTSaMxdvbKRTCT5gZ
         +Bxeh6VtfhG3bTomX+QdTe81HgGz5BzUDK4udiYfRDAk+ECP7BQim++DL+2cdKRD9aA4
         44nlCEEYK5P0Oodemdw27yZ6OKkgUBVIwqghmLBmMVYPmyGYZ6uKcLr1Hv+6qSuhGcCg
         nYjDl273AZtO8v+TZ1GmQwsTAVWSygvyVr6NnEbWVuhHAXFXlERpkKNdsp+kS4EX/9wS
         it+KDG+SVQlYaintKCAyowNqLIklO3lzyEQpnX/eptd3SY5uZmMOdaj11PQScdVElkxy
         0xQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836918; x=1751441718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DymnnvE184jkZ20uTvSiiI7+Y+QW2i9b6WEZQ2DOJs=;
        b=R17xfezCNoNTwSs2/yv0jLb9/yFNSmxeAvwF1mQNAShcP3dYrKorR9eTJwZKn2BKs9
         upyhl00avM1cSJ5qgVXYHHq4sK/ho0Z5wkQp5rXHxtj+tlLHftFLYy6+uIeKLtjv0iSy
         fDhLwyIDpmZrP9jWYxN1hrYe1ziuE6/z5SFcg1ZeYCHgqU2MjGebuBj2DB0waJPJSDn/
         sabvg6msDAZV+W/wcYYidEuACmPXA/8GbfFzXzPdoJs+D/NuifchD21CfRVb67CXaYzn
         w2YqfXo9GExbpKQHrvJnHqHyHlmHgWi2WJ75pCDuN/YGX/M0R75pIHtSMWb20kHQAnxL
         6AJA==
X-Forwarded-Encrypted: i=1; AJvYcCXsHhDl4e09+kbR1pU/GMmcOncFxkh4F8TiEIURhz6XH1sTclD5Jm8JU4aIHCZyc2fCSh2sSXysQ3+s@vger.kernel.org
X-Gm-Message-State: AOJu0YyXKulD8fo14/O+6IWVGeG+wolXW6VmJ17YHiIXFkPZBQA+mKqE
	+Ihucfz7502y7JNn5ScEc5rGBpIr4CZCtagnVnrLB7gf2sB3Q3GG+BPQic6mqLYEM3xqI4xDUH7
	7xrj8gd/Avs04aS22qZ2l0XKAJ7HRb9HEeT8PlbBllg==
X-Gm-Gg: ASbGnctqp3+kprV+9Q6sbzMBSrbD2uI9DeVtG0eq4SMIIf/NITEoXfhssbkew0ATYns
	PdadF4+rFdsQXMGWC455+Cc5ou8Wvyea0aJ/d+Gq7sCHLZ5bIsD8j/ILUC1nct+eeLbHm69B9O+
	lh2b0xfLcMUcv4vtcXp9qUTO5BCDwq5kWPHPDu+nL4/jysaOkZYMJiH583Pu8pC8cywzdmW7w5u
	OA=
X-Google-Smtp-Source: AGHT+IEyXKWCmKWZPw2kgX0twR9fcnM1z7nFPYHArFddxW4orcOtG+t3XPYgPsMNGRzQt/Onxf6tBPeKruUlJC8wqdE=
X-Received: by 2002:a17:907:7215:b0:ad8:959c:c567 with SMTP id
 a640c23a62f3a-ae0c06af8f0mr172746266b.10.1750836918190; Wed, 25 Jun 2025
 00:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org> <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
In-Reply-To: <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 25 Jun 2025 09:35:07 +0200
X-Gm-Features: AX0GCFtyVKN-DtXqrWSfe49kFtB1susJDcQJSJJYWx2PpacFz_0klmfgmBsfOl0
Message-ID: <CACMJSestPPEvsUrWaqz7yZ8OxZTMEOBY7htE7c8BV-VBumj1Lw@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Jun 2025 at 21:44, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Ahead of removing struct bgpio_pdata support from the gpio-mmio generic
> > module, let's add support for getting the relevant values from generic
> > device properties. "label" is a semi-standardized property in some GPIO
> > drivers so let's go with it. There's no standard "base" property, so
> > let's use the name "gpio-mmio,base" to tie it to this driver
> > specifically. The number of GPIOs will be retrieved using
> > gpiochip_get_ngpios() so there's no need to look it up in the software
> > node.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This works for me.
> I wouldn't be stoked to see device trees abusing the "gpio-mmio,base"
> property all of a sudden just because it now exists as a device
> property though... I kind of wish we had a way to opt out of exposing
> this to all the sub-property paths. But it seems tiresome, so:
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

That's not a problem - this property is not in any DT bindings and as
such is not an allowed property in DT sources. For out-of-tree DTs? We
don't care about those.

Bartosz

