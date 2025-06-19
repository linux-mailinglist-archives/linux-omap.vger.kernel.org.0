Return-Path: <linux-omap+bounces-3922-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08436AE0CCC
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 20:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3568A6A2A3E
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 18:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FECC29A326;
	Thu, 19 Jun 2025 18:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkBY2g0+"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F61E28E581;
	Thu, 19 Jun 2025 18:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356809; cv=none; b=HNfxQhcZzJtsH7njVcy6UfM/W3ljwbFblXLXVV/I/kzWXrXeBVc++1RV5W4W9evR8HKZynEAHiMM/2Q3QjVukPQv7/ojKXzou3O7mtgKWwGC3QNh6KV5/HNO3FiCRhVWBB5QMphvRAruZew2S5B2KY7qQQCfP6I6E4+xqDOaaoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356809; c=relaxed/simple;
	bh=n1ni9DlPXMDUYhaHLZEWHB/Fi2keFgi3FF8tgcT9jlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0D0WirmgWub/r+SkUAIbDc5ak5f9ZaXuAxWzwmV2+YpIP3V3vpOn9Q7TAIDS9MzdxbLQcyOb6aGwf3PhrE0EMio3MtdwOYtMnQoGzpvE4qjoXYhCfeJxogP8VGGZKK7pDRhnAHqtXf1xUOizrsVTcgMMFcwX/9/m2ZAGpI4AmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkBY2g0+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACB7C4CEED;
	Thu, 19 Jun 2025 18:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750356808;
	bh=n1ni9DlPXMDUYhaHLZEWHB/Fi2keFgi3FF8tgcT9jlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CkBY2g0+Ipg499Nhamecybxdcm7wkmdbVRfMUJye2sCkTidDLu3YqmCfBYlvKO5IU
	 09iOh+RloQcMVdVCfx5/dUlYXwKymSYtRbmcwLFMhohlD6KuzYf19a1GcYZgbEdugf
	 ElO+y/Nn47L9/W/UoYzH446GN24Wj3aLcBWx/nEFxB+nvrqGgCsovmgt2qqXTFVyxw
	 V7HMD/WFZLUoauW53K2+qqLPaqUf4fFGPOV7uyFRw5Y4aRKMy58NqTzXFnv1wP5P0y
	 9Rq8SIaRyuOzbDorBzcRAIGZFouH2c1okwRaGFcKmjs4TUmEBWOdYYXzlpyRHGg/5V
	 RyrtE/EGDTG+Q==
Date: Thu, 19 Jun 2025 19:13:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Dhruva Gole <d-gole@ti.com>, s-ramamoorthy@ti.com, lgirdwood@gmail.com,
	aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org,
	tony@atomide.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com,
	Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH] Revert "regulator: tps65219: Add TI TPS65214 Regulator
 Support"
Message-ID: <d526be6f-efe9-4f05-b8e1-9a80e4d92a36@sirena.org.uk>
References: <20250619153526.297398-1-d-gole@ti.com>
 <20250619193038.4e1f42c8@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aouGrvgz9MnWNdTD"
Content-Disposition: inline
In-Reply-To: <20250619193038.4e1f42c8@akair>
X-Cookie: Reapply as necessary.


--aouGrvgz9MnWNdTD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 07:30:38PM +0200, Andreas Kemnade wrote:
> Am Thu, 19 Jun 2025 21:05:26 +0530
> schrieb Dhruva Gole <d-gole@ti.com>:
>=20
> > This reverts commit f1471bc435afa31c8c0c58551922830dc8f4b06b.

> >  	TPS65219_REGULATOR("LDO2", "ldo2", TPS65219_LDO_2,
> >  			   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
> >  			   TPS65219_REG_LDO2_VOUT,
> > @@ -366,23 +326,13 @@ struct tps65219_chip_data {
> >  };

> I think it should be relatively easy to only revert that part without
> needing to revert it fully.

Yes, I'd like to see some analysis as to why a revert is a good fix
here, it doesn't seem like there's been any effort at understanding what
went wrong and the change doesn't seem that complex.

--aouGrvgz9MnWNdTD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhUU0IACgkQJNaLcl1U
h9AVSwf+MbaSUYJhNtVCq9jz54zj03mpTsNA+BZoLqDn/DSe2N04Gh9Iwx64lU1/
W0YE13KZPPwLHw1NX/CCnj6JntjROReuhEFNuVUj1XRA0/EoZwIIqanmVrlyEzSd
x5WQJwJabyXmel3ujCvCu+ByWFkEck8z3BCfp5xmaP37caKd/umkoPyXT3YZhEV8
hZuFmD/31K5Hf18a9YPXm1OQ1fIvtUwJbkmd5yA0KhENvmL1CyzTH3PIBCTxf18h
YrkmCwsKO8263pVEp9ZzPYuxD2nS0hU523NNE1mAW6n1URxAMdxkoKqMG2h27YI5
+scBKBkFSchi/GVtMQswznI0fYSzQw==
=LnG7
-----END PGP SIGNATURE-----

--aouGrvgz9MnWNdTD--

