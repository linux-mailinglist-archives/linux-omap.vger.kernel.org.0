Return-Path: <linux-omap+bounces-3939-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC06AE1D08
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 16:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3CCD4A6244
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 14:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB7528E571;
	Fri, 20 Jun 2025 14:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeJ1EvRT"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D951EB5B;
	Fri, 20 Jun 2025 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750428588; cv=none; b=o1XeAhtpCe0Z/9+X5CQJd/LrAFcefWK57QDmgrYQ6CWGApVM78YdbsGG2FAVvuX2kdnMJ5/dMQG6WUKi8M8ej2G96TLDweSub7nFS3RuC0VDGw7f7iy2onxZSylepI2Lhf56pjxanL1o9rGFetxPrpblAglpWufTa+MkIM1fcMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750428588; c=relaxed/simple;
	bh=ublnEfCCRuTWr7dTuVu1JxVOdVda7UeqYjpCCUS2Ieo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFgU5/d1GsJFdmJDEYuMXsEfohwm8CvY/M0zcTgQP1tMi6uUC94VgIGS9l1GrM7WETs+3oIhdumbcJBKSRmTJEKDxgQnX1SY9ees+Mez5adDa/LY/os1Szx0gfVQayjpgM52BNGfReNOPMZZ1nSKd0ut2m3jgg9TbLO+Hv49Op0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeJ1EvRT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F945C4CEE3;
	Fri, 20 Jun 2025 14:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750428587;
	bh=ublnEfCCRuTWr7dTuVu1JxVOdVda7UeqYjpCCUS2Ieo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JeJ1EvRTn+EZUKJaXmqV1lUAl52NXETvjn1Frk6Ev2bA9Kw6nJwKSSVeYa4jMvGZ4
	 oDyNqccYWV4WfprRacU3gUJNyrbib0Occy6mCcM33TjoL+SMcjuv5sC79VdJDUUJZq
	 r+O6tcMNwPTWxa9VEdteOalCKLz3g+4GsMBs7cp+GV0LcSTa5MAKFPD3IAPXlqM1+z
	 aqt86oiTu8PykChauWOgw9BUwjTLt2RBA+cGE/rr79F4f9T3ZgaSMazROzsmaT2QxO
	 NLnskPC4AqaNSgNTIGKjrsAGEWSWSlBSTUZKYcl99ZLMuOa3w0jJK3yQGe1x2IupuC
	 PC46NY6VllQDw==
Date: Fri, 20 Jun 2025 15:09:41 +0100
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
Message-ID: <20250620-widow-licorice-66fbd43b18b0@spud>
References: <20250620-ti_dts_clean-v1-0-786a3059bca7@bootlin.com>
 <20250620-ti_dts_clean-v1-1-786a3059bca7@bootlin.com>
 <20250620-mortally-fifteen-7a2566545a5d@spud>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mypntZaxA9GZ/Hkk"
Content-Disposition: inline
In-Reply-To: <20250620-mortally-fifteen-7a2566545a5d@spud>


--mypntZaxA9GZ/Hkk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 03:08:24PM +0100, Conor Dooley wrote:
> On Fri, Jun 20, 2025 at 10:24:08AM +0200, Kory Maincent wrote:
> > Add several compatible strings that were missing from the binding
> > documentation for AM33xx-based boards. Update vendor prefix from
> > "ti" to "beagle" for BeagleBone to match actual hardware vendors.
> >=20
> > Reviewed-by: Andrew Davis <afd@ti.com>
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
>=20
> This is a v1 apparently, what is the relationship between this patch and
> https://lore.kernel.org/all/20250617-bbg-v4-1-827cbd606db6@bootlin.com/
> ?

(I ask because at a scan I didn't see differences and I had acked the
last one, which doesn't show here even though Andrew's r-b does)

>=20
> > ---
> >  Documentation/devicetree/bindings/arm/ti/omap.yaml | 22 ++++++++++++++=
+++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Docum=
entation/devicetree/bindings/arm/ti/omap.yaml
> > index 3603edd7361d..7e0d5d376d57 100644
> > --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > @@ -104,12 +104,32 @@ properties:
> >        - description: TI AM33 based platform
> >          items:
> >            - enum:
> > +              - beagle,am335x-bone
> > +              - beagle,am335x-bone-black
> > +              - beagle,am335x-bone-black-wireless
> > +              - beagle,am335x-bone-blue
> > +              - beagle,am335x-pocketbeagle
> > +              - bosch,am335x-guardian
> > +              - bosch,am335x-shc
> >                - compulab,cm-t335
> > +              - grinn,am335x-chiliboard
> > +              - grinn,am335x-chilisom
> > +              - gumstix,am335x-pepper
> > +              - isee,am335x-base0033
> > +              - moxa,uc-2101
> >                - moxa,uc-8100-me-t
> > +              - myir,myc-am335x
> > +              - myir,myd-am335x
> >                - novatech,am335x-lxm
> > -              - ti,am335x-bone
> > +              - oct,osd3358-sm-refdesign
> > +              - sancloud,am335x-boneenhanced
> > +              - seeed,am335x-bone-green
> > +              - seeed,am335x-bone-green-wireless
> > +              - tcl,am335x-sl50
> >                - ti,am335x-evm
> > +              - ti,am335x-evmsk
> >                - ti,am3359-icev2
> > +              - vscom,onrisc
> >            - const: ti,am33xx
> > =20
> >        - description: Compulab board variants based on TI AM33
> >=20
> > --=20
> > 2.43.0
> >=20



--mypntZaxA9GZ/Hkk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFVrpQAKCRB4tDGHoIJi
0m0PAPdyk2Dzt3XT47IGJqy5gS8FoWS7Gdmb+1ki9dHjNDssAP0Us6NMl63rvO03
WVXNchWnAL5R1jO7dLw+FNdjc3EKBQ==
=1JPh
-----END PGP SIGNATURE-----

--mypntZaxA9GZ/Hkk--

