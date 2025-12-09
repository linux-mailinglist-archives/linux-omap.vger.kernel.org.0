Return-Path: <linux-omap+bounces-5143-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A10A9CB0140
	for <lists+linux-omap@lfdr.de>; Tue, 09 Dec 2025 14:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33351307B4F5
	for <lists+linux-omap@lfdr.de>; Tue,  9 Dec 2025 13:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52103328F4;
	Tue,  9 Dec 2025 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="x25Co79y"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99C13328EA;
	Tue,  9 Dec 2025 13:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765287834; cv=none; b=ffnJDeBRSyAtVNtDYoIX6H57wtpoEAW4Hd2EhtWqOufGpNPSw0FdoyhDCA/PWkegb55dqonr5XnDc8xoEc0QF+OJMZ+3uPmEx7XGZYKwFVGyQeK/LK1gk1+bhJrvDnc7hBEvo1B8Ck5u++OKZzLbMJjFq4wSaJAuSQG93gI+cK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765287834; c=relaxed/simple;
	bh=L175ZYxg+q0fgeUlf7cqwzGTGU+psHVOPK0bNhfTwGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRgtr6nZHotL0h5MKhDKFfbC1Pacye3f6hXvx2Yuv9prCVt3Y9jeN/a/CdhHjTEORNU5E4dys0zB+/HPRzCqgDzdY7fworEOg4lMG3m2m0Xh6p/lwB1ounYp/XyfNsfFXbt9Wqzs8mBrGXpkkE1j5U/LbjBel8aLhQOrnUWyoe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=x25Co79y; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 896E61F94A;
	Tue,  9 Dec 2025 14:43:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765287828;
	bh=iGP3vRW458Tun3BIx7ZKXNmg/pc9nBdtcAuL0AiV1Js=; h=From:To:Subject;
	b=x25Co79y0V4nkDEm80d7UshOyL9gUGfzKDO4k2AD1reXu+aWq0A+VxSNlTzqdKO+E
	 6G5vtl/zb5YdEBqqQ+4YXvQAgeCSLtJyrYyapAgG1TGBa2xz/EYMtG3gOlvDn5PZkB
	 pwz4W2QrhmD246xCfImsgsP8VSkaOvaL+nrMj58Jx5Zjv3P+Eh8wgWC7SsPJG3IzP4
	 ZuH2lkCadcfyrbE3vgloQsN4ZgxdSYynTX94gEFBTelFQ8xFer4FquqgPWZLIa4Ul5
	 ZlcPDocvLcWMhNz8e248ggKHjIXsoPgTpKN1Fmkk2vfuOjuwvJ6YZy5E7H6YL8V0lF
	 dH84ZLXn92CPQ==
Date: Tue, 9 Dec 2025 14:43:43 +0100
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
Message-ID: <20251209134343.GA238880@francesco-nb>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
 <20250429185240.6a7644bf@akair>
 <20250430080109.GA65078@francesco-nb>
 <aBH5s7p2RxLGjTQD@gaggiata.pivistrello.it>
 <23eeda43-a938-4c15-aee3-b1b9df217ff8@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23eeda43-a938-4c15-aee3-b1b9df217ff8@ti.com>

Hello Shree,

On Thu, May 01, 2025 at 10:32:12AM -0500, Shree Ramamoorthy wrote:
> On 4/30/25 5:21 AM, Francesco Dolcini wrote:
> > On Wed, Apr 30, 2025 at 10:01:14AM +0200, Francesco Dolcini wrote:
> > > On Tue, Apr 29, 2025 at 06:52:40PM +0200, Andreas Kemnade wrote:
> > > > Am Tue, 29 Apr 2025 15:21:19 +0200
> > > > schrieb Francesco Dolcini <francesco@dolcini.it>:
> > > > 
> > > > > Hello all,
> > > > > while working on adding support in mainline for a new board based on TI
> > > > > AM62P SoC I noticed the following Kernel Oops.
> > > > > 
> > > > > This oops was reproduced running current Linux
> > > > > master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
> > > > > to reproduce the same with 6.14.4.
> > > > > 
> > > > [...]
> > > > > [  +0.000022] Call trace:
> > > > > [  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
> > > > > [  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80
> > > > wild guessing: maybe because irqdata->rdev is not initalized in
> > > > _probe()? At least I do not see where it would be initialized.
> > > your wild guess seems correct, I'll send a proper patch with your
> > > suggested-by after doing a couple of more tests, thanks.
> > so, the bug is clear, however the fix is not an obvious one liner as I was
> > wishing.
> > 
> > we would need to add a link from each of the interrupts to the specific
> > regulator. as of now such a connection is not existing in the code.
> I'll try out implementing and testing the solution, but will get to it early next week. Will email with any updates!

What's the status on this? Were you able to do any progress or work on
it?

Thanks
Francesco


