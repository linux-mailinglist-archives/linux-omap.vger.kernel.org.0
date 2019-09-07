Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCE1AC5FC
	for <lists+linux-omap@lfdr.de>; Sat,  7 Sep 2019 12:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbfIGKH3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 7 Sep 2019 06:07:29 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:41089 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfIGKH3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 7 Sep 2019 06:07:29 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 79FEC82160; Sat,  7 Sep 2019 12:07:13 +0200 (CEST)
Date:   Sat, 7 Sep 2019 12:07:27 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        tomi.valkeinen@ti.com, jjhiblot@ti.com
Subject: Status of led-backlight driver
Message-ID: <20190907100726.GA12763@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I don't see the LED-backlight driver in -next. Could it be pushed? It
is one of last pieces to get working backlight on Motorola Droid 4...

Best regards,
							Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1zgV4ACgkQMOfwapXb+vKvAQCfZYlHrQsPO5HWj3BzHKRNJKHX
4yMAoIaIUZUm92445NiHY4mIIMwEo5+3
=PlCk
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
