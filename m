Return-Path: <linux-omap+bounces-2657-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDA99C44FD
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 19:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74F9E1F22DE5
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 18:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA99D1AA78A;
	Mon, 11 Nov 2024 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="90k0phcN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4537B145B16;
	Mon, 11 Nov 2024 18:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731349893; cv=none; b=dcnHGH+zfr3EDleaTvg7rN2EO1EyjHt9XZn9IIZjv570e0QEyMwnSC2sBW0QNDPU2FBeqhmT9D2KJ2GLuy/IFVGfJzaG5axhw0CN5SAipVmfDtsR8x3OYnj7KjiwQGAZ3Dfc51h1iVtTEHBPMNrdvdxte/TLKRca8eqSegGrZ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731349893; c=relaxed/simple;
	bh=JlHLtm5tmJMubSWHbX9llC7OekmRlU82Oeut3JnZmdw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P1jfWNs/ewRav6fM8rf2NO8XhOMt6LAcLxJhflln3oR/NhXrryP31UuAqFexmSVOoefExftQ5jB1h5T2wnvtiN10gcAiw00qaGcbYtvuOaxGvpq6GMqsSUhbHk8pvfXKufQeiKsTA0u34XfHvuNHJ2/qOLIiDPBW6W2MEMKAOSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=90k0phcN; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=p8dN0XjuNZkdV5wGrWWUH+hCEPSo2ov7b9o7jmj3OLE=; b=90k0phcNtpqV44Ho2GYQnAYND5
	dxcDexJhEH1+Bd40Mvb1H7P+fifQdKLQ53/xBj2h+PVyax1Kkq/XeTHcSGmNwcf9C15PVj6tD/jyn
	sw2/vop3GCmFycvT6HMbaSdaqg4AP3sNqOdTLJGE31h6vHDtD+V8rWFgK7GOLUM66pMmraNAflWRu
	Dyc5+X0rD1DuuwRqBm1/iT2W6nfH6iOS48Cphc6T83ltMKikbDmRU0tPKazkBjzqIrqYvSIr5HiAu
	xR63bPnuKWQBpNKSRJTPXfNCRPhKwtOZz7NlH5AOMeXXGDgoy4F++8LknTVm58rlJ3Fvg10xyzow4
	gYOcvaAQ==;
Date: Mon, 11 Nov 2024 19:31:17 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
Cc: Roger Quadros <rogerq@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hns@goldelico.com, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 aaro.koskinen@iki.fi, khilman@baylibre.com, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: ti/omap: gta04: fix pm issues caused by spi
 module
Message-ID: <20241111193117.5a5f5ecb@akair>
In-Reply-To: <20241111150953.GA23206@atomide.com>
References: <20241107225100.1803943-1-andreas@kemnade.info>
	<b26c1fa8-b3b7-4aa9-bc78-793ddfa3bc6b@kernel.org>
	<20241108184118.5ee8114c@akair>
	<20241111150953.GA23206@atomide.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 11 Nov 2024 17:09:53 +0200
schrieb Tony Lindgren <tony@atomide.com>:

> * Andreas Kemnade <andreas@kemnade.info> [241108 17:41]:
> > They are not used, if they are just disabled, kernel does not touch
> > them, so if it is there, the kernel can handle
> > pm. At least as long as it is not under ti,sysc.
> > 
> > There are probably cleaner solutions for this, but for a CC: stable I
> > would prefer something less invasive.  
> 
> For unused devices, it's best to configure things to use ti-sysc, and
> then set status disabled (or reserved) for the child devices only. This
> way the parent interconnect target module is PM runtime managed by
> Linux, and it's power domain gets properly idled for the unused devices
> too.
> 
Hmm, we also have omap_hwmod_setup_all() which is still called if
without device nodes being available.

Converting mcspi to ti-sysc is more than 100 lines. So it does not
qualify for stable.

> > I can try a ti-sysc based fix in parallel.  
> 
> Yeah that should be trivial hopefully :)
> 
I played around, got pm issues too, tried to force-enable things (via
power/control),
watched CM_IDLEST1_CORE and CM_FCLKEN1_CORE, they behave. Bits are set
or reset.

but not CM_IDLEST_CKGEN, it is 0x209 instead of 0x1.

I test from initramfs, so no mmc activity involved

removing status = "disabled" from mcspi3 solves things.
With and without ti-sysc conversion. removing status = "disabled" from
mcspi4 seems not to help.

That all cannot be... I will retry tomorrow.

Regards,
Andreas

