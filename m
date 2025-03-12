Return-Path: <linux-omap+bounces-3377-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D62A5DC15
	for <lists+linux-omap@lfdr.de>; Wed, 12 Mar 2025 12:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39361189E314
	for <lists+linux-omap@lfdr.de>; Wed, 12 Mar 2025 11:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AE424418D;
	Wed, 12 Mar 2025 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kjz2KWnh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2B243947
	for <linux-omap@vger.kernel.org>; Wed, 12 Mar 2025 11:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741780591; cv=none; b=tgxyHpC1XD7VMRZXh/mjaq7pDSiPpLleA59WWINsB/I4z4q5Y1me4kCzLGqJVSGo9p+rNLYHSRk23kTpWipD5E1bdLXM30NyQjjxFsKoB2T1nffYGLboGtKsN8yokvy8O+efXeKIMl8SiCB5V+98uHHxU0LbxYE1J1XgjDg5S04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741780591; c=relaxed/simple;
	bh=8gw1vVwPGuY8kyjufKSWPJXTHl93QcoZA59F0+eLung=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e19Oxj2a88ZiPZ6Nv9/yFf1f82lj7VXu632iwMHsXMteVAeZqKg6GYnPQEFxTu5ZSldhpD4gYkEWCjRSlvqYMAThBRSxS4NGNF7zw3XSnrUJsvhWjj19N9oMmj7g8z3J4kVZ70BurC+9mUkMUR3Qs5Saq+yAjZ5FHCeA7y7Haec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kjz2KWnh; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ef7c9e9592so55765927b3.1
        for <linux-omap@vger.kernel.org>; Wed, 12 Mar 2025 04:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741780588; x=1742385388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gw1vVwPGuY8kyjufKSWPJXTHl93QcoZA59F0+eLung=;
        b=kjz2KWnh9hOOYNxSjocVbJTXRnAgYr1L1Y8LMAxlleoxKsNrSuHko19dtjsa/Yk1aS
         yC41QPZ/n38Wzv5zekpIqHFPjSZ7V7mi3rxn2N2+hucRJThp1hSxtnvn2Onj9JXg4DLa
         uXzQAgBkveouqawo9rvX/2+apIv4JmNKsx/DuWP2SNzWYki+oaxhye5NM3KyzVafNC9c
         l6csjYQU7SAOdsM1bJwExRtxuGybhguWMpvTlIAhHH92RCSCk8E2V5kheU5N5NF5KufS
         JmwVxQo59iH+fv138wJ43ORvyNNFHfNw9xBKrNA0zr7RrodKMnKXAl2ig7+yFvuBZThL
         6U+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741780588; x=1742385388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gw1vVwPGuY8kyjufKSWPJXTHl93QcoZA59F0+eLung=;
        b=oC6zoU+FnzaGIB4JO3ervfkSimxgStg4+X4fGJbHw4yVQprLvcKvlTcBecPEhf+m4q
         wYbXQdFLiJumKFI4qNRKP/xd650Bm4c1H1p8PKcIX++KwqZKmuvHMetrbO5KboJQuNWP
         561hYpg+WdN7wt4yDr+J2hs8SVC/S5JcIIqwLowpsWQIkHF6eY8ZcDiNwT9T1WBZlZOr
         gAUKGx8WZ+oHjBWGPj1McJAVbnvFyfLlATxNAw2oEVdYna3a94fngPbC/ym6BI+3oY6p
         3rp3ZBQ0Y2eXt68ZUTaZJwvl8eu4XuaPPwhb6ttpNoq0JHyTm6MNeSTxb0coYOND4VSE
         T5ww==
X-Forwarded-Encrypted: i=1; AJvYcCX55L3XIL5ssvM+odYDiYTPPyZX0gp/bmxYlUyjykvdrzYDigpwO5z1C9uMqHwQ9hp9gEzGXagL97ih@vger.kernel.org
X-Gm-Message-State: AOJu0YyAXM/xwvGkL+hZi2wXdnTZBc2s/FpI7hmTY3Gwd62NY/eQcJDg
	e+HFK4CgcbXx65TmblJerO+ti5E+JOvpjBK3ihC7S7N4T51JKx7R1TKascaUrx77RzwHsZ08k+q
	rZcKgFWWExreChpLrgJF/8vISNG+JO8rIQ+8Lpg==
X-Gm-Gg: ASbGncvfGv6Ar5pCBAbcRi+WuFn233OFRsIrIpTysMjn8nDR233V6953bNISi4wtDbY
	xPPLt83ZhL291Uz4TRpyXRSVyBdhUOKtAmMB+Y24x8x7LYA3U5MD8+MhY5jFdCJBtCklO0ujNiR
	LiCptJ6tcj/oNc+E2qKiX8AO6038w=
X-Google-Smtp-Source: AGHT+IFhdtyASgBjgSeabbB5ub+Jpk4OA6+GGQx9A5TlYg1fa0XNR7Fe1HMS4YVD0oiQlbV+dppYmT4Lb1S0zAt1nyQ=
X-Received: by 2002:a05:690c:4441:b0:6fd:4718:9bde with SMTP id
 00721157ae682-6febf2d84c2mr262093277b3.9.1741780588293; Wed, 12 Mar 2025
 04:56:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
 <f6732c49-a5b1-4a13-b9f6-c2d552b5e7e8@smile.fr> <31717d89-432c-4b77-a974-99f7e6b97f97@gmail.com>
 <9168d127-06a7-46e6-a7a2-f2e60032a50e@gmail.com> <b1a369e2-938b-49ed-b743-6562f0bb46f9@smile.fr>
 <CAOCHtYiBFNY9nFjtqsFFpqRKdxUif_fC7MVqZ7cffeD8rLSe2A@mail.gmail.com>
 <CAOCHtYiujoMoPHfSmyTrv_48wUn3TfaoiPEcMFB=V++MZXvuuQ@mail.gmail.com>
 <20250226170614.18a497f0@akair> <20250307042822.GE23206@atomide.com>
In-Reply-To: <20250307042822.GE23206@atomide.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:55:52 +0100
X-Gm-Features: AQ5f1JopWLOeYGYCz_4MrDz2D-Dvj3jAOEGRd0VjfRR07Fg7DNOJPsGHxfVHElc
Message-ID: <CAPDyKFo-ODVL0JUmeZj5-PgcYwT8Gab6-US9LNSOUGwn_-prPQ@mail.gmail.com>
Subject: Re: sdhci-omap: additional PM issue since 5.16
To: Robert Nelson <robertcnelson@gmail.com>, Tony Lindgren <tony@atomide.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Romain Naour <romain.naour@smile.fr>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Jason Kridner <jkridner@beagleboard.org>, 
	"Aldea, Andrei" <a-aldea@ti.com>, David <daowens01@gmail.com>, linux-omap@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Mar 2025 at 05:28, Tony Lindgren <tony@atomide.com> wrote:
>
> * Andreas Kemnade <andreas@kemnade.info> [250226 16:06]:
> > Am Wed, 26 Feb 2025 09:36:40 -0600
> > schrieb Robert Nelson <robertcnelson@gmail.com>:
> >
> > > On Mon, Jan 27, 2025 at 3:20=E2=80=AFPM Robert Nelson <robertcnelson@=
gmail.com> wrote:
> > > >
> > > > > Thanks for testing.
> > > > >
> > > > > I'm able to reproduce the issue locally (using a kernel 6.1.112).
> > > > > It fail after the first sleep 20...
> > > > >
> > > > > If I remove MMC_CAP_AGGRESSIVE_PM from the sdhci-omap driver the =
issue is gone.
> > > > >
> > > > > About sdhci-omap driver, It's one of the only few enabling
> > > > > MMC_CAP_AGGRESSIVE_PM. I recently switched to a new project using=
 a newer SoC
> > > > > but the eMMC driver doesn't event set MMC_CAP_AGGRESSIVE_PM.
> > > > >
> > > > > I'm wondering if MMC_CAP_AGGRESSIVE_PM is really safe (or compati=
ble) for
> > > > > HS200/HS400 eMMC speed. Indeed, MMC_CAP_AGGRESSIVE_PM has been ad=
ded to
> > > > > sdhci-omap driver to support SDIO WLAN device PM [1].
> > > > >
> > > > > I've found another similar report on the Beaglebone-black (AM335x=
 SoC) [2].
> > > > >
> > > > > It seems the MMC_CAP_AGGRESSIVE_PM feature should only be enabled=
 to SDIO cards.
> > > >
> > > > We've been chasing this Bug in BeagleLand for a while. Had Kingston
> > > > run it thru their hardware debuggers.. On the BBB, once the eMMC is
> > > > suspended during idle, the proper 'wakeup' cmd is NOT sent over,
> > > > instead it forces a full reset. Eventually this kills the eMMC. Bee=
n
> > > > playing with this same revert for a day or so, with my personal set=
up,
> > > > it takes 3-4 Weeks (at idle every day) for it to finally die.. So i
> > > > won't be able to verify this 'really' fixes it till next month..
> > >
> > > Okay, it survived 4 weeks.. We really need to revert:
> > > 3edf588e7fe00e90d1dc7fb9e599861b2c2cf442
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D3edf588e7fe00e90d1dc7fb9e599861b2c2cf442
> > >
> > > On every stable kernel back to v6.1.x, this commit is `killing`
> > > Kingston eMMC's on BeagleBone Black's in under 21 days.
> > >
> > > By reverting the commit, I finally have a board that's survived the 3
> > > week timeline, (and a week more) with no issues.
> > >
> > Is there any simple way to restrain it to only sdio devices to go
> > forward a bit?
>
> Best to revert the patch first until the issue has been fixed.
>
> Based on the symptoms, it sounds like there might be a missing flush of
> a posted write in the PM runtime suspend/resume path. This could cause
> something in the sequence happen in the wrong order for some of the
> related surrounding resources like power, clocks or interrupts.

SDIO is entirely different in this regard compared to eMMC/SD. So if
there are no reports of issues I suggest we keep the SDIO part.

Let me help out and cook a patch for this. I send it out in a few minutes.

>
> Regards,
>
> Tony

Kind regards
Uffe

