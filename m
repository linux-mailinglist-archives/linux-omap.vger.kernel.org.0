Return-Path: <linux-omap+bounces-1597-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 481A1918355
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 15:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 034BB284286
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 13:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F63F18413A;
	Wed, 26 Jun 2024 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="D49IjKzZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69C185091
	for <linux-omap@vger.kernel.org>; Wed, 26 Jun 2024 13:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719409841; cv=none; b=OteiLBAD4f+trqI+9vwShVi9QfHJi8yeFPfxuXD+BMT8RtyInXZjYz8vqVzmHOD6sVhjyfaU7LD8PMW8P4C1GU9tZcywgEuRFUzKxyUkZKxfDnS+fBSJxqgwwj6xBhSL5ZMMcDxvVPyat4wy+OLWX6cxX3uFaOVyckOYE8OkHUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719409841; c=relaxed/simple;
	bh=TZduDhlp9/TjEQ25M8Lc4Kq4b82N4uSGOpOaLnXy4l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcwq9BQB9KEuBuuBJXxZencCmMuYRaePTUAgUCaeqrlFITC3sFpkxZZDNvYuK+DEiDU9WXmrkiZIQPU/HhjHk5CBsK876kzrQsyhKPykTPjQZ5BV8ZPX8xZkw8dMDpuCSZvnINUX/8RdiF6CWoyHFUha2UvZJ1jYN5wB3VtxYoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=D49IjKzZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ZmJx
	0833jvjqKY470UIF/QjG5KeElTQtcy4pb27rm0k=; b=D49IjKzZoWZpXISXiQo6
	Tix1GwLHyvSIUd/EdCCdzc4e15/s6PaFTxXj7u706wN1KhrqFh7+svyhA5RA8kf9
	5rSNRZ+5OQEpypxIfcuByUmvxerWcu8E2YLEcrGwTpnDM/Qs8Pkx72HGgluOTxql
	W6n9cpuf6fJ7xTn81QZT2ZQpEWjkrLnA3v0aXe3inVwe6DK9e1K+bIrSddPKnT6Y
	aAw3Ys8SPdlwwLCSLH9iWocSQrnppcUBS0DcAUZ9XJOGRFWes7knEG/CYEZdW1Jv
	iRZji3J+K+RXI31y6vN/slYZA7AKin8XBwmzPLJsZgPYi/snkwdttY/AZhobaDsc
	/w==
Received: (qmail 591740 invoked from network); 26 Jun 2024 15:50:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2024 15:50:32 +0200
X-UD-Smtp-Session: l3s3148p1@v6Y9TMsbOtVehhrE
Date: Wed, 26 Jun 2024 15:50:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Manuel Lauss <manuel.lauss@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Alex Dubov <oakad@yahoo.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Bruce Chang <brucechang@via.com.tw>, Harald Welte <HaraldWelte@viatech.com>, 
	Pierre Ossman <pierre@ossman.eu>, Christian Loehle <christian.loehle@arm.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5] mmc: Convert from tasklet to BH workqueue
Message-ID: <dc7hnzrxtrtvlnkfxnqfn46ulx4gq3so235tibohb54zwvjbcx@4s5osl4sjrb7>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Allen Pais <allen.lkml@gmail.com>, Aubin Constans <aubin.constans@microchip.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Manuel Lauss <manuel.lauss@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Alex Dubov <oakad@yahoo.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Bruce Chang <brucechang@via.com.tw>, Harald Welte <HaraldWelte@viatech.com>, 
	Pierre Ossman <pierre@ossman.eu>, Christian Loehle <christian.loehle@arm.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240626121551.3127032-1-allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="behznqdfvajuxg7o"
Content-Disposition: inline
In-Reply-To: <20240626121551.3127032-1-allen.lkml@gmail.com>


--behznqdfvajuxg7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> v5:
>    - completely dropped renasas changes from this series.

It seems you need to read mails more carefully. In v4 I said that...

>  drivers/mmc/host/tmio_mmc.h       |  3 +-
>  drivers/mmc/host/tmio_mmc_core.c  |  4 +-

... these need to go as well.


--behznqdfvajuxg7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ8HKMACgkQFA3kzBSg
Kba01BAApiLeyMPIIlETTrsco/LDr51rIUR5/BOEgO9JSkVWY93qYD0jftFz7Um4
dlaT52sCY0RwioAlm+FR91JpBC8Olc4GXKisBn/iV8NdXAxrjIvrDSibnWHzDU5Q
ZsobHcFVbj4gjP5SiKciicN5Urr0W9mohb71fauTN+lB/GZqQY0QPA5fZclpxO1k
3nAcIEeArDKcaH4C1rmy8MkBw7oJfn3NOpX/BlbXnmmLTncf6HDLWPbmxR3oyWtY
ywxMCJrIJJlD/kOyQEqBkH/+6IO8xQC7pthCJFEVXcCTvL6lWz4P31G/I/3fGYAi
VYZF2ePRHrSXc5ZlYCy4PXiZYHSk05anlNiOmKaE1B8jlpvMgl2/7R+aOm/kd3fy
BxxAtM91QSHFmRqhrmg2N8g3lWJFo2BhQ8cLmVMdM8oL/xqyzC1eczkg+Bflt37j
rYFZkYhP/JuLM7tYcL8xcqXgY9mdzpi/7ZfHxNS8IxACX8BW6nyLL1VegFUPkoTA
ub5ITUbJd0R7vsbLAZp1qNBTt5S25KYnoLSsJ1p9dLuZJWbd0LZO762LPdRAnGDg
hVXdhnfr2BoCUtrrkZyIl+dGDaIubt8IripdAf1vbp8jXl15Ygeyxtgf05Eo9kf5
cC1anjqbkBL8ifXX5ARXih9KFcUw6yRataNLKsAgkDAFjMShrRI=
=qv/w
-----END PGP SIGNATURE-----

--behznqdfvajuxg7o--

