Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36364D55CF
	for <lists+linux-omap@lfdr.de>; Sun, 13 Oct 2019 13:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbfJMLcW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Oct 2019 07:32:22 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:41162 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728620AbfJMLcW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Oct 2019 07:32:22 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 277B480249; Sun, 13 Oct 2019 13:32:05 +0200 (CEST)
Date:   Sun, 13 Oct 2019 13:32:17 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 3/7] usb: musb: omap2430: Handle multiple ID ground
 interrupts
Message-ID: <20191013113217.GD26237@amd>
References: <20191009212145.28495-1-tony@atomide.com>
 <20191009212145.28495-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3Pql8miugIZX0722"
Content-Disposition: inline
In-Reply-To: <20191009212145.28495-4-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--3Pql8miugIZX0722
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-10-09 14:21:40, Tony Lindgren wrote:
> We currently get "unhandled DISCONNECT transition" warnings from musb core
> on device disconnect as things are wrongly set to OTG_STATE_A_IDLE in
> host mode when enumerating devices. We can also get "Failed to write reg
> index" errors after enumerating.
>=20
> This is happening at least with cpcap phy where we get multiple ID ground
> interrupts. Looks like it's VBUS keeps timing out and needs to be kicked
> when the phy sends multiple ID ground interrupts during host mode.

1-3: Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--3Pql8miugIZX0722
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jC0EACgkQMOfwapXb+vIYxgCggHd9hcHp1/J145KZvapkU3vt
HGQAn3p3dVpWzGSlvo/AOaIStGe6OTK0
=Rmd9
-----END PGP SIGNATURE-----

--3Pql8miugIZX0722--
