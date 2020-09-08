Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B70262345
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 00:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgIHW4O (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Sep 2020 18:56:14 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34084 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgIHW4N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Sep 2020 18:56:13 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B0DBA1C0B7A; Wed,  9 Sep 2020 00:56:10 +0200 (CEST)
Date:   Wed, 9 Sep 2020 00:56:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        martin_rysavy@centrum.cz, "David S. Miller" <davem@davemloft.net>,
        guido.gunther@puri.sm, konradybcio@gmail.com, arnd@arndb.de,
        martin.botka1@gmail.com
Subject: Mailing list about low levels of Linux on cellphones
Message-ID: <20200908225610.GA25399@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

It seems there is quite a lot of efforts porting kernel to various
cellphones.

Librem 5 and PinePhone have their own hardware, people around Maemo
Leste work with Nokia N900 and Droid 4, there's group working with
Sony cellphones, there are postmarketOS people and there are probably
groups I don't know about.

I believe some coordination would be useful, so we end up with
compatible solutions for various problems.

It would be also good to know how ther hardware is progressing. I'd
really like to have phone I could use as a _phone_, running mainline
kernel. So far N900 with original Maemo is closest I could get.=20

Would it be possible to create a mailing list on vger.kernel.org?
Probably phones@ or phone-devel@? I believe it would be useful to
cover hardware-dependend pieces of the phone stack (ofono,
modemmanager) as well as kernel.

Best regards,

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html


--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX1gMCgAKCRAw5/Bqldv6
8hCjAJ0UUeO25TWORFOuDeLu9eryN7BzAACfeQaxgX1aqhy1aTcgrIOawZWdz6w=
=63wl
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
