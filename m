Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B0C22D9F2
	for <lists+linux-omap@lfdr.de>; Sat, 25 Jul 2020 23:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgGYVDT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 25 Jul 2020 17:03:19 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:43018 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbgGYVDT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 25 Jul 2020 17:03:19 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7FFEC1C0BD9; Sat, 25 Jul 2020 23:03:15 +0200 (CEST)
Date:   Sat, 25 Jul 2020 23:03:15 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     maemo-leste@lists.dyne.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        martin_rysavy@centrum.cz
Subject: modem:audio-codec has problems
Message-ID: <20200725210314.GA6701@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

While debugging something else I noticed this:

[  335.627838] mot-mdm6600-codec 4806a000.serial:modem:audio-codec@2:
command U3559AT+DTSE=3D,1 error +DTSE:ERROR
[  335.772064] mot-mdm6600-codec 4806a000.serial:modem:audio-codec@2:
motmdm_voice_get_state: ciev=3D1,7,0

user@devuan-droid4:/my/ofono/test$ uname -a
Linux devuan-droid4 5.7.0 #1 SMP PREEMPT Mon Jun 29 14:51:54 UTC 2020
armv7l GNU/Linux

It looks wrong, not sure if it causes any problems.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8cnhIACgkQMOfwapXb+vJlYgCgjG8pHo0IlZGhvMjtGHyooWDn
jHsAoL94yT1xbGN6WKx0X0atihZt95Ga
=z5fs
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
