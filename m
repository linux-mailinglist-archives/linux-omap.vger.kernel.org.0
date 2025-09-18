Return-Path: <linux-omap+bounces-4155-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F98B14B33
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jul 2025 11:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BE793A6D66
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jul 2025 09:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C698227AC21;
	Tue, 29 Jul 2025 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fEHAybb3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B53C14F98
	for <linux-omap@vger.kernel.org>; Tue, 29 Jul 2025 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753781049; cv=none; b=AkaNP6J2T99aw0Ua8rTa8EZrZTM8soQe5ATszN9tidwKBC83ErjqeecCGVpKfmo5vtlqyxmq3Ee5g/F9zdnysPiqpbQJW9s+PRko0The2SKz3rAabThxjyWAFCqW2Gte9Vy7fI4cIdP3IgyIg24xlR/3vFlwM6nIDwELTMvzKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753781049; c=relaxed/simple;
	bh=1XbJXYOtfiKvD5ix8X5FxAD5vsw1x7eclqIkLeXimps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mW/8cS5lNWVRBYepbWxvk24Ghy0EumaR4q+jdhL0f1/mFpONWRsuPq5cnh47FJOGhbtHC6McyEQeYUjp87uZPnDQXNO8XQaTeVtwUQboBssbRN2jTPY9wCMfh1KV+D/bMZubBeDmiBWhGHxXm4BJYaedy1E5Tc9avdRkbZQ2/nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fEHAybb3; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b561a861fso45402721fa.0
        for <linux-omap@vger.kernel.org>; Tue, 29 Jul 2025 02:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753781046; x=1754385846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvMriwwuRsxStr2YyKe5TWPbRI0lQN4j3ZQYt22kpLE=;
        b=fEHAybb3OuY7x+gjbN/XKz8qEKAN0mQ9y4DGFfnXysVJzJwBu4iLULXuGicbjpx3D3
         dtLhEKLl7J8VYDuc3D6tKDZw6iMkzJJpnTc+ZaATB+6uRKw/7SGeTrPwEd2pjTLLTdAB
         igfmKdMOgFcyGEZqedATfYQOT0p2O/Ahkz/gXp6Q7OdnmD3OT7EitbbBE4oBtgTlryVM
         gUMoQIS0sW4+bFi80TrW1fX+DN7lQwKQyzFSza/Jm+48xcga5AH2GdoWJUI2ga6zauQz
         s7wrDKdw8RqIk9GQgQrBuyWmT9Z3xz4gZJo3u8T/aReQHNRczFczjzO2OXujQ7bZpSIK
         X4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753781046; x=1754385846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvMriwwuRsxStr2YyKe5TWPbRI0lQN4j3ZQYt22kpLE=;
        b=o3MdoYnN2NNAq2FuKY/de1uTnsNW9/PXfF35VLgpXdjMbc1zP1R5jYXjpo/bIwBQqC
         wqsscYsUVvtiCalsPUdqUMjbtNj2OFpIs9ojCx9gG2FxaCKxcgQ3HgixYNbnS+e67kw3
         SCct+V2Y3XpfSk5vumEt0K6pISLzO5WK/q46zx8K+ONPxfKnTmTTtsvGB9TwF5Y5PuD0
         gW5pUQD/Z/LPqeuixBbNuWFgQrVpwyB5BNm+AIv0O3F5esE76OyoAyB0y8nKidgX7WEo
         QNfyr241/hpIoP04U3a0NXaYgGrypsQBar1CkvHZ8DtgrZgL4c+ZdtBmQRGd/Z2XwPKn
         8CBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXynHhMkitBlK3HvZqGgFW2lR2IA0VfCve8CLgVTQyxPOCKuIyBzzTx6XZVekf8VjFENlc3MuScj3bA@vger.kernel.org
X-Gm-Message-State: AOJu0YxUzD+5mOYuaCO85HBf+n0UXn+7UUApEEp79BucttKdsvqtmTud
	0+Et7UB+g+Rww9UXgP5IReElEe4jR8T+sXhaMe9PKPclH4j2kHbaTmP1RZnQ/Ibiw2ipCfW3wu3
	aJEJTE+RPfveA2SeLfdsp3X4hcucv3tKa82VlRUW57g==
X-Gm-Gg: ASbGncvolHFGR8mt00rPWl9CxCUqa8ngpMSkUuJ0c5KUiEc3IbrKGU9X+CcVjUkdZVI
	3f5AsHKY7AooKZNr0K1NHDDYJL9hvjoG/H4MJcnagLovXCvPtcjx7JdtVpc0ncqfYITeTAyi/O+
	u8YCbgFN1brdx6oauqMsPIO+cK8grd/MjSQHfhUetK3slJjh9U0One1pUQc2Bi1ioUPr9s0GBRI
	XlHUyOtoCwYUbvQedX3WM/GICBDwhud8Bw52hYCMB66Ww72YQ==
X-Google-Smtp-Source: AGHT+IG4d8eX8f04SwumbDn+t8ORtzgwAVwNB5BHKdmUryIfl8eqxh2e3123W81layXfFQt1IEka9/bpWuzrKar7j3E=
X-Received: by 2002:a05:6512:3a86:b0:553:d910:9334 with SMTP id
 2adb3069b0e04-55b5f4df595mr4041752e87.46.1753781045533; Tue, 29 Jul 2025
 02:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-8-af4db9302de4@linaro.org> <CAHp75VdMmfV=z75K9AmB7GsWV8C1bZPLGi33duTCt+CM79spJg@mail.gmail.com>
In-Reply-To: <CAHp75VdMmfV=z75K9AmB7GsWV8C1bZPLGi33duTCt+CM79spJg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Jul 2025 11:23:54 +0200
X-Gm-Features: Ac12FXwkqCsphx3p10ZENgy5ARM9FowTyJPFq-nwB_5x6uw2mPSH_J_dgheu8yg
Message-ID: <CAMRc=MeEo6p=6Tp5kORi9y5tGNJKrzh0kq7tpe_E=5TasMjgbg@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
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

On Thu, Jul 24, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > struct function_desc is a wrapper around struct pinfunction with an
> > additional void *data pointer. We're working towards reducing the usage
> > of struct function_desc in pinctrl drivers - they should only be create=
d
> > by pinmux core and accessed by drivers using
> > pinmux_generic_get_function().
>
> Any link to the discussion and perhaps an updated in-kernel
> documentation and/or TODO?
>

The discussions happened under v1 and v2 of this series. The "reducing
the usage ..." part refers to the need to avoid memory duplication of
struct pinfunction really but it's a prerequisite.

> > This driver uses the data pointer so in
> > order to stop using struct function_desc, we need to provide an
> > alternative that also wraps the mux mode which is passed to pinctrl cor=
e
> > as user data.
>
> ...
>
> > +struct keembay_pinfunction {
> > +       struct pinfunction func;
> > +       u8 mux_mode;
> > +};
>
> My gut's feeling that this type of construction will be in tons of the
> drivers, perhaps better to provide an alternative like
> struct pinfunction_with_mode {
>   ...

Nah, literally only this one so far. And I bet we could rework it to
avoid it altogether. Your proposal is too specific IMO. Let's cross
that bridge when (if) we get there.

> };
>
> Or even with variadic arguments... (just saying)
>

Oh please no. :)

Bartosz

