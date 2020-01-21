Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC49C143946
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2020 10:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgAUJRU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jan 2020 04:17:20 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42548 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727360AbgAUJRU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jan 2020 04:17:20 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 68ED51C036D; Tue, 21 Jan 2020 10:17:18 +0100 (CET)
Date:   Tue, 21 Jan 2020 10:17:17 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: [PATCH] ARM: dts: omap4-droid4: Enable hdq for droid4 ds250x
 1-wire battery nvmem
Message-ID: <20200121091717.GB6934@amd>
References: <20200119195659.18273-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline
In-Reply-To: <20200119195659.18273-1-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-01-19 11:56:59, Tony Lindgren wrote:
> With "[PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend"
> we can read the droid4 battery information over 1-wire with this patch
> with something like:
>=20
> # modprobe omap_hdq
> # hd /sys/bus/w1/devices/89-*/89-*/nvmem
> ...
>=20
> Unfortunately the format of the battery data seems to be Motorola specific
> and is currently unusable for battery charger unless somebody figures out
> what it means.
>=20
> Note that currently keeping omap_hdq module loaded will cause extra power
> consumption as it seems to scan devices periodically.
>=20
> Cc: Merlijn Wajer <merlijn@wizzup.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

Not for stable.
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4mwZ0ACgkQMOfwapXb+vJ8egCfc2gRU+lYJZzSLf95Se8s4H5n
clkAoKfl7tnelxQQqiCtAsEFfmIAgowj
=d6KS
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
