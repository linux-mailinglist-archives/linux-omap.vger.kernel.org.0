Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54E422DD34
	for <lists+linux-omap@lfdr.de>; Sun, 26 Jul 2020 10:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgGZIZX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 26 Jul 2020 04:25:23 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37932 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGZIZX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 26 Jul 2020 04:25:23 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9C0B61C0BD9; Sun, 26 Jul 2020 10:25:20 +0200 (CEST)
Date:   Sun, 26 Jul 2020 10:25:20 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Johan Hovold <johan@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv8 0/6] n_gsm serdev support and GNSS driver for droid4
Message-ID: <20200726082520.GA16953@amd>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200528083918.GB10358@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <20200528083918.GB10358@localhost>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Here's the updated set of these patches fixed up for Johan's and
> > Pavel's earlier comments.
> >=20
> > This series does the following:
> >=20
> > 1. Adds functions to n_gsm.c for serdev-ngsm.c driver to use
> >=20
> > 2. Adds a generic serdev-ngsm.c driver that brings up the TS 27.010
> >    TTY ports configured in devicetree with help of n_gsm.c
> >=20
> > 3. Allows the use of standard Linux device drivers for dedicated
> >    TS 27.010 channels for devices like GNSS and ALSA found on some
> >    modems for example
>=20
> Unfortunately that does not seem to be the case just yet. Your gnss
> driver is still aware that it's using n_gsm for the transport and calls
> into the "parent" serdev-ngsm driver instead of using the serdev
> interface (e.g. as if this was still and MFD driver).
>=20
> If you model this right, the GNSS driver should work equally well
> regardless of whether you use the serial interface (with n_gsm) or USB
> (e.g. cdc-acm or usb-serial).

We are not going to see that protocol anywhere else, so why is that
a good goal?

Anyway, Tony, is there newer version of this patchset? It would be
good to get something in...

Can I help somehow?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8dPe8ACgkQMOfwapXb+vJfFQCfa75UABs8B8Futdqki8nIW6pf
Aj8Anj1t2iSHSeGyQcNSPGbm3jcIOJch
=vk0S
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
