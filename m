Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACA7D5687
	for <lists+linux-omap@lfdr.de>; Sun, 13 Oct 2019 16:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbfJMOqS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Oct 2019 10:46:18 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45048 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbfJMOqR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Oct 2019 10:46:17 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id B379F8025D; Sun, 13 Oct 2019 16:46:00 +0200 (CEST)
Date:   Sun, 13 Oct 2019 16:46:09 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 5/8] ARM: OMAP2+: Configure voltage controller for cpcap
Message-ID: <20191013144608.GC13278@amd>
References: <20191010001224.41826-1-tony@atomide.com>
 <20191010001224.41826-6-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hYooF8G/hrfVAmum"
Content-Disposition: inline
In-Reply-To: <20191010001224.41826-6-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--hYooF8G/hrfVAmum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-10-09 17:12:21, Tony Lindgren wrote:
> We can configure voltage controller for cpcap with the data available in
> Motorola Mapphone Android Linux kernel. Let's add it so we can have droid4
> behave the same way for voltage controller as other omap4 devices and save
> some power when idle.
>=20
> Note that we're now using high-speed i2c mode, looks like the Motorola
> kernel had a typo using 0x200 instead of 200 for the timings which may
> caused it to not work properly.
>=20
> Also note that in the long run, this should just become dts data for a
> voltage controller device driver. But let's get things working first to
> make it possible to test further changes easily.

3-5: Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--hYooF8G/hrfVAmum
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jOLAACgkQMOfwapXb+vIEJACfaOC+s2HMvLdS2v3uYO1Oi2zx
p+AAnih27tb4tyL0MuWGn7s8d7B2QZpb
=iIfp
-----END PGP SIGNATURE-----

--hYooF8G/hrfVAmum--
