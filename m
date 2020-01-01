Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35AA212E0A4
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jan 2020 23:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbgAAWCz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jan 2020 17:02:55 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:51552 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbgAAWCz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jan 2020 17:02:55 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5172B1C25F4; Wed,  1 Jan 2020 23:02:53 +0100 (CET)
Date:   Wed, 1 Jan 2020 23:02:37 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: Droid 4 on 5.5-rc3
Message-ID: <20200101220237.GA13059@amd>
References: <20191228162929.GA29269@duo.ucw.cz>
 <20191228193622.GA13047@duo.ucw.cz>
 <20191230173507.GM35479@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <20191230173507.GM35479@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-12-30 09:35:07, Tony Lindgren wrote:
> * Pavel Machek <pavel@ucw.cz> [191228 19:37]:
> > Hi!
> >=20
> > > 5.4-based kernel works ok on my droid 4.
> > >=20
> > > 5.5-rc3 based kernel has problems; it reboots when I try to kexec it.
> > >=20
> > > Vanilla 5.5-rc3 reboots, too.
> > >=20
> > > If you have any ideas, let me know.
> >=20
> > I managed to get partial serial dump. This should be 5.5-rc3: And then
> > a bit better serial dump (below). But it is silent for few seconds,
> > and then it restarts...
>=20
> If spi or regulators have problems, nothing will really work..

Hmmm. I'm too lazy to think. 5.4 is okay, 5.5-rc3 is broken... Let me
try 5.5-rc1 and then bisect. Unfortunately getting serial output is
tricky, too, since I need the USB for kexec...

If you know that there's known bug somewhere in 5.5-rc1, tell
me. Bisect can only locate one bug....

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4NFv0ACgkQMOfwapXb+vIF3wCcDMrs0bs+1JWU3nnm2hPedrZ9
I+0AoK0newXf9VEBn/TY7kJrz1pSg+qu
=8xnV
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
