Return-Path: <linux-omap+bounces-4438-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F149BB3E4A1
	for <lists+linux-omap@lfdr.de>; Mon,  1 Sep 2025 15:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3FB91A803FC
	for <lists+linux-omap@lfdr.de>; Mon,  1 Sep 2025 13:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901B82FFDDA;
	Mon,  1 Sep 2025 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NXqh/pNg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571B0277026
	for <linux-omap@vger.kernel.org>; Mon,  1 Sep 2025 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756732859; cv=none; b=PJGbJWOEtkltTqtfDcPA9VVLMQa+0/iYzSoam9DEG2Xr15vfQC7/XsXwd3mbcBbV5jc9fYOe72mMBMJIkVTbJktJl6NEcEGpoxTUaxK9Fj2skO1FaCFuG+N/cRmtbwfRwzaI+2jhwzSf+uDNke+lBpCTECWQ+ba0G3vM9Sz5ZgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756732859; c=relaxed/simple;
	bh=+FzHD6P3GIG+WbvurBqu4eNuHXM1ihNGPdVL0Rl46EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYr0+VPU+G37r+xMs7ArdU1X3b43c2KOipxEcSrxqqua5THUwzOAyIob0dWFXElKe7lwEcMDrf0jKkjwY1LeI+XOXLemICrlLTIudEFzq2xLP4i3zZoMbiNdhdOopcqbKdPuHEFeSRFLnccWpkJcilALgdVFfMPWjndKo5yUkiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NXqh/pNg; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso3209695e87.0
        for <linux-omap@vger.kernel.org>; Mon, 01 Sep 2025 06:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756732855; x=1757337655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ApJifxHePLgmXB9tTWAWedH0XfL5fOO8paxsOA3xkw=;
        b=NXqh/pNgFvdh9534gdG5el6/ZagbcM4qdqFZr+bWDTOqlYOI7PzxLWNJpKAk0Jgw1o
         s0tv+sMZ1fZfMi3cl0T8CdMrzwyvldKPomK1W+l9cLLBhtRBFqMYxk+MIhqu352PH1FT
         PBoChcd91xX7UCHGjfj9JfHSxJGjH+w1vA2E39gFTUVFDLhItLGeT/Pfj5lTzSy+u+L+
         OZz2VDGzuqaMeTUlrGP0aZEP6BDnjizjkuyz4hPpPspV1+PUkkfcCcSBLyrjgJDaT80r
         /+xEWKIfUPKJMg4uwzkVzJBqSKLL4VEHXvCwu4IaATXnNwATlNbZ01/S335v8zUvalv5
         AMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756732855; x=1757337655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ApJifxHePLgmXB9tTWAWedH0XfL5fOO8paxsOA3xkw=;
        b=eaw3cZY2JpQdozU21NcVQI7Cl8pdMoes42lG/hZmfk/7IFiLp63J8eHB1zXa0+N5DV
         7A1BZsUa2+KJCjS6cgJjzugK+9x6knzhMQXlS/gC8losse7fckp1+bypOOvaXCE8OKOG
         MvIPkrX8Z1lbANdMW7PJ92s+UresSVDPB7UOSqqHGaawF3clZGXHiEI6wVMb59ORuwGt
         MVcIMa3TyB/6Y7etKzEPFlouIv+7dsVofTU0/ZdsWt174dSOclAEk9EVn08n9WCV4Uo+
         HjTdt544oHkyDwlUI/KqXQT78KsLlwSJhLtGo7h5Cieva+eEc693NiCn5y3jUGQ5wPL9
         55zg==
X-Forwarded-Encrypted: i=1; AJvYcCVrMcMoD4f8xYco0x+GuzBlDr0S4n311M9rf8cktcLXHL9QCQoZuHhXfW4c3mMvVnQXJj2/T3IsAWFU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/+SxDbJaCz79MCGm7MfMySGdQ+QVdgpkB53gNbGRXQvuHy/NC
	U37Fb4l3LxsuuHP/nXtHbzwLHBxy5qNDbjKhy80KCDBdIdUN0PlexLO8huUry9affypWr5vgdwh
	1Kx32Y8bKO5bbhJtRHJPI9sngf7UZdowx5JQGEibwhA==
X-Gm-Gg: ASbGncvJ/j9EQoKb9vIVJ3JTtoAf4MnCrmzUY0vgrgpcyswnnkC19TdNaPdFL0nFyH2
	puORaPrOTYzpoMPaoh8vriofXsGFbmmZQlTHiG0jClRN6jfQFwSkK8kPw0Ry+DlP488/9S0awZf
	5olrO4ZOpjgwsZiW9jYqC0ZqVSKmR/nTZXqmyi4fKfTxnaerbdazcQBJXMMZMBJ3vj+6keWFIv2
	ijiUXRc9bwohS8leunVjEQkFv/ryLeJR6FXJeg=
X-Google-Smtp-Source: AGHT+IH912XrSXzjBk2qT9512Zc2BnDvh2hCyUh1tIL/e/b5XAWzm9U6VOUb2k8kMnjWcaLf9C4w4UWLuNtsABXzYyY=
X-Received: by 2002:a05:6512:2513:b0:55f:4016:ad2b with SMTP id
 2adb3069b0e04-55f708eae52mr2361617e87.30.1756732855435; Mon, 01 Sep 2025
 06:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org> <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk>
In-Reply-To: <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Sep 2025 15:20:44 +0200
X-Gm-Features: Ac12FXxw4k3UY5TBARAefSnKyhMDuDCBaUNs2qyNKYW8yrbkHP8etuyQPhIAuGM
Message-ID: <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Mark Brown <broonie@kernel.org>
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 2:07=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Aug 28, 2025 at 06:00:14PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The radix tree containing pin function descriptors should not be
> > accessed directly by drivers. There are dedicated functions for it. I
> > suppose this driver does it so that the memory containing the function
> > description is not duplicated but we're going to address that shortly s=
o
> > convert it to using generic pinctrl APIs.
>
> This is still failing for me:
>
> [    0.628221] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000000
> [    0.636506] Mem abort info:
>
> ...
>
> [    0.801855]  __pi_strcmp+0x20/0x140 (P)
> [    0.805704]  pinmux_generic_add_pinfunction+0x28/0xe0
> [    0.810777]  imx_pinctrl_parse_functions.isra.0+0xf8/0x4a0
> [    0.816289]  imx_pinctrl_probe+0x404/0x520
>
> Full log:
>
>    https://lava.sirena.org.uk/scheduler/job/1758025#L704

That's not a lot of info but it fails in strcmp() which - I suppose -
is the one in pinmux_func_name_to_selector(). Any chance you could
check what the value of np->name is in imx_pinctrl_parse_functions()?
Is it NULL for some reason?

Bart

