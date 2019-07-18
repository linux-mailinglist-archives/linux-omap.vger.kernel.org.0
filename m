Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E11B6D468
	for <lists+linux-omap@lfdr.de>; Thu, 18 Jul 2019 21:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbfGRTIw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Jul 2019 15:08:52 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40444 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfGRTIw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 18 Jul 2019 15:08:52 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id B0487802B0; Thu, 18 Jul 2019 21:08:38 +0200 (CEST)
Date:   Thu, 18 Jul 2019 21:08:49 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: [PATCH] Enable backlight when trigger is activated
Message-ID: <20190718190849.GA11409@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Configuring backlight trigger from dts results in backlight off during
boot. Machine looks dead upon boot, which is not good.

Fix that by enabling LED on trigger activation.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigge=
r/ledtrig-backlight.c
index 487577d..6e6bc78 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -114,6 +114,8 @@ static int bl_trig_activate(struct led_classdev *led)
 	n->old_status =3D UNBLANK;
 	n->notifier.notifier_call =3D fb_notifier_callback;
=20
+	led_set_brightness(led, LED_ON);
+
 	ret =3D fb_register_client(&n->notifier);
 	if (ret)
 		dev_err(led->dev, "unable to register backlight trigger\n");
@@ -126,6 +128,7 @@ static void bl_trig_deactivate(struct led_classdev *led)
 	struct bl_trig_notifier *n =3D led_get_trigger_data(led);
=20
 	fb_unregister_client(&n->notifier);
+	led_set_brightness(led, LED_OFF);
 	kfree(n);
 }
=20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0ww8EACgkQMOfwapXb+vI/hQCeO9FNCL2TmO9oZ8A7L2jg1y1R
jvQAn1C6VabsEY2RJJWCWLOK9CshUbyu
=aKee
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
