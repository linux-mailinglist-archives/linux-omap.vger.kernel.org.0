Return-Path: <linux-omap+bounces-3781-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23033AD2497
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 19:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D66D618837C5
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 17:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCD521B191;
	Mon,  9 Jun 2025 17:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vOnLQMgX"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3907A1F17E8;
	Mon,  9 Jun 2025 17:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488647; cv=none; b=kYrK/VSTZ1oXM5K6duX9pcN+ZIrSEhLROht7duEQtyvFH/CBvoMs50nxyK9Es51VsVulYYjmPc1wAnmWEddUqqjHIYbwtvwaA7bmXzPkcY//AbZl8SNmbNqV0hZh/FJJJ+iGZ8YtShbatErdEbC7eFg2k0aRfrikHs8Rvg+43Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488647; c=relaxed/simple;
	bh=f5pI2UHN8+s/yMkJm1kl6R65sHaQKYgNclTmzYcp7R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njfxhENIay4yPFfblDNlLt3njUOMIF8hYRqK02LBMJb2s8Ns0EfnHTgi49dAApDbrn4FNu3+cn8XHmatoddF0X0NzUc2e4V3UjiGlVQsJq4+P6gGi4Q8/fpxw5UekUcAjkQOSICV6jZ5w20JIrZqIexmi82cQv4Ey6joHqc+Uo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vOnLQMgX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C22C4CEEB;
	Mon,  9 Jun 2025 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749488646;
	bh=f5pI2UHN8+s/yMkJm1kl6R65sHaQKYgNclTmzYcp7R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vOnLQMgXQN4VEY/z4Gsg7QRW4+a43c6FGy8VCK0sA6v4OwSUsAEThu37LBnmXqU6y
	 fae0aKwZKa96gUSQniCjV78+h2V2buKgNgMcdyyHAQ6GyBybRrkoNUH5mwGG3/DFDW
	 WHoACyq73Zkbu8AyARmOZwJJNGX5ExnfnDsHlQ3Gok5dtY6jaZGCCI0o53oHmBunto
	 svG/RpBcoGbONHc2n767orlFR61W67kNWZu6P8FPkvSIt5BHJ74dnFrRHVeMpH/esK
	 wo8SHEnSevvPpyB7+E1ayPkrXs8hRiET8W/ZAgmWIE1l2lC5Z6285LGcmLvOh8C6ki
	 Th7CXfhA5dflw==
Date: Mon, 9 Jun 2025 18:04:01 +0100
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
Message-ID: <20250609-helpful-immodest-0f195cdbcbf2@spud>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-4-5278026b7498@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qN2c0PWcJTDqDL56"
Content-Disposition: inline
In-Reply-To: <20250609-bbg-v2-4-5278026b7498@bootlin.com>


--qN2c0PWcJTDqDL56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 05:43:54PM +0200, Kory Maincent wrote:
> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>=20
> Changes in v2:
> - Used generic pmic node name.
> - Add regulator prefix to fixed regulator node name.
> - Add the compatible to omap.yaml binding
> ---
>  Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
>  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170 +++++++++++++++=
++++++
>  3 files changed, 172 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documen=
tation/devicetree/bindings/arm/ti/omap.yaml
> index c43fa4f4af81..774c13157caa 100644
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -145,6 +145,7 @@ properties:
>        - description: TI bone green variants based on TI AM335
>          items:
>            - enum:
> +              - ti,am335x-bone-green-eco
>                - ti,am335x-bone-green-wireless
>            - const: ti,am335x-bone-green
>            - const: ti,am335x-bone

Why is this hunk here?

--qN2c0PWcJTDqDL56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcUAQAKCRB4tDGHoIJi
0nHcAQDmm/vSthV7u0cRPShkiyiEYLhnJ1c/e0XLct8fqEWuHQD5ATthst+Gc7KE
2683y1k2eOiCjIvKEVH6KWfQEL79XQI=
=5ZBs
-----END PGP SIGNATURE-----

--qN2c0PWcJTDqDL56--

