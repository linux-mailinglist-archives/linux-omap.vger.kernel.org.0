Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 690A2918E7
	for <lists+linux-omap@lfdr.de>; Sun, 18 Aug 2019 20:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfHRSfC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 18 Aug 2019 14:35:02 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40645 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfHRSfC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 18 Aug 2019 14:35:02 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id E52FD80EFF; Sun, 18 Aug 2019 20:34:46 +0200 (CEST)
Date:   Sun, 18 Aug 2019 20:34:59 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Tony Lindgren <tony@atomide.com>, bencoh@notk.org
Subject: Re: Charging voltage for droid4 battery
Message-ID: <20190818183459.GA29779@amd>
References: <4a845327-348f-5e4f-ec76-4c5d1f61c270@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <4a845327-348f-5e4f-ec76-4c5d1f61c270@wizzup.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Recently my Droid4 battery seems to be swelling up quite a bit. It could
> be of old age, but bencoh (CC) suggested that he changed the driver code
> in his kernel to charge until 4.2v, instead of the 4.35v that mainline
> currently seems to use. (After one of his batteries started to swell up t=
oo)
>=20
> I assume the 4.35v value was taken from Android?

You can let stock android charge the battery, then read voltage from
mainline kernel. It seems stock uses 4.35V:

https://forums.lenovo.com/t5/Moto-Z/MOTO-Z-EXTREME-BATTERY-DRAIN/m-p/4435636

=2E..but maybe we should not.

https://batteryuniversity.com/learn/article/how_to_prolong_lithium_based_ba=
tteries

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1ZmlMACgkQMOfwapXb+vIZFACeJhOSEJk19BJf7fBZ/tM8C7KX
CbEAn0SwQXMvi2aNrwtCel43BeMZpoyJ
=YRjp
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
