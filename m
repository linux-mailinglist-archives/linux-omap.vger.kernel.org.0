Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D45FE1567F0
	for <lists+linux-omap@lfdr.de>; Sat,  8 Feb 2020 23:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgBHWGY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 8 Feb 2020 17:06:24 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:35322 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbgBHWGY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 8 Feb 2020 17:06:24 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 576F01C228F; Sat,  8 Feb 2020 23:06:22 +0100 (CET)
Date:   Sat, 8 Feb 2020 23:06:21 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        "Arthur D." <spinal.by@gmail.com>
Subject: Re: N900: Remove mmc1 "safety feature"? (was: Re: mmc0 on Nokia N900
 on Linux 5.4.18)
Message-ID: <20200208220621.GA18161@amd>
References: <5362c659-120f-5247-aaa5-7916229300bc@wizzup.org>
 <20200208190448.GA12984@amd>
 <270f27c9-afd6-171d-7dce-fe1d71dd8f9a@wizzup.org>
 <1eac0db3-17ce-8ebd-4997-8b1c282126e4@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <1eac0db3-17ce-8ebd-4997-8b1c282126e4@wizzup.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> When booting Linux 5.4.18 with omap2plus_defconfig, I no longer get a
> >>> /dev/mmcblk0 device - the one corresponding to my microSD card, where
> >>> u-boot also loads the kernel from.
> >>>
> >>> This also likely seems to be a regression, but I haven't tried to hunt
> >>> it down yet.
> >>>
> >>> Kernel log attached, below.
> >>
> >> Do you have back cover attached? That's common trap...
> >=20
> > Right.
> >=20
> > No, I did not, since I have the serial pins connected to my PC, and the
> > whole device is mounted on a piece of hardware for that. I thought that
> > we fixed the problem where we require the cover to be on...
>=20
> Indeed, this was the problem.
>=20
> Is there really a reason to have this in the DTS? I have a hard time
> imagining a use case for not showing SD card to users or developers
> simply because the casing is open. If anything, this sounds like it
> should be a userspace thing.

It is very bad for debugging, agreed.

It makes sense for regular usage: when user removes back cover, system
unmounts the u-SD card, so that it is ready for user to remove
it. Note that we do _not_ have "remove the card safely" button in the
UI; back cover serves that purpose.

That said... for Leste just keep the patch. And maybe apply that one
to shutdown system when battery is low :-).

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4/MN0ACgkQMOfwapXb+vLG9gCcCgw98bdpSGt6Lt+wOpVdgsix
T0gAniy8DQwWuV1Xa7LWSr+hgwuy5Tvh
=92ey
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
