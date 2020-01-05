Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8582B13096C
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jan 2020 19:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgAEScF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jan 2020 13:32:05 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:47248 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgAEScF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 5 Jan 2020 13:32:05 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AE2F01C21EA; Sun,  5 Jan 2020 19:32:02 +0100 (CET)
Date:   Sun, 5 Jan 2020 19:32:02 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        martin_rysavy@centrum.cz, agx@sigxcpu.org, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org
Cc:     tomi.valkeinen@ti.com, jjhiblot@ti.com, daniel.thompson@linaro.org
Subject: LED backlight on Droid 4 and others
Message-ID: <20200105183202.GA17784@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

It would be good to get LED backlight to work in clean way for 5.6
kernel.

As far as I can see, these are neccessary (but not enough; it does not
work for me): lm3532 changes to register LED with of node, plus device
tree changes for droid 4, and these generic changes:

commit d457d0c97d6d55fe3e62633791ac05d289a37d2e
Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date:   Thu Oct 3 10:28:12 2019 +0200

    backlight: add led-backlight driver
   =20
    This patch adds a led-backlight driver (led_bl), which is similar to
    pwm_bl except the driver uses a LED class driver to adjust the
    brightness in the HW. Multiple LEDs can be used for a single backlight.
   =20
    Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
    Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
    Acked-by: Pavel Machek <pavel@ucw.cz>
    Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

commit 44b7adbf0b07904e4198ae1d0a763917d1c68a23
Author: Jean-Jacques Hiblot <jjhiblot@ti.com>
Date:   Thu Oct 3 10:28:10 2019 +0200

    leds: Add managed API to get a LED from a device driver
   =20
    If the LED is acquired by a consumer device with devm_led_get(), it is
    automatically released when the device is detached.
   =20
    Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
    Acked-by: Pavel Machek <pavel@ucw.cz>
    Signed-off-by: Pavel <pavel@ucw.cz>

commit 93b98c570d7f898063ab6204e1b3950a3335dd12
Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date:   Thu Oct 3 10:28:09 2019 +0200

    leds: Add of_led_get() and led_put()
   =20
    This patch adds basic support for a kernel driver to get a LED device.
    This will be used by the led-backlight driver.
   =20
    Only OF version is implemented for now, and the behavior is similar to
    PWM's of_pwm_get() and pwm_put().
   =20
    Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
    Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
    Acked-by: Pavel Machek <pavel@ucw.cz>
    Signed-off-by: Pavel <pavel@ucw.cz>

[If you have an idea what else is needed, it would be welcome; it
works for me in development tree but not in tree I'd like to
upstream.]

Lee, would you be willing to take "backlight: add led-backlight
driver"? Would it help if I got "leds: Add managed API to get a LED
=66rom a device driver" and "leds: Add of_led_get() and led_put()" into
for_next tree of the LED subsystem?

It is kind of important as, well, phone without screen looks pretty
much dead, and same issue hits Droid 4 and Librem 5 phones at least...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXhIroQAKCRAw5/Bqldv6
8qprAJ90Q8brwIbYFi2ax/hmdk3CLdmWuwCfX3POM4PZoSAPnOvVbdh+jOO7cfI=
=sBIE
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
