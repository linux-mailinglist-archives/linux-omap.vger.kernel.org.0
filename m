Return-Path: <linux-omap+bounces-4335-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8920B3720F
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 20:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72F76366599
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 18:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60928362094;
	Tue, 26 Aug 2025 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ydmJeZUw"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270963164DA
	for <linux-omap@vger.kernel.org>; Tue, 26 Aug 2025 18:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756232392; cv=none; b=QJIsx8GNd05Ox+qmKCMjgzo/tTHej3dKd2+PXyX4AJ57O1ZWV7FihaBqBoPMc6Yvq6UZMyO2NSZtdUq9UvBqy62jM8Y24sg8Sjyzcmgueauh/N4xOUyx9WBjPDLTv57dXAJBVibR5RD+9TD0tM1OZWpNOMJdY8l2yVqTFC94O/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756232392; c=relaxed/simple;
	bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FoYgS6JTSlbpEWU3WIKhghrJ3CzT/pGDVBgGvd1oaE0ccrC6poj5JADUeKktuF6nxw7vvfYov97xan+xPDQyJ6uJvKw1sme/aVgIkVkF293sJ98rmIMuKR/dILaO6hBD2Ls8OFqMUatMvTKs6GBc6YBgKjSnLTnBjsF5Km4QNJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ydmJeZUw; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f4969c95aso2161956e87.0
        for <linux-omap@vger.kernel.org>; Tue, 26 Aug 2025 11:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756232388; x=1756837188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=;
        b=ydmJeZUwk65YNZNu/QlcHmZJjyvB7rwhDCI8hO9AxkeyxmXy4LrXAuRaLxz75GF+y2
         +7b6//9ACJiy0CI2AMoXV8k3QgqLL5qA5uzGncNdN6kQMoV8l7oSRBq99YgDUUMGumz0
         7RhwTtN2Wr6CfDOq2FH9ZUF2cxxh2JOwTuT60ddjMgBxtQAAi4QJGYUrPhP+im0IFdLn
         wFhte6LTGGCQbSw1cTM4vKJRS8OgEGZwWUW7cH76qKeioOx0sUbXzsijBsQV5efTmC7p
         wQJo+Lp1oW5heIE7m7jxqGga2PB3xOBumQf+HlFN9E/rDnACXY6nhsKLwCTWq8BuSSeN
         B/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232388; x=1756837188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=;
        b=cGSU6EAjmCtTNpI9iuyuv/LedGSmtftSNMFU29ychUchzWKjSPpsQSt21MlZfuUSeY
         XLbmDbZWNsMXUybc2dAfxPSwgYS7f27bZADY/vV31AwmwYm4vvTWY6Qvwkh4Csbc4UjK
         nerRBiXZl/iZ3unQTeAtAX0ZqhHo/Q5rFQMu681IQF9ROc72jKFAUogIMW1/Bsq2PNzj
         nMQQ475CfHREGcjVT2Ll/T5sgBtCmZ41+imESiacjjej25xbM/NXkbrfJYnOztTZjkbu
         r1WFdxBd65NLhnQHesIYh/YwDrP9LsP+RqGjbMCHYHcZ+pV5Vl/NzUl+YEkwRoYRl9P9
         0+pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPHoPRA+GxqENN1fuymFRh/DUVg1zMUL99GDS1KXaQSh/U9Gv2hG/1CcRyk3bFhfliasieETd+4iDy@vger.kernel.org
X-Gm-Message-State: AOJu0YyuT7jVmFrF+MjsmVGPl+FjOnyKS+Lg21EOf/hYIkP+UFU3lqvW
	lLeFsrG33Jc5yPGv3KTNOlk6CgorH71UoKFkY4hCk/ii7NZQZKLSQ9u/aHHv4Q4qtbfEFTWAtAf
	xWZ/9LyIt0EGiA2zvrNjkc62i3MELQIU4blqJ/H6+rw==
X-Gm-Gg: ASbGnctlzSHU9lX2pLla/J4dD663Hkj2DTZ/RUJSLfs43YhCNcO4EsMl4pM/JZr0PVB
	pGDYfbjgikayiQKGKxdyh5QN2yrX/dY2kO2HVbmcF+ggwiDISeN+ys5glC9YOIVQEWcuimkVIOG
	kLI8tom632ENLWTIPnzM2BNYICCkH2szbPMOYK0SlIILUu+Pm1K1S/e0yRem+WBCAY4zAJqK8+b
	17rjiYZwDnTzdVn8mKHvNnFD8uEtKnqG3wrF+IID/O1Ndgf/wHdUCV8eK26
X-Google-Smtp-Source: AGHT+IH9/wDD1C5c1pzIo5M6703fhe2Ju79J3Cg57MCbuHB+kMzD9Ry2MpuHtwyxY9EgNTzhw0WfnDm8emGE0JQOveU=
X-Received: by 2002:a05:6512:3d87:b0:55f:3d7c:387b with SMTP id
 2adb3069b0e04-55f3d7c3badmr3365498e87.12.1756232388100; Tue, 26 Aug 2025
 11:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com> <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
In-Reply-To: <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 20:19:37 +0200
X-Gm-Features: Ac12FXxAYIw0w_2T1YaN-IyY2JYcpKwwddZS_ZNL3wGJGwAsl60-M2w6oLQOL30
Message-ID: <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 8:41=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Aug 20, 2025 at 09:12:49AM +0200, Linus Walleij wrote:
>
> > The qualcomm 32bit platforms fail in next anyway so I dropped the patch=
es
> > for now.
>
> FWIW the i.MX8MP also seems to have been broken by this:
>

I can't test it unfortunately - would you mind sharing some info on
what's failing exactly?

Bartosz

