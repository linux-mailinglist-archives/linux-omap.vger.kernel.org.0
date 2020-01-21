Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18B56143944
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2020 10:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbgAUJQw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jan 2020 04:16:52 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42442 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgAUJQw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jan 2020 04:16:52 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6CDDB1C036D; Tue, 21 Jan 2020 10:16:50 +0100 (CET)
Date:   Tue, 21 Jan 2020 10:16:49 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: [PATCH] ARM: dts: motorola-cpcap-mapphone: Configure calibration
 interrupt
Message-ID: <20200121091649.GA6934@amd>
References: <20200119194501.17125-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <20200119194501.17125-1-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-01-19 11:45:01, Tony Lindgren wrote:
> We added coulomb counter calibration support With commit 0cb90f071f73
> ("power: supply: cpcap-battery: Add basic coulomb counter calibrate
> support"), but we also need to configure the related interrupt.
>=20
> Without the interrupt calibration happens based on a timeout after two
> seconds, with the interrupt the calibration just gets done a bit faster.
>=20
> Cc: Merlijn Wajer <merlijn@wizzup.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

Not for stable.

									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4mwYEACgkQMOfwapXb+vKqOgCgvto+aTKjcR8Gywm33f1WWaJ7
p0QAoJuwuy2F8RuJIOhzUXq9BFuWSZqZ
=Qn6E
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
