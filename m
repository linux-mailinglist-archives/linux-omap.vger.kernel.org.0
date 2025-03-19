Return-Path: <linux-omap+bounces-3457-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48367A68C0B
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 12:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F01143B5865
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 11:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1612561AE;
	Wed, 19 Mar 2025 11:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+qaj8ma"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A785255E53
	for <linux-omap@vger.kernel.org>; Wed, 19 Mar 2025 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742384466; cv=none; b=iz/fQ55pwy6c2qa6fGhmFRrTMVHvhvfC8ZMtJrgxIkIpgzNpolAY0/Tfjw4Z0wcwN8+SNmfSFqvjV44lMhI11GbvVPzCarpzj5i49t9lOQhlSsNTVodene5RuxrpYzflu6fyZXA6rOU2pauBsozIA71S2Wq/l0FjeOd5RJ1ueZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742384466; c=relaxed/simple;
	bh=QN4TukBKcr7GCstePwybtb0ft9vY9vxyq4OwjIpkHrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVylRB25UptKFlZ1QJS6XK/PVzpWl6XTcZF/5HDa0bI1cmxAB933kE/n7CaJOh7VUi09braRPyL5R4aNLNDzMnKadID7ygx9iGonVGh6mm/mpXX+c7R9B0/9JKcPh6gTE1k0+40lrAmuoEJP92S6UnJM2e0YV39hsKi8rw0IlQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V+qaj8ma; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso118503666b.1
        for <linux-omap@vger.kernel.org>; Wed, 19 Mar 2025 04:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742384462; x=1742989262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8MTVrzHn47D07QaIZqTqMn4oOq2XC0e3Is4UWL2ono=;
        b=V+qaj8majjDdDl3HUtX0Pz5hHUyvEEPO8oFQIykMTLjWZZjnOPFUPfjB463wakD4D/
         ZQPxlCl6woS4hg9Jc3M3t15AKavoQGeSVVK/mhabWs9ZDbxOHUh+Oz17l6+goIeDuhVH
         T/9DzAUEjpst491JXCAgSwMHfKzmvafHiGf0HsnnfJH1R8u6/4+4hYB2yI1KmVPrzcIm
         qS6vM4Y4cbB6zXYYwHhcLUPpC7n95iMtTzb4CHGd2iPgnm5K9YTcX3QEaXE0XnhALRVx
         fYDtFjf5lwolfLipriEZ1Y0I0uMmRTPx3SZJ8E8oXZCDXFq3SdORI+hQtRCLt+XA/FT6
         GPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742384462; x=1742989262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8MTVrzHn47D07QaIZqTqMn4oOq2XC0e3Is4UWL2ono=;
        b=q8i1LV0KtSoH17muzJRfzcMs5cGtARrInv6Uz51Xspjt1PNnnwkfVjvf/CpROaN9fS
         1w+6pk+vncF63wC3Da6fqAeV+sa9PFRWrzcMem6hi44U8tWd0yh09QL7pdPOQqDoqum6
         KmUTjwDAekZN3Qq31Ir7rtgpIjUEWIFzaeRI+1mMgWUg0NjjRAjEhsR+qklfF8oIb6X1
         ssMdVmXYg01UeRw05hx8FoVojEfQScdm6V+7w490CsDWn8mwBZbEsdzVSyr3PY2U1k7J
         zzzQ194WO3vwHmhZ8JIyxXlNIrk7oZ9jXFOC3LReJqB68bEC6K62/7dOiDV4WkC/1RVQ
         PGVg==
X-Forwarded-Encrypted: i=1; AJvYcCXb+pYSxeBxEHpaYqvjFOieLW4YxjuxkL41/Ov9G0AzYb0m+NpnreMouCcmeaSLRC8QLlYZU2QjoqJl@vger.kernel.org
X-Gm-Message-State: AOJu0YzYhuESJoR/FfvLF8yW6kUG0lJ0R7mb4Ke5T/v8N7ovOFBO/dsJ
	lKeVFBTAEt4S2VsW/09oqaEzvhv2IrzH6wRnvM0UN5owTriQRVTcXGGDIu/Dhaazq2baBaskArD
	VRHz7nRP8vaKov4oBWvQw7VNUvzz2JrEIAg2wwA==
X-Gm-Gg: ASbGncsA7qrWfuzQsNfEsLCafMUFsKmVdLagLJFpoCmnhgdung7LeEsfjEZWZ4ot9Bd
	a9Zt0F/6BN82xmUgoR/Jjpt7f4PX6XAgafBm6HzPVF1lDdrzatOsL/4rjEPWC6YpGnVgzWMJSmp
	x9mN/Hh3hNuChA92E8dHERp77XEB8=
X-Google-Smtp-Source: AGHT+IG9mKS0iIWb3TO2ivefr79iMICflm2Da/NDX55DveFEcqxff+kn7i1aSb8ulYyq8ga428bcN003oK5dIc0IuVM=
X-Received: by 2002:a17:907:3f17:b0:abf:6bba:9626 with SMTP id
 a640c23a62f3a-ac38f7c6017mr680301066b.12.1742384462329; Wed, 19 Mar 2025
 04:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312121712.1168007-1-ulf.hansson@linaro.org>
 <CAOCHtYjGuw9szeChihrDZ39_2+w5xOverbp6mAjjLjR=QkK1zg@mail.gmail.com>
 <CAPDyKFqPdDjoECXeBqx0P+fpbgVN1g_jWM2fQiH8Mw6HGMSPNA@mail.gmail.com> <20250319035911.GB4957@atomide.com>
In-Reply-To: <20250319035911.GB4957@atomide.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 19 Mar 2025 12:40:24 +0100
X-Gm-Features: AQ5f1JoOnwE3rFuTS8HijWcK8WnN5Pk8S5_GLHE89xJrW0hiLHYLTnkhrSGUYQg
Message-ID: <CAPDyKFpFcL=c2g72tHJUJbKYZqoxZ_puVy+hYMByGRFFN7n=ew@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-omap: Disable MMC_CAP_AGGRESSIVE_PM for eMMC/SD
To: Tony Lindgren <tony@atomide.com>
Cc: Robert Nelson <robertcnelson@gmail.com>, linux-mmc@vger.kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	David Owens <daowens01@gmail.com>, Romain Naour <romain.naour@smile.fr>, 
	Andrei Aldea <andrei@ti.com>, Judith Mendez <jm@ti.com>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Mar 2025 at 04:59, Tony Lindgren <tony@atomide.com> wrote:
>
> * Ulf Hansson <ulf.hansson@linaro.org> [250317 10:51]:
> > On Sun, 16 Mar 2025 at 21:54, Robert Nelson <robertcnelson@gmail.com> w=
rote:
> > >
> > > On Wed, Mar 12, 2025 at 7:17=E2=80=AFAM Ulf Hansson <ulf.hansson@lina=
ro.org> wrote:
> > > >
> > > > We have received reports about cards can become corrupt related to =
the
> > > > aggressive PM support. Let's make a partial revert of the change th=
at
> > > > enabled the feature.
> > > >
> > > > Reported-by: David Owens <daowens01@gmail.com>
> > > > Reported-by: Romain Naour <romain.naour@smile.fr>
> > > > Reported-by: Robert Nelson <robertcnelson@gmail.com>
> > > > Tested-by: Robert Nelson <robertcnelson@gmail.com>
> > > > Fixes: 3edf588e7fe0 ("mmc: sdhci-omap: Allow SDIO card power off an=
d enable aggressive PM")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > ---
> > > >  drivers/mmc/host/sdhci-omap.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci=
-omap.c
> > > > index 54d795205fb4..26a9a8b5682a 100644
> > > > --- a/drivers/mmc/host/sdhci-omap.c
> > > > +++ b/drivers/mmc/host/sdhci-omap.c
> > > > @@ -1339,8 +1339,8 @@ static int sdhci_omap_probe(struct platform_d=
evice *pdev)
> > > >         /* R1B responses is required to properly manage HW busy det=
ection. */
> > > >         mmc->caps |=3D MMC_CAP_NEED_RSP_BUSY;
> > > >
> > > > -       /* Allow card power off and runtime PM for eMMC/SD card dev=
ices */
> > > > -       mmc->caps |=3D MMC_CAP_POWER_OFF_CARD | MMC_CAP_AGGRESSIVE_=
PM;
> > > > +       /*  Enable SDIO card power off. */
> > > > +       mmc->caps |=3D MMC_CAP_POWER_OFF_CARD;
> > > >
> > > >         ret =3D sdhci_setup_host(host);
> > > >         if (ret)
> > > > --
> > > > 2.43.0
> > > >
> > >
> > > Thanks Ulf, i also have this exact revert running on the target in ou=
r
> > > ci farm, i think we should be good.  But I'll validate it in 4 weeks!
> > >
> > > Regards,
> > >
> > > --
> > > Robert Nelson
> > > https://rcn-ee.com/
> >
> > Thanks Robert for helping out!
> >
> > In the meantime I decided to queue this up for next, to allow it to
> > get more testing in linux-next.
>
> Thanks looks good to me too.
>
> Regards,
>
> Tony

Thanks, I have added your Reviewed-by tag too.

Kind regards
Uffe

