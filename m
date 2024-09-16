Return-Path: <linux-omap+bounces-2210-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D37E979F98
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2024 12:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F3D21C22630
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2024 10:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3341509A5;
	Mon, 16 Sep 2024 10:43:22 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC0013C67C;
	Mon, 16 Sep 2024 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726483402; cv=none; b=AcaYDJP48LetIl/0hJvt8VZ4IVJh2a9sR6GruaLlDKtLyCHsoK+T/6KgppF/6O7lhe5BO1pjYeIsFx3vcviaIq+cwDiy8fdOQL9mlkdQahvUUY8jCP2QHThcM4MhXuEZcNNuo/+z39UEKqqG027ab4U6kn2H2eZYi8/w8PDlqEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726483402; c=relaxed/simple;
	bh=LjXZHDqq+VcA7YGoQC7ydES3vWftp0cOoDMUTSIpG60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQ0Si7oS6ixk0juxn90HCk2hK07ht7tdubEQ+rRSgTCFJ4SlauNoIARdRtbEhlbZyY5saxWHD3C13lUnRF10xcheTly5p5M+6o5YbDV4tNLRSpj9po7Xvi++TrNAr27vKtDQWFlcDVB3rKTzhwTLJirQ/9HsFtBw85q35xpUPZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 7AE501F0004B;
	Mon, 16 Sep 2024 10:36:35 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id D6057A1E15C; Mon, 16 Sep 2024 10:36:33 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id AC280A1E154;
	Mon, 16 Sep 2024 10:36:32 +0000 (UTC)
Date: Mon, 16 Sep 2024 12:36:30 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] ARM: dts: omap4-kc1: fix twl6030 power node
Message-ID: <ZugKLiRZrrDpdI_W@collins>
References: <20240915193527.1071792-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0EOYwvdTGuWUqxoA"
Content-Disposition: inline
In-Reply-To: <20240915193527.1071792-1-andreas@kemnade.info>


--0EOYwvdTGuWUqxoA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

Le Sun 15 Sep 24, 21:35, Andreas Kemnade a =C3=A9crit :
> dtbs_check was moaning about twl6030-power, use the standard property
> instead.
> Apparently that twl6030 power snippet slipped in without the
> corresponding driver. Now it is handled by the standard property.

Thanks for the fix! LGTM.

Reviewed-by: Paul Kocialkowski <contact@paulk.fr>

Cheers,

Paul

> CC: Paul Kocialkowski <contact@paulk.fr>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/boot/dts/ti/omap/omap4-kc1.dts | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-kc1.dts b/arch/arm/boot/dts/=
ti/omap/omap4-kc1.dts
> index c6b79ba8bbc91..df874d5f5327f 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-kc1.dts
> +++ b/arch/arm/boot/dts/ti/omap/omap4-kc1.dts
> @@ -112,11 +112,7 @@ twl: twl@48 {
>  		reg =3D <0x48>;
>  		/* IRQ# =3D 7 */
>  		interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>; /* IRQ_SYS_1N cascaded=
 to gic */
> -
> -		twl_power: power {
> -			compatible =3D "ti,twl6030-power";
> -			ti,system-power-controller;
> -		};
> +		system-power-controller;
>  	};
>  };
> =20
> --=20
> 2.39.2
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expertise in multimedia, graphics and embedded hardware support with Linux.

--0EOYwvdTGuWUqxoA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmboCi4ACgkQhP3B6o/u
lQy80Q/+K61+Btb+NzT9ug0gX53/mlmAYW3LI2hAjlVUf/yWar5eirKSTJV+5AGi
DpIKlROtOoiyGd2ikz6yInLYYc5IdDJHXuLsxJZB6+mLdF2zKm2O+lnMtW8f0LG/
Xsyn7/qiGClG5a+tKn+RHKB4oHp3/xVT/u+fLJUZpwB35FuVw8ZK+Tc82Ax+QROH
rFC/mdZQQJKHLkRnptunZlDJcOmbXDAzGCoSccuat79KUVEPIVQg/CjNt45xaDDy
xUdKfjiBNcMfv6Egpk1BWtlheQeAVk2kIV7E8MfPtPQAWdBQiKwcTfbx6kur3zqC
jE/AguUvb6uZsObqEBG9Z9YkOfMccK3ZLyCYH1AF8J0oypbfooZF4qkJpchA8gEy
WpnPVkkgsrGBpzkZ2jXXj+Jx1jYxbVCfeVVh/uzw24ziwXr436DUVZWvpdYrFXvQ
u2JX/4o7ELverZfWLAd42FqY/YRcn11Ajw7yLUNjz9hXhfGbz3E8SNYBt28+FrHx
A03LvZN+FhANl+ZgPYtzCqg3tPvqUNrZoFycYscDD0xbpBLsO9GnwvFn5nvJePds
oMrFIqO/tI8CRr1taY15twxFmYo3am3pM0FLhDl9DNa/6hEHU9vnE5jVAA3a4nHu
fuO8Wxh7RKeStBgCxYmB3hD/Y3jX7w89+ohVYbobYIhTic78THs=
=ihYs
-----END PGP SIGNATURE-----

--0EOYwvdTGuWUqxoA--

