Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF491B18DE
	for <lists+linux-omap@lfdr.de>; Mon, 20 Apr 2020 23:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgDTVzw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Apr 2020 17:55:52 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37660 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgDTVzw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Apr 2020 17:55:52 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3791A1C01E0; Mon, 20 Apr 2020 23:55:50 +0200 (CEST)
Date:   Mon, 20 Apr 2020 23:55:49 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/4] tty: n_gsm: Add support for serdev drivers
Message-ID: <20200420215549.GA17489@amd>
References: <20200319173755.65082-1-tony@atomide.com>
 <20200319173755.65082-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <20200319173755.65082-2-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-03-19 10:37:52, Tony Lindgren wrote:
> We can make use of serdev drivers to do simple device drivers for
> TS 27.010 chanels, and we can handle vendor specific protocols on top
> of TS 27.010 with serdev drivers.
>=20
> So far this has been tested with Motorola droid4 where there is a custom
> packet numbering protocol on top of TS 27.010 for the MDM6600 modem.
>=20
> I initially though about adding the serdev support into a separate file,
> but that will take some refactoring of n_gsm.c. And I'd like to have
> things working first. Then later on we might want to consider splitting
> n_gsm.c into three pieces for core, tty and serdev parts. And then maybe
> the serdev related parts can be just moved to live under something like
> drivers/tty/serdev/protocol/ngsm.c.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6eGmUACgkQMOfwapXb+vI6UwCeOiesuDEAJqWZbPTVhRwfOzwM
0S8AniLQF8CFJCXqxN/2fqNtVdIRhypC
=yKMK
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
