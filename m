Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D8F3E5A23
	for <lists+linux-omap@lfdr.de>; Tue, 10 Aug 2021 14:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240667AbhHJMki (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Aug 2021 08:40:38 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39778 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240682AbhHJMkc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Aug 2021 08:40:32 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B8C5A1C0B77; Tue, 10 Aug 2021 14:40:07 +0200 (CEST)
Date:   Tue, 10 Aug 2021 14:40:07 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>, sashal@kernel.org
Cc:     linux-omap@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [PATCH] bus: ti-sysc: Fix gpt12 system timer issue with reserved
 status
Message-ID: <20210810124006.GA25121@amd>
References: <20210611060224.36769-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20210611060224.36769-1-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I noticed the issue while reviewing stable kernels, as this is being
backported.

> Jarkko Nikula <jarkko.nikula@bitmer.com> reported that Beagleboard
> revision c2 stopped booting. Jarkko bisected the issue down to
> commit 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix suspend
> and resume for am3 and am4").
>=20
> Let's fix the issue by tagging system timers as reserved rather than
> ignoring them. And let's not probe any interconnect target module child
> devices for reserved modules.

+++ b/drivers/bus/ti-sysc.c
> @@ -3093,8 +3095,8 @@ static int sysc_probe(struct platform_device *pdev)
>  		return error;
> =20
>  	error =3D sysc_check_active_timer(ddata);
> -	if (error)
> -		return error;
> +	if (error =3D=3D -EBUSY)
> +		ddata->reserved =3D true;
> =20
>  	error =3D sysc_get_clocks(ddata);
>  	if (error)

What is going on here? First, we silently ignore errors other than
EBUSY. Second, sysc_check_active_timer() can't return -EBUSY: it
returns either 0 or -ENXIO. (I checked 5.10-stable, mainline and
-next-20210806).

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmESc6YACgkQMOfwapXb+vKZ5wCeLKBimzJgT4TZyjOoeCGslBeJ
BH8AoKYD1/pIPyYP4B42sem9TRwrdWEx
=XRbK
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
