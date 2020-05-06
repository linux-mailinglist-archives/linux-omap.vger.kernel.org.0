Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEDC1C6E1C
	for <lists+linux-omap@lfdr.de>; Wed,  6 May 2020 12:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgEFKL2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 May 2020 06:11:28 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56450 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728624AbgEFKL2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 May 2020 06:11:28 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 60C431C023B; Wed,  6 May 2020 12:11:26 +0200 (CEST)
Date:   Wed, 6 May 2020 12:11:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        martin_rysavy@centrum.cz
Subject: USB networking news, ofono for d4: less hacked version
Message-ID: <20200506101125.GA7490@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

So... I found out that USB networking works way better when I don't
attempt to charge the phone at the same. Yes, green light was
blinking.

I pushed

To github.com:pavelmachek/ofono.git
   e7b58fdd..1e7e5ce3  mux-v1.19-2 -> mux-v1.19-2

which creates copy of atchat, so I don't damage existing
functionality. It still seems to somehow work. Lot more work is still
needed. Designed to work with latest kernel patches from Tony, using
gsmmux interfaces.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6yjU0ACgkQMOfwapXb+vKKJACgoJOAkfp2//om4MLhnQxOnxGh
4VYAoLCWdAfT0e+k6l6ai9H/MStEB6C+
=Dwe6
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
