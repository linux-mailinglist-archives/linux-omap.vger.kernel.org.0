Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 305E615673F
	for <lists+linux-omap@lfdr.de>; Sat,  8 Feb 2020 20:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbgBHTEv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 8 Feb 2020 14:04:51 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:47694 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727442AbgBHTEv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 8 Feb 2020 14:04:51 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3F6C01C228F; Sat,  8 Feb 2020 20:04:49 +0100 (CET)
Date:   Sat, 8 Feb 2020 20:04:48 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        "Arthur D." <spinal.by@gmail.com>
Subject: Re: mmc0 on Nokia N900 on Linux 5.4.18
Message-ID: <20200208190448.GA12984@amd>
References: <5362c659-120f-5247-aaa5-7916229300bc@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <5362c659-120f-5247-aaa5-7916229300bc@wizzup.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> When booting Linux 5.4.18 with omap2plus_defconfig, I no longer get a
> /dev/mmcblk0 device - the one corresponding to my microSD card, where
> u-boot also loads the kernel from.
>=20
> This also likely seems to be a regression, but I haven't tried to hunt
> it down yet.
>=20
> Kernel log attached, below.

Do you have back cover attached? That's common trap...

Best regards,
								Pavel
							=09

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4/BlAACgkQMOfwapXb+vITUQCgoiH2D1wFnADsQ4UFgBXrK9fn
P4IAoKnRWeiMKsmhjmiNTOEs1bcQ2sLR
=k/Du
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
