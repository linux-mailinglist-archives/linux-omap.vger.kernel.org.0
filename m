Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7FA1B21B2
	for <lists+linux-omap@lfdr.de>; Tue, 21 Apr 2020 10:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgDUIbp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 04:31:45 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42748 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727941AbgDUIbp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Apr 2020 04:31:45 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 753151C01F7; Tue, 21 Apr 2020 10:31:43 +0200 (CEST)
Date:   Tue, 21 Apr 2020 10:31:43 +0200
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
Subject: Re: [PATCH 4/4] ARM: dts: omap4-droid4: Enable basic modem support
Message-ID: <20200421083143.GA5090@amd>
References: <20200319173755.65082-1-tony@atomide.com>
 <20200319173755.65082-5-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <20200319173755.65082-5-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-03-19 10:37:55, Tony Lindgren wrote:
> This allows apps to use /dev/motmdm1 for voice call AT commands,
> /dev/motmdm3 for sending SMS, and /dev/motmdm9 for reading SMS.
>=20
> Voice call audio mixer and GNSS are not yet supported.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>

3,4: Reviewed-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6er28ACgkQMOfwapXb+vIhYwCfR/qauvJ4cHXyyTY2QXjrwiKZ
KhIAoMOmd28ZuUq07dmA8cIioWphJRJQ
=gu46
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
