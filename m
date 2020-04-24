Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1921B81C0
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 23:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgDXVun (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 17:50:43 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41534 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgDXVun (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Apr 2020 17:50:43 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 502391C0237; Fri, 24 Apr 2020 23:50:41 +0200 (CEST)
Date:   Fri, 24 Apr 2020 23:50:40 +0200
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
Subject: Re: [PATCHv6 0/4] n_gsm serdev support and protocol driver for
 droid4 modem
Message-ID: <20200424215040.GA14087@amd>
References: <20200421232752.3070-1-tony@atomide.com>
 <20200423114326.GQ18608@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <20200423114326.GQ18608@localhost>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Here's v4 set of n_gsm serdev support patches, and the related protocol
> > driver for the modem found on Motorola Mapphone phones and tablets
> > like droid4.
> >=20
> > This series only adds basic character device support for the serdev
> > driver. Other serdev consumer drivers for specific devices will be
> > posted separately.
>=20
> I'm still missing an architectural (design) overview here -- reviewer
> time is a scarce resource.
>=20
> I also suggested earlier that you include, at least as an RFC, one or
> more of your child-device drivers so that we can see how this ends up
> being used in the end (including an example devicetree).

Note that this is useful on its own: we have ofonod running on the top
of this doing calls and SMSes.

Tony: I know you have drivers depending on this somewhere (audio
routing and GPS), but I can't find them. It is not droid4-pending-v5.6
AFAICT. Do you have a pointer / could you publish them somewhere?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6jXzAACgkQMOfwapXb+vL1MgCgkfDgPdNCuH+IVEioBezNZBZW
CdIAnR1+l1rBSV1qT6U8BWmkXXdKbSoT
=NUS7
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
