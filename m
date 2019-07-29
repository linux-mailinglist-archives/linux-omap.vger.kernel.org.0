Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7097779BF0
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2019 00:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730684AbfG2WAf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jul 2019 18:00:35 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:42541 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfG2WAe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Jul 2019 18:00:34 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id D1F298025F; Tue, 30 Jul 2019 00:00:19 +0200 (CEST)
Date:   Tue, 30 Jul 2019 00:00:31 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: Backlight in motorola Droid 4
Message-ID: <20190729220030.GA20100@amd>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20190722205921.GA24787@amd>
 <b8fbc94f-c087-2c9d-4532-ea423f1626e6@ti.com>
 <20190724124530.GA30211@amd>
 <ca69f627-96e2-f982-3a29-18b0127ac6e5@ti.com>
 <edde330e-516b-ecaa-4139-0bfa766a9c08@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <edde330e-516b-ecaa-4139-0bfa766a9c08@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >Looking at the rest of the code.
> >
> >The DT doc indicated that this was a required child property so this is
> >why it
> >
> >errors out.
> >
> >Dan
> >
> ><snip>
> >
>=20
> Did you want me to fix up the LM3532 and send the patch?

If you could do that, that would be nice :-).

> Or do you have a patch ready to go?

No progress there, I'm busy with other stuff...

Thanks,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0/bH4ACgkQMOfwapXb+vJbZwCeOsEnECGW7XgsYHjDkAvi9ZHy
Rd4Anjl6meti7Dn9fgRfk1KrcIy28Ueo
=J4oU
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
