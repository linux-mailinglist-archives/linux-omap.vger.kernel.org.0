Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A42D7D567F
	for <lists+linux-omap@lfdr.de>; Sun, 13 Oct 2019 16:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729255AbfJMOdh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Oct 2019 10:33:37 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:44788 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729249AbfJMOdh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Oct 2019 10:33:37 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id A50A58025D; Sun, 13 Oct 2019 16:33:19 +0200 (CEST)
Date:   Sun, 13 Oct 2019 16:33:16 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] ARM: dts: Add minimal support for Droid Bionic xt875
Message-ID: <20191013143316.GA13278@amd>
References: <20191009222549.53265-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
In-Reply-To: <20191009222549.53265-1-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-10-09 15:25:49, Tony Lindgren wrote:
> We already have folks booting Droid Bionic with Droid 4 dts, but it is
> a different hardware with no keyboard.
>=20
> Let's start adding device specific support for Droid bionic by making
> current omap4-droid4-xt894 a common file and including it.
>=20
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jNawACgkQMOfwapXb+vIRrQCdGA5NKkVL/FYF/Z4f9q4dgTDD
gdcAoKGcBIZRxWFum3VZELKhE1V7n/r0
=5BgC
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
