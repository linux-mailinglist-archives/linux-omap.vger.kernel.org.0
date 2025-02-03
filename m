Return-Path: <linux-omap+bounces-3257-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FA5A250E3
	for <lists+linux-omap@lfdr.de>; Mon,  3 Feb 2025 01:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6E091633A6
	for <lists+linux-omap@lfdr.de>; Mon,  3 Feb 2025 00:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A144BE67;
	Mon,  3 Feb 2025 00:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyqpF2fb"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2988A923;
	Mon,  3 Feb 2025 00:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738543224; cv=none; b=iU+4x5uylLtjp+ICG0/8gT4nrrrpwpmMhApCa6DOyWJ7Vvgc6kQ3QnXmsPPOE4hJQW0+M4wPCihCQ6VuHByAJV6qRnH6+RLeRWSaMORKlsS8dsRv2fmg28tE7v8KpXouu/8W0IbHKfiO5fI1Ny4CdsCgAwYkRPkfF5k6L/weKoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738543224; c=relaxed/simple;
	bh=yFpcQjapUhFlMoyn5dZeQvZi9M6hLoZut6pJ5JCbk14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLqepNhVFtgLkHSJkadRn0KfonWgMmptEZDzxp2Bs+23Q5ps+p4rb7QaHI80jmx7K/KRGdgXEirRj1BG9jABokhjlfg9pt8ntcM2CREHT2BdriQh/aiNHoqjUwqF4Nf/i0el+7/I+fTeGhq+CJLovIxIPiahty6bkgmdophsvGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyqpF2fb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B5DC4CED1;
	Mon,  3 Feb 2025 00:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738543224;
	bh=yFpcQjapUhFlMoyn5dZeQvZi9M6hLoZut6pJ5JCbk14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyqpF2fbdQoud7wT9cT5VNhwC3PlncrxVJleMZ9HJltM9HR7hyuozrikXWCzAgUH1
	 uy1WXVX57L6zz0y7hh49r0kqp59Nez6LKrPcWEb+pQoF5sK1X8IIH8ZGZRod/suNSi
	 KSuk6xfAcz83JBOCWVfUMuZPwG2PrbM8JamR11efyWt0IQpT9mmczn3VarUu5Hu8zI
	 wPBDLU16cCtg0X6CJqhFd/JeK4e32MevH8q5vFgp1V+CdPkv9UU5OuAMSXC0ZF+cDy
	 iM3ZET1cPICtVzU7JA3+9HT1QWHxBK4u3L6cbvyrWp23vPEr78YzPWU2kiR/7WcY/x
	 0YZD3VVvRxlDQ==
Date: Mon, 3 Feb 2025 00:40:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
	jerome.neanne@baylibre.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	m-leonard@ti.com, praneeth@ti.com, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v1 1/2] regulator: dt-bindings: Add TI TPS65214 PMIC
 bindings
Message-ID: <8f5ed865-cd21-4b20-af17-dfc52e28b4d3@sirena.org.uk>
References: <20250116223740.429515-1-s-ramamoorthy@ti.com>
 <20250116223740.429515-2-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dq0AMyPFi9HfGhlH"
Content-Disposition: inline
In-Reply-To: <20250116223740.429515-2-s-ramamoorthy@ti.com>
X-Cookie: Monitor not included.


--Dq0AMyPFi9HfGhlH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 04:37:39PM -0600, Shree Ramamoorthy wrote:
> - TPS65214 is a Power Management IC with 3 Buck regulators and 2 LDOs.
> - TPS65214 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs.
> - TPS65214's LDO1 maps to TPS65219's LDO3.
> - A key difference between TPS65215 & TPS65214 are the LDO current and
>   voltage output ranges and the configurable options available.
> - The remaining features for both devices are the same.
>=20
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>  .../bindings/regulator/ti,tps65219.yaml          | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

This doesn't apply against current code, please check and resend:

Applying: regulator: dt-bindings: Add TI TPS65214 PMIC bindings
error: sha1 information is lacking or useless (Documentation/devicetree/bin=
dings/regulator/ti,tps65219.yaml).
error: could not build fake ancestor
Patch failed at 0001 regulator: dt-bindings: Add TI TPS65214 PMIC bindings

--Dq0AMyPFi9HfGhlH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmegEGwACgkQJNaLcl1U
h9Bj6gf/bscQ3ay2ZunvUqfVUvNiyLmEX8Q4ni7nSi5pFiUOC/L7OUdCFkvSe85t
KbGgK+XtDI0IMRKPc1rqbWyGdqXgi7p7EIWumGwAhXGQfPGqMvtu70auiHla/Vrs
DST9xViPAsqBiE/LmHlVS8zIWbDfTiuDjI1m1x5298ZD4v3+Wj9oD+v28LJr5yD7
C6uqWjJNRALZMTiPc8bbT0m42dsI6RKxCOcXs0b6H6gyq6FAHKYF44S5CPadSR8S
fMFN2hsx+JBAHxuf/VI2NH1CBrcIjokyR2bjTfArgw1+Rsa0v77LSFPvssI9l+O3
gqKzSJdFGI8epL7Qn3mOQJY1QQE0dA==
=FC/2
-----END PGP SIGNATURE-----

--Dq0AMyPFi9HfGhlH--

