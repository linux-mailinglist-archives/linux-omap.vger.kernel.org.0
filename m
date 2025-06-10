Return-Path: <linux-omap+bounces-3819-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCE4AD3D65
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 17:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A32717783E
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 15:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F59623D281;
	Tue, 10 Jun 2025 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFHJtYCx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380C91D90C8;
	Tue, 10 Jun 2025 15:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569207; cv=none; b=ZoosZA04+QpqlM7Qh1j6oorigiWnW1n4LIbfIMVWcQcNJKP5XesDBEOyjDS4bCYkdvu/kYHScm8FbWc7H/SNBezv9tDy68uI3qTCFm087vvZ2rzgyQXQn/iUlYduM3JpMowktxQtS+e91bo68/PuNxQGrywsTHzOueG8OmUzvWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569207; c=relaxed/simple;
	bh=L4D6UEE3jXZEX8/zwLbFdXFJfzEaEMXKWpBeLeAk1Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ft+gYFOop5GiE/ADeqli1MsU3W8RWw7l9/v9t7YNikJQ4LEgMgNNEQgJosm4G8Q4PknYWsAx5AFNw3OyMuaYeE4l2LzNn/AHyDXhsDaJ2wEyarXMsSjLH0b1/H+s7JqLAhU7FRTb5sChQVn7dhPQYjP/ROSypHUym2JwdUmxI6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFHJtYCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB9AC4CEF0;
	Tue, 10 Jun 2025 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569206;
	bh=L4D6UEE3jXZEX8/zwLbFdXFJfzEaEMXKWpBeLeAk1Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFHJtYCxl9efKlFhO+vB8Mjl/34HpMQfpIePgoQSHEHTm4tNkwyrOfTO6S+PbpIic
	 Pu8R217jkW01boKBcwLo8aK8lB5n0odnvP8grrgINrN7oHDMm97xI+VpbR1GJ8EVtG
	 rIiYnToX486ubJqWXQOyBrkzWLG2nLJGIAvfmezktcbtyNrpE2isBiXdYc4gX9I89z
	 1xcLu3iJFBEpO+v0O8z/za/8Zakc7TzlQDlgSeX2Bs5uxW7qjfaaOx5LAg4VRu1GkX
	 qPq4eR649NMwqC+pbVFVY911ZW+ZNbCT4/XvUBJp9JED2YZv57hDS1A70lRNib+I48
	 StBtJFABKDHTQ==
Date: Tue, 10 Jun 2025 16:26:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] arm: dts: omap: Add support for BeagleBone Green
 Eco board
Message-ID: <20250610-ongoing-showing-4274fe6ac0e4@spud>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-4-5278026b7498@bootlin.com>
 <20250609-helpful-immodest-0f195cdbcbf2@spud>
 <20250609224502.1fce742c@kmaincent-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CNb1Q4rZI/FcDQ7n"
Content-Disposition: inline
In-Reply-To: <20250609224502.1fce742c@kmaincent-XPS-13-7390>


--CNb1Q4rZI/FcDQ7n
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 10:45:02PM +0200, Kory Maincent wrote:
> Le Mon, 9 Jun 2025 18:04:01 +0100,
> Conor Dooley <conor@kernel.org> a =E9crit :
>=20
> > On Mon, Jun 09, 2025 at 05:43:54PM +0200, Kory Maincent wrote:
> > > SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone =
Green
> > > (BBG). It has minor differences from the BBG, such as a different PMI=
C,
> > > a different Ethernet PHY, and a larger eMMC.
> > >=20
> > > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > > ---
> > >=20
> > > Changes in v2:
> > > - Used generic pmic node name.
> > > - Add regulator prefix to fixed regulator node name.
> > > - Add the compatible to omap.yaml binding
> > > ---
> > >  Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
> > >  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
> > >  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170
> > > +++++++++++++++++++++ 3 files changed, 172 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml index
> > > c43fa4f4af81..774c13157caa 100644 ---
> > > a/Documentation/devicetree/bindings/arm/ti/omap.yaml +++
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml @@ -145,6 +145,7=
 @@
> > > properties:
> > >        - description: TI bone green variants based on TI AM335
> > >          items:
> > >            - enum:
> > > +              - ti,am335x-bone-green-eco
> > >                - ti,am335x-bone-green-wireless
> > >            - const: ti,am335x-bone-green
> > >            - const: ti,am335x-bone =20
> >=20
> > Why is this hunk here?
>=20
> Do you mean that the binding change should be in another patch?

Yes, you have a binding change hidden away in a dts patch.

--CNb1Q4rZI/FcDQ7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhOsQAKCRB4tDGHoIJi
0lMaAQCmKPqrWelkROcaZ+0YtXmnca+FBaYWFgHGdnpcj+Yf/QD9GSTFZQwOTKVP
MdMxzoAGPBOr08LrEVPcvhr6rUrHxAo=
=ndtq
-----END PGP SIGNATURE-----

--CNb1Q4rZI/FcDQ7n--

