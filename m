Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7740715D9BD
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 15:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbgBNOtS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 09:49:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:44322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729294AbgBNOtS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 14 Feb 2020 09:49:18 -0500
Received: from earth.universe (dyndsl-095-033-170-229.ewe-ip-backbone.de [95.33.170.229])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 013BA222C2;
        Fri, 14 Feb 2020 14:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581691757;
        bh=+U/C5/WoFlL7gJcY7WhJ5ANkFVe5DyWAcqpTE17f8M4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pbhb2FemxY1A3p5lgEEfOHh7xg70hLcmPLizP+Ub11LjzSTJdxDUGrPw3K32Jz5Nq
         6ubz8Cc12RC8+F3LFx5zlHkBcQ+4dL68aQcVPxDW2Zzy+ymWpPnekCGPLEzGJlXWOg
         ZVUEDrWVEe44hgH9LiZhAjqNJuIyieUvFWHke7Lo=
Received: by earth.universe (Postfix, from userid 1000)
        id 410453C0C83; Fri, 14 Feb 2020 15:49:15 +0100 (CET)
Date:   Fri, 14 Feb 2020 15:49:15 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mattias Jacobsson <2pi@mok.nu>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] ARM: dts: n900: remove mmc1 card detect gpio
Message-ID: <20200214144915.jnmnsqennc4jvvsv@earth.universe>
References: <20200214130249.6845-1-merlijn@wizzup.org>
 <20200214130249.6845-3-merlijn@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lsufgzzbafems3q2"
Content-Disposition: inline
In-Reply-To: <20200214130249.6845-3-merlijn@wizzup.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--lsufgzzbafems3q2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 14, 2020 at 02:02:48PM +0100, Merlijn Wajer wrote:
> Instead, expose the key via the input framework, as SW_MACHINE_COVER

How about:

The chip-detect GPIO is actually detecting if the cover is closed.
Technically it's possible to use the SD card with open cover. The
only downside is risk of battery falling out and user being able
to physically remove the card.

The behaviour of SD card not being available when the device is
open is unexpected and creates more problems than it solves. There
is a high chance, that more people accidently break their rootfs
by opening the case without physically removing the card.

> ---

Missing SoB.

Patch itself is

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  arch/arm/boot/dts/omap3-n900.dts | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n=
900.dts
> index 7028a7cb2849..ed773e1609a5 100644
> --- a/arch/arm/boot/dts/omap3-n900.dts
> +++ b/arch/arm/boot/dts/omap3-n900.dts
> @@ -108,6 +108,14 @@
>  			linux,code =3D <SW_FRONT_PROXIMITY>;
>  			linux,can-disable;
>  		};
> +
> +		machine_cover {
> +			label =3D "Machine Cover";
> +			gpios =3D <&gpio6 0 GPIO_ACTIVE_LOW>; /* 160 */
> +			linux,input-type =3D <EV_SW>;
> +			linux,code =3D <SW_MACHINE_COVER>;
> +			linux,can-disable;
> +		};
>  	};
> =20
>  	isp1707: isp1707 {
> @@ -805,10 +813,6 @@
>  	pinctrl-0 =3D <&mmc1_pins>;
>  	vmmc-supply =3D <&vmmc1>;
>  	bus-width =3D <4>;
> -	/* For debugging, it is often good idea to remove this GPIO.
> -	   It means you can remove back cover (to reboot by removing
> -	   battery) and still use the MMC card. */
> -	cd-gpios =3D <&gpio6 0 GPIO_ACTIVE_LOW>; /* 160 */
>  };
> =20
>  /* most boards use vaux3, only some old versions use vmmc2 instead */
> --=20
> 2.23.0
>=20

--lsufgzzbafems3q2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5Gs2UACgkQ2O7X88g7
+pocChAAohM6F5rZSxC2jdWHmrT/fWK7ws4C0hdiAaN5T48NxDbgOTEIt2FSpJiL
Pz/fAFkzRp5C7XQMnS0kgmKhpSeGf1BTuqUHP1+zveCVVugzbpmBF88eFMxhEzFX
ifR6qNrIraksoPPygP9kVg8Z4tM0efv4thiPsYDnQ6EeVUAfD/nzPV4DOCyuU9s+
wtrTll+4dJCk6RH042LSd2lcU16eWQKMNgZeEezUCnJxxv2U5Htf8HEAjLnwMM/T
48lV38WxGw7EH+XS1RXKIkeh9wubbBRZt8gsjBr4LNp264Hm3MY3vp2z5YSq3GPQ
RFFXjF7ewPvgVbx7RgvqqnLpc0aozGooUJYQEpRiIElsBs1OOXOstp+xtvrkofwT
4RelJkkvsxtLGoBaUkDKJePErDC+dkGkEEDZ9XBsI3QEY10QCJUc/MUzDjUASJcb
BrxKAh32jfzWG4xAU+KtI4hCWJQjlr7rjkqsj26Ao4nLRpGwE5ZjjiGBIPtWO/Hc
cRrqEDk2eAq9PPNzdYo2s4KRJZ+UPPUUiKjkGku/JM6tWXwSW8bmTvwYXsWFY4S8
66j7U07LDNtsQq5KevhRHYwuRFfX1RGd8rDUEI0t/JJxmgrSWAHNsBz40z3uFDzF
bgPD0U07aeZ4qbk28xFChIy12Df1vDahLDeXBrYA8vCHgoeu72g=
=0Z0i
-----END PGP SIGNATURE-----

--lsufgzzbafems3q2--
