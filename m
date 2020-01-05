Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2C5130ACD
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2020 00:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgAEXzy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jan 2020 18:55:54 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:40224 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgAEXzy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 5 Jan 2020 18:55:54 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4A0E11C2453; Mon,  6 Jan 2020 00:55:52 +0100 (CET)
Date:   Mon, 6 Jan 2020 00:55:51 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>, linux-leds@vger.kernel.org
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        agx@sigxcpu.org, lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com, jjhiblot@ti.com
Subject: Re: LED backlight on Droid 4 and others
Message-ID: <20200105235551.GB7598@amd>
References: <20200105183202.GA17784@duo.ucw.cz>
 <20200105202449.GC5885@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline
In-Reply-To: <20200105202449.GC5885@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > It would be good to get LED backlight to work in clean way for 5.6
> > kernel.
>=20
> I agree, this is badly needed for many devices.
>=20
> > [If you have an idea what else is needed, it would be welcome; it
> > works for me in development tree but not in tree I'd like to
> > upstream.]
>=20
> I have some version of these patches working with modified dts in my
> droid4-pending-v5.4 branch git branch, maybe try to diff against that.

So.. backlight now works for me, and I put the LED parts of the
patches to

gitolite.kernel.org:pub/scm/linux/kernel/git/pavel/linux-leds.git for-next

tree. [I guess I could try to sneak them into 5.5 if that helps.]

Could we somehow get this to the backlight tree?

commit d457d0c97d6d55fe3e62633791ac05d289a37d2e
Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date:   Thu Oct 3 10:28:12 2019 +0200

    backlight: add led-backlight driver

    This patch adds a led-backlight driver (led_bl), which is similar
    to pwm_bl except the driver uses a LED class driver to adjust the
    brightness in the HW. Multiple LEDs can be used for a single
    backlight.

 Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
 Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
 Acked-by: Pavel Machek <pavel@ucw.cz>
 Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4Sd4cACgkQMOfwapXb+vKtigCcD7s9rcf8yUC1oR22yqA5RyON
RW4AmgOniJ4uj2z21/PEdlR5LnqhdCB/
=7Rz5
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
