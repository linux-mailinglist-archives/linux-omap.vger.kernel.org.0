Return-Path: <linux-omap+bounces-340-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6BC836E2A
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 18:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F7611F23F12
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 17:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B6D4A991;
	Mon, 22 Jan 2024 17:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZkpTLFA"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ED63D574;
	Mon, 22 Jan 2024 17:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705943507; cv=none; b=LIPLh67CZ/OruEm+lAoWI2ZGDgzR6TPRfDh0vDubo8qR4pn7mN5Nu2foLtOX17qxkrdAzFA1Xbu3Z7MZqnevG7O3pkEOovQoPUUCPEoO/uulZcuP7mbJud9XfFvkzb/Wg4LFG8ddILcIwCif/p84SK937C9/zrjHUqt60Nxvkvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705943507; c=relaxed/simple;
	bh=k2CNr7LmlyvVXOsB5EVe+VkohS7bN+gdLn1ISX7JPAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B70n11btw2D4DfJbgD0Sr2orjcEpwxoBL7tEXgTEDXqG9zwaf9RycV6Qc4OCXhqS8s62aOYcZlIivG91YIBq0etf9ogEN6Bc4rAENex8d8XYfTAv1bhiaXbo6wx6gQyNqUU6ILeEdCZJ2km0sVps2HDFgf7qaQ5vR1gNQC+DtW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZkpTLFA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21528C433F1;
	Mon, 22 Jan 2024 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705943507;
	bh=k2CNr7LmlyvVXOsB5EVe+VkohS7bN+gdLn1ISX7JPAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZkpTLFA+pv+dgKqXR9AKm6w3m8oGZBo9CYsV2MjFkuFTlRkpxq0CZi9hv61X2ksV
	 Rddh+8mZ/qNkvmkcbExmoCdkcyfo73hPBxwfH4MCrwLxxQPbDgKKycN1F+fVg86miX
	 JPADKsGiGAosrC5OtVM8cQ71vY9bLj7Y7Uq4tFQZ3KrX6zEA979ufjpr4AxJdJrRMU
	 oR6BR3tmtJgD+2YKl8p6dtFknwSOhVP8Jfykp1KuFVnmxryR90/ri12NpMSFGgEu9o
	 vimmRptoqTTTSkGryEpDIHD4/KJzA9u6zVJJf2f+CmvmmwI62JHKWRcstXnEmV3WIs
	 LD1E0rUhO98Mg==
Date: Mon, 22 Jan 2024 17:11:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Romain Naour <romain.naour@smile.fr>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	=?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Romain Naour <romain.naour@skf.com>
Subject: Re: [PATCH 1/3] arch/arm/boot/dts/dra7-l4.dtsi: add missing unit
 addresse
Message-ID: <20240122-extending-identical-9609420a1baa@spud>
References: <20240122111948.416444-1-romain.naour@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RXiEXhniTINmF+T+"
Content-Disposition: inline
In-Reply-To: <20240122111948.416444-1-romain.naour@smile.fr>


--RXiEXhniTINmF+T+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 12:19:46PM +0100, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
>=20
> phy_gmii_sel node have 'reg' so it must have unit address.
>=20
> Fixes:
> Warning (unit_address_vs_reg): /ocp/interconnect@4a000000/segment@0/targe=
t-module@2000/scm@0/scm_conf@0/phy-gmii-sel: node has a reg or ranges prope=
rty, but no unit name

Does checkpatch not complain about this "Fixes" tag?

Also, for all patches in your series, the subject is odd. Running
`git log` on the files you're changing is a good idea to get off to a
good start with a subject line.

Thanks,
Conor.

>=20
> Signed-off-by: Romain Naour <romain.naour@skf.com>

--RXiEXhniTINmF+T+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa6hzgAKCRB4tDGHoIJi
0mBYAP9F0/plPjdvLISSoKlEHcy1+P5CxGl1+LcAx0sbH0/A5wEA4brQffVEo11j
RGG89Yn1GXt4+7Bjw5+TjlCij9k5mQI=
=7sJx
-----END PGP SIGNATURE-----

--RXiEXhniTINmF+T+--

