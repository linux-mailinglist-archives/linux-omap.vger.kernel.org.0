Return-Path: <linux-omap+bounces-4158-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4614B15D79
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jul 2025 11:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5292D7A5247
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jul 2025 09:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58037293C74;
	Wed, 30 Jul 2025 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="y6v1Y+rP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A4F27467A
	for <linux-omap@vger.kernel.org>; Wed, 30 Jul 2025 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869294; cv=none; b=rA2zD7LP6Q+M3bK4/LXd0K2P3TTQRYSTQAUQ3ZZSJO8hXgMyr8XYmeTuHy4GDKBWjoQT9Tvdex2W66chUN2l1Z2hv5mJJIdLZJWT4ngrQUZF9G+bi0t8efdZr2qmBzHdW1qWdBM/kSUl9RjDAvXYqQcXbXTnZnA8rPei/87QakU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869294; c=relaxed/simple;
	bh=hp7bAnlyWbMe0UagxjClRdoFhPBImgjJBDcHhbMOPBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGCWQn3bdYq4Rda/svzYftdh2yEPcgXmwM3fPSelXjBqFIY1oG8fn8GnEiZI4CTbQu422dtB7WTRhAF8KGh5ChlR7M1aRqja780JlcqTA+S+ctr1w6CkO5/9N7BVDmMddNWCMzL6IhsxzRzEJFMQkvuGz1TJFFjJC3xFam1UBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=y6v1Y+rP; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55b81b58eb7so517327e87.2
        for <linux-omap@vger.kernel.org>; Wed, 30 Jul 2025 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753869290; x=1754474090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=;
        b=y6v1Y+rPEVDHOkrqc2KWOfhiugmQ47csz1p9+cPsKrBxMu6N++Lx7mDSVzJx9n6oqS
         UB5hMz5e/MChLsSvAmzP82OKI7y6HHDsJkHIQqJ10ekWc9qTbZH4JevVzniY4W09B0A/
         VbMUa0prk04D/p8/3TRqlWvGNSKC2kXTwf/bhns+HC7/CXVhXgBURVJR/9r87Bn9GlN0
         gv/+LXG6hJV0a64I7ABkBgPr6iaKk6lKUYzENYZv0W+E8GgTmxZDjeJpjUQvzGsRYgUw
         UIsm9yMb4dS4lePbwKM+ubqez2QY+tIytNFSDWF2gXWKi7MulASGNSolQFMpNoSrFq9C
         RciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869290; x=1754474090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=;
        b=A3s+/a6pu2NSacWeplo9WeReZ10QWx2j5901G4tX8krtQDOY9Rzm+MHnuVHNirIUYv
         vCXxExL3VrM+65MiCFjebscHt14Z0ZoGZCUcIxG1EyfcKW8uQzhc/H14BPHIzUOoFTip
         OFEaRTzHnWQYQ8F3hcOYBlHKCgqwlA4j6MWklxO8zSbbtXfb7Cth5cBo2rMkVQN+JFKW
         MxIl5XbvsCfPjI0Mkf28TH/NAzPVcgJ1NJWcnhJC3Q4UqiINDK1kYDT+cU8eHSuysQ1R
         6BYNVYxFAhlB8ZGeHbbS2GbVvhYz2VZesgat5H7MEDueUMFRkij6hI2Lw5MNNbpYk6xp
         tLvg==
X-Forwarded-Encrypted: i=1; AJvYcCXr+D2MTCnQZzNN5bCJ3zQIWyhHXVYqG8JWaqmSN1x9OeSVIM+TU8XhElg8CnD0YuTBtsWdWc+Xov+T@vger.kernel.org
X-Gm-Message-State: AOJu0YwEW6sI2+NJtW9A2vg+yECgGzwQfs6/49x4D6JS1NNbJebkroW7
	Vbj68tT9e4jInMLShCJb1A0y7DaD7pBgURNH3Ps/FnUAOhU3pyLPIc1wQ86uteojDm8SUqdX1zH
	9kHsYCPFDEoHLcnsEny7RVEIpASSc6TnGd0sBgexYLQ==
X-Gm-Gg: ASbGnctU68zcltLwgRM1E0H7HSBTJHIX2FLgs0ai+hkG5w7ju46H+zRop9zSBhCdJ6D
	Ox2cbDYlEunumBgbuRpTxq/Sup3Kin+YfRAjpRbXB6RTgtbo04v9za05ResBeQfgnUsUKFRyEiv
	PNra7mXjGP3IJy1sqdt0eYWzxNmtLIOKytxJB6/K7vuVw8TlhlfkkDQINwv4SEJcYdUeXHcLmGS
	7XWCtDdYTKaaeUCn4/MpeMV3G4WwQJ8WSUbsH4=
X-Google-Smtp-Source: AGHT+IFD0mC+adTu2tQIUqoYqi4YbEm6lb9KfHl4WlQUhUVwQ9owZPBnvnUOvhF+89ksRVwAv/r0YIR9B2aVVdKhoAo=
X-Received: by 2002:a05:6512:33c7:b0:554:e7f2:d76b with SMTP id
 2adb3069b0e04-55b7c0b0f66mr939851e87.56.1753869289592; Wed, 30 Jul 2025
 02:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org> <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
In-Reply-To: <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 11:54:38 +0200
X-Gm-Features: Ac12FXyouWksKyGI1Z-cYawOTPPQ3IbuMxJxWat2oIDr-ST0nxIlLBCifNIDusI
Message-ID: <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> >  struct pinfunction {
> >         const char *name;
> >         const char * const *groups;
> >         size_t ngroups;
> > +       unsigned long flags;
>
> Not sure we need this. If the function is GPIO, pin control already
> knows about this. The pin muxing has gpio request / release callbacks
> that change the state. Why do we need an additional flag(s)?
>

I'm not following, how does the pin controller know that the function
is GPIO exactly, other than by the bit set in this field?

Bartosz

