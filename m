Return-Path: <linux-omap+bounces-3628-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661FEAA4831
	for <lists+linux-omap@lfdr.de>; Wed, 30 Apr 2025 12:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C62974C66BC
	for <lists+linux-omap@lfdr.de>; Wed, 30 Apr 2025 10:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D23E24679D;
	Wed, 30 Apr 2025 10:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="JxzaPl7R"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0CD237164;
	Wed, 30 Apr 2025 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008503; cv=none; b=lmQmvpuy3sYh30t0IpiAWQC/+0AhYPU3+Q/h2gWKdJv2v8or86u5r9M6lJZaxcewlHLjYLv/e5fBnfT4ymLMneRIGY3epYcaXasYfzguR5sgI6H3hq/Uhi9U9wmdjZpUdSzYJsTUVgqNuRYgph/HGKYLX8/KvnkMGVmq15p37aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008503; c=relaxed/simple;
	bh=CLIfvubB/B/OHg0nRihEh8GRi3rzx1utm1UTR2IFe/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQ2eiM95VWBGlsQ5KNGWiXxVz2goRP+YCd2jgDZoHr6ek88+vxnWN/5A0LIss/ZJ8C6MkqvpMUF4Flz9LTFMMeH3fE8FX05wg6FaAi8j90crJwymFgNgP3OcazVHtcCQz8b3Hq2BRLP2g6RNzL6KvpNjFqaWO70Y06eySe7UcxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=JxzaPl7R; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id C89AF1F997;
	Wed, 30 Apr 2025 12:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746008499;
	bh=5DaHQT4Qjk3BDVTDz4Bb4NNHE0GPIz71ATKW0qH/aBY=;
	h=Received:From:To:Subject;
	b=JxzaPl7RKrpB0llXa5Yy3AtfyvduS+RlpsdYVdEWBPaBh0HNBWiJnSy5NtGqxZ9HL
	 bFsNPtQpXkF5MDO5s0KH/lzNrwDYkuZ/7PRcseFY70IpgkTZr39v3gfIyfRUQkCBUf
	 9d2OQXqD+hhgnwjGhc4WkwwStEiPFgHIGpTebx5zth0sxGIndJ5EbSnpIhtnbPWDqm
	 MEjRFdey2H0RqWncNAWqBTObiLYL33ZmZu0rz3RIOXvgLm8owaKW5RZW37kdnpGAaN
	 x6a7MXociRmsTFUN45QNkwkwOXmfsBazfWyth1e7/6FNideUAw1mmxLy9ioXj+wy8h
	 zSDmnxBXkpYJQ==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 7AAF67F84D; Wed, 30 Apr 2025 12:21:39 +0200 (CEST)
Date: Wed, 30 Apr 2025 12:21:39 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Jerome Neanne <jneanne@baylibre.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: tps65219/am62p kernel oops
Message-ID: <aBH5s7p2RxLGjTQD@gaggiata.pivistrello.it>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
 <20250429185240.6a7644bf@akair>
 <20250430080109.GA65078@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430080109.GA65078@francesco-nb>

On Wed, Apr 30, 2025 at 10:01:14AM +0200, Francesco Dolcini wrote:
> On Tue, Apr 29, 2025 at 06:52:40PM +0200, Andreas Kemnade wrote:
> > Am Tue, 29 Apr 2025 15:21:19 +0200
> > schrieb Francesco Dolcini <francesco@dolcini.it>:
> > 
> > > Hello all,
> > > while working on adding support in mainline for a new board based on TI
> > > AM62P SoC I noticed the following Kernel Oops.
> > > 
> > > This oops was reproduced running current Linux
> > > master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
> > > to reproduce the same with 6.14.4.
> > > 
> > 
> > [...]
> > > [  +0.000022] Call trace:
> > > [  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
> > > [  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80
> > 
> > wild guessing: maybe because irqdata->rdev is not initalized in
> > _probe()? At least I do not see where it would be initialized.
> 
> your wild guess seems correct, I'll send a proper patch with your
> suggested-by after doing a couple of more tests, thanks.

so, the bug is clear, however the fix is not an obvious one liner as I was
wishing.

we would need to add a link from each of the interrupts to the specific
regulator. as of now such a connection is not existing in the code.

I would not have the time to fix the code in the next few days, if someone is
able to pick this up before, just let me know ...

Francesco



