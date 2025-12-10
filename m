Return-Path: <linux-omap+bounces-5151-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EE7CB25DA
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 09:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7FCE301396E
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 08:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B88C301716;
	Wed, 10 Dec 2025 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="LqOcVPDD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7065D283FD6;
	Wed, 10 Dec 2025 08:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765354222; cv=none; b=AC4wBo2xFioSSyn5KYmAkk+pJLrIpDUEaJP2q6jhvsTdcwf/UJGnlXhM/roQDvmMzmXMjgKEtcT49ViltecUmJJNj6TquanzUvqZJVatknAhkB+Yyt4np7y3QqfncP5Z40aDl91u+w+fhxCyQA4FvD7FrbLBOntA3o+/1Bhj/js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765354222; c=relaxed/simple;
	bh=REdZyEdu3qntDCxnWH6qtLHsUaG3P64YCl8NCqs3fzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DiZtiltz5nxokjxGjKZXhq0dDL7qOyi8J/JzwGS1EORghCpvHv9hxSJjTP0upcgis2xo5D4wxJPh6FyxDDUR0kVFKoDbMu221xLqmk53YCzwhwanYGgmimaIEOM5cH611sD2nh/orqx8uoLIC+eTP9b3W9HkxDxqL+Z1MOoRdW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=LqOcVPDD; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id C0AD91FE25;
	Wed, 10 Dec 2025 09:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765354218;
	bh=tY5uwzl+AxVEKvLx/HBwHjEU47qpsVqEgTLjK9+nBsk=; h=From:To:Subject;
	b=LqOcVPDD1BUINRwxzSNmeAKRcdt38XJGj8Cq//KKBbigw1oMJQFvWfx3U0hQ02qOw
	 VNNvKoX4iTISpYoOJkOwbs/aAHvYK5gYyPQ/RwfuOlCqCnRdm5JSxJyR6YaeHL9Iuk
	 KP6nQjYlEfNkH53FkIzWM6z+4mxGpzDQ/oZ3WmkMmSc6qleI2tda2NgRw8LTkotpeB
	 +sGx+qzuz/eAzQYcdnpWuLNaIsfPUa+OcZArv5hl2EFCdzKfNpDtwX1acOcDFNRaMJ
	 NeN6pcRlVAZWjKpiMLWzEmJzoze5Ks8v7L0tzkWHm6augF8Gy+esBdenjb9lqTjdrw
	 koaBgOmBgE51w==
Date: Wed, 10 Dec 2025 09:10:14 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Andreas Kemnade <andreas@kemnade.info>,
	Jerome Neanne <jneanne@baylibre.com>,
	Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: tps65219/am62p kernel oops
Message-ID: <20251210080955.GA14989@francesco-nb>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
 <20250429185240.6a7644bf@akair>
 <20250430080109.GA65078@francesco-nb>
 <aBH5s7p2RxLGjTQD@gaggiata.pivistrello.it>
 <23eeda43-a938-4c15-aee3-b1b9df217ff8@ti.com>
 <20251209134343.GA238880@francesco-nb>
 <d6de7066-a802-41fc-bb10-2f5d248743db@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6de7066-a802-41fc-bb10-2f5d248743db@ti.com>

Hello Shree,

On Tue, Dec 09, 2025 at 12:16:05PM -0600, Shree Ramamoorthy wrote:
> On 12/9/25 7:43 AM, Francesco Dolcini wrote:
> > On Thu, May 01, 2025 at 10:32:12AM -0500, Shree Ramamoorthy wrote:
> > > On 4/30/25 5:21 AM, Francesco Dolcini wrote:
> > > > On Wed, Apr 30, 2025 at 10:01:14AM +0200, Francesco Dolcini wrote:
> > > > > On Tue, Apr 29, 2025 at 06:52:40PM +0200, Andreas Kemnade wrote:
> > > > > > Am Tue, 29 Apr 2025 15:21:19 +0200
> > > > > > schrieb Francesco Dolcini <francesco@dolcini.it>:
> > > > > > > This oops was reproduced running current Linux
> > > > > > > master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
> > > > > > > to reproduce the same with 6.14.4.
> > > > > > > 
> > > > > > [...]
> > > > > > > [  +0.000022] Call trace:
> > > > > > > [  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
> > > > > > > [  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80
> > > > > > wild guessing: maybe because irqdata->rdev is not initalized in
> > > > > > _probe()? At least I do not see where it would be initialized.
> > > > > your wild guess seems correct, I'll send a proper patch with your
> > > > > suggested-by after doing a couple of more tests, thanks.
> > > > so, the bug is clear, however the fix is not an obvious one liner as I was
> > > > wishing.
> > > > 
> > > > we would need to add a link from each of the interrupts to the specific
> > > > regulator. as of now such a connection is not existing in the code.
> > > I'll try out implementing and testing the solution, but will get
> > > to it early next week. Will email with any updates!
> > What's the status on this? Were you able to do any progress or work on
> > it?
> 
> Thanks for following up on this, the task got lost on my end. My
> apologies!  The original line deleted `irq_data[i].rdev = rdev;` was
> never replaced.  The correct code should be re-implementing a version
> of the tps65219_get_rdev_by_name() function that was removed in commit
> 64a6b57 & add in irq_data.rdev = rdev;` where the other irq_data
> fields are being assigned within _probe.
> 
> Is there anything missing with this solution?

I am not really familiar with the code, I just looked at it once when
I did hit this bug. I would say to just send such a patch.

Francesco


