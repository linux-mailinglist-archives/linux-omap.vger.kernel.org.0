Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E576179D4AD
	for <lists+linux-omap@lfdr.de>; Tue, 12 Sep 2023 17:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236257AbjILPUX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Sep 2023 11:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236230AbjILPUW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Sep 2023 11:20:22 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61DBE10DE;
        Tue, 12 Sep 2023 08:20:18 -0700 (PDT)
Received: from mercury (dyndsl-091-248-213-163.ewe-ip-backbone.de [91.248.213.163])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 365B3660731E;
        Tue, 12 Sep 2023 16:20:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694532017;
        bh=LvBsHe6wN7LSsS0+rzx3grtgf96aSE2yfmCbQhFiEZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GqPQWtgfsXdBehvBiw02lRcsPLN8DloV7XCUwrPCg0jNnZHjEu+PImgA0NnUBar1K
         accZkJWL+8fKzTmnIvYsP8xNGBLEfPcawMa5+XRmN0axC/RTVjnpt+Eek/XP/1Ms2s
         f72p25VCkPPqiUL5ihPJEu98kV4NL6IR/pszlu9uwkeISVOnrX7s3lA6ZSn9kwlePl
         ur7ZU46D3e5QBQiroCLfo2GIRicyp1Y8VHoSLlQYSqwz29uc2W3rczOjTMBBlUSiR3
         mbSMEo8Iu12ojRxGul3hpHyo9Wx3ip25kmBcauc45NcXBg1n+FtujIsIQSjn/uMrjB
         JdLBuM00WWuCw==
Received: by mercury (Postfix, from userid 1000)
        id 03E0F1060929; Tue, 12 Sep 2023 17:20:15 +0200 (CEST)
Date:   Tue, 12 Sep 2023 17:20:14 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/4] ARM: dts: ti: omap: Fix bandgap thermal cells
 addressing for omap3/4
Message-ID: <20230912152014.4bmkfffzcswrxc57@mercury.elektranox.org>
References: <20230911040828.39386-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="j72lnmhfg4uuibgw"
Content-Disposition: inline
In-Reply-To: <20230911040828.39386-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--j72lnmhfg4uuibgw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 11, 2023 at 07:08:24AM +0300, Tony Lindgren wrote:
> Fix "thermal_sys: cpu_thermal: Failed to read thermal-sensors cells: -2"
> error on boot for omap3/4. This is caused by wrong addressing in the dts
> for bandgap sensor for single sensor instances.
>=20
> Note that omap4-cpu-thermal.dtsi is shared across omap4/5 and dra7, so
> we can't just change the addressing in omap4-cpu-thermal.dtsi.
>=20
> Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: Carl Philipp Klemm <philipp@uvos.xyz>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Fixes: a761d517bbb1 ("ARM: dts: omap3: Add cpu_thermal zone")
> Fixes: 0bbf6c54d100 ("arm: dts: add omap4 CPU thermal data")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  arch/arm/boot/dts/ti/omap/omap3-cpu-thermal.dtsi | 3 +--
>  arch/arm/boot/dts/ti/omap/omap4-cpu-thermal.dtsi | 5 ++++-
>  arch/arm/boot/dts/ti/omap/omap443x.dtsi          | 1 +
>  arch/arm/boot/dts/ti/omap/omap4460.dtsi          | 1 +
>  4 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/ti/omap/omap3-cpu-thermal.dtsi b/arch/arm/=
boot/dts/ti/omap/omap3-cpu-thermal.dtsi
> --- a/arch/arm/boot/dts/ti/omap/omap3-cpu-thermal.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap3-cpu-thermal.dtsi
> @@ -12,8 +12,7 @@ cpu_thermal: cpu-thermal {
>  	polling-delay =3D <1000>; /* milliseconds */
>  	coefficients =3D <0 20000>;
> =20
> -			/* sensor       ID */
> -	thermal-sensors =3D <&bandgap     0>;
> +	thermal-sensors =3D <&bandgap>;
> =20
>  	cpu_trips: trips {
>  		cpu_alert0: cpu_alert {
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-cpu-thermal.dtsi b/arch/arm/=
boot/dts/ti/omap/omap4-cpu-thermal.dtsi
> --- a/arch/arm/boot/dts/ti/omap/omap4-cpu-thermal.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap4-cpu-thermal.dtsi
> @@ -12,7 +12,10 @@ cpu_thermal: cpu_thermal {
>  	polling-delay-passive =3D <250>; /* milliseconds */
>  	polling-delay =3D <1000>; /* milliseconds */
> =20
> -			/* sensor       ID */
> +	/*
> +	 * See 44xx files for single sensor addressing, omap5 and dra7 need
> +	 * also sensor ID for addressing.
> +	 */
>  	thermal-sensors =3D <&bandgap     0>;
> =20
>  	cpu_trips: trips {
> diff --git a/arch/arm/boot/dts/ti/omap/omap443x.dtsi b/arch/arm/boot/dts/=
ti/omap/omap443x.dtsi
> --- a/arch/arm/boot/dts/ti/omap/omap443x.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap443x.dtsi
> @@ -69,6 +69,7 @@ abb_iva: regulator-abb-iva {
>  };
> =20
>  &cpu_thermal {
> +	thermal-sensors =3D <&bandgap>;
>  	coefficients =3D <0 20000>;
>  };
> =20
> diff --git a/arch/arm/boot/dts/ti/omap/omap4460.dtsi b/arch/arm/boot/dts/=
ti/omap/omap4460.dtsi
> --- a/arch/arm/boot/dts/ti/omap/omap4460.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap4460.dtsi
> @@ -79,6 +79,7 @@ abb_iva: regulator-abb-iva {
>  };
> =20
>  &cpu_thermal {
> +	thermal-sensors =3D <&bandgap>;
>  	coefficients =3D <348 (-9301)>;
>  };
> =20
> --=20
> 2.42.0

--j72lnmhfg4uuibgw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmUAga4ACgkQ2O7X88g7
+ppT/xAAmRI7vChb2Imm3km6MxGk5h/UYzwxUPv5GQM7T5Ntyw2U7cZGRM7Qkt7l
nW3HsIGTRnads+MwQkVDeQi25ttjmcbDl7f5GjUMBuv7eUkZ4VpJeOV/fk8SNqeQ
ONFAvXwifAbO9QX5O8qIHZppun33T0NWAjkI01iRMNx/vJaYcOCKTp9JwCRYZ3RH
xPoaQ0CswGOwY/kEDg+7drhAeyBl3pL+CpGuIYZrm/6VRaflGsTHscs6hiMzOUNr
jIrh3KdOlubTgfXhl52FZf7SNu5fJosVvTCkx8nFl/fO4cSDRShSVQn9s5vbwZYb
wpZ6fcwn+f3oLtgmWmDwNAWMhngFungdEAV8q9LXLEYtRp82xZ/3docahyq4B6Td
I6WZw7q9A2eUwytaB1UVjx+vLnStsTkec44iQl1jAMveCW7zKGu+x+7tjfUbJHg6
fNQABJMKG2XIk7Si6xqHZfK6ahwkeXcmNTXFcWnjmjY7LkLg56BnbU95wvtl0J+t
elvmMzxuKAhmfjVbtU45gp6Nj7z9JigmukKy/USNilO3X7Ry0ixxlII9+mQEL48z
Z8quPnOWcpoGelsAhCg6+dKQuzE1Y0Xme4iAaiszKfeayQA9ciG6O1isVP1a61oA
Wun3EfepKq9SuwMximYDKB+BHSdgYf7bmeCvhLcd9YhuY9hJCGA=
=CfAt
-----END PGP SIGNATURE-----

--j72lnmhfg4uuibgw--
