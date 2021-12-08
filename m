Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 042C046DD5A
	for <lists+linux-omap@lfdr.de>; Wed,  8 Dec 2021 21:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236825AbhLHVAg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Dec 2021 16:00:36 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33930 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235864AbhLHVAf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Dec 2021 16:00:35 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 001C01C0BA2; Wed,  8 Dec 2021 21:57:01 +0100 (CET)
Date:   Wed, 8 Dec 2021 21:57:00 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     "Merlijn B.W. Wajer" <merlijn@archive.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: Oops while booting 5.15.2 on Nokia N900
Message-ID: <20211208205700.GA12125@duo.ucw.cz>
References: <12e13327-3bb5-229e-d784-cd528db4b58e@archive.org>
 <6fa3d07a-28e5-7853-e6ca-fc405d3080e4@archive.org>
 <c75ac850-7d9b-6263-a046-57c8f4435090@archive.org>
 <f463d8f2-109e-3040-4350-ce20d651ffe6@archive.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <f463d8f2-109e-3040-4350-ce20d651ffe6@archive.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

You may want to cc: linux-kernel@vger.kernel.org and
phone-devel@vger.kernel.org, since this is kernel issue.

> > I am back with a bit more news, but no solution.
>=20
> It looks like commit fb2c599f056640d289b2147fbe6d9eaee689f1b2 ("ARM:
> omap3: enable off mode automatically") is causing these failures on the
> Nokia N900. Reverting this commit on top of v5.10 (with
> 21b2cec61c04bd175f0860d9411a472d5a0e7ba1 also reverted), makes the
> problem go away (I tried 10 times).
>=20
> The same holds for 5.15.y, just reverting
> fb2c599f056640d289b2147fbe6d9eaee689f1b2 makes the system "stable" (at
> least the problem reported in the first email is gone).
>=20
> Perhaps the "pwrst->next_state" change is causing these problems, since
> I can enter OFF mode just fine with init=3D/bin/sh and a custom
> script?

fb2c599f056640d28 has some hints in it. Perhaps Andreas can mention
what boards he tested it on?

And rather than reverting it, we may want to delete ti,twl4030-idle*
hints from n900 device tree for now?

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYbEcHAAKCRAw5/Bqldv6
8tE5AKDD3LRnQWjH7RmALQTukL6zLA69mACgqA4wpNBhlw5L8vsM+NrM7PR1508=
=Ca1E
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
