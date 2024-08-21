Return-Path: <linux-omap+bounces-1964-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E395946A
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2024 08:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76111B23587
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2024 06:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B77116D4DA;
	Wed, 21 Aug 2024 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="rN8rTzS6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D831C6B5;
	Wed, 21 Aug 2024 06:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724220976; cv=none; b=UJamXgw+p74OU1AKHHWGHFQgBBI9YOtxwmNnyBfA4kzAS3f+rEKhL2+GbJtIbJH/BZRL5cBEEyDJkJGGK59//mPpZoEaCqnvNsSsIsLXE+OfxoN7ajBNaorv+Vn2a0C4j2onFR0HFo3TMUBTe0DyE6pq6xRX9VWwr2jt+9xBqwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724220976; c=relaxed/simple;
	bh=2reMS2abFjEmmGXQTd14XspYdvQzuU9J6ti19gknrkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXED2MzYc+RP5ICPN2/8KxNrYSx+sTayOUVj2bzTYFbfUFI2/tkLRq4M12aos/oEU9c3If1bURsQZLlxSLBPKW999kwORtTOLCqMRLGOaPbQoApKKMXKnEJom8mUYubMnaRLS0Snpazq6eMfQjbDWjOkRS510bSW/zsrRA+A5ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=rN8rTzS6; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 436C31483149;
	Wed, 21 Aug 2024 08:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1724220971; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Dl+RoD6QZnQpgIOZGmiiMtYBsjlYnty3EcuCmVpqaWg=;
	b=rN8rTzS6B47nDtgh0bW6AFWjjIozngRnDBW6pZv45yItrXTHwBTmmttPyqMaLTMStiSIEi
	yV/E7s7yof3gwAhslgS0MLUTZ3MEE5BkzJhG28/JTqIcEKDSsrKtQB/GOpbhmyuEHOTwu5
	AlyX75vLVxoRZD4nUDZhCms9VtdgRnjyavhObZFj8SFXZ0xomrbTNwi0nBF1s/ISwFAEs+
	hEzvlsTZALbtVBgtSTaLEeg6L+759lTusg2F5I3+WWbTpswiznNUMdbv/j77owvv4aG9dh
	8uvNF+ysV25Qj+TG+dgJ27Mymop0dj+psGftwkkjQv+DXNQ9MPbcmNAOqZ4zMg==
Date: Wed, 21 Aug 2024 08:15:55 +0200
From: Alexander Dahl <ada@thorsis.com>
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
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	linux-samsung-soc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	debian-arm@lists.debian.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Message-ID: <20240821-moonlike-winnings-fcee547a16b2@thorsis.com>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
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
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	linux-samsung-soc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	debian-arm@lists.debian.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Arnd,

Am Wed, Jul 31, 2024 at 07:29:29PM +0200 schrieb Arnd Bergmann:
> === ARMv5 ===
> 
> About one third of all supported platforms use ARMv5,
> but most of these are near their end of support. Notably
> there are still new SAM9 variants from Microchip that are
> meant as backward-compatible replacements for their
> older variants.
> 
> Debian still supports these, but the lack of FPU and
> atomics makes this harder, so I expect this to become
> an unofficial port in the future.

FWIW, these are not only replacements, but actually new boards are
designed with SAM9X60 for example.

Not all have .dts files in mainline kernel, though.  Would that
improve or change things with regard to long term platform support, if
the .dts files were upstream?

Greets
Alex


