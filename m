Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4370812E54A
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 12:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgABLA3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 06:00:29 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:50038 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728044AbgABLA3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 06:00:29 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 68A1D1C25CE; Thu,  2 Jan 2020 12:00:26 +0100 (CET)
Date:   Thu, 2 Jan 2020 12:00:25 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>, olof@lixom.net, arnd@arndb.de
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Droid 4 regression in 5.5-rc1, armsoc-soc tree
Message-ID: <20200102110025.GA29035@amd>
References: <20191228162929.GA29269@duo.ucw.cz>
 <20191228193622.GA13047@duo.ucw.cz>
 <20191230173507.GM35479@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <20191230173507.GM35479@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--ew6BAiZeqk4r7MaW
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

arm-soc merge seems to be responsible:

bad 38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6 Merge tag 'armsoc-soc' of
good d9e48dc2a71a836f17d1febbedb31470f957edb4 Merge tag

									Pavel

# bad: [738d2902773e30939a982c8df7a7f94293659810] Merge git://git.kernel.or=
g/pub/scm/linux/kernel/git/netdev/net
# good: [219d54332a09e8d8741c1e1982f5eae56099de85] Linux 5.4
git bisect start '738d2902773e' '219d54332a09'
# bad: [46cf053efec6a3a5f343fead837777efe8252a46] Linux 5.5-rc3
git bisect bad 46cf053efec6a3a5f343fead837777efe8252a46
# bad: [e42617b825f8073569da76dc4510bfa019b1c35a] Linux 5.5-rc1
git bisect bad e42617b825f8073569da76dc4510bfa019b1c35a
# good: [9a3d7fd275be4559277667228902824165153c80] Merge tag 'driver-core-5=
=2E5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-co=
re
git bisect good 9a3d7fd275be4559277667228902824165153c80
# good: [0b4295b5e2b9b42f3f3096496fe4775b656c9ba6] io_uring: fix a typo in =
a comment
git bisect good 0b4295b5e2b9b42f3f3096496fe4775b656c9ba6
# good: [056df578c2dcac1e624254567f5df5ddaa223234] Merge tag 'arc-5.5-rc1' =
of git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc
git bisect good 056df578c2dcac1e624254567f5df5ddaa223234
# bad: [25cfb0c7de3f14e283a43dcd6de903657f9f98c7] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu
git bisect bad 25cfb0c7de3f14e283a43dcd6de903657f9f98c7
# bad: [38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6] Merge tag 'armsoc-soc' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad 38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6
# good: [d9e48dc2a71a836f17d1febbedb31470f957edb4] Merge tag 'pwm/for-5.5-r=
c1' of git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-p=
wm
git bisect good d9e48dc2a71a836f17d1febbedb31470f957edb4




--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4NzUkACgkQMOfwapXb+vL/lwCeMuMUzLWhBOPsJT5QSoBhPbAp
qYMAoKLdeCAROa7G9Cn8n2x1ZOigQ5cE
=rq58
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
