Return-Path: <linux-omap+bounces-582-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D157C854144
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 02:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E50D1F22408
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 01:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690F89449;
	Wed, 14 Feb 2024 01:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="qFSEtE3o"
X-Original-To: linux-omap@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EC14C79
	for <linux-omap@vger.kernel.org>; Wed, 14 Feb 2024 01:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707874077; cv=pass; b=YwAD9FuZU6V26v/O20NOEnwhicYGNnwjroUgSYIofSqi7S6Q62DBnsJB5ssRJvZ1S7D74ULVhwJSrB63NzxhSGx+U4aMQyFN3UcpymP2hvyTth6liR86+N0og97eca3Q+e9nnD0YkfydDgkbkhcPCAo7sh/yzXWGw8Bk9qRBmoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707874077; c=relaxed/simple;
	bh=Nk9SfQzKi+X8qhGdLWWyz5QivgNxRoDwHg1oF7w0Fqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRIxq1QEIX5wxRMJ7r/XmXmNReYY8O94rV2LxWEwpt3WOmb/vISV2phfcADJKIJVo5p1F4mvWASDn/ix0fvEmDKYEPyqPFb+oIPErKqhDe6bvEnXYCQBLYYtVSB5KpH92ng0720a+h+Nt4y6AHAGnfV8TpyWSdV5mET73OkLIyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=qFSEtE3o; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-160-177-nat.elisa-mobile.fi [85.76.160.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TZLD71hD6z49PyJ;
	Wed, 14 Feb 2024 03:27:51 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1707874072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4114BJ6W6i8Bsstwtgpj1rAy65HGfORfmM3A0e8Aa4k=;
	b=qFSEtE3oeD972ocZ9UxJbiLMfVGTpOdndOtwRw8Kz1jaX1Cp+f9DirjIqCYohMnPbD8G/B
	fimJ5CVWHO9jTBZERDsMy145V/AToZtUu3vDt+9mMBAEEHVhFy7H7fDs9U9nZRnZTE6YEE
	/HolOg78Ng0woGsf37RWIx27Sd3P07tzaEieQDx/Gwnso/uRrnsbtHcsNbTrXpUBZniHxD
	jxBNvKkAVcwF18UNEKq4mGzesMBoa3oJQl8/BS1oMAr+ADhvurh5Epq1mofD/vdm4wnF4C
	G9CH5PcIWGXx7qN3AAjw4UtWsLHKQoVHYLsRojfhPMQPzbHxG0xg8qjDu/emSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1707874072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4114BJ6W6i8Bsstwtgpj1rAy65HGfORfmM3A0e8Aa4k=;
	b=TcPn2+J6WWZYMl/Nw1NwxP5KG7gcYjK+SyqxfbWuT8+oa34PrREG0pr01H43zQVnfEpNRQ
	6QznGJWRuHzWCOqCUvXl3YxBrWZQDI+er3ZdSyiF5K+62e/Ms1fqymHVPpPfKvB21iBkmS
	0SC7upcO2OOH5hK2cwOyln2h2GT5hWar+bf0/cvA3uvTOILdJBUSqI3GuNwRVT8uGkXP15
	p+Sv0ECvwxlsPaGuo0D69gSBcf4Cjpehqke2cEvrbXbyUL6Y4Riexz07pCryuTQSRiy4gS
	UPH2Pp1UdnsYeiHf9SHBa98aEf9xkCpMd6UNjl4o29qmIe9YqQuFOQOsVeiFaQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1707874072; a=rsa-sha256;
	cv=none;
	b=sXIVf8RChiAZ7SLD2ivPhWO3VF0xTCe+uQqwok+lOGrLXO8KV5gVQ6iLxu36gccJuGQSaT
	euTU21km4HU1TljjcjKEddC8s6o0VbrGPiKKYXSeVNQPne1Qc19SP7VTB+0MmBoRX5x/xY
	DRKDzeuV6/zJMrvZAjVCZGTiY/Z9C8IZjsIvgDz+yzlaDjnOAtmTpd7PYam9pNnOqFbWzR
	UJTOPzNN2A3TyfACH0V3wOy1CWwSl2wNASBrF4X0cnvys51UFOj4yV89d1Bq1m+pHxAaz/
	U0aXUGTvMkEFxQlSBUVW5mv7Wo/lTDetoWnHvuojb+KF0uxlBLwIeTBYbgfMEQ==
Date: Wed, 14 Feb 2024 03:27:49 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stefan Lehner <stefan-lehner@aon.at>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
Message-ID: <20240214012749.GA203324@darkstar.musicnaut.iki.fi>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>

Hi,

On Tue, Feb 13, 2024 at 09:11:38PM +0100, Arnd Bergmann wrote:
> On Tue, Feb 13, 2024, at 16:36, Guenter Roeck wrote:
> >> > > OMAP1 machines:
> >> > >
> >> > > cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
> >> > > sx1                  Siemens SX1 (OMAP310) V2
> >> > > sx1-v1               Siemens SX1 (OMAP310) V1
> >> > >
> >> > I test sx1. I don't think I ever tried cheetah, and I could not get sx1-v1
> >> > to work.
> 
> This is similar. omap1 development is slightly more active
> than pxa, but then again they have no DT support today and
> are unlikely to ever get there at this point.
> 
> Out of the five machines that are still supported in the
> kernel, I think three still run on hardware (osk, ams-delta
> and nokia770), while the other ones were left there only
> for their qemu support. I don't mind removing them from
> the kernel as well if they are gone from qemu.

I'm one of the OMAP1 Linux kernel maintainers, and I have Palm TE which
I have been using for testing and development (and reporting bugs,
regressions) along with those other boards you mentioned.

Since I have the real Palm HW, I haven't used QEMU for that particular
board. But however I use QEMU SX1 support frequently as it's quickest way
to check if OMAP1 is bootable, and if the basic peripherals are working.
SX1 is close to Palm/AMS-Delta, and also it's ARMv4T which is rare these
days. I think it's useful to keep it in QEMU as long there are hardware
that people use.

So my wish is to keep at least SX1 support in QEMU as long as ARMv4T
supported in the Linux kernel.

> >> > > OMAP2 machines:
> >> > >
> >> > > n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
> >> > > n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
> >> > >
> >> > I never managed to get those to boot the Linux kernel.
> 
> I think Tony still tests these on both hardware and qemu.
> The platform side here is much more modern than any of the
> others above since it does use DT and it has enough RAM
> to be somewhat usable.

I have also these boards (real hardware) and test them frequently with
mainline Linux. However, QEMU support I haven't used/needed. I recall it
was a bit buggy, and some changes in mainline made the kernel unbootable.
Unless Tony needs the support, I guess they are good to go.

(Arnd: RAM isn't everything. Some of the OMAP1 boards today are still
more useful than N800/N810, even with modern bloaty Linux.)

A.

