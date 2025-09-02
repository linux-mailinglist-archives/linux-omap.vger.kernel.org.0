Return-Path: <linux-omap+bounces-4472-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A29B403C0
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 15:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D7A8482316
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 13:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5AD326D53;
	Tue,  2 Sep 2025 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oSx6kIYn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A839731DD83
	for <linux-omap@vger.kernel.org>; Tue,  2 Sep 2025 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819854; cv=none; b=gIpctq33TgM5Rbg0Cc6TKSyQk1dEAFhCmmhANgNc2aDbidVhWfmS5/VOeCuGRMlxhtuJCdz14uX5Ygnscr+vXVhAYD9b0OsGlEq7v3KQNsJflUhaOsgWtHGs6UkYMwq6At6s9DY+KDaT2dI/dwLhtGoLBk6ewq4+EAJzRiRzXQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819854; c=relaxed/simple;
	bh=OnwD5QXlkWRXkwweSWm2YbRhyhJnp/UrnZINov1baPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptcB3hKx3jKuaLUeF78VUge6oBtCqN8pMsu7U93GilOk0jfLaSJTn5pLjPOrCKnb+4bRFSolLdG+Mw0wYbFyD0eBNUoZs4022zOozwhxrKZVghNB9/hplWHehTbpLE/ON3i4nJ30IJ2YJupFl+IRtB6dTV6eHBy3wWXse+dE1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oSx6kIYn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f646b1db8so5111551e87.0
        for <linux-omap@vger.kernel.org>; Tue, 02 Sep 2025 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819851; x=1757424651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZhR5vC+b5jGByrsGl+I17mSTr+5gAmJbDumtIuc2ZA=;
        b=oSx6kIYnxTc4ce01XQdS97dHxSBJKFsS51gCgcViELkkIwWqV/G2fco58SnjNs49Pv
         JeUzY5hNY+EEphjDs00DvHnyLamO2HJU2/cPZT2O9EwEXQeUpC8X0+oUTDWnNtjqQVQe
         46XR6p7LyBgmKVd/m1rmJgtKo7VL2uT/yb4P4nzuEL88f4bz0xt7Pi+wNjVBkT5KKdbr
         n5686Wy1/ivZr1opV3gkwC96pi3LrgMumjJM2Pc1GHnlw9v9fRFXdXcND4fexD6gyV/M
         FdtCCDQ2ECS2XLK1jOKNrP0rsM5v0y+fS4KBIhfPIeOJjMGM4pWsI9WXPLGOr4UEbuLK
         R9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819851; x=1757424651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZhR5vC+b5jGByrsGl+I17mSTr+5gAmJbDumtIuc2ZA=;
        b=MKv1iOiloc5kQ8lJxANxmyqv2ssRUv141Nnd9ghmFQfTXmfB1xO8EdFtNAi2ZI3mT0
         qTmXuqdDpKbPBdxwLoCfB7ioNI1VqYFDQP8yaT/OcXAQbO5ewe4MN6ZccpBY561S6dOk
         WJOk4pNSuoE3MWZpqAuwGLMWEPRVVLyrlpmBK8LHwihJuMMu5TgpZLYvgsuyKLfQfTq2
         r517GAvv2bZakKMY5CrgVCX8vHc88peAxbrjLQPsuTlWygUtR90xXYSwrB5zTE4EIFao
         riyKBvSlpDtoGcRPT+d9hWXXl13I1KONKbA+gcMEu1BC6GI4CJgSYwGU31mTHiX7GQyd
         8Q9w==
X-Forwarded-Encrypted: i=1; AJvYcCX/lX6mwPZ8GgrXDm8sKIkvLajOb5zgRjPah+QiaoeFJu+KM+WuwzqmtQZgTdrZk4hbo33iXcDDriyA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9BuL5pYUvb7m0DHR7siwB1KsHTynp41vDHRX3V/vJPR2iIZtS
	5Y57PyCR9eQuuZ25qx35bFNDs/Z+UfsjlQzvj4uPcHF9T0/2CC64INZITQKSdXVy31cuJeG0TdW
	xZC49e2XGTcTcGtNPV8+DRlmsObhcFc8hDImBOYxY+w==
X-Gm-Gg: ASbGncs1UNis2fidB0szMiG4/qdhOfyexdqg2hwFQNWwbOmX4RjlTrH7KSKsvJIcdxI
	xGYrAwCK1Rv2bE+ZMuOW1f9xSD8yq43NCgMUvMJv0smFvJ1V8iOLyc6YKxkO2kAUOYzDs//pwPs
	zwSsqNTmzcujeOiiT8+V8CcpFMw5EENlBj8CSCM64vIYYj7uOlJWO013FeLFzmOxAoA+mXvG5pP
	zSbxFts43SU/Hx8ZXuxUXfom+l5uAJIbdXGerQ=
X-Google-Smtp-Source: AGHT+IETXrXrPtCI9kHaUsOk3PiYBtzLQDyO5BpniBUPpd4tNEA5zWWpm33Zl8pshGOfywjYNp9sGHw+kB/41Th8Wwg=
X-Received: by 2002:a05:6512:2522:b0:55f:4429:15a6 with SMTP id
 2adb3069b0e04-55f70967db8mr4302395e87.48.1756819849325; Tue, 02 Sep 2025
 06:30:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-8-bb091daedc52@linaro.org> <aLbsr4s7nfvCKLnd@smile.fi.intel.com>
In-Reply-To: <aLbsr4s7nfvCKLnd@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:30:38 +0200
X-Gm-Features: Ac12FXwa7a499RP9JirYFVy7SbY2WfOVu2ugSGxCUkawbutvsj6hahPNBLiFvFg
Message-ID: <CAMRc=MfgXac4kRgeiw+SkNUZS_ThoX5qcXeRX5bPWm-t3JQ9Xg@mail.gmail.com>
Subject: Re: [PATCH v7 08/16] pinctrl: keembay: release allocated memory in
 detach path
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 3:10=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:17PM +0200, Bartosz Golaszewski wrote:
> >
> > Unlike all the other allocations in this driver, the memory for storing
> > the pin function descriptions allocated with kcalloc() and later resize=
d
> > with krealloc() is never freed. Use devres like elsewhere to handle
> > that. While at it - replace krealloc() with more suitable
> > devm_krealloc_array().
>
> With that in mind...
>
> > Note: the logic in this module is pretty convoluted and could probably
> > use some revisiting, we should probably be able to calculate the exact
> > amount of memory needed in advance or even skip the allocation
> > altogether and just add each function to the radix tree separately.
>
> ...
>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>

Ah, I just ran b4 trailers -u and didn't check the result. :(

> This tag is not applicable to all patches, I do not believe this has been
> tested.
>
> ...
>
> > -     keembay_funcs =3D kcalloc(kpc->npins * 8, sizeof(*keembay_funcs),=
 GFP_KERNEL);
> > +     keembay_funcs =3D devm_kcalloc(kpc->dev, kpc->npins * 8,
>
> ...switching to size_mul() also adds more robustness against too big npin=
s
> values.
>

Eh... ok, if there'll be a v8.

Bart

> > +                                  sizeof(*keembay_funcs), GFP_KERNEL);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

