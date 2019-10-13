Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D17BBD5680
	for <lists+linux-omap@lfdr.de>; Sun, 13 Oct 2019 16:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729264AbfJMOeZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Oct 2019 10:34:25 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:44812 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729249AbfJMOeZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Oct 2019 10:34:25 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 4749280239; Sun, 13 Oct 2019 16:34:08 +0200 (CEST)
Date:   Sun, 13 Oct 2019 16:34:02 +0200
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
Subject: Re: [PATCH 7/7] usb: musb: Get rid of omap2430_musb_set_vbus()
Message-ID: <20191013143402.GB13278@amd>
References: <20191009212145.28495-1-tony@atomide.com>
 <20191009212145.28495-8-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline
In-Reply-To: <20191009212145.28495-8-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-10-09 14:21:44, Tony Lindgren wrote:
> Now that we've removed direct calls from interrupt handler to
> omap2430_musb_set_vbus(), let's make things less confusing and
> configure VBUS directly in omap_musb_set_mailbox().
>=20
> We have omap_musb_set_mailbox() called from the PHYs, and that's
> all we need.
>=20
> Note that we can now also drop the check for MUSB_INTERFACE_UTMI,
> we've been already calling otg_set_vbus(musb->xceiv->otg, 0)
> unconditionally via omap2430_musb_set_vbus() and we should only
> need to call it once.
>=20
> And we want to disable VBUS unconditionally on disconnect even
> without musb->gadget_driver, so let's drop that check too.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>

4-7: Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jNdoACgkQMOfwapXb+vLjKgCfRKROp8H/HwWN7lmjsmtxSM3e
+Q0An3AkCZWYfwE9C63orIWsFs2j9Mtl
=DjNd
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--
