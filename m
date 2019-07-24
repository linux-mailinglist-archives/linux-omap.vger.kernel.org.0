Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11DE6729D9
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jul 2019 10:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbfGXIW5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Jul 2019 04:22:57 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47530 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfGXIW4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 Jul 2019 04:22:56 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id A18978029F; Wed, 24 Jul 2019 10:22:42 +0200 (CEST)
Date:   Wed, 24 Jul 2019 10:22:53 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: Backlight in motorola Droid 4
Message-ID: <20190724082253.GA23552@amd>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20190722205921.GA24787@amd>
 <b8fbc94f-c087-2c9d-4532-ea423f1626e6@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <b8fbc94f-c087-2c9d-4532-ea423f1626e6@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-07-23 10:53:16, Dan Murphy wrote:
> Pavel
>=20
> On 7/22/19 3:59 PM, Pavel Machek wrote:
> >Hi!
> >
> >So now the backlight LED can be controlled. Good. (And thanks!)
> >
> >But I seem to remember that backlight had range from "is it really on?"
> >to "very bright"; now it seems to have range from "bright" to "very
> >bright".
> >
> >Any ideas what goes on there?
>=20
> In the LM3552 driver we are changing the Full scale brightness registers =
for
> the
>=20
> specific control bank.
>=20
> #define LM3532_REG_CTRL_A_BRT=A0=A0=A0 0x17
> #define LM3532_REG_CTRL_B_BRT=A0=A0=A0 0x19
> #define LM3532_REG_CTRL_C_BRT=A0=A0=A0 0x1b

Yep, and those registers are 5-bit linear...

> In the ti-lmu code the ALS zones were being modified not the control bank
> brightness.
>=20
> #define LM3532_REG_BRT_A=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 0x70=A0=A0=A0 /* zo=
ne 0 */
> #define LM3532_REG_BRT_B=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 0x76=A0=A0=A0 /* zo=
ne 1 */
> #define LM3532_REG_BRT_C=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 0x7C=A0=A0=A0 /* zo=
ne 2 */

=2E..while these allow 14-bits of control.

That explains very limited range of backlight control.

Do you have any plans to change that?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl04FV0ACgkQMOfwapXb+vI3tgCguRG0MY2FC+hQMV0vAg4QyYGf
mJ8Anix5g0Mp6MVJSUSJhX7Bk6dJOX2a
=0ZJs
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
