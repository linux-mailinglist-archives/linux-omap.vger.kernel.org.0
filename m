Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA8BE8E891
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2019 11:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730304AbfHOJtY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Aug 2019 05:49:24 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38796 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbfHOJtY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Aug 2019 05:49:24 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 667D880C11; Thu, 15 Aug 2019 11:49:09 +0200 (CEST)
Date:   Thu, 15 Aug 2019 11:49:22 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
        Dan Williams <dan.j.williams@intel.com>,
        Lars Melin <larsm17@gmail.com>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCHv2] USB: serial: option: Add Motorola modem UARTs
Message-ID: <20190815094922.GB11427@amd>
References: <20190815082602.51765-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <20190815082602.51765-1-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-08-15 01:26:02, Tony Lindgren wrote:
> On Motorola Mapphone devices such as Droid 4 there are five USB ports
> that do not use the same layout as Gobi 1K/2K/etc devices listed in
> qcserial.c. So we should use qcaux.c or option.c as noted by
> Dan Williams <dan.j.williams@intel.com>.
>=20
> As the Motorola USB serial ports have an interrupt endpoint as shown
> with lsusb -v, we should use option.c instead of qcaux.c as pointed out
> by Johan Hovold <johan@kernel.org>.
>=20
> The ff/ff/ff interfaces seem to always be UARTs on Motorola devices.
> For the other interfaces, class 0x0a (CDC Data) should not in general
> be added as they are typically part of a multi-interface function as
> noted earlier by Bj=F8rn Mork <bjorn@mork.no>.

Acked-by: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Tested-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Tony Lingren <tony@atomide.com>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1VKqIACgkQMOfwapXb+vJ+YwCeOiINkTCJCV7hE+8e3sPOiUW8
Y5QAoIYZz3Ln70nhSt3ikoVxqRegCq93
=k4Po
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
