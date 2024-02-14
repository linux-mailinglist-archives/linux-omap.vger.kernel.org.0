Return-Path: <linux-omap+bounces-584-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 800B1854288
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 06:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C839285907
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 05:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D297FD510;
	Wed, 14 Feb 2024 05:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="kmOQU0I4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41DED2FF
	for <linux-omap@vger.kernel.org>; Wed, 14 Feb 2024 05:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707890050; cv=none; b=ODCKjHFUO+RfVdsmrgdY/DIxnKgO08q6RhLpafBwqHEu2QGUzGmFp8E4UneDGadIcdozhTC5JHb2mg+u0/PtTJj/PiKiocf4xQey2Nmx6h/jSXFAqgoblac1bxS4i0tgE6PKlEZSiVkcnVrtEJLkeMAy3iNAT8YUlyVpLXxfJrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707890050; c=relaxed/simple;
	bh=Fw5oQJ5HFO1ECMibd3OJwI8fxtVq/TOpOYMhoS5tAZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hje/Dn+acXg4LSYa8juNQJFq5ADIUm1X/Bo1Z/2kniWr0gUsa6BersUG+cDaDLrjkpiWzjsWfuxlJeeYModp7i34DGFBtY+CxdGpB5oCj4I4JEh0FCyeevwkzMOR1UaokmEWg+SwTbkbatUAw/RkSGC4DTZEuIXIBEmd628mkKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=kmOQU0I4; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 238AC60476;
	Wed, 14 Feb 2024 05:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707890047;
	bh=Fw5oQJ5HFO1ECMibd3OJwI8fxtVq/TOpOYMhoS5tAZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kmOQU0I4oJFiUx/7Ocp1oV0U029yuPjmVuTvIgts4mq+VS57ZlO6BiRampfUYIF2f
	 lNDfC3pCeowqAzniITV5/dyWDMGtgP9ZpZw4+EynxVsnFG7q1LLSzStNxHAJ4MNWjO
	 IpevMOFtYXvP1vglmOOrs3Oh6clkfm7U60Y2r3l/PRpiimTuA7WNB4Z8wcpugUdpFV
	 h+VxKH4WkVYSRPaVNnbEIyglrN3Pp/gnS/ZBaA/dOxuqQlnmIB+RjjFPsrv157JAQu
	 WGfnXmW/Ym8F6wvxPYR8MM36pvll6f2jI0xrQ7FCvGJyO0qPQplVvXvMsqZ2Ao6Eon
	 jDPwoc+ufnKCg==
Date: Wed, 14 Feb 2024 07:53:16 +0200
From: Tony Lindgren <tony@atomide.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stefan Lehner <stefan-lehner@aon.at>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
Message-ID: <20240214055316.GL52537@atomide.com>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
 <20240214012749.GA203324@darkstar.musicnaut.iki.fi>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214012749.GA203324@darkstar.musicnaut.iki.fi>

* Aaro Koskinen <aaro.koskinen@iki.fi> [240214 01:27]:
> On Tue, Feb 13, 2024 at 09:11:38PM +0100, Arnd Bergmann wrote:
> > I think Tony still tests these on both hardware and qemu.
> > The platform side here is much more modern than any of the
> > others above since it does use DT and it has enough RAM
> > to be somewhat usable.
> 
> I have also these boards (real hardware) and test them frequently with
> mainline Linux. However, QEMU support I haven't used/needed. I recall it
> was a bit buggy, and some changes in mainline made the kernel unbootable.
> Unless Tony needs the support, I guess they are good to go.

I've only used real hardware to test omap1 for at least 10 years, and I
have currently no omap1 devices booting. Still hoping to add n770 and
osk back at some point though for basic boot testing.

I could see qemu being handy for automating boot testing for git bisect,
but as far as I'm concerned no objections to dropping old device support
for qemu.

IMO it's best to concentrate on where there is activity and users, and try
to make thing easier to maintain in the long run. Anything with users and
active development happening we should try to help and encourage :)

Regards,

Tony

