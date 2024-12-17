Return-Path: <linux-omap+bounces-2850-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A4D9F589D
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 22:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 871097A2CF9
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 21:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8201F9EDA;
	Tue, 17 Dec 2024 21:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ol2zlekT"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE431DA61D;
	Tue, 17 Dec 2024 21:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734470363; cv=none; b=bf/nbn6EZI/theIlOfd4s37NkID19TKXaoUf3rT5ucDqgYFTIZA4Iqxa2uAvfy/WndZq0+x12VuBfhlU7KzXMHFbB0M0DoCqNwTebaG5DKCrahLQ22p75nj0llDVjsSg7lHNCDvnO6hUKbiLoYrs1yzcjRTczBiJogzk1UTK4QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734470363; c=relaxed/simple;
	bh=jrc3lY75xHWJSSzKDhwHm1denSyOJLkP2xgW2pqkhag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTPD4gFH1w/qq9P9hQIijmTTWst+fZ4mh4UMXDjg5C9++P8dF5rVsRM7ZI6hxDdYxTAro3lrqsnMyR87BGKDDWrmx3asHODICaho4lZewBnqaDXjGq9QcaZ5ipF8YpPfb+R0qfeE4nqlwzNGDHV53JIyw3tRhmF4zzpZ/Y9l8U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ol2zlekT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E1BC4CED3;
	Tue, 17 Dec 2024 21:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734470362;
	bh=jrc3lY75xHWJSSzKDhwHm1denSyOJLkP2xgW2pqkhag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ol2zlekTlcUlX42G6Y9JWMcaF4pKnf6xFOzNzkclzDB35apI0xnTEazu7c91I9hq6
	 M7f+Xl3OzjIzCuJD3qs+PCuioRvGk4icTQas53Kip11pdM43aj6WnYEd7oQW2eNiCK
	 t4V438NIE4HW3fB7tJaSKyFDXqDz7p7ctQf3tjRnbLl2C/Swyq3rVXJz7y4CgTGWrD
	 VuJKpHLKX7rVYLA/bXEYc6XnBrI/gKR6Gi35EUtApLJLKdDpC5xyqBixyeZmt9UqNP
	 O30vxDbupuSKPCUmKhKisxvX0GuWoEDQCZ5Hx+ZC3UIFaymbiq2DoWPDGujWC4mF9Z
	 kKZNe/uTL6WzQ==
Date: Tue, 17 Dec 2024 21:19:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
	andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
	tony@atomide.com, lgirdwood@gmail.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com
Subject: Re: [PATCH v1 2/4] regulator: tps65219: Update driver name
Message-ID: <59e004d7-7e46-4141-bf61-f01a6e5296e2@sirena.org.uk>
References: <20241217204526.1010989-1-s-ramamoorthy@ti.com>
 <20241217204526.1010989-3-s-ramamoorthy@ti.com>
 <23dd1912-31cf-4e99-8fb0-0fbd68eee8e2@sirena.org.uk>
 <2fdf8fd0-b764-4720-8f7b-71b5d63d2541@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CYPEFqoeyAgL+0Ji"
Content-Disposition: inline
In-Reply-To: <2fdf8fd0-b764-4720-8f7b-71b5d63d2541@ti.com>
X-Cookie: The sum of the Universe is zero.


--CYPEFqoeyAgL+0Ji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2024 at 03:16:44PM -0600, Andrew Davis wrote:
> On 12/17/24 3:01 PM, Mark Brown wrote:

> > This isn't just a naming convention thing AFACIT, the MFD registers the
> > new name so the driver wouldn't previously have loaded.  How did this
> > ever work?

> It matches based on the platform device .id_table[0] which does have
> "tps65219-regulator" listed, the driver .name itself is only used
> as a last fallback when there is no .id_table.

Ah, there's not enough context in the diff to show the ID table.

--CYPEFqoeyAgL+0Ji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdh6tQACgkQJNaLcl1U
h9ByzAf7Bc/PZDfMPtI9KxJCA6hCXGpfdjWES8E2VVongW5g6QXFNq7pYdHbRP+i
DaEanNv4FztvVbVNHRNdcL4HPnUuVtK3/mU+Apm0Hkl8DjlJ22UKrgTtxb/qvxyT
UHpJguD6lQauiFG5Skac4dGI/Nhh4cGTRJ4LKDK3vP/xAeVy2A8EPgaKsw3bRTVq
ETeluEiwFxisxjLuasbWL1E3USy2EuFuilk9yMqeeBDfc+tU4FLUA8JjynrQy+Db
Q/sLC8nzdkKUeuF7SlnsKbIdbXje703U+TF12B2MyRuaprRiN4QpNhS+der4caK5
16WXZ46xpdD7a+zeCcYT8yE0z9AVbA==
=acoK
-----END PGP SIGNATURE-----

--CYPEFqoeyAgL+0Ji--

