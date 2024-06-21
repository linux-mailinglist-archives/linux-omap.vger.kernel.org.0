Return-Path: <linux-omap+bounces-1578-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C0D91214E
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jun 2024 11:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73C2F1C238BA
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jun 2024 09:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE4816F859;
	Fri, 21 Jun 2024 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JfJzCQK0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4991A16F84A
	for <linux-omap@vger.kernel.org>; Fri, 21 Jun 2024 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718963629; cv=none; b=L1jFvZwK+19F3rRh5dBTyoyhAWDOxl55xSzqr++8+ILNcEgRgy7mimzDUjf4b0Jy70A1j04jBMScV8zoop/RuI7dLY21xmMGsYckhYA46BWXhKBv3k5LP661YZkpMn9JQxnJyQKP39bgYBShWSyHxwSu/tnkPpN5jOnEv3J5gr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718963629; c=relaxed/simple;
	bh=9X27kAi88t13JEAFL9myOVAMxXzM/vgQYLhQyo43drE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndhRsg+sbdlxWx6ZiTloaGAXvVqvjkQsysVl+nC8IASGJJ5MFfMBKn3hO+VGEBD77JGxHMPCVeWFWUFTZUfURygoC07uk3OsHmPLyooG3AeGjeyoZNGWuEl8Q2ZgXkaSNMqXipzFD9UGQWyZRGUb9Zbf8EElyNFLKWdC65lF/vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JfJzCQK0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RPfT
	8u6a3+40tK3oCZZfl86nwYXzLiH9ajhehJvBjqs=; b=JfJzCQK0ozaPEuqmU/lq
	8h/+hfxTrqCfF0yKoNf5BY1by4bKOrS3weHMmmqAD2hCgk9zoWs/etD3B3iTVI7j
	qYLp9HRiCzt0qgaosA1jZz2oYj33/h4EriTTD0c/ziUWCJgIgiL0QqvVsnxxLbbP
	Kzj0oF0UdKzsCG2ntXXe/AuL6erfPPSJQA0hdgf8MIPulqO6Umd1GPAWb3bV5ZXj
	zABGh8fc0vEBOKAddFTf8k9tiLeiINDjk7ViMnMRtndwfdHLilDztl4EKlsKUkOQ
	sSi9Z+2s9e3UGLXgOt3t0SsCJLfr0Up+yFOuq4MD1+EA3fzcCh+JHh2lS8szanCs
	ww==
Received: (qmail 1326092 invoked from network); 21 Jun 2024 11:53:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 11:53:44 +0200
X-UD-Smtp-Session: l3s3148p1@6DcuaGMbKqogAwDPXzjQABqqX1QYyOSW
Date: Fri, 21 Jun 2024 11:53:43 +0200
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
Subject: Re: [PATCH v3] mmc: Convert from tasklet to BH workqueue
Message-ID: <gw6adkoy3ndjdjufti2gs2gnk3xdgylt6tnia2zha76hsgdwtq@dr3czbxjij66>
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
References: <20240618225210.825290-1-allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gq4kufue4w3vtipq"
Content-Disposition: inline
In-Reply-To: <20240618225210.825290-1-allen.lkml@gmail.com>


--gq4kufue4w3vtipq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 18, 2024 at 03:52:07PM GMT, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
>=20
> This patch converts drivers/mmc/* from tasklet to BH workqueue.
>=20
> Based on the work done by Tejun Heo <tj@kernel.org>

Has this been fully build-tested?

=3D=3D=3D
drivers/mmc/host/renesas_sdhi_internal_dmac.c: In function =E2=80=98renesas=
_sdhi_internal_dmac_complete_work_fn=E2=80=99:
=2E/include/linux/container_of.h:20:54: error: =E2=80=98struct tmio_mmc_hos=
t=E2=80=99 has no member named =E2=80=98dma_complete=E2=80=99
=3D=3D=3D

In deed, 'dma_complete' is only in 'struct renesas_sdhi_dma'. From
there, we can get to the parent 'struct renesas_sdhi' using
container_of. But then, I don't see a way to go to 'struct
tmio_mmc_host' from there. The other way around is possible because
there is the pointer 'struct tmio_mmc_data *pdata' in the TMIO struct
pointing to the data contained in 'struct renesas_sdhi'. 'host_to_priv()'
does the math. But I don't see a path the other way around.

So, it doesn't look like the workqueue interface can provide a
generic pointer like tasklets could do? This means we have to add a
pointer from 'struct renesas_sdhi' to 'struct tmio_mmc_host'?

All the best,

   Wolfram


--gq4kufue4w3vtipq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ1TaMACgkQFA3kzBSg
KbanVQ//dqEZ+e/wVpBJ/SIXoF0cFcPn3VByooLZaUBcc7mmkHJCynUy3IleRLG2
zyPZXbb4367ZgKpi4MtZ9xFVQB2l1+Vwcag8Si0wn6HT6uJfAZpzICet+yovlam/
alBGpZQBCQbiRNXakttLhByw9+KHIcQHMQQlsdzW5V8L8w1LZYgr/N2vxnz3Bwqv
c3XSf1Cpvyc5r2Ztce6d2GXKxPsmWTCcGCAAnj5oPe2FkyMpmZeStL1RZYc/spTa
YjEDtOMrckbNpCXoLu5OjvZRv4NFicsuRojKCtbFScaj9uSS654P6JJY8rfSWJp4
rWOuidtkkkKlE6y+rT79fnPikKc4UoMMKsf6D9EWETKBP9jEIsO3Vr1kz0/wME0R
iolEdaUwvOC6EHmE86tEleFEmYZIK3RF7NpmyVofqy2kMAsNj5dIAuvPyxXN1vOh
bXM9JLI0Io+YxwYfoW2ycYMZTFVIQXdsWefZmFoTQnPND5aE21UwQYX4bCE2vz+x
eCcUo0hTOAnz1quoiDuyr7eNLXyGTfyhkQ/VHgE9dez7hFUtNxVcGunp38fd6Zbh
KFXGX7wtIkVPHLvls7WsellcB6Bz6mckcW0UwThPUYjEkw4G28nm14FRUwGJLj6L
qXTveQ7e7fp720pxFi7JCuf1dl/rL/uS7ub1hjkEi/8/3UZKEg0=
=CZvf
-----END PGP SIGNATURE-----

--gq4kufue4w3vtipq--

