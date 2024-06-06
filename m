Return-Path: <linux-omap+bounces-1497-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74158FF56D
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 21:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C76AD1C2673B
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 19:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90E85339B;
	Thu,  6 Jun 2024 19:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="q8ONmmOY"
X-Original-To: linux-omap@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5563BBCC;
	Thu,  6 Jun 2024 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717703233; cv=pass; b=heFxj0WHfXFpmRFYwugGU4r8l6I+QMDeiPV4twPwEYK+1FFpR41bG2IPC3ip5sKqwcVrZmFiDRk09kWnPzPGGPMC2ue4D/q7vjo7RozHtp+Slf6aMTAH3EZ0l652dgw++Q93qRGZFtT4xauNDbTeo8bnHEDKDQW70h4fg5QUDUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717703233; c=relaxed/simple;
	bh=95JBikPb0VU85plNVzpeTui8k5LLPaKq/tw9FQgiWEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQyIDa5ikGiwyUdx6niQAvgkTv0XuycagP6zcoxD//UphQWmWt2MtghiagihqcIDNPskoRJzxaV40nxz5aMZRHC311zeF1brb2SfJSNKSF1rtqqmhEbr0PY/pbb9pjeBoqiOHbshWsAeGWB+3vfEo6baw2D6oVN98cNf0N3fPyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=q8ONmmOY; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-74-208-nat.elisa-mobile.fi [85.76.74.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VwFGN5c5Mz49Q3M;
	Thu,  6 Jun 2024 22:47:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1717703229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UrClKJA9brL19M4WtLgma2oVHMAxwn+KD22tbsVdg88=;
	b=q8ONmmOYIBVmAKqu/7z3JAZwLs8Inom5+FHT0lLXpcJHH8m0xNQ1Ap7BqdEidau+Ek5fJW
	BD+nsD9U54bL8nK91DTmFsogCXGWR9FjzHUsR/JkQZBhgW4Sjg3/4WcfOgrI1txJeOqCtC
	4tZh9sfV4Y+e2W82JAtjUimvn/3ZaZjOmnrLjrzH6tfU62Tv2nL/kZw1qv6cUBQj8N/DbE
	sSlYyGDcNH/LQTFkUogxRIghCwmmvYmJSgBxxNwb5Yhb3Ke5HwI5dzVeOAfyOpkU7qHpxZ
	F3nXVeSadgaIwvmc3sm+4yVooTw6NlythJuZVROYWmx0us+IideVRVof1zkXqg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1717703229; a=rsa-sha256;
	cv=none;
	b=F+VKMfVokwqydHJto6eK36ByJZYaGwuU+I1cS62avWh7lOjhR3F0XmU+wjFJW0qOic3rR7
	pc3EJtN46x9xL9P5rXlqWC4MFwFMWGDzp1SMcLF+dJdsigd4xn31N6rSXaG4kPjyB4pATj
	pLkzYE/BHaihgrPhICSVPNz6FiLmJTlzTMbHUkwVcyUR455TcNhF1ZCnUrJMN+cLkPPDcn
	rGMe2p6eVqd2NdaOw7Fo3EQ6oF9j9GqchXxJg/DboxZL5UlRPjI7jvxfhVt9qTK/K9vfVH
	lM/BvxzWa1KJ3j5+w4gA1vNccbnh4v1Ci6afPZz2R1/NKZkoWNiNi/fAcw7B+w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1717703229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UrClKJA9brL19M4WtLgma2oVHMAxwn+KD22tbsVdg88=;
	b=ZMKaHRbImTolUYoichVgjsIobmvUgMeIx4GAPk8gHzRfIJv0ktSjDgoficvnk2uwLomb1N
	nz6Ctv/qIEsrMJA1bmtjWDFT7re8hC2FgFo6VjnVT5m57V+9ocZpJj5E/vko8T7fag2NFo
	WyYtXz8+yxN/nZhU5vQTKRLX43pcf9s8hqtk0G6ag8Bm0bLVKlZkzSRSgg9aN+425hCOMk
	L0l1YE9ytJ1F1ZtVlAf/3R3vH3E+l+2WnyziB2CjuQs80vtNKMP79Vl6B0fK4IyBOUxkmu
	aDTgOg9zjs5dnV0PCR4P6ODR3Ca0cF7dBr5iHUwY+FvG6FCPdF+bRe4Pdg9/zQ==
Date: Thu, 6 Jun 2024 22:47:07 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v1 1/1] ARM: omap2: Switch to use kmemdup_array()
Message-ID: <20240606194707.GE9487@darkstar.musicnaut.iki.fi>
References: <20240606165104.3031737-1-andriy.shevchenko@linux.intel.com>
 <20240606193202.GD9487@darkstar.musicnaut.iki.fi>
 <ZmIRS8HTar7iKQo7@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmIRS8HTar7iKQo7@smile.fi.intel.com>

On Thu, Jun 06, 2024 at 10:43:07PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 06, 2024 at 10:32:02PM +0300, Aaro Koskinen wrote:
> > On Thu, Jun 06, 2024 at 07:51:04PM +0300, Andy Shevchenko wrote:
> > > Let the kememdup_array() take care about multiplication and possible
> > 
> >           ^^^^^
> >           Typo.
> 
> Aha, thanks!
> 
> > > overflows.
> 
> ...
> 
> > > -	hwmods = kmemdup(ohs, sizeof(struct omap_hwmod *) * oh_cnt, GFP_KERNEL);
> > > +	hwmods = kmemdup_array(ohs, oh_cnt, sizeof(*hwmods), GFP_KERNEL);
> > 
> > Maybe same result, but I guess the 3rd parameter should be count?
> 
> Actually it is going to be changed to follow kcalloc().
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?id=0ee14725471c

OK, good, you can add:

Reviewed-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

