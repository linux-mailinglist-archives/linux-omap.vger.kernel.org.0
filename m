Return-Path: <linux-omap+bounces-2661-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F16D09C4949
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 23:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B55C8285375
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 22:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA6C1BCA02;
	Mon, 11 Nov 2024 22:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="6+nfhIIT"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB59156F5E;
	Mon, 11 Nov 2024 22:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731365181; cv=none; b=TX5YdZGb1tax5omU8EZlknYjvAOn+Ll9MnsgyqasD2Q4/tSqDFAj6aUXHnUljmb7cyR6/bTpraz1mF2CpDSTZ6wGWz5JVf5T7ZSx+eL29ycsHAzxOhgkAzpDyUmjY6tZuDXOcpUpvvqpMfwwyUe9seONIt1IenxW48mopGadqQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731365181; c=relaxed/simple;
	bh=5rU8s0axoUdw/3t1/h8MiI09YYSTA7832OWSw1von30=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Go+1XQoRGffQjvZyWvt51QfKx0syxOCJDeNJPgxCUjLYjYrt0ZsP56AG36t1NQF4SUj6I4VlTKB3KxnnnsfXVn4FDHxXjY7zOWf32rSk0Um+RZi+2JgMBr1VuO5CQkjIeZTl/aImlm9YLY9hfHlnQL/I5/s0Ibk0nZizO1+1V74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=6+nfhIIT; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZpNWFQwQJn4BOXJoxOWOhm1D3BZjq+95hiepMT+RS3o=; b=6+nfhIIT4x7gLn4hQSvuQtkXNa
	UZSEXOfK3jrd3mvTMKt6tfN3iheIbKI+u1S+umZla6RuEOU0LqZUDZv3CGzyTaCX6vcHBisX647ez
	YPiIdMXvufk5IiO6NSWajWVotzfWfVaJriUWlfo8CB8HSP7nanWiWGomyUZVy7PHN9Kt9Zo4ytwQe
	wHza5bS1Ufs9SgvGjkq3xnNAfaiDUS9O2Pd3SuSOf+tFz8tOcVu0ayydJwH/Ozp+AgCT2fT1d4UGN
	0PwrvCCIiN3C4c90ppVIHre5ifjWESShxfPwAhK2jTDZ8BipgJ1p6Dpd7vh+7nvSzri8SbdHPXN28
	sWQiJYvA==;
Date: Mon, 11 Nov 2024 23:46:04 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
Cc: Roger Quadros <rogerq@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hns@goldelico.com, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 aaro.koskinen@iki.fi, khilman@baylibre.com, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: ti/omap: gta04: fix pm issues caused by spi
 module
Message-ID: <20241111234604.66a9691b@akair>
In-Reply-To: <20241111193117.5a5f5ecb@akair>
References: <20241107225100.1803943-1-andreas@kemnade.info>
	<b26c1fa8-b3b7-4aa9-bc78-793ddfa3bc6b@kernel.org>
	<20241108184118.5ee8114c@akair>
	<20241111150953.GA23206@atomide.com>
	<20241111193117.5a5f5ecb@akair>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 11 Nov 2024 19:31:17 +0100
schrieb Andreas Kemnade <andreas@kemnade.info>:

> Am Mon, 11 Nov 2024 17:09:53 +0200
> schrieb Tony Lindgren <tony@atomide.com>:
> 
> > * Andreas Kemnade <andreas@kemnade.info> [241108 17:41]:  
> > > They are not used, if they are just disabled, kernel does not touch
> > > them, so if it is there, the kernel can handle
> > > pm. At least as long as it is not under ti,sysc.
> > > 
> > > There are probably cleaner solutions for this, but for a CC: stable I
> > > would prefer something less invasive.    
> > 
> > For unused devices, it's best to configure things to use ti-sysc, and
> > then set status disabled (or reserved) for the child devices only. This
> > way the parent interconnect target module is PM runtime managed by
> > Linux, and it's power domain gets properly idled for the unused devices
> > too.
> >   
> Hmm, we also have omap_hwmod_setup_all() which is still called if
> without device nodes being available.
> 
> Converting mcspi to ti-sysc is more than 100 lines. So it does not
> qualify for stable.
> 
> > > I can try a ti-sysc based fix in parallel.    
> > 
> > Yeah that should be trivial hopefully :)
> >   
> I played around, got pm issues too, tried to force-enable things (via
> power/control),
> watched CM_IDLEST1_CORE and CM_FCLKEN1_CORE, they behave. Bits are set
> or reset.
> 
> but not CM_IDLEST_CKGEN, it is 0x209 instead of 0x1.
> 
> I test from initramfs, so no mmc activity involved
> 
> removing status = "disabled" from mcspi3 solves things.
> With and without ti-sysc conversion. removing status = "disabled" from
> mcspi4 seems not to help.
> 
> That all cannot be... I will retry tomorrow.
> 
well, I tried a bit further:
I build the omap spi driver as module.
and booted With mcspi3 not disabled and no module autoload.

without module loaded: pm bad, same as with mcspi3 disabled
with module loaded: core pm ok
with module loaded and unloaded: core pm ok.

so at least a trace.

Regards,
Andreas

