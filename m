Return-Path: <linux-omap+bounces-1825-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7FB9452AE
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2024 20:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 217D3283EFA
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2024 18:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5242E146A7C;
	Thu,  1 Aug 2024 18:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="b2BdOvzG"
X-Original-To: linux-omap@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E64182D8;
	Thu,  1 Aug 2024 18:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722536610; cv=pass; b=EjNXtf7hCRerz7lzOp9KOaqzOuFeSd9tH0g4dRcQbU/KWLDZ4ORc4oUNo58w9NOz2uibxKCDXbUKcDqSEu0tbi70rkYTM8JZ389cAJVdiLf97mak44KQl08I8b/CoH9Jl/JGVb5Ju6ipdhyz+FDvFBidPtTheRn8psOFwdaf4YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722536610; c=relaxed/simple;
	bh=4wRXXMehBGRDb/6aL/BZckBsPVOqICCy6SwZj15ywqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTrPUkWgyYik+DDHJd6GbknSx6QHJm998aiKs5OfeEnFcqr+7M5+ErUBQXc01hxrAGar7sgAfb2dlclMKikt82zahdVcZd91oizf1fI6npNf7NO/IhfsprqnvNt9I5vOqZ49Nipyaxe3vw3IF4uvGqByLp5e4F5hlwLPW0DW8SA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=b2BdOvzG; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-100-193-nat.elisa-mobile.fi [85.76.100.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4WZcll3Bw7zyTm;
	Thu,  1 Aug 2024 21:23:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1722536600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yQ1qrq1jrt4jr96yddGi/XxkrM81q9qc+13oI7Z3kUk=;
	b=b2BdOvzGALoWHnyvxL3tYp82UwiNU7ICLb2rOAGKRTZniaXBFCRQMTUjckytek0V0eSfLe
	evs/K6FN3LtpNW/8pBdueQyu6TDA2D1kpuYrku2jUvKuIRZnSK7g7n3sQH93iIg4Xs2mqo
	0uTLSs6JNDHYi3/3XxIcJQuGUMKajMg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1722536600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yQ1qrq1jrt4jr96yddGi/XxkrM81q9qc+13oI7Z3kUk=;
	b=cr8B6ebMedsHZogHn6KaGlvFM7mfsREXwcTBmCYtJEME1qjpuDvV5o5rTc6gVAPr98uYyC
	2RIg/lg34X5xgNP7xDB1eOAgXmfxjHqSfPFHdt5SM9XgF171tQO3TP3myvGC2F8xzByfRb
	ruQHgbCACBfsiOdYDaKPEBfx+VhB3+c=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1722536600; a=rsa-sha256; cv=none;
	b=eitN2X/lAagvt1JHcwHwjoN77StVkh/G0LS11puePxp3dXmL0NybO8SH3pKg1+e9Wtj5ux
	kmC5nvDziWIlbHptP8O6idOqYVgQReZW6u3x70+WLnNQAFSUE+cvHBDpD7edx5HjzyYMIR
	DEn8MAHYhG33fu9HbTshQfBkzDWBbVM=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
Date: Thu, 1 Aug 2024 21:23:13 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Richard Earnshaw <richard.earnshaw@arm.com>,
	Richard Sandiford <richard.sandiford@arm.com>,
	Ramana Radhakrishnan <ramanara@nvidia.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	linux-samsung-soc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	debian-arm@lists.debian.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Message-ID: <20240801182313.GD47080@darkstar.musicnaut.iki.fi>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <20240731191332.GB47080@darkstar.musicnaut.iki.fi>
 <ea475f27-af7c-4060-bff7-a78389174236@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea475f27-af7c-4060-bff7-a78389174236@app.fastmail.com>

Hi,

On Thu, Aug 01, 2024 at 10:59:38AM +0200, Arnd Bergmann wrote:
> > These tablets are not very attractive for hobbyists anymore as the display
> > support got broken and eventually deleted due to bitrot. There has been
> > some out-of-tree patches/interest to regain display and other features,
> > but no major progress really in 10 years or so. The last major mainline
> > feature was adding Retu watchdog support that allowed the device to stay
> > on longer than 30 seconds after the boot (the hardware watchdog cannot
> > be disabled).
> >
> > I guess in OMAP-land N8x0 is one of the least used/active boards, so if
> > it causes "a lot of pain" then maybe could be a candidate for deprecation.
> > But with custom kernel config, the board has been pretty stable overall
> > between the releases for limited use cases.
> 
> Yes, I think it would help a lot to deprecate it, at least this
> would save me the work of moving ARMv6 into an ARMv5 compatible
> option (I have done the patches, but they are entirely untested
> on real hardware and probably incorrect).
> 
> Would the timing make any difference to you? I.e. does it help
> to keep another year or two, or would dropping it in early 2025
> be the same?

Early 2025 could come too soon, but anyway during 2025 sounds OK. Let's
see if anyone else has comments. At least one more LTS release where it
has been tested would be nice.

> We'd also want to coordinate this with the i.MX31 maintainers,
> since dropping both together is the only way to remove
> ARM1136r0 support.
> 
> >> === OMAP1 ===
> >> 
> >> This is now the only ARMv4T/ARMv5 platform with no
> >> DT support, making it a target for removal at some
> >> point. Unlike PXA, there are still users, but it seems
> >> there are no current plans for a DT conversion.
> >> 
> >> I would suggest going through the five boards
> >> individually to see which ones we can remove in 2025
> >> and keep the remaining ones for the moment.
> >
> > Here situation hasn't changed - all of the boards are equally
> > important/useful, at least from a maintainer point of view. The routine
> > I use to test/debug kernel releases relies on all of them.
> 
> Ok, noted. Since you are doing the testing, that at least means
> we have a chance of cleaning up the code gradually towards using
> DT. Dmitry has started a migration of platform_data towards
> DT compatible device properties, which can be done gradually
> for the 22 platform drivers you use. This unfortunately still
> leaves the nonstandard dmaengine interface (for UDC), but we
> can deal with that later.

I have some plans to work on that. There's a long-standing bug with 15xx
DMA, but I have gotten that working, just need send those fixes out. After
that the conversion to new dmaengine should be more straightforward,
as we have a working testable reference for both boards using the UDC.

A.

