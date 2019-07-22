Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2F6070AEE
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jul 2019 22:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbfGVU7Y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jul 2019 16:59:24 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55923 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730165AbfGVU7Y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 Jul 2019 16:59:24 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 5B8BD80410; Mon, 22 Jul 2019 22:59:10 +0200 (CEST)
Date:   Mon, 22 Jul 2019 22:59:21 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>, linux-omap@vger.kernel.org,
        tony@atomide.com, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org
Cc:     jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Backlight in motorola Droid 4
Message-ID: <20190722205921.GA24787@amd>
References: <20181219162626.12297-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <20181219162626.12297-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

So now the backlight LED can be controlled. Good. (And thanks!)

But I seem to remember that backlight had range from "is it really on?"
to "very bright"; now it seems to have range from "bright" to "very
bright".

Any ideas what goes on there?

Thanks,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl02I6kACgkQMOfwapXb+vLwVgCeIkjY3t3Rjjh7Ijc0GLlOw/GL
WXIAoJpuXgO9ZH8gZJDe3B7+RHjs8eCb
=VpDx
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
