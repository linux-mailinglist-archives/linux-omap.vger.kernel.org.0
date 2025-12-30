Return-Path: <linux-omap+bounces-5297-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FDDCEA530
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 18:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5C08301D652
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 17:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE86127AC28;
	Tue, 30 Dec 2025 17:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="C0J63I2r"
X-Original-To: linux-omap@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE64CA52
	for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 17:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116161; cv=pass; b=Gj8PaITxvVGr5/z7FBe6gdxavEr2dcOL4NiTjR66nFNAoEhUibqB0B3mUvmZ0MRvlcyw5Ml5eUsArQKxZ8igJW2scln6mnL3v3EzwXordAcnqwhWZgNR4PwsnEVOmj6qW9OS02HtM339uwTOYNXY/BJY7Keb1ReAWJxry3sQDtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116161; c=relaxed/simple;
	bh=AehpaYdyh/w30UaBplTlikv0iNx9XeTTYgf500yJ33Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuXldQWgNwWfdvor/utoLGsQzYdIDgwy2VxQE7Ja3in0hFREKvJRUMuqmNaBUeJCz2xNMEQi4cLtEVAkcHkgt2R/EyD2VIqrg0S/x9Pxm6yqeKYM+yGJ9jPZX7QLlUSua5+7/R6e4LS6xKyasuOdaDdkRphNFJ1d03GumvQjJm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=C0J63I2r; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-162-171-nat.elisa-mobile.fi [85.76.162.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4dggGl2dZJz49Q8K;
	Tue, 30 Dec 2025 19:35:42 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1767116145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/IB+huzo10okk2OaTVTslD9guwUX3b+iP/CdZtUnaS8=;
	b=C0J63I2rqTHg2c8seaXumRYMepfu9z8lkPKAr014D4AbO/8Mha3L9EDoepEa7PulAtIVdR
	zzA9FZr8FHULlZ27pzfNSXAXc8FW5GkeVsdBw3PMQZiIditn5x33IyjDxPwlO0R36JObLT
	cT9QMw5wmLNwIxYGx7Xe3YM1bFLWXDMLE0anIhK5RJxMt4QVN8xCV3EzVaCbMnRFv3QxXW
	hGiaeOjwr7o/wTWNBpFahNI0xrEwDD7aVl49Rg4iplp6ipD0epXXFHfFBaEvqkvNuWMP2r
	1q4EYYz7GShxddFmiFrrGYtA4w5+FjWex9S19mL3TGrpqjwF/3WMF9U2raTrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1767116145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/IB+huzo10okk2OaTVTslD9guwUX3b+iP/CdZtUnaS8=;
	b=Gfl/D9D/vVEHaO4gJY0CAoQqPjmvQ/8qjdkxdgTUNS8coc2XsHjv8gLUTNYjUAQJJ2hD9t
	SKugwNgFJyVaDmoXuFo4nLSd6x8SnrkgY8MYs8TNI2JjizQKg6do2h/UYvQzTzua+MD3h6
	esIDy7pvi398YIKclN9sfvr+Vjs5G29PyD20bpteVZT80FMC9hYPpzYoM6EoQ0HpWCDlCN
	YEZLkQ6dGYgofgIA7953XxKfdT7a3YH8vE8M8jPP7dVdnlr7ZkAlDaB40NfL8p9WulwoEx
	5LAeiaT87weV6gzNZA4LA1kXsQKskTkYs+8HlEbAXiwL8XC6emKC6HPkX9cFfw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1767116145;
	b=BhE4yi8POenZhEl4FPyDdkrAeQAlsFc0UbQRxqAz7as9BCgxglLYgQGdw78oHT/+rx3sN1
	pNmRD3Vw4VJycfXGibYD/JmPRmdwr2v57sRxQBV46cIuiVCu89MpNNnbnUTKWKlcyiPOKW
	a5IHP5RzSdqRZj33DuiboTKc0e6D70a5AM9eFyAWGnHXuJ5URqFHIAXKOnggZQw9OmMhO+
	yfDJpfXrcFiBBRXuhZZMqQc14TtcG1CKlk61NV5ZITPaf9SbSj3KOWIood8rlOPHG6jomb
	J6VqEGn00Si5D57jpPkwc7iUUvzkyoQYnOqL9ZtT8dUqTCeuAt9SK+MXuF8Grg==
Date: Tue, 30 Dec 2025 19:35:40 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	patches@armlinux.org.uk, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: omap1: drop unused Kconfig symbol
Message-ID: <aVQNbK4K_q4UtJP_@darkstar.musicnaut.iki.fi>
References: <20251230055230.3212260-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230055230.3212260-1-rdunlap@infradead.org>

Hi,

On Mon, Dec 29, 2025 at 09:52:30PM -0800, Randy Dunlap wrote:
> "select ARCH_HAS_HOLES_MEMORYMODEL" was mistakenly merged here
> due to a botched rebase (says Arnd [1]).
> 
> Drop that line since that symbol is not used anywhere else in the
> kernel source tree.
> 
> [1] https://lore.kernel.org/all/5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com/
> Fixes: 7036440eab3e ("ARM: omap1: enable multiplatform")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

> ---
> KernelVersion: 6.19-rc1
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: patches@armlinux.org.uk
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-omap@vger.kernel.org
> Cc: Russell King <linux@armlinux.org.uk>
> 
>  arch/arm/mach-omap1/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
> 
> --- linux-next-20251219.orig/arch/arm/mach-omap1/Kconfig
> +++ linux-next-20251219/arch/arm/mach-omap1/Kconfig
> @@ -4,7 +4,6 @@ menuconfig ARCH_OMAP1
>  	depends on ARCH_MULTI_V4T || ARCH_MULTI_V5
>  	depends on CPU_LITTLE_ENDIAN
>  	depends on ATAGS
> -	select ARCH_HAS_HOLES_MEMORYMODEL
>  	select ARCH_OMAP
>  	select CLKSRC_MMIO
>  	select FORCE_PCI if PCCARD
> 

