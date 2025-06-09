Return-Path: <linux-omap+bounces-3780-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8FEAD2495
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 19:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE2757A26AF
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 17:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676FE21C189;
	Mon,  9 Jun 2025 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFXB3fAK"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023EE21C161;
	Mon,  9 Jun 2025 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488591; cv=none; b=ir3P7FV629X2D2N4JMw3WRfMhv6eyN5w/PuUZ9mOylRGtPTOnZbOq7zs0fiNLsj1yin+uLKjgUSrle/9+cxGQA8gKa9S7rGC+C6cTL1Uxn+oB84TwkSqrOabYT8RGczaBOdgfl1zJVmGi5QnDNEQBQXzWHU+2NLmSPYDxS9ztJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488591; c=relaxed/simple;
	bh=yshw6FuZ+90MLQuf4k5pVwoG8nSwK5lhMx3IZxX4Yjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qa9c4+8sqZfjYXSjmRhCfl8aGVf8s6Xcr0qdmIBeGj9xN9y4PHVQEIBrk0CTvM9R1LHL7wzNrCXHcGSznChqgOXTgTQQPd8S8Ft9X4OR4r4Azk66cYEsEVINeL7O1kbXfDNhA/bSgOhqD4iVjQHv2pQ6rhtdame9Jo+EpPMDzr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFXB3fAK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF62C4CEEB;
	Mon,  9 Jun 2025 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749488590;
	bh=yshw6FuZ+90MLQuf4k5pVwoG8nSwK5lhMx3IZxX4Yjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFXB3fAKQEml8axtfTSLRX63AIu8lfrNVd+eSmH26rzMKl81kmc988nBVEr9eiZ1I
	 ABLbR7+i4oqcCDUoEBZ0cFj/PmQ2Jk/NHjXSS+VdEn1xeMDaRnMluobVOXG6KeSy7b
	 BWM0etqh25arz2xYTX7VNHo9ZefvrTD4JWEgwuBjixEd69Tbwt5mzbIUnZ0POKprtz
	 lhD3a8dBgphRmfNY16L3Cjv4mOj8FuyFaDE0wgroUkIZJhAWBPazsSRTHVXI34/qyb
	 UhC/J6aYB4lubISyYSg92C5BDTXs3aSMTm15JLoyYup3LnSdNEJjbZ/iPP9TV5XtFv
	 7r/muSVDvqI6Q==
Date: Mon, 9 Jun 2025 18:03:05 +0100
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
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250609-hacking-corporate-d53531577680@spud>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-2-5278026b7498@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LtdcJJGh4TYXgIhP"
Content-Disposition: inline
In-Reply-To: <20250609-bbg-v2-2-5278026b7498@bootlin.com>


--LtdcJJGh4TYXgIhP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 05:43:52PM +0200, Kory Maincent wrote:
> Add several compatible strings that were missing from the binding
> documentation. Add description for Bone, BoneBlack and BoneGreen
> variants.
>=20
> Add several compatible that were missing from the binding.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>=20
> Change in v2:
> - New patch
> ---
>  Documentation/devicetree/bindings/arm/ti/omap.yaml | 38 ++++++++++++++++=
++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documen=
tation/devicetree/bindings/arm/ti/omap.yaml
> index 3603edd7361d..c43fa4f4af81 100644
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -104,12 +104,50 @@ properties:
>        - description: TI AM33 based platform
>          items:
>            - enum:
> +              - bosch,am335x-guardian
>                - compulab,cm-t335
> +              - grinn,am335x-chilisom
> +              - gumstix,am335x-pepper
> +              - moxa,uc-2101
>                - moxa,uc-8100-me-t
> +              - myir,myc-am335x
> +              - myir,myd-am335x
>                - novatech,am335x-lxm
> +              - oct,osd3358-sm-refdesign
> +              - tcl,am335x-sl50
>                - ti,am335x-bone
>                - ti,am335x-evm
> +              - ti,am335x-evmsk
> +              - ti,am335x-pocketbeagle
> +              - ti,am335x-shc
>                - ti,am3359-icev2
> +              - vscom,onrisc
> +          - const: ti,am33xx
> +
> +      - description: TI bone variants based on TI AM335

"bone variant" sounds like some shortand or nickname. Are the boards not
called "beaglebone green" and "beaglebone black"? Whatever about the
compatible, the description should use the full name I think.

> +        items:
> +          - enum:
> +              - ti,am335x-bone-black
> +              - ti,am335x-bone-green
> +              - ti,am335x-pocketbeagle
> +          - const: ti,am335x-bone
> +          - const: ti,am33xx
> +
> +      - description: TI bone black variants based on TI AM335
> +        items:
> +          - enum:
> +              - sancloud,am335x-boneenhanced
> +              - ti,am335x-bone-black-wireless
> +          - const: ti,am335x-bone-black
> +          - const: ti,am335x-bone
> +          - const: ti,am33xx
> +
> +      - description: TI bone green variants based on TI AM335
> +        items:
> +          - enum:
> +              - ti,am335x-bone-green-wireless
> +          - const: ti,am335x-bone-green
> +          - const: ti,am335x-bone
>            - const: ti,am33xx
> =20
>        - description: Compulab board variants based on TI AM33
>=20
> --=20
> 2.43.0
>=20

--LtdcJJGh4TYXgIhP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcTyQAKCRB4tDGHoIJi
0qmaAQCnYxeSuRJuzQVZJXHtkG21nWecDwYZTK+G5bmgMQu4JAEA1D88zUPK6VZX
LCfljitN0oDl0kGQFAPdaT7pXwWKdgQ=
=7/bx
-----END PGP SIGNATURE-----

--LtdcJJGh4TYXgIhP--

