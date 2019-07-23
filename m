Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03DDC70ED6
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 03:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732041AbfGWBxp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jul 2019 21:53:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:51040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbfGWBxp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 22 Jul 2019 21:53:45 -0400
Received: from earth.universe (dyndsl-037-138-177-200.ewe-ip-backbone.de [37.138.177.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AECDC21955;
        Tue, 23 Jul 2019 01:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563846824;
        bh=NaXqBg9rCdeIodFToT71HI6Xgmdy3Ay3ojTJaBKqdlw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qvY3+hO2JxZBoA48wBdqbLPZgjTFWpQAJNfEH0WQ4iQH6wepJBVo5N1rI3OOY8NtH
         im1aQUoGVM70i5NUcjF7yQaf1ozwOYOBBAlmMc1QaLwP7slNnTRf+lt1nWR5wTRRGy
         XFkRaxeR+0wuYQSX8/nsb/5iN9ZMo9kzwdPfjUV0=
Received: by earth.universe (Postfix, from userid 1000)
        id 49DDF3C0944; Tue, 23 Jul 2019 03:53:42 +0200 (CEST)
Date:   Tue, 23 Jul 2019 03:53:42 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH] ARM: dts: omap3-n950-n9: Remove regulator-boot-off
 property
Message-ID: <20190723015342.vc2hybovozfmeekj@earth.universe>
References: <20190721232455.13709-1-ezequiel@collabora.com>
 <20190721232455.13709-2-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y5m57v4tkp6mj5vk"
Content-Disposition: inline
In-Reply-To: <20190721232455.13709-2-ezequiel@collabora.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--y5m57v4tkp6mj5vk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jul 21, 2019 at 08:24:55PM -0300, Ezequiel Garcia wrote:
> This property was never supported upstream. Get rid of it.
>=20
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  arch/arm/boot/dts/omap3-n950-n9.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/omap3-n950-n9.dtsi b/arch/arm/boot/dts/oma=
p3-n950-n9.dtsi
> index 5441e9ffdbb4..6681d4519e97 100644
> --- a/arch/arm/boot/dts/omap3-n950-n9.dtsi
> +++ b/arch/arm/boot/dts/omap3-n950-n9.dtsi
> @@ -41,7 +41,6 @@
>  		regulator-name =3D "VWLAN";
>  		gpio =3D <&gpio2 3 GPIO_ACTIVE_HIGH>; /* gpio 35 */
>  		enable-active-high;
> -		regulator-boot-off;
>  	};
> =20
>  	leds {
> --=20
> 2.22.0
>=20

--y5m57v4tkp6mj5vk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl02aKMACgkQ2O7X88g7
+pqbkhAAkNgOCCWkcdt1zK5FHf5KQ78sE+0pR7TZlZYs+ZJ92U7ouC+d0CdP1XUr
NUC40Y1u8sHBCcG2d0z3ARmask3OGJrVN1ngmnIT1Jl7c2OSYMADs7JZxD4ob6PF
ypnwJaDwd26B0qWCH8gViuvUwHrD7AuJuwOFRdvZYW5MAlGYXBPqc9jxjlXI4cXD
x39K4nWQatHWUPFu3yjFdlLv5FuY1dBZKzTaiBO3BD51JCFvup6htSs8W8J7zhiZ
xF/UGY5XLBpBtKaWa5dM7pKZoV5Rh/+aH2BRtbGw+Fcy09KaQSU7dAnAwAdp4HBF
syBUa5svCit6dK2IqqbCDjhZGcOTZF7TcBzKCGJzomr/oP0i8591Q+Xb6XPqtyaU
SBS2tKfiIJ0K6OhvDAfiJ/Ixn1YRuXjQ/y+GeZRSKVXMI0P3/K0Bfu2nVT2C0TRQ
kiq6Y7gCcaKaFfxJ7wJonFBEUe3d6FCHgj311axDopesWmmkNXCPfuxP/EPpKDnZ
n9KcFaUtwnixbgatzP2eOmW7eSseJZ/WrthGGj1uZLDc2+NqrexTo/NUJ8uiSZmO
F+E5LPXq9SJ61YCcCuh9BYMyADdAviaBcJplT7rTc0rlBOoYgcp7DPEUVds6tV1m
zeG6/8wZhQ7q8tEMIodViPD5BGxl37Xv0HugW6aTTwV5+AfmXg8=
=zqUv
-----END PGP SIGNATURE-----

--y5m57v4tkp6mj5vk--
