Return-Path: <linux-omap+bounces-4819-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA19C221C1
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 21:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 293C2188EFA1
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 20:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E90A333437;
	Thu, 30 Oct 2025 20:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+DLOqD1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71E13191B0;
	Thu, 30 Oct 2025 20:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761854407; cv=none; b=B6T9oqtJtXXSJAO/QIzpNmJQxGapdt9MS9Lzz/cXgmJ+F1OQLkAkmng3N4ft9+/vGs7I/1jVCUKwgjwaxUXyBIhbP5gYwR7EvwokGkHISnjcXN7nbB28eUMIMmi0nItfIZYWYUo/XbH6ZXlCmPMFG9unotC2NK9GDG44+xNnaVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761854407; c=relaxed/simple;
	bh=adl3rEiDgJT/7cpcKay8yGJNneTH4HZ4ERRdYFjnDOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqqT1ZOcYGBqQ1djfLIWz6armjSe0WFNhfpr34/7UIiBlObGeYOi6zKIQo8CN3tOL+U6MYYt+jb/MiSEdIa0lkeFHqVmQZEhLX+/Q88ypdAanNlpwOzyRiEwPt1a9g0SPwRPmmOZJh4NKLVWphkX/UgCjdEdNHD0SxWAu6e2X9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+DLOqD1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC73C4AF0B;
	Thu, 30 Oct 2025 20:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761854405;
	bh=adl3rEiDgJT/7cpcKay8yGJNneTH4HZ4ERRdYFjnDOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+DLOqD1CWACwg4wIfPnpv8wzdyZrwA0aUjXNcieEbxD2JUNWEt0RnsCUT/SWKWLe
	 m+OFqHGdHc7RNWi1igOQCTdXyY12I5XlBdEPazuTEiFZkv4U3nUpTNyAV8y5cnN7P3
	 Rb0WSN8cJEK4nMG7cSFkCryyQoOq4o66WeNxRfey0ml/EbWF9EEMrXYRsUPoHOqf8G
	 nmjnuOXWRbonwMkc6KaBIc5NhtobNiVr0eDWOVExaNx02RnS2Ng7Ni58E/xEtU2RFq
	 L3rf8qndYjlIBeUnlb+QJ0j89apRUnTFIsljI+RUUNDR3U3SY39DDfS77OaexINLOD
	 z6CSp2vPEM7Yw==
Date: Thu, 30 Oct 2025 19:59:59 +0000
From: Conor Dooley <conor@kernel.org>
To: akemnade@kernel.org
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: twl: enable power button also
 for twl603x
Message-ID: <20251030-scientist-splashed-e0505d44abc4@spud>
References: <20251030-twl6030-button-v2-0-09653d05a2b1@kernel.org>
 <20251030-twl6030-button-v2-1-09653d05a2b1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AwBfcfdV42k/Lguc"
Content-Disposition: inline
In-Reply-To: <20251030-twl6030-button-v2-1-09653d05a2b1@kernel.org>


--AwBfcfdV42k/Lguc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 08:10:34PM +0100, akemnade@kernel.org wrote:
> From: Andreas Kemnade <andreas@kemnade.info>
>=20
> TWL603x has also a power button function, so add the corresponding subnod=
e.
> As not in all cases there is a power button connected to the corresponding
> pad of the TWL603x, the functionality can be disabled by
> status =3D "disabled" or simply not adding the subnode.
> To keep things simple, follow the established design pattern of using con=
st
> interrupts as used also by the other subdevices.
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

> @@ -225,12 +248,8 @@ properties:
>      additionalProperties: false
> =20
>      properties:
> -      compatible:
> -        const: ti,twl4030-pwrbutton
> -      interrupts:
> -        items:
> -          - items:
> -              const: 8
> +      compatible: true
> +      interrupts: true

I think this should be
    properties:
      compatible:
        enum:
          - ti,twl4030-pwrbutton
          - ti,twl6030-pwrbutton
      interrupts:
        maxItems: 1
since we want to keep the widest constraints that apply at the outer
level, rather than removing the constraints entirely.

pw-bot: changes-requested

Cheers,
Conor.

> =20
>    watchdog:
>      type: object
> @@ -459,6 +478,11 @@ examples:
>            #io-channel-cells =3D <1>;
>          };
> =20
> +        pwrbutton {
> +          compatible =3D "ti,twl6030-pwrbutton";
> +          interrupts =3D <0>;
> +        };
> +
>          rtc {
>            compatible =3D "ti,twl4030-rtc";
>            interrupts =3D <8>;
>=20
> --=20
> 2.47.3
>=20

--AwBfcfdV42k/Lguc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQPDvwAKCRB4tDGHoIJi
0geGAQCUOfSydQ4hCeo0qguS5sInoT+gqjD5PYSMfQqcdg01ZQD+Nqjvu20sQwhz
pZjtbtBlHG05Iohv3xX/fzZnXmFPzQo=
=OvzN
-----END PGP SIGNATURE-----

--AwBfcfdV42k/Lguc--

