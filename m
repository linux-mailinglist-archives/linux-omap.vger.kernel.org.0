Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCE596FAB5
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jul 2019 09:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbfGVHuh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jul 2019 03:50:37 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:36781 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfGVHug (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 Jul 2019 03:50:36 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 803AE80317; Mon, 22 Jul 2019 09:50:21 +0200 (CEST)
Date:   Mon, 22 Jul 2019 09:50:32 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] Enable backlight when trigger is activated
Message-ID: <20190722075032.GA27524@amd>
References: <20190718190849.GA11409@amd>
 <22d7eca4ad8aa2e73933c4f83c92221ce6e0945a.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <22d7eca4ad8aa2e73933c4f83c92221ce6e0945a.camel@collabora.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Configuring backlight trigger from dts results in backlight off during
> > boot. Machine looks dead upon boot, which is not good.
> >=20
> > Fix that by enabling LED on trigger activation.

> > +++ b/drivers/leds/trigger/ledtrig-backlight.c
> > @@ -114,6 +114,8 @@ static int bl_trig_activate(struct led_classdev *le=
d)
> >  	n->old_status =3D UNBLANK;
> >  	n->notifier.notifier_call =3D fb_notifier_callback;
> > =20
> > +	led_set_brightness(led, LED_ON);
> > +
>=20
> This looks fishy.
>=20
> Maybe you should use a default-state =3D "keep" instead? (and you'll have
> to support it in the LED driver).
>=20
> That'll give you proper "don't touch the LED if it was turned on" behavio=
r,
> which is what you seem to want.

Actually no, that's not what I want. LED should go on if the display
is active, as soon as trigger is activated.

Unfortunately, I have see no good way to tell if the display is
active (and display is usually active when trigger is activated).

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl01asgACgkQMOfwapXb+vK9lgCbBcUNDD1pNFmswZowkerycBcz
v80AoK7Dv7JR0+GNLhozQBGFuNFWTOIt
=oVmU
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
