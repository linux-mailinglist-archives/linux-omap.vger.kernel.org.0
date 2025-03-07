Return-Path: <linux-omap+bounces-3343-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E67A55F5F
	for <lists+linux-omap@lfdr.de>; Fri,  7 Mar 2025 05:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3962172CF6
	for <lists+linux-omap@lfdr.de>; Fri,  7 Mar 2025 04:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F0719048F;
	Fri,  7 Mar 2025 04:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="h1WleRMO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC09DDC1;
	Fri,  7 Mar 2025 04:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741321733; cv=none; b=KUJJHXgGzPWhftuh+cMld9gkf1yAOJSB5NlBJcNqi68BDvPjIyCNkyPMdR5iuuRCUkoWQUdbEtj9Qri0y2llX3iawMqRXU7eK98EFyJtHc2U3f0CLZUWiGnFcA4FdFmQf4RCex9omBbO8YUepcxPzHTWEKC9qWD7jrPJocyub1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741321733; c=relaxed/simple;
	bh=bl/Iny20USHLhuGmL7JmnPpA0CC/5d5CikyAMxv6Fm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYmkPPoM0u0maf8Sijuho/OWAr7nUUX5zyC5qiwU4HZevRixJ1+tMMGvMD51zVT/rdcbOPNHgZFdnF3bigKhzqHnNiMFbNb25smVBQN2fmAxiHY93ReVF6ljIY3hq91tcNetpJTdUvOhx0MtIexSmtufIMKIHYsP0U2eHHdmDDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=h1WleRMO; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 489586050B;
	Fri,  7 Mar 2025 04:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1741321729;
	bh=bl/Iny20USHLhuGmL7JmnPpA0CC/5d5CikyAMxv6Fm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1WleRMOjLjiunj4uQ3myvzhLlhd8XuaSlHKz0Kz04tA3tZOHL82qRaZ8lFWY4N7b
	 6Q8D+vlO2sTz7aAwThzcZQ8/XMDocszuXoZunwzUgc2DjrVo3lJ9MxJbpIfs3yH5yI
	 jr5GrSjK/ZAojRU3a2BNtFYppsUDv3j2/k5InVCpaakUE/xP+Kb11/PcAR4kJM7jV0
	 u27fPQ2VlQ2bTuFsm43dmfK9A4VfoO15BPrb7/tMLqxrPYkDKjQgrv5xJMuYl+C6tL
	 YPYRLkMSOMOxmtW6qZcjK5tJcRurEXwywINKKbKJJJb4CJpBkdbtaEG8zwYcgR5kVb
	 019GMdXdmecpg==
Date: Fri, 7 Mar 2025 06:28:22 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Robert Nelson <robertcnelson@gmail.com>,
	Romain Naour <romain.naour@smile.fr>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	"Aldea, Andrei" <a-aldea@ti.com>, David <daowens01@gmail.com>,
	linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: sdhci-omap: additional PM issue since 5.16
Message-ID: <20250307042822.GE23206@atomide.com>
References: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
 <f6732c49-a5b1-4a13-b9f6-c2d552b5e7e8@smile.fr>
 <31717d89-432c-4b77-a974-99f7e6b97f97@gmail.com>
 <9168d127-06a7-46e6-a7a2-f2e60032a50e@gmail.com>
 <b1a369e2-938b-49ed-b743-6562f0bb46f9@smile.fr>
 <CAOCHtYiBFNY9nFjtqsFFpqRKdxUif_fC7MVqZ7cffeD8rLSe2A@mail.gmail.com>
 <CAOCHtYiujoMoPHfSmyTrv_48wUn3TfaoiPEcMFB=V++MZXvuuQ@mail.gmail.com>
 <20250226170614.18a497f0@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226170614.18a497f0@akair>

* Andreas Kemnade <andreas@kemnade.info> [250226 16:06]:
> Am Wed, 26 Feb 2025 09:36:40 -0600
> schrieb Robert Nelson <robertcnelson@gmail.com>:
> 
> > On Mon, Jan 27, 2025 at 3:20 PM Robert Nelson <robertcnelson@gmail.com> wrote:
> > >  
> > > > Thanks for testing.
> > > >
> > > > I'm able to reproduce the issue locally (using a kernel 6.1.112).
> > > > It fail after the first sleep 20...
> > > >
> > > > If I remove MMC_CAP_AGGRESSIVE_PM from the sdhci-omap driver the issue is gone.
> > > >
> > > > About sdhci-omap driver, It's one of the only few enabling
> > > > MMC_CAP_AGGRESSIVE_PM. I recently switched to a new project using a newer SoC
> > > > but the eMMC driver doesn't event set MMC_CAP_AGGRESSIVE_PM.
> > > >
> > > > I'm wondering if MMC_CAP_AGGRESSIVE_PM is really safe (or compatible) for
> > > > HS200/HS400 eMMC speed. Indeed, MMC_CAP_AGGRESSIVE_PM has been added to
> > > > sdhci-omap driver to support SDIO WLAN device PM [1].
> > > >
> > > > I've found another similar report on the Beaglebone-black (AM335x SoC) [2].
> > > >
> > > > It seems the MMC_CAP_AGGRESSIVE_PM feature should only be enabled to SDIO cards.  
> > >
> > > We've been chasing this Bug in BeagleLand for a while. Had Kingston
> > > run it thru their hardware debuggers.. On the BBB, once the eMMC is
> > > suspended during idle, the proper 'wakeup' cmd is NOT sent over,
> > > instead it forces a full reset. Eventually this kills the eMMC. Been
> > > playing with this same revert for a day or so, with my personal setup,
> > > it takes 3-4 Weeks (at idle every day) for it to finally die.. So i
> > > won't be able to verify this 'really' fixes it till next month..  
> > 
> > Okay, it survived 4 weeks.. We really need to revert:
> > 3edf588e7fe00e90d1dc7fb9e599861b2c2cf442
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3edf588e7fe00e90d1dc7fb9e599861b2c2cf442
> > 
> > On every stable kernel back to v6.1.x, this commit is `killing`
> > Kingston eMMC's on BeagleBone Black's in under 21 days.
> > 
> > By reverting the commit, I finally have a board that's survived the 3
> > week timeline, (and a week more) with no issues.
> > 
> Is there any simple way to restrain it to only sdio devices to go
> forward a bit?

Best to revert the patch first until the issue has been fixed.

Based on the symptoms, it sounds like there might be a missing flush of
a posted write in the PM runtime suspend/resume path. This could cause
something in the sequence happen in the wrong order for some of the
related surrounding resources like power, clocks or interrupts.

Regards,

Tony

