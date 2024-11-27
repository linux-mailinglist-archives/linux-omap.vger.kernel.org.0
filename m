Return-Path: <linux-omap+bounces-2740-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B569DAF9B
	for <lists+linux-omap@lfdr.de>; Thu, 28 Nov 2024 00:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9324AB21C09
	for <lists+linux-omap@lfdr.de>; Wed, 27 Nov 2024 23:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919C4205E15;
	Wed, 27 Nov 2024 22:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="tzkl8bGe"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884C7205E0E;
	Wed, 27 Nov 2024 22:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732748361; cv=none; b=n7r1VIhN9I0r8PH02iY5hzmgPaA98YZ0HNqyn63n+uQPrn5M8iQL/ERlfzE1qb/A8gTNgrk5W2ztD/o6kTFoLBQYqAHbly3QabWGaZEDueXO6VKbrQuszmP76jmpybHiJrDkA+3S+D0l7HMosFAaXrjH8D0FedcGswBHOlKAucU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732748361; c=relaxed/simple;
	bh=ZlIqQL9nhR8ZrTmEz4h9i7YgCxYv3bRODmwAhrVR7tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JN+VIFtqpZR/dJ3oowI21Qp9Tyv0BapnKuY9IcTnItZgSZKVjQdbxpa9Mcn7nj6lHUCTt6V/5q561mb8a1cWqhANuODqUBsopoD68sE8qZdhQf6i52jRgiY4iAK5GTB6JBgEH2AkD6LKBDaon6HDXlIFsM1B5ycMQpA9xi2KD1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=tzkl8bGe; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=zYWPwKrxCHw1U304AUsx5/K0+fIPQMRZnHhXdfi9zsg=; b=tzkl8bGexeiM662e4bzFYg/nMt
	sUv4PjlCkek4aSLZdlU9XIbsvVdWxEuVQsYteZ+HwGszkkLBj9kgDEBHHhYPVUmmo77z2VkyvIp6n
	11GBvKKsz4J9ewjZGcUEBIAX/H/UI7riqhzsftJ4FqFPQzqKnn/x3sLyIhDO74xCMGwqJGrTwzqf0
	KW4WJjENCdXKAVFHi0ynD4IcX1Un77p2msa9Ha9GwWlzST5kchQMTawaj7PrLw+ed3edrhEMxlG1B
	UiwO+Kn6NEatA6y8TC7pxIhJimRpj7TxFTDT5f6YVxz0dwRb/Cg+KQVHTYEXDGYDzPgA5HfyuYkjb
	d7mrlnig==;
Date: Wed, 27 Nov 2024 23:58:58 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hns@goldelico.com, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 aaro.koskinen@iki.fi, khilman@baylibre.com, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: ti/omap: gta04: fix pm issues caused by spi
 module
Message-ID: <20241127235858.44e1ce01@akair>
In-Reply-To: <d1679678-8996-4484-bcf4-d4eaa6f009a4@kernel.org>
References: <20241107225100.1803943-1-andreas@kemnade.info>
	<b26c1fa8-b3b7-4aa9-bc78-793ddfa3bc6b@kernel.org>
	<20241108184118.5ee8114c@akair>
	<20241111150953.GA23206@atomide.com>
	<20241111193117.5a5f5ecb@akair>
	<20241111234604.66a9691b@akair>
	<20241116212734.30f5d35b@akair>
	<d1679678-8996-4484-bcf4-d4eaa6f009a4@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 18 Nov 2024 15:08:48 +0200
schrieb Roger Quadros <rogerq@kernel.org>:

> On 16/11/2024 22:27, Andreas Kemnade wrote:
> > Am Mon, 11 Nov 2024 23:46:04 +0100
> > schrieb Andreas Kemnade <andreas@kemnade.info>:
> >   
> >> Am Mon, 11 Nov 2024 19:31:17 +0100
> >> schrieb Andreas Kemnade <andreas@kemnade.info>:
> >>  
> >>> Am Mon, 11 Nov 2024 17:09:53 +0200
> >>> schrieb Tony Lindgren <tony@atomide.com>:
> >>>     
> >>>> * Andreas Kemnade <andreas@kemnade.info> [241108 17:41]:      
> >>>>> They are not used, if they are just disabled, kernel does not touch
> >>>>> them, so if it is there, the kernel can handle
> >>>>> pm. At least as long as it is not under ti,sysc.
> >>>>>
> >>>>> There are probably cleaner solutions for this, but for a CC: stable I
> >>>>> would prefer something less invasive.        
> >>>>
> >>>> For unused devices, it's best to configure things to use ti-sysc, and
> >>>> then set status disabled (or reserved) for the child devices only. This
> >>>> way the parent interconnect target module is PM runtime managed by
> >>>> Linux, and it's power domain gets properly idled for the unused devices
> >>>> too.
> >>>>       
> >>> Hmm, we also have omap_hwmod_setup_all() which is still called if
> >>> without device nodes being available.
> >>>
> >>> Converting mcspi to ti-sysc is more than 100 lines. So it does not
> >>> qualify for stable.
> >>>     
> >>>>> I can try a ti-sysc based fix in parallel.        
> >>>>
> >>>> Yeah that should be trivial hopefully :)
> >>>>       
> >>> I played around, got pm issues too, tried to force-enable things (via
> >>> power/control),
> >>> watched CM_IDLEST1_CORE and CM_FCLKEN1_CORE, they behave. Bits are set
> >>> or reset.
> >>>
> >>> but not CM_IDLEST_CKGEN, it is 0x209 instead of 0x1.
> >>>
> >>> I test from initramfs, so no mmc activity involved
> >>>
> >>> removing status = "disabled" from mcspi3 solves things.
> >>> With and without ti-sysc conversion. removing status = "disabled" from
> >>> mcspi4 seems not to help.
> >>>
> >>> That all cannot be... I will retry tomorrow.
> >>>     
> >> well, I tried a bit further:
> >> I build the omap spi driver as module.
> >> and booted With mcspi3 not disabled and no module autoload.
> >>
> >> without module loaded: pm bad, same as with mcspi3 disabled
> >> with module loaded: core pm ok
> >> with module loaded and unloaded: core pm ok.
> >>
> >> so at least a trace.
> >>  
> > ok, I am a bit further.
> > mcspi is per default in slave mode, setting it to master solves issues.
> > And that happens when the driver is probed because its default is
> > master.
> > Having the pins muxed as mode 7 also helps or selecting a pulldown for
> > cs. (cs is active high per default!)
> > switching to pullup does not harm once the spi module is off, but having
> > active cs seems to prevent idling despite CM_IDLEST1_CORE
> > not showing it.
> > 
> > History: u-boot muxes McSPI3, because it can be available on an
> > optionally fitted pin header. But there is no user known (would need
> > a dtb overlay anyways). So I will rather mux to mode 7.  
> 
> I'm sorry I didn't fully understand the problem.
> 
> So, u-boot configures pinmux for McSPI3 and enables McSPI3 as well
> but fails to disable it properly?

At least it sets Pinmux.
 
> And because McSPI3 is in slave mode and CS is active it fails to
> transition to idle in Linux?

yes, slave mode is default.
> 
> So isn't this a u-boot issue?
> 
Just telling u-boot to not mux McSPI3 helps. So, yes u-boot should not
set it. But. I have no clear idea how bitrot the u-boot update process
is. I would prefer setting the pinmux also in kernel back to the
default.

Regards,
Andreas

