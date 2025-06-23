Return-Path: <linux-omap+bounces-3952-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6530CAE46F0
	for <lists+linux-omap@lfdr.de>; Mon, 23 Jun 2025 16:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E6FD1895A01
	for <lists+linux-omap@lfdr.de>; Mon, 23 Jun 2025 14:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C73226056E;
	Mon, 23 Jun 2025 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VflVaaes"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B905B260560;
	Mon, 23 Jun 2025 14:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689407; cv=none; b=Qyc80SiDvVZQE2lmgJb1pdhrECIraE1M/VKVPjBpMHaH41UQdrMX0IWsO7laaOo4gPS3Dx0dIdedo28QJ1QTlEMpd/203gbKYfEysNLTjvJIqbuxsumPkxGfmKOy2kx8W6TqOv4Nr7u7saALmRfNP+zaLf1XoxvUvuJO5dEN66o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689407; c=relaxed/simple;
	bh=eFi6qWyko4q95G1qV6b/bkdDjJ4xkEd1EzWEqFQjMzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvp0hXPUZZLA7wh6WJdqA6pmHi7f+3L5vUDx5R/+6AYBxQacOLv8gW6oeqzry8vZH1JWHs4ulwHgtI+WE2R6qJNexi32YuUW+qiMw46gyqxCTXdJvqVLf9+L53dvw2r1cdnF3eGW3SkihITqZVOqwR2aC6DYEJTPosDPytY+too=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VflVaaes; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B90CC4CEEA;
	Mon, 23 Jun 2025 14:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750689407;
	bh=eFi6qWyko4q95G1qV6b/bkdDjJ4xkEd1EzWEqFQjMzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VflVaaesju+Z85bTPS02OiXknR48/LxrmGx88zwcCxt04hyH5eYBaejbkThbEFlR8
	 poDrxTPJpax3lmcbFd4UqLV8b8So7tj+JJYY6FquTl03nPg86xqCBIFfY58nB2tePi
	 xOjlW6fiOWtIho4ckxMj6tPM8ZbfEt+7RWmWyUu64Dyg5U0iTL/XNlmV1KKHMV8mi0
	 DqfFlF5XNhlcb+iPNo17fH/cCuEkX9TC+dpfs8jQvMj/pksJ7zLc8dsyVplCFNOthE
	 zFa5f7D26iD0JqZqTz/2Xyfs7432kFghpiLhxEewcEU5+gtkK8NyjUTmPQTA00VE1u
	 E8C9QCpTHZBvw==
Date: Mon, 23 Jun 2025 15:36:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Barker <paul.barker@sancloud.com>,
	Marc Murphy <marc.murphy@sancloud.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Romain Gantois <romain.gantois@bootlin.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Bajjuri Praneeth <praneeth@ti.com>, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: omap: Add missing AM33xx compatible
 strings
Message-ID: <20250623-gluten-bulb-cff911ccf00d@spud>
References: <20250620-ti_dts_clean-v1-0-786a3059bca7@bootlin.com>
 <20250620-ti_dts_clean-v1-1-786a3059bca7@bootlin.com>
 <20250620-mortally-fifteen-7a2566545a5d@spud>
 <20250620-widow-licorice-66fbd43b18b0@spud>
 <20250620162617.50ca0a7f@kmaincent-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z6loaMYSs0CfFWNj"
Content-Disposition: inline
In-Reply-To: <20250620162617.50ca0a7f@kmaincent-XPS-13-7390>


--Z6loaMYSs0CfFWNj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 04:26:17PM +0200, Kory Maincent wrote:
> Le Fri, 20 Jun 2025 15:09:41 +0100,
> Conor Dooley <conor@kernel.org> a =E9crit :
>=20
> > On Fri, Jun 20, 2025 at 03:08:24PM +0100, Conor Dooley wrote:
> > > On Fri, Jun 20, 2025 at 10:24:08AM +0200, Kory Maincent wrote: =20
> > > > Add several compatible strings that were missing from the binding
> > > > documentation for AM33xx-based boards. Update vendor prefix from
> > > > "ti" to "beagle" for BeagleBone to match actual hardware vendors.
> > > >=20
> > > > Reviewed-by: Andrew Davis <afd@ti.com>
> > > > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com> =20
> > >=20
> > > This is a v1 apparently, what is the relationship between this patch =
and
> > > https://lore.kernel.org/all/20250617-bbg-v4-1-827cbd606db6@bootlin.co=
m/
> > > ? =20
> >=20
> > (I ask because at a scan I didn't see differences and I had acked the
> > last one, which doesn't show here even though Andrew's r-b does)
>=20
> Oh, you acked-by was lost in the void during the patch series split sorry=
 for
> that.

In that case,=20
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Z6loaMYSs0CfFWNj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFlmeQAKCRB4tDGHoIJi
0rZEAQDe5mN87Tk29xJZ7cPHT6fEDF80FUZTHGyl9/oNchF3+gEAhjKhB5ljKGZi
y1LRHCJVDjjH5WoVTNyAnqd0D854Cwo=
=9UG+
-----END PGP SIGNATURE-----

--Z6loaMYSs0CfFWNj--

