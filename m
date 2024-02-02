Return-Path: <linux-omap+bounces-478-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A7B846704
	for <lists+linux-omap@lfdr.de>; Fri,  2 Feb 2024 05:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC5831F247E4
	for <lists+linux-omap@lfdr.de>; Fri,  2 Feb 2024 04:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529E4F4EA;
	Fri,  2 Feb 2024 04:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="ArgEnzRR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15048DDD6;
	Fri,  2 Feb 2024 04:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706848585; cv=none; b=hwDve+wqV7/4mNrEdMR0gVU18WUHu6M/tif9nN6PkjEcegBmzP8Xj9uIBbSwEWg53D7qmyYOzvIHufT5BeiqjCp/J/vqphMIVyZwpVK7B03NmOb25lAtOeJL9sy40SYHR5uuNYL0nbXHLmEwfYiTjQmGstdbNCIxJorbvbm/zIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706848585; c=relaxed/simple;
	bh=nkmDbUQlq4zNwl6Jd/Vb+PA0uyv1xGA2FmONzdP1Sn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLn6Ke1mQttxPHzYuyP1JTRza4nDWQF+cjB4q1PO2TqLMcXD69T1+JaUtY/4xFLce+I/cfZbqDr8xvycbtydgJrvGQpeCKlCXFKwfkl84oKToHBIjx2rUfuVuTmA+XobFJD2PZtK6qCsB9oFEsaCc/4zbHYw8yd/k78YXDtaPmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=ArgEnzRR; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 7793C60363;
	Fri,  2 Feb 2024 04:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1706848576;
	bh=nkmDbUQlq4zNwl6Jd/Vb+PA0uyv1xGA2FmONzdP1Sn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArgEnzRRe9ms4Josxbe+YGGWeYwx4jhbE5Mwx/eGYWy/niGPn8okDCDWzgZS/U/3G
	 Fqlwy8VWlnBNsPwSN3+4/aMleaqsmouCRojQpae36sGl317/afEgvPIU8eKuoBXwzQ
	 4Owiiu79KlW+3N815WAd1ZA77dV1UxlctB9wISJcDWPbigCUgOyiCOlwLD1hEnaioT
	 RXAcjf96VNbL6GOq3ifQnjneXN1Q+Jg99tsu32dfvjDRZXvwp884S+HmhR/CVi2hu/
	 xSw11Zr5FhB7MH03KmqC1/65wSpcekJyhyI5okhChFspfk3wE/79hL400zxDSmiREP
	 72d1ZNaRvd+VA==
Date: Fri, 2 Feb 2024 06:36:01 +0200
From: Tony Lindgren <tony@atomide.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
	linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: sdhci-omap: issues with PM features since 5.16
Message-ID: <20240202043601.GA5185@atomide.com>
References: <2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr>
 <20240127044851.GW5185@atomide.com>
 <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>
 <20240129111733.GX5185@atomide.com>
 <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
 <7d72f3ee-bcfe-4197-b492-857dc49b2788@smile.fr>
 <20240131103050.GZ5185@atomide.com>
 <519f7e2e-4df2-4b3c-90e2-2383b6b34562@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <519f7e2e-4df2-4b3c-90e2-2383b6b34562@smile.fr>

* Romain Naour <romain.naour@smile.fr> [240201 09:04]:
> Le 31/01/2024 à 11:30, Tony Lindgren a écrit :
> > * Romain Naour <romain.naour@smile.fr> [240130 11:20]:
> >> Le 29/01/2024 à 18:42, Romain Naour a écrit :
> >>> Le 29/01/2024 à 12:17, Tony Lindgren a écrit :
> >>>> So I'm still guessing your issue is with emmc not getting reinitialized
> >>>> properly as there's no mmc-pwrseq-emmc configured. Can you give it a
> >>>> try? See am5729-beagleboneai.dts for an example.
> >>
> >> I can't add such mmc-pwrseq-emmc on the custom board, there is no gpio available
> >> to reset the emmc device.
> >>
> >> To resume:
> >> - the emmc doesn't work with mmc-hs200-1_8v mode with PM runtime enabled
> >> - the emmc works with mmc-hs200-1_8v mode without PM runtime (patch series reverted)
> >> - the emmc works with mmc-ddr-1_8v mode with PM runtime enabled
> >>
> >> AFAIU the hs200 mode requires some pin iodelay tuning (SDHCI_OMAP_REQUIRE_IODELAY)
> >> is sdhci_omap_runtime_{suspend,resume} needs to take care of that?

On PM runtime resume, sdhci_omap_runtime_resume() gets called and calls
sdhci_runtime_resume_host(), and calls mmc->ops->set_ios().

Then sdhci_omap_set_ios() calls sdhci_omap_set_timing() to set the iodelay.
Maybe add some printk to sdhci_omap_set_timing() to verify the right modes
get set on PM runtime resume?

> >> The mmc2 clock seems idle when mmc-hs200-1_8v and PM runtime are used.
> >>
> >> omapconf dump prcm l3init
> >>
> >> (mmc2 clock idle)
> >> | CM_L3INIT_MMC2_CLKCTRL           | 0x4A009330   | 0x01070000 |
> >>
> >> (mmc2 clock running)
> >> | CM_L3INIT_MMC2_CLKCTRL           | 0x4A009330   | 0x01040002 |
> >>
> >> Thoughts?

For the clocks above, that is as expected. The clocks get idled when the
MMC controller is idle.

> > OK so if the emmc reset gpio is not available, seems we should do something
> > like the following patch to not set MMC_CAP_POWER_OFF_CARD unless the
> > cap-power-off-card devicetree property is set.
> > 
> > Care to give it a try and see if it helps?
> 
> Same problem without MMC_CAP_POWER_OFF_CARD flag (even by removing
> MMC_CAP_AGGRESSIVE_PM too).
> 
> I did some test with mmc capabilities mask but no progress so far.

OK. So this issue seems to be related to the PM runtime resume not
restoring something properly as you suggested earlier.

Regards,

Tony

