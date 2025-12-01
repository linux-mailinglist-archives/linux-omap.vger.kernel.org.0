Return-Path: <linux-omap+bounces-5089-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 08631C9746D
	for <lists+linux-omap@lfdr.de>; Mon, 01 Dec 2025 13:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EFBCE344D40
	for <lists+linux-omap@lfdr.de>; Mon,  1 Dec 2025 12:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A86430E0FB;
	Mon,  1 Dec 2025 12:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKl2r7r4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB28C30BF58;
	Mon,  1 Dec 2025 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592061; cv=none; b=Do1koUsKS3BHMORhe1Q3jtA65FvZU8jx+redgBSQFUxP5Jif+7fJt/xe/E+W33kBOxhminCbXj5h7fpN91HgLbUrHpcJkllEoXyrItplLkXEmxbElP4dxCD2iU6N6zcPt53ltlRxFc8D+wVtPxXwGW3WaaX7G2iiM3BByzMlZis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592061; c=relaxed/simple;
	bh=Hojq5EyLvV2nCnDxHPVNao/8dCHaP4tC37CXiMMTYTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=squ1YeyowHKwXuTd/pfjncGA/yH3wnVTRDr4nVI0QXrMERzLjPRYC8H6vVMEBpCSsvQoLQI73Qh/lnJoxfWwwIv0tLJUlUgkU42m9COo9EomGhZ2RZs4YbAqOpQRX+i4JmUGxG6q4X4vY6GV/+loTZo2iaKufR6rd2DqigH2OW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKl2r7r4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03F1C113D0;
	Mon,  1 Dec 2025 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764592061;
	bh=Hojq5EyLvV2nCnDxHPVNao/8dCHaP4tC37CXiMMTYTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKl2r7r4Z4d+e3GTzllXenuxcnq/f5q1hgQByTF40ZaUs4T6E9ZRgEZf59LlKaqi+
	 sAcizvZdG4SVKs7sYZV61qlgmtLWBsZFy7wqblteQuJsq8peocf6vOE7dVd6L6z3hc
	 90Fp2x8BIg0/gKyiQYyl0ZrYhMPLpX/voU2vsI3Mkg7wkj8d1AccdcN9ZZgqk4rtLo
	 o9c2uC0c1GqVPtip0scInoc0jH96McujbCIw8+Gzxt+8GFviKXu7kSDWLzsSYdaRuw
	 p8FyVjLGB6WCZOW3rHCkEtzgF8A9n1N9FKe4BqPNzfMfMuMUweeS8IMTPud+htyqUM
	 Jx5N81vPBHEVQ==
Date: Mon, 1 Dec 2025 12:27:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	arnd@arndb.de, lee@kernel.org, dakr@kernel.org, rafael@kernel.org,
	gregkh@linuxfoundation.org, tony@atomide.com, rogerq@kernel.org,
	khilman@baylibre.com, aaro.koskinen@iki.fi, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH 0/4] Add tooling to disable debugfs on OMAP based systems
Message-ID: <5a557c17-94a3-4c0b-88e8-1767fcd602f1@sirena.org.uk>
References: <20251129142042.344359-1-richard@nod.at>
 <20251129153644.333498f1@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yOgM2W7dPZ3TJFhE"
Content-Disposition: inline
In-Reply-To: <20251129153644.333498f1@kemnade.info>
X-Cookie: Mene, mene, tekel, upharsen.


--yOgM2W7dPZ3TJFhE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 29, 2025 at 03:36:44PM +0100, Andreas Kemnade wrote:

> it is usually not about individual registers, but about accessing=20
> unpowered devices/modules,

If that's the case the regmap should be in cache only mode while the
device is unpowered.

--yOgM2W7dPZ3TJFhE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmktibYACgkQJNaLcl1U
h9Ae3Qf/ZTyIlYIMjHApPMbNm2CnBCDV1xU1iEnyBahrMQFsBdiDUYfKVqICWuZB
jc6bkvBwfEcdUtg/7dA4/11BIdnoPcaVeTWARRJkjMz3AovQEi356LeNdsDr8bNx
FoBsPq6rAnXYt9jsdrRYIpqrlzxffWSqeyrQn3rM5K3sZBvycf375RBgxFt9S/AK
VNNA9+I82YqFQ80nn+s7Py2Ku5tWfhaOVpti1441BgoAfHbFQJr6aydLhNjyAhNv
xxl0esRCY5PNfQMZoKQ8lsK8/cyjib9ddo35t+CJTu6j3jBBtP0cjra9/tdiLi3c
z5pN+0238sXowj2KYGXExmcvVeqs9Q==
=fnHu
-----END PGP SIGNATURE-----

--yOgM2W7dPZ3TJFhE--

