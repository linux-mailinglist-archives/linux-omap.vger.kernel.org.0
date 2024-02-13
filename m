Return-Path: <linux-omap+bounces-559-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 256D98530CF
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 13:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CD92B242AF
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 12:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BD342076;
	Tue, 13 Feb 2024 12:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daUUPPrn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4B540BFE;
	Tue, 13 Feb 2024 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828216; cv=none; b=W2vyglrrDDA2xzbqX8caguOVEMhn4/59GgtEslNYTgxdcrVk/JUQZH6QAo2YPV9NPyvkkGr2lzcjFayTrEOMQc21keogNqe4znnYOe7BKLgCp1DZpUhY+HiHSJ8tyhWLhmh2rmKC7zgaQMOY1oJftz89oJKpNVDCHHaE0seUIEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828216; c=relaxed/simple;
	bh=0wlm9P6o2rcc8cvXXNEmo3T+AzJDgfB1248ymcMTdJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUDOfVVSzoe8Rb0skmJoGDfZSMzJPkOY1jGeTN14w/YKibHZzkYyTL+kJH1vimTypGg5nAGjVyHsPBuIcCoFNFoUm7nnhBNjoyXjzOOhGGMpF17WPubLxlfK3PK2NUgHTfPz1euprnYfkzw0MCz3wuAGNbkLMPl44N92m92BoAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daUUPPrn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-296dcd75be7so2505533a91.2;
        Tue, 13 Feb 2024 04:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707828214; x=1708433014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGu4HZdxVpF5D7HwjpFTQqfuRoTuDC9uByiyLARYoUk=;
        b=daUUPPrn6EFKZL3baC9+lvuq73ZzPyDuiVJHORrwp7rRlGun/QLWRPJRrdYqF8jpYS
         /Dpb1asGezIQVZHj/h0Sz0MdK4bcQXUnpo26V8d4W6f1FMGn6AAehSGFr2iOVFX/sDl5
         dutBSJsw3B1dwiBLGK5TD+K0M6GOB4MwJHTiY7V6Vb4sHmBFwcOPAW9853xmt8MM8ikA
         q0ZQ6CEO+YKN+eL5it5QdQdjiu36c5kSXhhBQx+mQTwchqtD709Hnw1BWX9ZMI1dl37g
         xnYRBnrKC9ia6T4VVIx8qKjbL2o4hJHhLlMOITop5AV46znVLnL27bX1nkyhxgZtMyVs
         rAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707828214; x=1708433014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGu4HZdxVpF5D7HwjpFTQqfuRoTuDC9uByiyLARYoUk=;
        b=D0Hf4T/fCa0RcQ8qJpekEpal6Rj9ntSLBVrPLVPPTAywANBiCIaxeQgFs3NNBj2B6S
         3dcTYVyqEtHJXGmT7LH5XOWTGKmDuNJN5TRzd9iQgVv0IafS93vW0Z685UlcZzj++LIL
         fNNnZRPpOERoqHu1j61PnrA1j/M8M7ZpxhOR3s4S2avvI+phhP9fFaQw4Sdfnkvph70n
         /bbIuqcHbkNgH4RGbk3JLuqIjDflyzHU6S3IcpgUuyl/y5v4/NkwD1bvSj+YVQ6RY3ek
         3c3xN6hvOhcruKhUdccdXTkBU6g5uIGLYbaMtjnvi7B5AYrquwlIWMnDf1Hemt8bizrw
         gXxw==
X-Forwarded-Encrypted: i=1; AJvYcCW5VvE0jI0ykpX7WoQhDZBgKZtnDDN5AkBAwCH3ssYRkPlJkJMV55/Fw83Tz8aPJK9QAkcRI2y7C09E4VRywBDNCwjXeJ/ecK0ShDlbB5CGe0JGFItgC2qAUHOw5CBH3HbbAHAaZw==
X-Gm-Message-State: AOJu0Yzcm5Pbf0SRI1qfeNfBsjVy9RyclMdqvxdwC01SmD8UKIQ/N+A4
	p7QICBOUu77CNekHb2r1mIZ05MOv6kJMQCreqWAoyxS/fJjSXHaI/uIPs+WNwb8oklq5EhScLJd
	D5OlcJ01q15II/2Y+22p8/SRx4gY=
X-Google-Smtp-Source: AGHT+IEvwLuTvI7eqv7o0o8h1JeDHkpff30o3UN9EqA2G2k0i/Qt1291dW3Jv6fDor546AYO6APmSwRTLZweFkK86B0=
X-Received: by 2002:a17:90a:a010:b0:296:2057:28c with SMTP id
 q16-20020a17090aa01000b002962057028cmr5839952pjp.31.1707828213714; Tue, 13
 Feb 2024 04:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129111733.GX5185@atomide.com> <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
 <7d72f3ee-bcfe-4197-b492-857dc49b2788@smile.fr> <20240131103050.GZ5185@atomide.com>
 <519f7e2e-4df2-4b3c-90e2-2383b6b34562@smile.fr> <20240202043601.GA5185@atomide.com>
 <6eced20a-6454-4824-a149-ee331ebb7eec@smile.fr> <CAHCN7xLUH7Qj_djEuMDAx2nNVqtS5WyoM_DN4zarCbmKh=te4Q@mail.gmail.com>
 <20240212072740.GC52537@atomide.com> <CAHCN7xJZXVXxiwBXgGKhGmBQhCAFfa4Tn=tJcGLX3N==tgvFzQ@mail.gmail.com>
 <20240213060302.GD52537@atomide.com>
In-Reply-To: <20240213060302.GD52537@atomide.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 13 Feb 2024 06:43:22 -0600
Message-ID: <CAHCN7x+Uswxzj3eTf1_9oqso0fpdVR5QHNQkd59zHSqx5CyeCw@mail.gmail.com>
Subject: Re: sdhci-omap: issues with PM features since 5.16
To: Tony Lindgren <tony@atomide.com>
Cc: Romain Naour <romain.naour@smile.fr>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Nishanth Menon <nm@ti.com>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 12:03=E2=80=AFAM Tony Lindgren <tony@atomide.com> w=
rote:
>
> * Adam Ford <aford173@gmail.com> [240212 13:24]:
> > On Mon, Feb 12, 2024 at 1:28=E2=80=AFAM Tony Lindgren <tony@atomide.com=
> wrote:
> > >
> > > * Adam Ford <aford173@gmail.com> [240208 12:57]:
> > > > I was testing the newer MMC driver on an AM3517 a few months ago, a=
nd
> > > > I noticed that SD cards were returning weird or empty data after so=
me
> > > > indeterminate amount of time.  If I read the IOS file immediately
> > > > after boot, it worked.  If I forced some sort of file IO, it might
> > > > work, but after it went idle, it appeared to have strange data.  I
> > > > don't think this bug is limited to one platform.
> > >
> > > OK interesting. So the zero values for ios are expected when the card
> > > is idle. What do you mean by weird values when idle?
> >
> > I meant zero-values when I said weird.  It's weird to me, because
> > other platforms don't return zero.
> > If tha's normal, I'll likely submit an update to omap3.dtsi to migrate
> > the MMC driver to the newer one.
> > I'd been meaning to do that for a while, but this threw me off, then i
> > forgot about it until I saw this thread.
>
> Yes I'd like to enable sdhci-omap and deprecate omap_hsmmc too.
>
> Assuming no issues and if the hs200 issue is a separate issue, maybe
> post the patches and then let's get some Tested-by for them before we
> put them into Linux next.

I just sent a patch against omap3.dtsi.
I am not sure how to handle the backwards compatible device tree breakage.

Maybe since it's been around long enough, it might be ok.

adam
>
> > > Can you please try catch the weird values or a failure maybe with
> > > something like:
> > >
> > > while true; do
> > >       cat /sys/kernel/debug/mmc0/ios
> > >       fdisk -l /dev/mmcblk0
> > >       cat /sys/kernel/debug/mmc0/ios
> > >       sleep 20
> > > done
> >
> > It appears the first time, that runs after fdisk, the values seems
> > reasonable, but subsequent iterations, the values are zero again:
>
> Seems expected to me. Before fdisk -l the mmc controller may have
> autoidled showing mostly zero values, and after any access to the mmc
> card the card is enabled and the values are the normal enabled values.
>
> If, however, fdisk -l does not work, or the values right after fdisk -l
> are mostly zero, then that would indicate a problem. I guess leaving
> out the reading of ios before fdisk -l would make it easier to see.
>
> Regards,
>
> Tony

