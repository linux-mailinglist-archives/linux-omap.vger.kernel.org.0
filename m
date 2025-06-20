Return-Path: <linux-omap+bounces-3938-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CD2AE1D05
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 16:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A23C93B64F1
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 14:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CB128DF2B;
	Fri, 20 Jun 2025 14:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elgZLdtS"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC702E403;
	Fri, 20 Jun 2025 14:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750428510; cv=none; b=Nws43CsWO7KUvLEHb7RIpvgn60bwctxmACX6svZj2vGpntT4Gpv26AcKZ63wODItB+Myg0rkj/w5SMTWec1IFhKQgPRTN/I1QoHRWJpTBkz8+BYxbdofhP+pYHbtRIKBLLLh3ph0+BXHaYOnaPV//Eh/j3AdBwS/sIKcMUje56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750428510; c=relaxed/simple;
	bh=XEAKrcXRYWA6SsaxOrWHhacPY6lqTdOvMcVrjzpRH/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwRwviF1TXsQBpr/YApC8UMHkEJXsmAyV7+6Qc5/bINgHR8jOzR/akDIHeQl8SgnBTy7j2u4LTLdBiso0ebYuK+eCFtaRO9KdP6edm9AhOIzAdEA5hPrqUWPhV/4sTW1RAPRH319j1bIEyy827NqPB4LcA8odHYXVV1oARsm6w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elgZLdtS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC81C4CEEE;
	Fri, 20 Jun 2025 14:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750428509;
	bh=XEAKrcXRYWA6SsaxOrWHhacPY6lqTdOvMcVrjzpRH/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=elgZLdtSf5MSXVVhsKa1KhzQZoajyVz8+2bJ+SfsGzNb2IIfYJ2aCcEEHDZ8sS89a
	 X/2BNn60pcUQpIehe5eAoDZLtd5MkiUxpifSPWkGHp7soCNw6O4eRASTd6W1RlCkzY
	 lLH8GF/nkjwyytsnV4PCvTEPt6cnFGH80fQk75GOcpTdlH5TPRXPm6vowwAnUR2y5p
	 uq7aBCDcNzQX5eq/PX7pvtHccIkO8qm1QxRZsAumOoJmTCaJWInH4UgRcMgRzRSYXU
	 DrWjnqyXH3anyJ2h8wG6h5fcfJk3Gm5pHapTgIfg/Y6UySDEK/djG3Lx/yuCVZDeGU
	 MRgHBzogtQPjw==
Date: Fri, 20 Jun 2025 15:08:24 +0100
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
Message-ID: <20250620-mortally-fifteen-7a2566545a5d@spud>
References: <20250620-ti_dts_clean-v1-0-786a3059bca7@bootlin.com>
 <20250620-ti_dts_clean-v1-1-786a3059bca7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7E0pVWu7aCWflRJE"
Content-Disposition: inline
In-Reply-To: <20250620-ti_dts_clean-v1-1-786a3059bca7@bootlin.com>


--7E0pVWu7aCWflRJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 10:24:08AM +0200, Kory Maincent wrote:
> Add several compatible strings that were missing from the binding
> documentation for AM33xx-based boards. Update vendor prefix from
> "ti" to "beagle" for BeagleBone to match actual hardware vendors.
>=20
> Reviewed-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

This is a v1 apparently, what is the relationship between this patch and
https://lore.kernel.org/all/20250617-bbg-v4-1-827cbd606db6@bootlin.com/
?

> ---
>  Documentation/devicetree/bindings/arm/ti/omap.yaml | 22 ++++++++++++++++=
+++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documen=
tation/devicetree/bindings/arm/ti/omap.yaml
> index 3603edd7361d..7e0d5d376d57 100644
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -104,12 +104,32 @@ properties:
>        - description: TI AM33 based platform
>          items:
>            - enum:
> +              - beagle,am335x-bone
> +              - beagle,am335x-bone-black
> +              - beagle,am335x-bone-black-wireless
> +              - beagle,am335x-bone-blue
> +              - beagle,am335x-pocketbeagle
> +              - bosch,am335x-guardian
> +              - bosch,am335x-shc
>                - compulab,cm-t335
> +              - grinn,am335x-chiliboard
> +              - grinn,am335x-chilisom
> +              - gumstix,am335x-pepper
> +              - isee,am335x-base0033
> +              - moxa,uc-2101
>                - moxa,uc-8100-me-t
> +              - myir,myc-am335x
> +              - myir,myd-am335x
>                - novatech,am335x-lxm
> -              - ti,am335x-bone
> +              - oct,osd3358-sm-refdesign
> +              - sancloud,am335x-boneenhanced
> +              - seeed,am335x-bone-green
> +              - seeed,am335x-bone-green-wireless
> +              - tcl,am335x-sl50
>                - ti,am335x-evm
> +              - ti,am335x-evmsk
>                - ti,am3359-icev2
> +              - vscom,onrisc
>            - const: ti,am33xx
> =20
>        - description: Compulab board variants based on TI AM33
>=20
> --=20
> 2.43.0
>=20

--7E0pVWu7aCWflRJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFVrWAAKCRB4tDGHoIJi
0jdgAP0cmxprJm+ho6cmKXm0QY2B9SykMVlWsQP1CWYb2xnNnQD8DfGR0xJiuQgh
GmK0oS8J1J/UoVgllbT3pROzldr3EAk=
=AdaR
-----END PGP SIGNATURE-----

--7E0pVWu7aCWflRJE--

