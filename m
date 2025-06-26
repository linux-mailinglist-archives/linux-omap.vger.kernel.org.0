Return-Path: <linux-omap+bounces-3981-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D0AE9EAA
	for <lists+linux-omap@lfdr.de>; Thu, 26 Jun 2025 15:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73E6C3B454A
	for <lists+linux-omap@lfdr.de>; Thu, 26 Jun 2025 13:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149F92E54AF;
	Thu, 26 Jun 2025 13:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B2URa0mm"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010EC28BAAF
	for <linux-omap@vger.kernel.org>; Thu, 26 Jun 2025 13:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944321; cv=none; b=RDjGdjxInTDjTriGETuOLdWN2ujVrt2Hjj7vpEDXSF5h7TREcKiOUGohJKBGgVnhTyGW7z9ycYNcwGbwWnkS8RKbSnFm+u+jwWo5afWsaVcoYmb0PLrOoTQbP6MznKuV0e+f1FT0cP99aYI8IK6gZ9uHRLIe8DRv95PmnPQcVE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944321; c=relaxed/simple;
	bh=enT5vO2ALcAa/LZ/Y3Lm+uixPZpZ0NB8EkbAOpe//TU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rl4fnhFsvsRUkM0NC4zMAY5psYrflT/4ynaz4KyiFpOsPr6gcl3lvWai76b6nKa4O68DlesFmRG3zlX46jGGZH3cdjxfQOxGgb7sU11eWhrtZDUKn66f3OVjsmjuGuLMMlhPKANAPcFPld8wOeldGTXWhW9IUDVGT0l0kIeII/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B2URa0mm; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b544e7b4so1017982e87.3
        for <linux-omap@vger.kernel.org>; Thu, 26 Jun 2025 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750944318; x=1751549118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLwSjoUY7m1Ln7Qu4AWMnTKuJMVdB5FurphkXRXpBRw=;
        b=B2URa0mmUHhnUjza7rK4696DHHQRqzZPsZe5TYKZKfgX+wCd+wRPV2jMDwS/ZdKSLd
         GG29e4E2LuL+S6ctn/2NS4m/6ZIE2g0iPL6B8QpKy3nOO5WwKcDTr8e1HuUw2uq42BYs
         VwDUidPE0YGep05ZnMAO/6qTkLMKYq6p4E1qlVkEwyO4CkhyfQSXd88NMQDxTBba7RWJ
         D5CmwT6dZt+QP4retuQYMnXxS26f5thUFxNkgLK4Odj+9rxPKwiziZ0xMnrF9a75+8aH
         7x2ei/oncy3TeryRSUA3mkUn6WU37Lr9LqHWN9rimDXlFPf9y4NV9WSUoJgn5+gYBKG5
         ic5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944318; x=1751549118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLwSjoUY7m1Ln7Qu4AWMnTKuJMVdB5FurphkXRXpBRw=;
        b=entEsrjJiDZAD3HeqEEPVsCU8wqKpFiSKmkAXvJ/gn+qRCDO8fZ3hjzWl94MlhKhx1
         0av8RSYsjt0AajFvKNjDpgI+Wg5shOav5p7HPOGLeA2Wp+d6UD3RgBovU1CsVwrXOhHF
         crxCLFoHPO1HGsm61OGDksL+X9TDB3zwRPQORgJKmRLOVQ0dPduEhn2LIbBzPlL3jGBL
         +UtesSQ/wJBmQg4RFBm2GN4Z3SBW0bQBTENPrHLjEIQoR1NdghBebO0v7I/4XAk/RxBH
         l20CDWy2j8dxHM1Wd1aJOh4UOpv2U/y5z8/FURQpuR2RXo2hYK/zADUTB0990neCbhgX
         o69g==
X-Forwarded-Encrypted: i=1; AJvYcCUJaibSCVpNx84+QKLQlcLiPKn+iV83TOUpMsLqgmZid/13c/UYcj4WeXqAyL/KXF6udkdMjVSLcblH@vger.kernel.org
X-Gm-Message-State: AOJu0YyYAoBEP42IGz7KvQASX0W4xGIT6cr/EEetUbuSUz4T6H3phCu/
	cdRZPWdsX8UeLKOhZvuUrYDjM/XiuyvT2ZzO/QX8Q49WpLXuU68XpmQcNPSX9kOMjKrXHL46HoP
	emh8R6FGIZTBYwbKwY6+m78k8iaqX5Nz1/tbuOyjFlA==
X-Gm-Gg: ASbGncvaiuvXiEndbZUvyyWTo/D3LmPO3r7RIswJGnTtQ4HBECsf2jBdU5aGtCYOU3i
	FaqbWi4OOo+JX73+cEVtwVoJM+YiYJ9XyjSN43gUN+GKD/BiBASU+wjhvr2X57HIBMGAuHlO6bD
	IjRMBjY0Xgw2bMSaYNAuDR1bsp78/XmoqnBBuKWGwJxRZq+wyLHsXHsWaWvspJP4gtinebo/51K
	g==
X-Google-Smtp-Source: AGHT+IFZCHpg6dN8jQOP4LGMeE8N6TdaxL+CR37n8aEWMLkZ46xkrupRdz8U89iquKgLZ75BaGxTbVJfXxSWy4Rbayg=
X-Received: by 2002:a05:6512:691:b0:553:aed7:9807 with SMTP id
 2adb3069b0e04-554fdcc531fmr2571744e87.9.1750944317960; Thu, 26 Jun 2025
 06:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org> <20250626132257.GE10134@google.com>
In-Reply-To: <20250626132257.GE10134@google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 26 Jun 2025 15:25:06 +0200
X-Gm-Features: Ac12FXw9b1Ua2nskF_gKsApdHRnQVgOC-Rscq226tK5vt_NGX_5zRRRras-l-hs
Message-ID: <CAMRc=MdBipydUjEKXDufMAWNZjMA18RKj0XcNofrn1oR7bXTZA@mail.gmail.com>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
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

On Thu, Jun 26, 2025 at 3:23=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 24 Jun 2025, Bartosz Golaszewski wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Replace struct bgpio_pdata - that we plan to remove - with software
> > nodes containing properties encoding the same values thatr can now be
>
> Spelling.
>
> > parsed by gpio-mmio.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++---------=
--------
> >  1 file changed, 28 insertions(+), 18 deletions(-)
>
> Can this go in on its own, or does it have depend{encies,ants}?

It will break the MFD GPIO sub-driver without patch 1/6 from this
series. It would be best if you could Ack it and I can set up an
immutable branch for v6.17 if you need it.

Bartosz

