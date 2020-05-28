Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C671E6185
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 14:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389884AbgE1M54 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 08:57:56 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48068 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389936AbgE1M54 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 May 2020 08:57:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C57CB1C037C; Thu, 28 May 2020 14:57:53 +0200 (CEST)
Date:   Thu, 28 May 2020 14:57:53 +0200
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
Message-ID: <20200528125753.GD22054@duo.ucw.cz>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200528083918.GB10358@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Content-Disposition: inline
In-Reply-To: <20200528083918.GB10358@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-05-28 10:39:18, Johan Hovold wrote:
> On Tue, May 12, 2020 at 02:47:07PM -0700, Tony Lindgren wrote:
> > Hi all,
> >=20
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

I believe we are pretty sure we'll not see that protocol anywhere
else.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXs+1UQAKCRAw5/Bqldv6
8o6oAJ4ynA1fL1tIB/TUTTntEtvfMxREqgCgo8ciNkb8jdFhjdPpKw0gQn7EyQE=
=ka09
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--
