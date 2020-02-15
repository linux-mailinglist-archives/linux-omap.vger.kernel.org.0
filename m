Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3543160056
	for <lists+linux-omap@lfdr.de>; Sat, 15 Feb 2020 20:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgBOT7w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 15 Feb 2020 14:59:52 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:50846 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbgBOT7w (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 15 Feb 2020 14:59:52 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8981B1C1CBB; Sat, 15 Feb 2020 20:59:50 +0100 (CET)
Date:   Sat, 15 Feb 2020 20:59:49 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: 5.6-rc0.95: /dev/motmdm no longer there
Message-ID: <20200215195949.GB10344@amd>
References: <20200209213422.GA3009@amd>
 <20200209213717.GD64767@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline
In-Reply-To: <20200209213717.GD64767@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > 5.6-rc0.95 -- based on:
> >=20
> > commit fdfa3a6778b194974df77b384cc71eb2e503639a
> > Merge: 291abfea4746 e0a514259378
> > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > Date:   Sat Feb 8 17:24:41 2020 -0800
> >=20
> >     Merge tag 'scsi-misc' of
> >     git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
> >=20
> >=20
> > /dev/motmdm* is not there for me. Unfortunately,
> > drivers/mfd/motorola-mdm.c is not mainline, so I can't just try with
> > the mainline....
> >=20
> > Does it work for you?
> >=20
> > I have ... rather a lot of warnings in dmesg :-(. /dev/ttyUSB4 works
> > ok for me.
> >=20
> > Can I somehow help get /dev/motmdmX upstream?
>=20
> Heh yeah actually I'm cleaning up those patches right now :)
>=20
> Meanwhile, try droid4-pending-v5.5 branch or pick the related
> patches from there.

Thanks, that branch works fine for me. I guess I should try to get my
Droid into state where it can be used as a primary phone.

Best regards,

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5ITbUACgkQMOfwapXb+vIKOACgn6mIIDmlx9TU0KIt9aeaHQ3b
TLkAniPVNkucHHFfsaAAyssKqsyoP2/Y
=E/d4
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
