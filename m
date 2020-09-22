Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765BE273FB1
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 12:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgIVKeV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Sep 2020 06:34:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:57986 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgIVKeV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Sep 2020 06:34:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F3053B521;
        Tue, 22 Sep 2020 10:34:55 +0000 (UTC)
Message-ID: <133be287646ff03e251b0a590b240fef650a0c19.camel@suse.de>
Subject: Re: [PATCH 06/42] mfd: bcm2835: use PLATFORM_DEVID_NONE
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
Date:   Tue, 22 Sep 2020 12:34:16 +0200
In-Reply-To: <20200921205016.20461-6-krzk@kernel.org>
References: <20200921205016.20461-1-krzk@kernel.org>
         <20200921205016.20461-6-krzk@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-SqufxWVnSrUXf1qA/5ZH"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--=-SqufxWVnSrUXf1qA/5ZH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-09-21 at 22:49 +0200, Krzysztof Kozlowski wrote:
> Use PLATFORM_DEVID_NONE define instead of "-1" value because:
>  - it brings some meaning,
>  - it might point attention why auto device ID was not used.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

>  drivers/mfd/bcm2835-pm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
> index 42fe67f1538e..a76014512bde 100644
> --- a/drivers/mfd/bcm2835-pm.c
> +++ b/drivers/mfd/bcm2835-pm.c
> @@ -44,7 +44,7 @@ static int bcm2835_pm_probe(struct platform_device *pde=
v)
>  	if (IS_ERR(pm->base))
>  		return PTR_ERR(pm->base);
> =20
> -	ret =3D devm_mfd_add_devices(dev, -1,
> +	ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
>  				   bcm2835_pm_devs, ARRAY_SIZE(bcm2835_pm_devs),
>  				   NULL, 0, NULL);
>  	if (ret)
> @@ -60,7 +60,7 @@ static int bcm2835_pm_probe(struct platform_device *pde=
v)
>  		if (IS_ERR(pm->asb))
>  			return PTR_ERR(pm->asb);
> =20
> -		ret =3D devm_mfd_add_devices(dev, -1,
> +		ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
>  					   bcm2835_power_devs,
>  					   ARRAY_SIZE(bcm2835_power_devs),
>  					   NULL, 0, NULL);


--=-SqufxWVnSrUXf1qA/5ZH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl9p0ygACgkQlfZmHno8
x/5DhQf9E6d1y9M4iAU4g+kbh+bA1ey9/1H7PYxSbABFrrdX+TFHGZpRy9JA7aPz
uSuPs8/ujIU1wMmhzXCdZmSzuWECMu+8TEM6NWjgJnFFbuSZfJJLYueXAjPZAuaR
V06SZO5NkKZ9dCbrmcYd8JUyWZEsA5OIcFnPudyDB8GhbyAwI1tAWKcXB8POZNVt
ro5s/GtMnV7OXwv677e/rx2FR4cEA8ZVBfMxZRIVsn1HZm9QOo2vczXllJi5D/9Z
7cRAmHYUSgnqoZtek8wfNolzTbUXyzastcB9WhDzwkr/2u5KbiNV+nCCONbIJmvX
BC+7RCfUvMJrgM7X1/bB88EzCAgQfQ==
=Rb3s
-----END PGP SIGNATURE-----

--=-SqufxWVnSrUXf1qA/5ZH--

