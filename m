Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51DEC6D5A4
	for <lists+linux-omap@lfdr.de>; Thu, 18 Jul 2019 22:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfGRURQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Jul 2019 16:17:16 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:42108 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbfGRURQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 18 Jul 2019 16:17:16 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 2B2CC802B6; Thu, 18 Jul 2019 22:17:03 +0200 (CEST)
Date:   Thu, 18 Jul 2019 22:17:13 +0200
From:   Pavel Machek <pavel@denx.de>
To:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: USB Modem support for Droid 4
Message-ID: <20190718201713.GA25103@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Tony Lindgren <tony@atomide.com>

Droid starts to have useful support in linux-next. Modem is tricky to
play with, but this is enough to get basic support.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
index 613f91a..3ca9439 100644
--- a/drivers/usb/serial/qcserial.c
+++ b/drivers/usb/serial/qcserial.c
@@ -181,6 +181,9 @@ static const struct usb_device_id id_table[] =3D {
 	/* Huawei devices */
 	{DEVICE_HWI(0x03f0, 0x581d)},	/* HP lt4112 LTE/HSPA+ Gobi 4G Modem (Huawe=
i me906e) */
=20
+	/* Motorola devices */
+	{DEVICE_HWI(0x22b8, 0x2a70)},	/* Droid 4 mdm6600 */
+
 	{ }				/* Terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, id_table);

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0w08kACgkQMOfwapXb+vJpwQCfTiUS2K4a1CVoJwFu6/B1FtTc
z+kAnRGFucsG+uLBUmYmxdZiQpeyBTXZ
=SQkN
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
