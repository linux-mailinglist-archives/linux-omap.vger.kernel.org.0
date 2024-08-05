Return-Path: <linux-omap+bounces-1834-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9CB947B0F
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 14:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A2F21F21C42
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 12:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECACF15666C;
	Mon,  5 Aug 2024 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="AuA380N+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9FE18026;
	Mon,  5 Aug 2024 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722861414; cv=none; b=DrJ35dcZhUWF8cCkTBWu8R4UFf2L5NHed9h1VIGHDWcMo2m/Yj2/MsedQBlHrRX+lzXfZNX2udKX9RnCytZWIkFfCXzpG02F5ag8Rmo2PBU2AEwqAr5XFdW9MLasNssAIREDladvmMSr29B5By3h3b2Uo3npHB+mwHUv38dV4UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722861414; c=relaxed/simple;
	bh=H2gxC/+BsGYwCzylaUC6vm1fwAgk9U/dzWcrtrEPq38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIAfn364bfxZHGVg6r+nWcv01z+Xo2yLBlOY9KDgaRd3BJbfNnankiMJwc7M5HMCeSZT6raLMRjnq4ZoQaWrvoI1BGk/olyUnVfKXzyf8nPeo6Lc8kEvw+CcCOPKCn4LrkDRcEaEfYSh+iwBkYVg7e0FfgtICvvaelLbZGmwt5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=AuA380N+; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 439E060434;
	Mon,  5 Aug 2024 12:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1722861060;
	bh=H2gxC/+BsGYwCzylaUC6vm1fwAgk9U/dzWcrtrEPq38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AuA380N+uuIrzYd5SM3muac/ofHHbpm4jpko8fb8EXDdKExnzkfvcK6Yq1v7O3Zav
	 pmyaZpMghdRMhHhI07baa4G5vulqPYS0vWUhUWeyIoDXerJWG1lzEkuprqDDhLptXj
	 3WXVLNEJcopXPSxA6ZtN2Z2FZ0TZfRBLFry5PAhu6jnA1aXoE6ni4LSs/HINS+CHE5
	 K4WoB6IdVqh7HvOSHAgT4fkWjGakLrLyy4827PwIt4K24laZQ9+URVeJw7O+G3rPHQ
	 V+iMsaR6mVV9IUMrYAjS6m9hPPhyk4r9w3YA+0Jl8k80quvw7dV15E9AAZ1shGUS/q
	 vLw3oLpbMGJsA==
Date: Mon, 5 Aug 2024 15:30:03 +0300
From: Tony Lindgren <tony@atomide.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
	Linux-OMAP <linux-omap@vger.kernel.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	linux-samsung-soc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	debian-arm@lists.debian.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Ard Biesheuvel <ardb@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Message-ID: <20240805123003.GA5123@atomide.com>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <20240731191332.GB47080@darkstar.musicnaut.iki.fi>
 <ea475f27-af7c-4060-bff7-a78389174236@app.fastmail.com>
 <eb91d092-259c-4896-a06d-363c1a62712c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb91d092-259c-4896-a06d-363c1a62712c@app.fastmail.com>

* Arnd Bergmann <arnd@arndb.de> [240805 07:58]:
> Thinking about this some more, I wonder if we should just
> change the Kconfig dependencies now (for 6.12, possibly backported)
> and forbid ARM1136r0, i.e. OMAP2 and i.MX31, from being enabled
> in combination with SMP.
> 
> This would immediately prevent the bug you are seeing and
> allow the cleanups we've been wanting to do for a while,
> and it would avoid the larger-scale rework that I had
> planned (moving armv6 into an armv5 kernel).
> 
> The main reason we didn't do this in the past was that it broke
> Tony's workflow of testing omap2plus_defconfig across all
> platforms, but I assume this all changed with the new group
> maintainership anyway.

Yes please go ahead, no objection from me.

Also related, the 2430 support could be dropped as AFAIK there
are no active users for it. It's similar to the 2420 support
that n8x0 use, and only 2420 support should be kept.

> The effect here would be that imx_v6_v7_defconfig would
> only inlucde imx35 but not imx31, and that omap2plus_defconfig
> would turn into effectively omap3plus.

Yes that makes sense for the active devices. Note that
multi_v7_defconfig is too bloated to boot many of these devices..

> I would still tentatively schedule both for removal in early
> 2026, but if we add the !SMP dependency it's not a big deal to
> keep them around after that either. We can make that decision
> next year.

Makes sense and the SMP related change can be done now.

Regards,

Tony

