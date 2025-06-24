Return-Path: <linux-omap+bounces-3968-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07836AE7020
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 21:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C1FD3AEBC1
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 19:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A44B2EA163;
	Tue, 24 Jun 2025 19:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VZK64ZpQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E46288C8D
	for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794405; cv=none; b=EspGGj3e4nN8g5gcZvJVB6yTmAducQU4A9UdBuWGUsXcY/1mqlGnH42Ip1+RAzveNJqgo5vLZFvQl6YQTSzalPUVfgxvhpqZV5x/dnIfQKB2pl/5AWb41UnSkRMaBUhGK0gHFFpeN3hxgP3R1r/IsausDNO/AmFS11qjT+mBxGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794405; c=relaxed/simple;
	bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4/X4DzWzPjn35c5tNi2ZtmVmuISX8OXkBAi9DXc0PXyqEhLchkHC4JMUGfMDG8D6+gWkX4q+O8eZGOz4N47t8RgR392v+HM+tYEiyxhCtxX7uHkMKvyqbh4ErCaWU7h879DrmZI0D0+e5RRbd4jHtuW6gGRB/beiaTV6e9Go/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VZK64ZpQ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553d52cb80dso248288e87.1
        for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794402; x=1751399202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
        b=VZK64ZpQTEt9hL2LxW8l6wfKpbOHWR3TNjMgYRQTap1lD84dGIejNLJ9NU56lEA9sQ
         OY6YCr8BDg0/opw7Uu5vmWNmD9vGtbUP5Rzcuv2T5GZO2IMwggT2Uu0WpiTzWnBV+UMt
         MGou6zlqWylzILsmpc4yaS9mXK8up4RL2oeoHof18cN33eLXVg4DJkIxQhx1DJ+izAmz
         QHHFW2CPXhg4JdtfZntdB9UYrDOEHQnOr+vYupVvl3xWqE8H5K93AdAMOEMwQt6iJJ92
         R036d1iCOQeh6p2WTN7GRq660y685JFgbRizPKVNFM8YfOoegUuOdmifJYXhJzmnPcvs
         XPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794402; x=1751399202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p48sMTmP/Wq8ruqfMZ8LiS7A/PulyMV9Lx/kALaANNI=;
        b=rcD03S0LxcuNcvttV5p2h6tQT86xu5uJWlY7s6fBw12epZnnn38WDhDF87psAe7iyk
         +6JA7mxjCfMHmuwf2XWaLqSaNjdlVJIevdVcssdtHvwE7GXC6v8MxMnXZUUsQps3bFJg
         OtrfwsnOxHxuml/Rax5hSHc/dYYFimsQG8qMpKtiCBR0Kcwfv8qO9Q3D2E802WdoxQ11
         l+o9XnZ2s6K6wicyMzX1qbqB1RwcMo79CRm02bTdGHR1WAx52bjns4VUkxONiuT2GivG
         f3B7SdqS/0MfnEdWKjGt0mSQBkRd4ajBpAZmOR1UNF5p/8MVWxLhy7VtHrs2CYVGPYwf
         XzIg==
X-Forwarded-Encrypted: i=1; AJvYcCW+25YCIh48LpSVB2jJ7cXW9tGFLnmQ8czPQrJpPIlO10J1GKoFEGgO9WeOijqHzt+NLdMy1PH9wHS+@vger.kernel.org
X-Gm-Message-State: AOJu0YyaEUa1MXxcp2U3DThFdME12w19Jarx6mg1gh2gjVGsrrpPh8ns
	qvU5YVrA3WiafXWCcBscq03TpDSi7sc7tXoLDYKbtfbVgWJuxUnAo6GGQpdIFxbmTSBQ6uos0Yt
	bKK1+w+va6Z3kmiijxAOf7GEkVpLg1+OyNxTo7DA4ow==
X-Gm-Gg: ASbGncvzfFLQncFsgdAtzSkRhAyOoK4bJL50NJ905v5fh9ZWwDi5AXhdNBLxywa4sYt
	/HeRySRtz8Jr0rjWKaAOoAtBImjmfPck/m6lw7mmQzS9ACacBdMUoavMYqUFO9ro5StLmfJVdUE
	RcD0WpClEfq8SLYRiI/7+z6+z7yAbtwHQ9PPTtmOGlpYmq84oKoLgNsg==
X-Google-Smtp-Source: AGHT+IHdpwQMLs1O1YXsE7OYJDSqDv174xvDSUigjOl1MX3lK4+jDay8aiOLOcZL8anmxuKl33tiqVeqknlI9Y/jdlg=
X-Received: by 2002:a05:6512:1114:b0:553:cb0b:4dc7 with SMTP id
 2adb3069b0e04-554f5c85c83mr1548662e87.9.1750794402146; Tue, 24 Jun 2025
 12:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:46:31 +0200
X-Gm-Features: AX0GCFtNgkCX1W_AdlK11ZGEmJmRv7gODCrJ0s33UaorzXY8ZeRx0-2XaShZXAw
Message-ID: <CACRpkdZ0zsBCXLqdXKoY5Fyn835xqunesRLrAMxUu6ASWU7iBw@mail.gmail.com>
Subject: Re: [PATCH RFT 5/6] ARM: s3c: crag6410: use generic device properties
 for gpio-mmio
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The GPIO device in crag6410 is registered with struct bgpio_pdata passed
> as platform_data to the gpio-mmio driver. We want to remove the
> bgpio_pdata from the kernel and the gpio-mmio driver is now also able to
> get the relevant values from the software node. Set up device properties
> and switch to using platform_device_info to register the device as
> platform_add_devices() doesn't allow us to pass device properties to the
> driver model.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

