Return-Path: <linux-omap+bounces-1584-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB619912FB5
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jun 2024 23:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77287285F36
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jun 2024 21:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D2917C221;
	Fri, 21 Jun 2024 21:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EoSqq8iq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48C17B435
	for <linux-omap@vger.kernel.org>; Fri, 21 Jun 2024 21:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719006141; cv=none; b=lOCmUr0B526ea6m/AO9AzamNbO1iVgSH5zUooMs8I3PBUBGjgq+R8hc1T+OKTdyvkTHRT4uRqoNx3vZLLYIC4EePCvQg9zKZL0uOfAGeMHoURRRzHp+ogN25TYfFRzvVIg3qb1FEW1MPvEnedsnl6hes0cT64mD5HntEU0HNG7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719006141; c=relaxed/simple;
	bh=1YAwfipQupFRIS4wpWcyOMfeZDaN8Qg2Ww00GUTEC3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxjW/vQPZOyN1udPlinnlv1BghjgfQ2QtH0K7EM1HG7DlL1UJEdIdePld6fEBqt6Y2uOkkrm0xngpJ1uuL/JBLoZg7Tw01fjk5UJmihF01cd3ainfJg/86/R6e7Gy3LrkEgFYdHSNBT0EP1KiFhwu4MH8h4yjXqFd0pVmjNOKLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EoSqq8iq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1YAw
	fipQupFRIS4wpWcyOMfeZDaN8Qg2Ww00GUTEC3Y=; b=EoSqq8iq1SKJnOEvDq2J
	mZyH5lgrQQxuZ8BDZygr+BRtkybIAQHwLLbeyDp+Om/Fc6B2Vp3SSBaK/ZKa39wk
	lvrzlHyBwPz3++JVJPtq//p5v+RDtzqwfRlfbTA4okvVpy0nYFut32lo2No0du8o
	BDMZw2QVyqD1By8LcRjbW0hD5PNY9NCFA+v4vNKEUoDLz52Z4ORZ69v3bDe2zpEC
	DIYgh0nB2oftaFpaAlQuC54+S7tH+5pMBMeRio2Jdi6QL9wjrmN81CG+xlNG53uY
	Fonsysw4nQR+005d3xktNxtUusBKZBLvg12T6zcb9dU5CVDL32YOKMOtXgoW9pyl
	zw==
Received: (qmail 1496405 invoked from network); 21 Jun 2024 23:42:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 23:42:13 +0200
X-UD-Smtp-Session: l3s3148p1@+wTtTW0bcpNehh9j
Date: Fri, 21 Jun 2024 23:42:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Allen <allen.lkml@gmail.com>
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
Subject: Re: [PATCH v3] mmc: Convert from tasklet to BH workqueue
Message-ID: <ay2rpumtfxtvx4qgkgal7a7z46dbtwjnq4ctik55neseirkhfk@gkylcwud6vry>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Allen <allen.lkml@gmail.com>, Aubin Constans <aubin.constans@microchip.com>, 
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
References: <20240618225210.825290-1-allen.lkml@gmail.com>
 <gw6adkoy3ndjdjufti2gs2gnk3xdgylt6tnia2zha76hsgdwtq@dr3czbxjij66>
 <CAOMdWS+p4Dt2xDGWvwoXtWinsRZintLwPmADddbsmaEfLvRQkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4uczb2555w7pwjdx"
Content-Disposition: inline
In-Reply-To: <CAOMdWS+p4Dt2xDGWvwoXtWinsRZintLwPmADddbsmaEfLvRQkw@mail.gmail.com>


--4uczb2555w7pwjdx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If introducing the pointer is the only way forward and is an
> acceptable solution,
> I can send out a draft.

My proposal is that I take over the SDHI part of your series. I know the
code pretty well and I can test the solution right away. Your draft
seems in the wrong layer (conceptually, technically it should work), but
I need to play around a little. Is that okay with you?


--4uczb2555w7pwjdx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ187AACgkQFA3kzBSg
KbbkFw/+NH0uQfV6TYrBMMITXN3T4xDzbs9NYB/BVvi4xIlPamoo08TmnIls53lQ
DMooD/RzgfYjo+8bF07S/RYy794UEsHR9fGWSsaqEOJUI2rWAJveeXzMsZHBmfGQ
HScU/Tfzm6c9C0zqvw7SO7zV26VDX25yUpVaAa/2IKKmsmKsBTcnAQjCP0F1Xibo
VvTW2iyVQDH/byyQiLbgdQxaK6K7BUwuliMX3vNvSLSzC8FLAldd7iE7zvhjMCdj
0wrYmTL/RjmAk+n4sPjPDaxav12gpRm38i0iB+oiLbE9G2onfOvjEkV6sDYjFfxA
hWPKRziVrRIJhBpT9jcAxuVUvnoBVmc/li0WqTA8b9akpPpr2WHkRDnyN+LpBI3t
FOEoTEJgxI1FPHLr2PiR4F4y6jti8dgKqsxRqcCWDN0Pa+QDWm7SUj4/DckZUeKX
VEu4Qyqp2LKdUIpK90ppMxaukDoOdtebVz3zg/go3+dVJqZaZvzQAP/xfzDuSSHu
PO3COoXSenYjYMFDPmlQBquNUq2SNIr6l8rE/Asucj7oIQdctw/5quwGOTF2zKTN
3ThGUbD5mUOTDu/FL6ImAOtPiLUpb0l4IXqz3etBaEXLTAah+mRg0VeIPyBhF2n4
0GEIjJ3TOdrtPXA20O5M/aCjeH1q3O+wSgL3PfXfwsV/z3AqQc8=
=JsVR
-----END PGP SIGNATURE-----

--4uczb2555w7pwjdx--

