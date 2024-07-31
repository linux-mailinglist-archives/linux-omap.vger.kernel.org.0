Return-Path: <linux-omap+bounces-1820-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F91943624
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 21:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F85B284107
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 19:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FB716A949;
	Wed, 31 Jul 2024 19:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="qEDwW4M6"
X-Original-To: linux-omap@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8DC161314;
	Wed, 31 Jul 2024 19:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453226; cv=pass; b=mA+pEQJpsdUaN+dMvq0i41PfstHPcxv16PkoTxplwf3y7xe4tOeKLDYQhOvA+orZnDeLre9bY84EPYG1Ummy/UeC10regIJbydsKttZX90zLM5Zx/afhbg7uvTc17Hmdk8XlGBhZ2p3Pc2b+jKt0PsSHsE+N5oUP1DEMXm2noxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453226; c=relaxed/simple;
	bh=NZoJXqLy6vZhc05SjrTiCHFxzwDxKYHyUwWMAWN1DMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grgHSR024C/BWd7TUF2gHpY2csYcP1DqmIpPwqd+kl0qGHrqB+J/PrH0W7VMYS8wCwghFsDmeFLJbCJLImU/gX574jEz5aUUld2ZZpuuPS7IYHHXdo3OnfgZmqySOzyBQUcYtzfMc5GGKC/gf+9g/86L3l4ZW6X+DNdxB2kKJvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=qEDwW4M6; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-100-193-nat.elisa-mobile.fi [85.76.100.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4WZ1wG4sN1zyQf;
	Wed, 31 Jul 2024 22:13:34 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1722453219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKNVn6TfX89GWfjIM0Jaen4pOYmILV2qL8jp0k43Fn8=;
	b=qEDwW4M66WNuY45SArOnCaxXp7QfJZUIZxO2cY19UkdOFMc6EEYHuKVDHlXzKFRS8XKbhq
	VqqvxLaAzaYV13ztrjOjdQbPpCsadMRmScwbbjPkWLR9+H3AnJd1jPsfkegX/D4vbvP3Ul
	33r2w/V+jEaRFLClsQ7UsjY5rKZzH54=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1722453219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKNVn6TfX89GWfjIM0Jaen4pOYmILV2qL8jp0k43Fn8=;
	b=Jfyw1d2Knad26sGf6oXlIzSPvanRQvdMpHOcxwKmv6kvOZqgpontBeibOGoYWK+Oiqho7k
	5e3YHhqTqhpEqOGXJ4AR10qyuSCPlCufqARgN0NCB/JdEhF2xC1zmXkbv+qBmBnVAs5hnz
	JNY+msDThwLJUG01+1RVwU8LdFKTdEI=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1722453219; a=rsa-sha256; cv=none;
	b=dA0q57eRsz7dG4S4uC6uc/jooWpGeO5R8w8QHbFHSOlFLEYcxLZgsE+bi74s0zB3Q6uyGK
	oh47LKfeAh4dWREJi9VsIfCbtXhlsb7ccYoYxZ4rKLaemaM3DaeYCBHxKeQTYMK9+BS2V1
	jnXX/HuCOxG/kKw7mfVXa3pZ7c2qOrQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
Date: Wed, 31 Jul 2024 22:13:32 +0300
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
	Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	linux-samsung-soc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	debian-arm@lists.debian.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Message-ID: <20240731191332.GB47080@darkstar.musicnaut.iki.fi>
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

Hi,

On Wed, Jul 31, 2024 at 07:29:29PM +0200, Arnd Bergmann wrote:
> === early ARMv6 ===
> 
> This is the ARM1136r0p in NXP i.MX31 and OMAP24xx, which in
> practice means just the Nokia N8xx tablet.
> It causes a lot of pain to support in the kernel since it
> requires special hacks to support in SMP-enabled kernels.

FWIW, I have been never able to boot N8x0 unless CONFIG_SMP was disabled
(but haven't tested recently if the situation has changed). And probably
nobody else is anymore even booting these with modern kernels. Common
distro kernel support for N8x0 would be unlikely anyway due to bootloader
and memory limitations.

These tablets are not very attractive for hobbyists anymore as the display
support got broken and eventually deleted due to bitrot. There has been
some out-of-tree patches/interest to regain display and other features,
but no major progress really in 10 years or so. The last major mainline
feature was adding Retu watchdog support that allowed the device to stay
on longer than 30 seconds after the boot (the hardware watchdog cannot
be disabled).

I guess in OMAP-land N8x0 is one of the least used/active boards, so if
it causes "a lot of pain" then maybe could be a candidate for deprecation.
But with custom kernel config, the board has been pretty stable overall
between the releases for limited use cases.

> === OMAP1 ===
> 
> This is now the only ARMv4T/ARMv5 platform with no
> DT support, making it a target for removal at some
> point. Unlike PXA, there are still users, but it seems
> there are no current plans for a DT conversion.
> 
> I would suggest going through the five boards
> individually to see which ones we can remove in 2025
> and keep the remaining ones for the moment.

Here situation hasn't changed - all of the boards are equally
important/useful, at least from a maintainer point of view. The routine
I use to test/debug kernel releases relies on all of them.

A.

