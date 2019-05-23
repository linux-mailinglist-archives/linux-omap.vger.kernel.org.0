Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F52928CCD
	for <lists+linux-omap@lfdr.de>; Fri, 24 May 2019 00:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387709AbfEWWAu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 May 2019 18:00:50 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:46305 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387616AbfEWWAu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 May 2019 18:00:50 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 0D393803EF; Fri, 24 May 2019 00:00:37 +0200 (CEST)
Date:   Fri, 24 May 2019 00:00:47 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org
Subject: Droid 4 backlight support
Message-ID: <20190523220047.GA15523@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Good news .. we have driver for backlight in mainline, AFAICT.

Bad news .. it is called "lm3532::backlight" or something like that. I
guess we should switch to ":backlight" or something? It is quite
important to do that before someone starts to use the ABI...

And now... we have the driver, but it is not connected to the
backlight subsystem. I guess we could make the LED "default on" for
now... but if there's better plan, let me know.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlznGA8ACgkQMOfwapXb+vKvEACgqh7D8W9xEk0CYM0E6JZ/nYzP
NSwAn33OnShByv5jZg7ue2kh7hB/D4jj
=5e5V
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
