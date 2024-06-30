Return-Path: <linux-omap+bounces-1621-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C022B91D3D1
	for <lists+linux-omap@lfdr.de>; Sun, 30 Jun 2024 22:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73E822815DA
	for <lists+linux-omap@lfdr.de>; Sun, 30 Jun 2024 20:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBB2155A39;
	Sun, 30 Jun 2024 20:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CCEH93Y/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C773200C1
	for <linux-omap@vger.kernel.org>; Sun, 30 Jun 2024 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719778810; cv=none; b=RX0JM7umuHN5Cmmivv6Vh/njh2t47AQHO9gK9zRFl2mJ8OD08SLTC/eUbPFR6rAZQG6k3t1H+eiRTuUzHKUUNHQWQE5L5pnP4EKhR71SSr+WzjmID7vULaDJNXZ+uU+++Y/Y9RQRv86oZ4mUwlWo+/+a06wDGjn/U2grlQ4yL68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719778810; c=relaxed/simple;
	bh=k7XWzF83Yk/Gk9jFPSfNDfm4CWYKj1+6WTt5ZA7ll6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHua6e1eP9V1edifFmmAx986KCluBADvvap4irpUBKelDmKqntL4FwGwlS+PXypFvaYn09btwaS9BSPgMFeSfLlyrZD/KvRgfg2nFb1ZiiYpPgke4RZMU2+3r3Ao2N+bqOprn+3Pdpc8f8P70ujqpHlOUObJmxd6Rp6LDN54ce4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CCEH93Y/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=k7XW
	zF83Yk/Gk9jFPSfNDfm4CWYKj1+6WTt5ZA7ll6c=; b=CCEH93Y/mSLPE2OvuPDC
	pAiBrWluT0Zpub/ALass+4mQp88brwgj4q8Df1hVIPSn7E3aNXnkib5IuKxnk/IC
	WA9bLLyWOcbuIOqs9DTUKPUZto7g8GgygYiF+QaxWgMUiUf6AYXN/hqSGftuJekL
	k4Kz+8ARmanSDJ//eCSn1V/IdePZ4OdS5RlcNLkyOVKFpTKOiCn+rS2Wzc9PtsjS
	YKbpc5zMUK+v2ztjRHRZHLmrtqPjVrgBnT7yv/BTCNORoFnK0aSj8gktrkhGLdky
	O1EQBKssstp/bIiCLLEoJqrgGymuFafBfo3+NB42/ezk81E6pYpxhNOJmlGCYnPB
	ow==
Received: (qmail 1903384 invoked from network); 30 Jun 2024 22:19:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jun 2024 22:19:56 +0200
X-UD-Smtp-Session: l3s3148p1@WyFANCEciMdehhrE
Date: Sun, 30 Jun 2024 22:19:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Allen <allen.lkml@gmail.com>
Cc: Aubin Constans <aubin.constans@microchip.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Manuel Lauss <manuel.lauss@gmail.com>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alex Dubov <oakad@yahoo.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Bruce Chang <brucechang@via.com.tw>,
	Harald Welte <HaraldWelte@viatech.com>,
	Pierre Ossman <pierre@ossman.eu>,
	Christian Loehle <christian.loehle@arm.com>,
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5] mmc: Convert from tasklet to BH workqueue
Message-ID: <ZoG97J8P_-zM9AtY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Allen <allen.lkml@gmail.com>,
	Aubin Constans <aubin.constans@microchip.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Manuel Lauss <manuel.lauss@gmail.com>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alex Dubov <oakad@yahoo.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Bruce Chang <brucechang@via.com.tw>,
	Harald Welte <HaraldWelte@viatech.com>,
	Pierre Ossman <pierre@ossman.eu>,
	Christian Loehle <christian.loehle@arm.com>,
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
References: <20240626121551.3127032-1-allen.lkml@gmail.com>
 <dc7hnzrxtrtvlnkfxnqfn46ulx4gq3so235tibohb54zwvjbcx@4s5osl4sjrb7>
 <CAOMdWSKh3+HXFuYVx-GHC93iqEPskRKLti9KHKLHs5RYy-mcjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RFRvANZWl1prx3ZZ"
Content-Disposition: inline
In-Reply-To: <CAOMdWSKh3+HXFuYVx-GHC93iqEPskRKLti9KHKLHs5RYy-mcjg@mail.gmail.com>


--RFRvANZWl1prx3ZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> My apologies, I have been out sick and wanted to unblock Ulf and
> in the process missed reading your feedback. Will have it fixed and sent out.

Thank you! No worries. I hope you are well again.


--RFRvANZWl1prx3ZZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaBvegACgkQFA3kzBSg
KbaQMA/8D++6ZsuscnqcQoQiPzdP4nOFHpUMEufjlfhpxMdosdABvWxP3sIhXTkH
0lfox8OqAa9eWZD0ZoWsBbNZ+uJ7RYGajoL8KTRMt8XJAyfbErXPKt8djnQVZJDA
ir/Yy3eeRJzSjW0YadRqMmfrNA/RUQ1teqdzUhIl3EnW/F4YOdsyJRDogmllwRgS
NOuO3fFYfvaHcmOTvfIb0a74U08uILfO5H3C0WmzzI9DgSgQpKQW6KqASRlTLffH
ova4HFXeRtLPEosPk5WXgPdrBboDUTdpaYJ0z4Y43Qp4wDGYRJLc0U/lHIDeSzGm
I+VFF32kRdE+fr6Buez9PlaoZJKJeAVES436df90llLkV7H2O0iR6gAlEl+8ru2P
naY5XobgT+hrjRLiF2VHS3Plqb1/vLdT+ZBCrFwlSADYVkTiVBobm5u4YfZrc6P6
r0C6cRj2RmsudRE/Xd18+trAR2IQFpqX4rVUwSPK76HwkCVLwMMrXvrmwH3k3pOh
xycAbsTPmOWxsSdlgLaoKCIj+PcpJqAjZqzsbEP2BGKNybwnLbkLlgz9eKhuPsm8
hufUW87XQxRFosbMYRxPN+xuJu+2rfk65MiWfT9zwMiPl8qtv8InQr7GXRoQP2yS
vc1by1XbApy4bsLuvXLzpnUJjPSI41N1BZ1Id/3OMgN5JkCbwO4=
=3jwr
-----END PGP SIGNATURE-----

--RFRvANZWl1prx3ZZ--

