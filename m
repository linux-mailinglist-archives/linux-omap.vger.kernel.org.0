Return-Path: <linux-omap+bounces-3940-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3958AAE1D1B
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 16:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C34CB16592A
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 14:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A19528DB4A;
	Fri, 20 Jun 2025 14:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/aQQWDI"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC0E30E857;
	Fri, 20 Jun 2025 14:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750428952; cv=none; b=h1eXIDAF9tDOPAJpTXqpxFLjEsEfU1wyWYUEQ3uceL76tSHJ2fAGkY3zQQFUsg4aHe4X4u/uHJVqMAALVdtzLcQfMlzThCnOwhItcMclmbZedd1ELbnynFAyHEWzLyCBiMsK22Cnz832HxkbBMXWyK1NQlGZiscaEnCY1Sro2oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750428952; c=relaxed/simple;
	bh=E1U3rRsS4LsJcSpEDBEZ23LHNaLMC0SBp3f8M6PqPIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzj75+SB298gxobq4RcZrAcRieckXm51yf8DhUB5Vz6QylMUEmDfMPVYhjX3iCpkEHNMg2/DSNOtfr6d/x6y4OvnP5pURNNihm1WEpYa9T43RL4aXpiPKygDqaclpmp67wJ+2eJ0+J4UyBN3yPRDiW3V0z41v/HJc+VYov9K/C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/aQQWDI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F059C4CEE3;
	Fri, 20 Jun 2025 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750428951;
	bh=E1U3rRsS4LsJcSpEDBEZ23LHNaLMC0SBp3f8M6PqPIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/aQQWDIwzs6BWk0sYP15kpqquSpUhAPO99rmEk04SAHsQJ5VjpcVHEuFMtgltxUc
	 /li7gVAEMX+D1AC7CKeitZ6Smrbhgr66acxSZIKlJjHdIxVQhlg+zqNuWMk3YtN20h
	 npxaxDvdafmg3U817T6VSXVv6cfrGKZ8APYyYDouyYNWDmSZhPh53HAED7w/9y0cDa
	 cr6utUkpnX2ABCv5hD3g9Q6DV8c358v+dqrFDD/0BpxYRV+krVUiodX2fsVuAintIQ
	 dVapr3DZY/0JXghjw1BL2UNQP5qP9hDZ6atmbCivuPB2MmQWUZwhOw54XYGmvKSGxP
	 eubtcvHmcdC9A==
Date: Fri, 20 Jun 2025 15:15:45 +0100
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
Subject: Re: [PATCH 0/2] arm: dts: OMAP: Clean up devicetree bindings and
 compatible strings
Message-ID: <20250620-unfitting-shredder-7c4c3c3bc8ec@spud>
References: <20250620-ti_dts_clean-v1-0-786a3059bca7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QeYTrg+s3ZKZg5Ao"
Content-Disposition: inline
In-Reply-To: <20250620-ti_dts_clean-v1-0-786a3059bca7@bootlin.com>


--QeYTrg+s3ZKZg5Ao
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 10:24:07AM +0200, Kory Maincent wrote:
> This series addresses inconsistencies in OMAP devicetree bindings and
> compatible strings for AM33xx-based boards:
>=20
> - Add missing compatible strings to binding documentation
> - Update vendor prefix from "ti" to "beagle" for BeagleBone boards
>   to reflect actual hardware vendors
> - Remove redundant compatible strings from device properties
>=20
> Note: Originally attempted to align devicetree model descriptions but
> received pushback due to Debian script dependencies (see thread at
> https://lore.kernel.org/all/7e854232-f02f-4ad6-b65e-22c18d1d9fe5@jm0.eu/).
> The compatible string changes may face similar concerns and would
> benefit from devicetree maintainer review.

I think relying on the "model" field is really silly, but there's also
probably very little harm in keeping the old names. I'd be much more
understanding if the complaint was about the compatible strings
changing! Keeping old ?image packing tools? working with new devicetrees
is a platform maintainer thing really, what we care much more about is
old devicetrees with new software.

>=20
> This work was split from a larger series to address feedback and allow
> independent progression of each topic area. Original series:
> https://lore.kernel.org/r/20250617-bbg-v4-0-827cbd606db6@bootlin.com
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> Kory Maincent (2):
>       dt-bindings: omap: Add missing AM33xx compatible strings
>       arm: dts: omap: Remove incorrect compatible strings from device tre=
es
>=20
>  Documentation/devicetree/bindings/arm/ti/omap.yaml | 22 ++++++++++++++++=
+++++-
>  arch/arm/boot/dts/ti/omap/am335x-base0033.dts      |  2 +-
>  arch/arm/boot/dts/ti/omap/am335x-bone.dts          |  2 +-
>  .../boot/dts/ti/omap/am335x-boneblack-wireless.dts |  2 +-
>  arch/arm/boot/dts/ti/omap/am335x-boneblack.dts     |  2 +-
>  arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |  2 +-
>  .../boot/dts/ti/omap/am335x-bonegreen-wireless.dts |  2 +-
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts     |  2 +-
>  arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts    |  3 +--
>  arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts  |  2 +-
>  .../arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts |  2 +-
>  arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts  |  2 +-
>  .../ti/omap/am335x-sancloud-bbe-extended-wifi.dts  |  5 +----
>  .../boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts  |  5 +----
>  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts  |  2 +-
>  arch/arm/boot/dts/ti/omap/am335x-shc.dts           |  2 +-
>  16 files changed, 36 insertions(+), 23 deletions(-)
> ---
> base-commit: e22b9ddaf3afd031abc350c303c7c07a51c569d8
> change-id: 20250619-ti_dts_clean-d1d86c9e675f
>=20
> Best regards,
> -- =20
> K=F6ry Maincent, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
>=20

--QeYTrg+s3ZKZg5Ao
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFVtEQAKCRB4tDGHoIJi
0tJqAQDguBGeHMESgkQ3BVgfrNTedU4Yy6KExPY/v1U3RkqwYAD9FgRQMdh0ebw1
yRK6TyBFSkTxLYQ0daxAQ+o8ANs/HgQ=
=YH8K
-----END PGP SIGNATURE-----

--QeYTrg+s3ZKZg5Ao--

