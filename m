Return-Path: <linux-omap+bounces-2699-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F189D00CB
	for <lists+linux-omap@lfdr.de>; Sat, 16 Nov 2024 21:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 760671F23876
	for <lists+linux-omap@lfdr.de>; Sat, 16 Nov 2024 20:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D46198840;
	Sat, 16 Nov 2024 20:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="QFBDja2Z"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5281928FF;
	Sat, 16 Nov 2024 20:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731788877; cv=none; b=Xku0boNb7eQnWf+6fePOCZ2/HEJnI+FOkN4vBNWSTYgVPitrxUc3uZQDlglqxptGl8jeTvK5qBqQdDljhwdArtK2LjbvM9itLAuP9TqL9F0gpGM+RvFIB3GQa+Tg7yvsn6u9YIHiMHq5fw7DPzCHsW44QnieJBUAK1r4R5fe85w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731788877; c=relaxed/simple;
	bh=3W/vNeG99abzvcR9K+Bx5HhwVrlB/e7Cu6Zw6Ux/ASo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0p7Juwd6Kq9a7laJDyPn/IPy4oTwhrWftE8oCTcUTzjtU600cR0bh2vYDYpr58rwRsmnQT9y6/57abAV/K4DFP2tG7Dk2EYP2nx7xzaVc2LHR5YRnTt2aoLoOGkOpx1Lf7TBM98AudPw6NDFlYooBhNehYzl0hY8wQSxRm+N7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=QFBDja2Z; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=RZGy7qwsxGBnmfUQ6rUk5NOMwmA4dhgXmcF2ln4UgfM=; b=QFBDja2ZNto8VLe0W1q+K002OR
	Yd5ZPiMmrhG2zziVo/PwybtfJpC7EAhpME6MhFdb7A8BpPCpaR8iz7lqEUTE4fhnPr58R9M0rscNg
	EGIdwh2pyBgMnFeBDwdN+dvdXGnApEZpma9EVNRpLi7fmzCnV2Adf1OJZrDrn9qo2LuPA7vPV9Tww
	QWiyVY6UGw08JrQqn8WZFyLZlaL8/UX1uEzmwvcTpjZtBwXpnZp7q4oRTec7Qk10nSFej3ezHWl0k
	uKIZT0FUHyR+BG4UhkLHhuffLohA8LjW0Pdor+2t62R/r019WAUw0acti6nCyH/Ldqd8lxhbYKxEB
	wju13Wrw==;
Date: Sat, 16 Nov 2024 21:27:34 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
Cc: Roger Quadros <rogerq@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hns@goldelico.com, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 aaro.koskinen@iki.fi, khilman@baylibre.com, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: ti/omap: gta04: fix pm issues caused by spi
 module
Message-ID: <20241116212734.30f5d35b@akair>
In-Reply-To: <20241111234604.66a9691b@akair>
References: <20241107225100.1803943-1-andreas@kemnade.info>
	<b26c1fa8-b3b7-4aa9-bc78-793ddfa3bc6b@kernel.org>
	<20241108184118.5ee8114c@akair>
	<20241111150953.GA23206@atomide.com>
	<20241111193117.5a5f5ecb@akair>
	<20241111234604.66a9691b@akair>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 11 Nov 2024 23:46:04 +0100
schrieb Andreas Kemnade <andreas@kemnade.info>:

> Am Mon, 11 Nov 2024 19:31:17 +0100
> schrieb Andreas Kemnade <andreas@kemnade.info>:
> 
> > Am Mon, 11 Nov 2024 17:09:53 +0200
> > schrieb Tony Lindgren <tony@atomide.com>:
> >   
> > > * Andreas Kemnade <andreas@kemnade.info> [241108 17:41]:    
> > > > They are not used, if they are just disabled, kernel does not touch
> > > > them, so if it is there, the kernel can handle
> > > > pm. At least as long as it is not under ti,sysc.
> > > > 
> > > > There are probably cleaner solutions for this, but for a CC: stable I
> > > > would prefer something less invasive.      
> > > 
> > > For unused devices, it's best to configure things to use ti-sysc, and
> > > then set status disabled (or reserved) for the child devices only. This
> > > way the parent interconnect target module is PM runtime managed by
> > > Linux, and it's power domain gets properly idled for the unused devices
> > > too.
> > >     
> > Hmm, we also have omap_hwmod_setup_all() which is still called if
> > without device nodes being available.
> > 
> > Converting mcspi to ti-sysc is more than 100 lines. So it does not
> > qualify for stable.
> >   
> > > > I can try a ti-sysc based fix in parallel.      
> > > 
> > > Yeah that should be trivial hopefully :)
> > >     
> > I played around, got pm issues too, tried to force-enable things (via
> > power/control),
> > watched CM_IDLEST1_CORE and CM_FCLKEN1_CORE, they behave. Bits are set
> > or reset.
> > 
> > but not CM_IDLEST_CKGEN, it is 0x209 instead of 0x1.
> > 
> > I test from initramfs, so no mmc activity involved
> > 
> > removing status = "disabled" from mcspi3 solves things.
> > With and without ti-sysc conversion. removing status = "disabled" from
> > mcspi4 seems not to help.
> > 
> > That all cannot be... I will retry tomorrow.
> >   
> well, I tried a bit further:
> I build the omap spi driver as module.
> and booted With mcspi3 not disabled and no module autoload.
> 
> without module loaded: pm bad, same as with mcspi3 disabled
> with module loaded: core pm ok
> with module loaded and unloaded: core pm ok.
> 
> so at least a trace.
> 
ok, I am a bit further.
mcspi is per default in slave mode, setting it to master solves issues.
And that happens when the driver is probed because its default is
master.
Having the pins muxed as mode 7 also helps or selecting a pulldown for
cs. (cs is active high per default!)
switching to pullup does not harm once the spi module is off, but having
active cs seems to prevent idling despite CM_IDLEST1_CORE
not showing it.

History: u-boot muxes McSPI3, because it can be available on an
optionally fitted pin header. But there is no user known (would need
a dtb overlay anyways). So I will rather mux to mode 7.

Regards,
Andreas

