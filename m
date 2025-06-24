Return-Path: <linux-omap+bounces-3964-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D0BAE6FE8
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 21:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02E4C1895914
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 19:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A7F2ED15A;
	Tue, 24 Jun 2025 19:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TYt+v66u"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE77C2ECD1A
	for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 19:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794100; cv=none; b=N7NGMEi69uZ2lERcUL9iV9kDwTKTwscVuAkkc7l1r9EivNAwPCdqv/TSa3JNtCT3591aSLL5TpV9MbZqPU4zGXxW8UmCNSxsZWjyF+4i8fhuQuiGB1DWCyiAL6pXJKwbpC0tDhmF77x8cnGgnpWJDFYpZGiHK8qOKWTCA0JBANo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794100; c=relaxed/simple;
	bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIfuZvkaW9iH0GaCxQbGilzl0axK5qHM/4lodOU2dDn9W3zou1TD7QQNk2sDxOvOyu0/BBpGpGDX9AlUf91Sf5QCCCRa/QqyLqhwRXF+aWvEG+57MvEMcrqRbfJyx4ol5+vB56IEydfAtCxNHS1dlP0pWG340tEYiioNx21Gico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TYt+v66u; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b5226e6beso53027441fa.2
        for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794095; x=1751398895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
        b=TYt+v66uVRtdBCH9H4QW6IdRV6c/mtAgiEKCU2v/jOAZP1gJ1A/c5/GLBlLxt7rdiO
         AutgSujhqabyUhE2uifVgFIZ9/6zpUAsIgUXgUYKRh/sB90YlempQGeq00/4ERqNCBWr
         enb9QwoEC4r8SDamuq3aZh5kZJnzN3Vu3SnDdg//2EOu55sw/6ZzlBXOq6L34r0/CzQt
         Lv9Q5KSzOLsg8gqwiXQEFcdOKmo8oMNjAsZGm7FaPRXrCBFtm8dnTvqkyIbaemVY1wlQ
         Gr/7OuTfpPuCldYQIYA7fCZuXCHbgWuHfTXem+gfFHKDcvoGCqQgjMOnonWNsxP6epzB
         oaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794095; x=1751398895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
        b=NddJs8J4Q75NXYx8EjJLAHJN5QB6nZg4QlE8s2ApX13EEe1vC+5Dp4HMZTvNIgX0LD
         PiAzK6gtl3z15J0YsqDGuuJ7ADsA3VsV8T/bqsCBGC5ZTK0PK728o2HSEYJiiigUc7vb
         Q3ZUWvm4POWhTBhqNazoK9uHKEpyXtnNCvGDD7RZxY9T3wIm9OJLh5fnqodELPUQLIed
         pG2+CniO8/PVgmKWt5Ivw89DZYreoDGTD3r5vnIu0izfsao4Cf84waTwwCwu0av6KcVV
         uOUzTjORkLgAatTjmdCrhwz4C5HB8FN1oj+bvVPUwRmxGnSVzPJom3fqRGLYSsTW4tvP
         R2OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk74EZrfLUJouXo7t0dbjQxzfH4CbF8hHQqY5u/SPwUyFlOoB+BHQso0m4/4dhHG+ivQtk2aewInk1@vger.kernel.org
X-Gm-Message-State: AOJu0YyXLYpPerbzfQSK7hqaSdFE3KRyOZkfr86OR8vaBP/9YdLvO79D
	MTKJIjsdq0z8oNBFy99mYUjFE1fGMEk/oHIY3NBJOrl1ou9yOv9pzEaPAXwGczXWCQxsOCBcJhb
	zSiGlASxa+3b//65ukpyu4zxY9UJYaiJ4tApNSpnlhg==
X-Gm-Gg: ASbGnctsqd7DocK+IH9Fm/po1wLpbau+1boQ/71beyNmczqyURKcuj//ONdaEMljbZc
	0lJtBlx0XqE9K3741EYcLl9eb0Plg9UXvD5+LXLwWFVzYjAe2nEW3l1pyi6PzJZ/6vCP2CT3W72
	0XygdpbwHyARVmdMmiwnL2Nt6i+5eGlAZHyF1xbGbrWmk=
X-Google-Smtp-Source: AGHT+IGgAuc3iJtRYb+OK2rDM3TlkSrDgGEbgeVIFtkTDVdAbZ8WB/KP/SQ/rIDTOfAZi97Vwex02jPn22o+QO9h4sI=
X-Received: by 2002:a2e:a4b6:0:b0:32b:8778:6f06 with SMTP id
 38308e7fff4ca-32cc64fe7edmr63161fa.18.1750794094847; Tue, 24 Jun 2025
 12:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-1-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-1-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:41:23 +0200
X-Gm-Features: AX0GCFu-CBprmbPmDb8uoIG_yV6pNxQGi2vFucZMy5qL34U2BG3ecQIKj4_p--o
Message-ID: <CACRpkdbG9WSuErEvcNGnt6bSqMVk31PuLGykaLw8XToVFnAc-Q@mail.gmail.com>
Subject: Re: [PATCH RFT 1/6] gpio: mmio: drop the big-endian platform device variant
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
> There are no more users of the "basic-mmio-gpio-be" platform device ID
> in the kernel. We can safely drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

