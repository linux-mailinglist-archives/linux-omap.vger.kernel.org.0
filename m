Return-Path: <linux-omap+bounces-3438-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E761A68409
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 04:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4572D189DFA6
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 03:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C999324EAB1;
	Wed, 19 Mar 2025 03:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="YyM/B78G"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A281D21324D;
	Wed, 19 Mar 2025 03:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742356781; cv=none; b=AfokkCQnye/12RiiLhiuneq6OpKobqGoV2qEcWhxQxgFzaC8AmzZXMtakJn6zimZjBdoMy1vpk0xkt3ISxoHcLHetcIea8p99YP0iDdggeKFJcQ2lefk4EcvPxPsOqexAlvU3nlNBT5xfZsH4piN8injftfR63veiMGAbbAqoeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742356781; c=relaxed/simple;
	bh=DgAPiSKYMiegwOXBfr9LT1fSR0n9A/vD3GZjzsXCD94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aY84rJYZVj1K0S0i7AkMlNamRHKBvqEK783zJv3hFQ8MpnDw6uY6G6NGqiJR1/6apLKHeMtPUoQRH1KTSQqU1oVWuo5c8tSAmI+Mup3lfwgxcEiILqdQx6YsjjmQpjZSFX9S2kpPpTNfcORZDCw4wRKS0tRkbufj3JRqbYHY1Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=YyM/B78G; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 42B23603EE;
	Wed, 19 Mar 2025 03:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1742356778;
	bh=DgAPiSKYMiegwOXBfr9LT1fSR0n9A/vD3GZjzsXCD94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YyM/B78Gw7Fn9o386HkL520wljBLIILUsJ+V4RF63Mcqb5vOX3NW8jF7xoICn3gBl
	 9QJmxHOOhcdYPW2OTEqp6uOpSi59dnD1nFnwNwJ3EQsCyuk9gECINg6se+pnbwzAKP
	 MmgeQGKGVJh/SJctXp+KZoLqbV8arm4GQeEvxOPQO66A6FIIyDWVpskxGZ2psAD7tj
	 QiuHT6IKxR1tsGkiXfyAxbeLMWycby2uQuAvZ366UNJrYzKnFYqReVDJH0qGMlLERP
	 UqiJ7zgciMypV38k2oeBosnEikYKuvfTIY4W3n8xZU7AybJNCqe0di6yRdvwpwQhpq
	 XaCderVmNq4Yg==
Date: Wed, 19 Mar 2025 05:59:11 +0200
From: Tony Lindgren <tony@atomide.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	David Owens <daowens01@gmail.com>,
	Romain Naour <romain.naour@smile.fr>, Andrei Aldea <andrei@ti.com>,
	Judith Mendez <jm@ti.com>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mmc: sdhci-omap: Disable MMC_CAP_AGGRESSIVE_PM for
 eMMC/SD
Message-ID: <20250319035911.GB4957@atomide.com>
References: <20250312121712.1168007-1-ulf.hansson@linaro.org>
 <CAOCHtYjGuw9szeChihrDZ39_2+w5xOverbp6mAjjLjR=QkK1zg@mail.gmail.com>
 <CAPDyKFqPdDjoECXeBqx0P+fpbgVN1g_jWM2fQiH8Mw6HGMSPNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFqPdDjoECXeBqx0P+fpbgVN1g_jWM2fQiH8Mw6HGMSPNA@mail.gmail.com>

* Ulf Hansson <ulf.hansson@linaro.org> [250317 10:51]:
> On Sun, 16 Mar 2025 at 21:54, Robert Nelson <robertcnelson@gmail.com> wrote:
> >
> > On Wed, Mar 12, 2025 at 7:17 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > We have received reports about cards can become corrupt related to the
> > > aggressive PM support. Let's make a partial revert of the change that
> > > enabled the feature.
> > >
> > > Reported-by: David Owens <daowens01@gmail.com>
> > > Reported-by: Romain Naour <romain.naour@smile.fr>
> > > Reported-by: Robert Nelson <robertcnelson@gmail.com>
> > > Tested-by: Robert Nelson <robertcnelson@gmail.com>
> > > Fixes: 3edf588e7fe0 ("mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > ---
> > >  drivers/mmc/host/sdhci-omap.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> > > index 54d795205fb4..26a9a8b5682a 100644
> > > --- a/drivers/mmc/host/sdhci-omap.c
> > > +++ b/drivers/mmc/host/sdhci-omap.c
> > > @@ -1339,8 +1339,8 @@ static int sdhci_omap_probe(struct platform_device *pdev)
> > >         /* R1B responses is required to properly manage HW busy detection. */
> > >         mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
> > >
> > > -       /* Allow card power off and runtime PM for eMMC/SD card devices */
> > > -       mmc->caps |= MMC_CAP_POWER_OFF_CARD | MMC_CAP_AGGRESSIVE_PM;
> > > +       /*  Enable SDIO card power off. */
> > > +       mmc->caps |= MMC_CAP_POWER_OFF_CARD;
> > >
> > >         ret = sdhci_setup_host(host);
> > >         if (ret)
> > > --
> > > 2.43.0
> > >
> >
> > Thanks Ulf, i also have this exact revert running on the target in our
> > ci farm, i think we should be good.  But I'll validate it in 4 weeks!
> >
> > Regards,
> >
> > --
> > Robert Nelson
> > https://rcn-ee.com/
> 
> Thanks Robert for helping out!
> 
> In the meantime I decided to queue this up for next, to allow it to
> get more testing in linux-next.

Thanks looks good to me too.

Regards,

Tony

