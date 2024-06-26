Return-Path: <linux-omap+bounces-1589-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D6D917912
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 08:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BF4F1F226F6
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 06:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBED14F9E0;
	Wed, 26 Jun 2024 06:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FnPZ2Q/U"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E62613CFBC
	for <linux-omap@vger.kernel.org>; Wed, 26 Jun 2024 06:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719383826; cv=none; b=pLdOLQYipLUQ5mxovOd84HhMX29s0zlJjLSRURaSM+gs3dRxNJqib89ueUECX+swQtMHAJzr1g8msSh9icDf994RRsu3NW9SvdTLBYRo5L2HVEf+GAzoolzDGxwrb1cNAbwFqPdn9WBvSyVgEIxLA9M8H1+lPUhtmy42U4jcO5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719383826; c=relaxed/simple;
	bh=8HlxFlayCO5Q2Dfn73N1VcmYhkr9Os/QNdTYULmauYE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9aebe0Yk1fZphBJpK8585lTMMDDNkIeoeSojJSRNmstyxLh3XcLxG1djFepqHA5dP9TSjVNupji8LVYNF/uZegh1m+3t0eNVejYhX6cxac7eRd9cWWcXrZ4SeEPF4HWuCOnDY/pX0LP1re+or6tyuZrwpygYlAfU2IVYu4c51U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FnPZ2Q/U; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XG6W
	uG1CYZoEaFrNfdf57P8XrLm7RnivnO3dyvLzvcc=; b=FnPZ2Q/U1oAia+ECkCSI
	e2Vf+z1lM930cF5/n1xjmcnndQTOAyPRdB5gTPRSb1xzfF3b7YVeBDcjV8rnnwVu
	QX3hJHRnDcHXPT4WSPjqTCKsFXIjL5gKYTgn0BJTw/w5XzSG4X6tW0eQD9cgFS2V
	Ch4Zh29SLzOHdfYT6wAy0NCQpFx+h6zgqprSRPz/M8pgwtrUs0qM0gFhLylKX4qf
	7rm8CdqI558UzyWj7Nzk0Q0Tkas0S6CMKLD49RH4Yhf1l74WS9vOEZh0nP361Z9M
	PKOeUZ4al3pjv63JX9suLLTzUY0SY2+0TxtJIGrcAGUQFmOzpYBOGFPXZBtwPyE5
	Hw==
Received: (qmail 466193 invoked from network); 26 Jun 2024 08:37:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2024 08:37:01 +0200
X-UD-Smtp-Session: l3s3148p1@UUrgPcUb4pkgAwDPX0AHAIitiwsdozO7
Date: Wed, 26 Jun 2024 08:37:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Allen Pais <allen.lkml@gmail.com>, 
	Aubin Constans <aubin.constans@microchip.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Manuel Lauss <manuel.lauss@gmail.com>, 
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Adrian Hunter <adrian.hunter@intel.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Alex Dubov <oakad@yahoo.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Bruce Chang <brucechang@via.com.tw>, Harald Welte <HaraldWelte@viatech.com>, 
	Pierre Ossman <pierre@ossman.eu>, Christian Loehle <christian.loehle@arm.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4] mmc: Convert from tasklet to BH workqueue
Message-ID: <rddr35qidcxfemy24lcqnz7fo6ogltlffizwbf7evtdoz5qgsu@tva3pf6e2isb>
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
References: <20240625170938.2579372-1-allen.lkml@gmail.com>
 <racc3a2kmhu5275xcb6bght5j2bbg5ujlowdbfqeiwputmygei@ckscwafglafl>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d35bwx5hanml5js2"
Content-Disposition: inline
In-Reply-To: <racc3a2kmhu5275xcb6bght5j2bbg5ujlowdbfqeiwputmygei@ckscwafglafl>


--d35bwx5hanml5js2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 08:31:05AM GMT, Wolfram Sang wrote:
> Hi Allen,
>=20
> >    - dropped changes to renasas sdhci(dma_complete)
> >    - Wolfram to send a patch for it.
>=20
> It is still there.

With build errors (forgot to say that):

drivers/mmc/host/renesas_sdhi_internal_dmac.c: In function =E2=80=98renesas=
_sdhi_internal_dmac_request_dma=E2=80=99:
drivers/mmc/host/renesas_sdhi_internal_dmac.c:551:22: error: =E2=80=98renes=
as_sdhi_internal_dmac_issue_bh_work_fn=E2=80=99 undeclared (first use in th=
is function); did you mean =E2=80=98renesas_sdhi_internal_dmac_issue_work_f=
n=E2=80=99?
  551 |                      renesas_sdhi_internal_dmac_issue_bh_work_fn);
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Please let me handle TMIO/SDHI completely. You will get the credit,
still.


--d35bwx5hanml5js2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ7twwACgkQFA3kzBSg
KbbwqQ/+NEsWVmbIE12XppdwgrT28RGTfbagMcWDMvCLQBszNbFraLrclztth842
CRPQ5KawhKp7DPEO7y/7EEqNJfbTZeoUnQHPdGAJ8VCXiV7on3ikUYRaBIvuR/nW
bQxKCUQZUPmzT0bvOgoiL8ERhwOEbuXxz0G8E0RNObpXj/fhA17gJ5rOx2OjuQ9U
C3M/EI/+NCnW7WKD4fJ/7RXrFctcJoSDIb3ev1s0eJ/3uqRHPKtyzGDjqIw20VzS
i0WaEuU38TfgCabDxzSQbbhWAvxay0XeOweIdliKhAnYWJvDceFpRKqdx1qf56fF
l5dQW/OPbCmnjiXRJKvZIsjqarIAjTHumoGzfLBnGFshN/WyshGf310BxhXZgAgb
YpRtrTR/mkhweojaI5yn7RWRkgsTRLd/+ShTIMujC1t5/3u9bFPVVyMp3xLjK7HO
Enie/iNOWuhcscaWleriZuYlB+yYs601IqazjBYJ+u/52aBLm8PqeVQDZ2ZvPeBx
/WcCP6P3Ea4lEsc5r9pE+D4JxHv4NBNazCz/y1or3RHjexb88mtN2L7U2iEMIoRs
sy2Kz0Qaie9vhqG2+/rPf6ORzOTOtQL5I1deVB2CAqTvxtbCClYIleQFFRPGv8EF
Ui464tJmhd7k9izfr+WYmRSEL9g5lCs4L5t4RnnRx6lpZhxZeO4=
=SPOe
-----END PGP SIGNATURE-----

--d35bwx5hanml5js2--

