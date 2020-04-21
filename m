Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B77B1B256F
	for <lists+linux-omap@lfdr.de>; Tue, 21 Apr 2020 13:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgDUL7X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 07:59:23 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34176 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbgDUL7X (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Apr 2020 07:59:23 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8B3BB1C013D; Tue, 21 Apr 2020 13:59:21 +0200 (CEST)
Date:   Tue, 21 Apr 2020 13:59:20 +0200
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
Subject: Re: [PATCHv5 0/4] n_gsm serdev support and protocol driver for
 droid4 modem
Message-ID: <20200421115920.GA16890@amd>
References: <20200319173755.65082-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <20200319173755.65082-1-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Here's v4 set of n_gsm serdev support patches, and the related protocol
> driver for the modem found on Motorola Mapphone phones and tablets
> like droid4.
>=20
> This series only adds basic character device support for the serdev
> driver. Other serdev consumer drivers for specific devices will be
> posted separately.
>=20
> The patches are against v5.6-rc series.

And it would be good to get them into v5.7... pretty please :-).

It seems to work for me... mostly. I checked out your ofono
branch. Calls seem okay, but two smses arrived, but now phone does not
seem to be logged into GSM network. Weird.

Anyway, likely not a kernel problem.

Tested-by: Pavel Machek <pavel@ucw.cz>


								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6e4BgACgkQMOfwapXb+vI2pQCgwXs84UOlFBJO71p6HMLGCU/8
DB0AoJemrL034OAs2wDMqp+PLkqaC/lf
=8b3u
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
