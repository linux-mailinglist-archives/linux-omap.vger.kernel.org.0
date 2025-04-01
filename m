Return-Path: <linux-omap+bounces-3521-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBADFA77327
	for <lists+linux-omap@lfdr.de>; Tue,  1 Apr 2025 06:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF7CF7A56BC
	for <lists+linux-omap@lfdr.de>; Tue,  1 Apr 2025 04:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83081D54FE;
	Tue,  1 Apr 2025 04:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="dp/EBO45"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E69C7080D;
	Tue,  1 Apr 2025 04:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480117; cv=none; b=RbF31n8xfK/N5yG/CnSQfmKIVR9TpbMTM2Yb0AYh8LCQIQrjFmCS3n378pirTYKy+vYSN8HxbjyAdC8lHjVMH2ePmmqVLuvenDZ7GV7lJUTcLcGUvpaS4VwiucTdJGb51clhJ+Wh9P4pf/w5Xc67RR4SUKlrPCJCWlkcqLspD4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480117; c=relaxed/simple;
	bh=dUMzR6uQQz/gAz9Cz2o8m2RiVZcRSvvP5TyRxskXtHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmK8vbV+Q0uY5NfobLg0a/AYrtmpoqXD/rSmjlmox9SvbiPQ0g+6ey9BZq3HjnOo02Mv7M/7Mper32pn/cbxbJVSngYHodaQDoND7P0qUkdvwaNHHq2En2hSf4dS8bzOGg+NkPsVOY9Xk2xBJi+i7rGz+xRHUU0MjoYmedQ/amU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=dp/EBO45; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 69FC7604F7;
	Tue,  1 Apr 2025 04:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1743480114;
	bh=dUMzR6uQQz/gAz9Cz2o8m2RiVZcRSvvP5TyRxskXtHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dp/EBO45ODHUh34PH5dO+Nvrve+/R106MsrbmiSXgQlvrLuNn5IdNwtIuEGoZ1qOw
	 3pa1ByqgvEvJwxsBy4YYvsTNUJuvDU/rjPxuJxexcyNPsI+N0QQrJz5plWadfNE4Mo
	 Scf0reS9Rg4jsZnWpbQviKdED77aQS+lInCoStAHvglTrQOrJ2dmfYldwNsm3n11wq
	 cWeCEDg/xj5/pwrGB/K47lZzrK94CboH0tJTNQxbzj8SXiW0bgxN+Kvm2/WeKu/cl1
	 KpE5iVIKayTh6C844pxToCXi2A0FeFmnMjXzMwXdF0JAcOdcXDkKQmciVrbiMVR5wA
	 okE484CKdNq8g==
Date: Tue, 1 Apr 2025 07:00:58 +0300
From: Tony Lindgren <tony@atomide.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Robert Nelson <robertcnelson@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Romain Naour <romain.naour@smile.fr>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	"Aldea, Andrei" <a-aldea@ti.com>, David <daowens01@gmail.com>,
	linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: sdhci-omap: additional PM issue since 5.16
Message-ID: <20250401040058.GH4957@atomide.com>
References: <31717d89-432c-4b77-a974-99f7e6b97f97@gmail.com>
 <9168d127-06a7-46e6-a7a2-f2e60032a50e@gmail.com>
 <b1a369e2-938b-49ed-b743-6562f0bb46f9@smile.fr>
 <CAOCHtYiBFNY9nFjtqsFFpqRKdxUif_fC7MVqZ7cffeD8rLSe2A@mail.gmail.com>
 <CAOCHtYiujoMoPHfSmyTrv_48wUn3TfaoiPEcMFB=V++MZXvuuQ@mail.gmail.com>
 <20250226170614.18a497f0@akair>
 <20250307042822.GE23206@atomide.com>
 <CAPDyKFo-ODVL0JUmeZj5-PgcYwT8Gab6-US9LNSOUGwn_-prPQ@mail.gmail.com>
 <20250320041418.GE4957@atomide.com>
 <CAPDyKFqY-XtVrmXnkYbW+8XZ3eHukMKyG6FKXRh=vz4gmXujEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFqY-XtVrmXnkYbW+8XZ3eHukMKyG6FKXRh=vz4gmXujEQ@mail.gmail.com>

* Ulf Hansson <ulf.hansson@linaro.org> [250320 08:48]:
> On Thu, 20 Mar 2025 at 05:14, Tony Lindgren <tony@atomide.com> wrote:
> >
> > Hi,
> >
> > * Ulf Hansson <ulf.hansson@linaro.org> [250312 11:56]:
> > > On Fri, 7 Mar 2025 at 05:28, Tony Lindgren <tony@atomide.com> wrote:
> > > > Based on the symptoms, it sounds like there might be a missing flush of
> > > > a posted write in the PM runtime suspend/resume path. This could cause
> > > > something in the sequence happen in the wrong order for some of the
> > > > related surrounding resources like power, clocks or interrupts.
> > >
> > > SDIO is entirely different in this regard compared to eMMC/SD. So if
> > > there are no reports of issues I suggest we keep the SDIO part.
> >
> > Hmm just wondering if you have any guesses what causes the eMMC/SD related
> > PM to break?
> >
> > Regards,
> >
> > Tony
> 
> Well, I have recently been looking a bit closer at the runtime PM
> support of the eMMC/SD card. We seem to have some kind of related
> problems [1], but I am not really sure yet.
> 
> That said, I believe I may have found some *potential* issues and I am
> working on a few patches for it (for the mmc core), I will keep you
> and the people in $subject posted. Although, it's not quite clear to
> me, why these problems have turned up at this point and not a lot
> earlier. I have a feeling there is something that I am missing.
> 
> Also note that, if the problems are sdhci/sdhci-omap specific, it
> becomes a bit more difficult for me to help out.
> 
> Luckily, it seems like David shared a pretty simple script with us,
> which should reproduce the problem in just a few minutes. There are
> also debugfs and the runtime PM-sysfs interface one can use to play
> with the behaviour of MMC_CAP_AGGRESSIVE_PM.

OK thanks for the description. AFAIK this is issue has not been happening
with the eMMC and the old mmc-omap-hs driver. Sounds like the issue might
be also eMMC specific.

Regards,

Tony

> [1]
> https://bugzilla.kernel.org/show_bug.cgi?id=218821
> https://lore.kernel.org/all/CAPDyKFq4-fL3oHeT9phThWQJqzicKeA447WBJUbtcKPhdZ2d1A@mail.gmail.com/T/

