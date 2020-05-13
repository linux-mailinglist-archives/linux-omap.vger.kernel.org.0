Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238F61D1E9A
	for <lists+linux-omap@lfdr.de>; Wed, 13 May 2020 21:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390450AbgEMTJp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 May 2020 15:09:45 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35188 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732218AbgEMTJp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 May 2020 15:09:45 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B26AA1C025E; Wed, 13 May 2020 21:09:42 +0200 (CEST)
Date:   Wed, 13 May 2020 21:09:42 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv8 0/6] n_gsm serdev support and GNSS driver for droid4
Message-ID: <20200513190942.GA2626@duo.ucw.cz>
References: <20200512214713.40501-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <20200512214713.40501-1-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Here's the updated set of these patches fixed up for Johan's and
> Pavel's earlier comments.
>=20
> This series does the following:
>=20
> 1. Adds functions to n_gsm.c for serdev-ngsm.c driver to use
>=20
> 2. Adds a generic serdev-ngsm.c driver that brings up the TS 27.010
>    TTY ports configured in devicetree with help of n_gsm.c
>=20
> 3. Allows the use of standard Linux device drivers for dedicated
>    TS 27.010 channels for devices like GNSS and ALSA found on some
>    modems for example

> 4. Adds a gnss-motmdm consumer driver for the GNSS device found on
>    the Motorola Mapphone MDM6600 modem on devices like droid4

It does one thing ... it turns Droid 4 into useful phone!=20

Thanks a lot. I believe these are same patches as in
droid4-pending-v5.7 branch, so whole series is

Tested-by: Pavel Machek <pavel@ucw.cz>

Getting this into 5.8 would be nice :-).

> Now without the chardev support, the /dev/gsmtty* using apps need
> to use "U1234AT+CFUN?" format for the packets. The advantage is
> less kernel code, and we keep the existing /dev/gsmtty* interface.
>=20
> If we still really need the custom chardev support, that can now
> be added as needed with the channel specific consumer driver(s),
> but looks like this won't be needed based on Pavel's ofono work.

These work for me, and I have patched ofono with basic
functionality. It is no longer possible to use minicom for debugging,
but printf can be used instead, so that's not much of a problem.

I have adjusted ofono code, and moved away from normal AT support
code. More API changes would not be welcome :-).

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXrxF9gAKCRAw5/Bqldv6
8s9sAKCe1lhrghH/ZZcPP1qyI00/pEbM/ACfeI3/EpzutMhcO7n1Hu9cHZhSmis=
=tgVq
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
