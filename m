Return-Path: <linux-omap+bounces-3627-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5550AA44A4
	for <lists+linux-omap@lfdr.de>; Wed, 30 Apr 2025 10:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C36B47AD809
	for <lists+linux-omap@lfdr.de>; Wed, 30 Apr 2025 08:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBCC1F0994;
	Wed, 30 Apr 2025 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="qza0LVi/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A78839F4;
	Wed, 30 Apr 2025 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000080; cv=none; b=NUJ/iX8xbR/ihOm8t14YK8gVKhIECn6OiyQ9jxnFg84tRpRJSdht6l5fo+kKqlmh3IS1j+7I8EZRHVKBgTvt288EWO2EKXMBihZIRUM4YF3QXvJ7UFLWlUidv4G4AYJYjOWCpxu0XyYCOkIgoVhn9TDEcl02SFIEJObRfLE9+MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000080; c=relaxed/simple;
	bh=kOLgDW5mAscBzPybxkcT5m7kBv/Z93TCzymRJmIKLfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jsowh5jX74PeqQ1stuSjhcP0+jBWfo0pJ4s4NzCUAkGNQSGdzHLXEC6nu2BlOOn8DN1xJ4EJK0lUSxNG5HJTGesuWSVAJotkx6BBC3Tzv2xk3VwNXVOvchrZQtAQNxaMS0hD63QsGVeL2VtxhWHPeCOkCubPHUSiD9GW4qBCxxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=qza0LVi/; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 35DEE1F969;
	Wed, 30 Apr 2025 10:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746000073;
	bh=Qwk49apGdChV5JZGiqEylFepdwmcqjzUOJTqLuSzy70=; h=From:To:Subject;
	b=qza0LVi/m2HVbgsx5wPZ2FtmT7C3PHPi6mEHLul28C5RUkukL9Y99CETWlrSzEmYT
	 /onAc2BzSyL8esA5FVRV2j2LWwUKd2IWD6u7rXhhzNH0VmmOXFQH2tCikLIi1785PS
	 VBS7t4lAzvGefP/J42axieMW7vhXTrosZlnRfiYKxjAriW2SRdQRhVehSmDJH5Yrjn
	 r36yWuEvvaeGKi6TWZs6Fjvddh6La7HD5SL8yBl03FnPLQFfF4uzlku0g2iDcY2em8
	 S+5AafpdlscJJyxwJRDEC/fQosP+ZFDyeFsR1K/9oePSqI8yxays62bWn5m+tugHYZ
	 V/w3WsBIFGUYA==
Date: Wed, 30 Apr 2025 10:01:09 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Francesco Dolcini <francesco@dolcini.it>,
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
Message-ID: <20250430080109.GA65078@francesco-nb>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
 <20250429185240.6a7644bf@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429185240.6a7644bf@akair>

On Tue, Apr 29, 2025 at 06:52:40PM +0200, Andreas Kemnade wrote:
> Am Tue, 29 Apr 2025 15:21:19 +0200
> schrieb Francesco Dolcini <francesco@dolcini.it>:
> 
> > Hello all,
> > while working on adding support in mainline for a new board based on TI
> > AM62P SoC I noticed the following Kernel Oops.
> > 
> > This oops was reproduced running current Linux
> > master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
> > to reproduce the same with 6.14.4.
> > 
> 
> [...]
> > [  +0.000022] Call trace:
> > [  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
> > [  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80
> 
> wild guessing: maybe because irqdata->rdev is not initalized in
> _probe()? At least I do not see where it would be initialized.

your wild guess seems correct, I'll send a proper patch with your
suggested-by after doing a couple of more tests, thanks.

Francesco


