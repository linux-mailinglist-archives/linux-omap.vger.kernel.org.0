Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCEAED55D8
	for <lists+linux-omap@lfdr.de>; Sun, 13 Oct 2019 13:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbfJMLkS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Oct 2019 07:40:18 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:41326 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728956AbfJMLkS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Oct 2019 07:40:18 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id E42AF80249; Sun, 13 Oct 2019 13:40:00 +0200 (CEST)
Date:   Sun, 13 Oct 2019 13:38:17 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 1/8] ARM: OMAP2+: Remove unused wakeup_cpu
Message-ID: <20191013113817.GE26237@amd>
References: <20191010001224.41826-1-tony@atomide.com>
 <20191010001224.41826-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="maH1Gajj2nflutpK"
Content-Disposition: inline
In-Reply-To: <20191010001224.41826-2-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--maH1Gajj2nflutpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-10-09 17:12:17, Tony Lindgren wrote:
> After commit 32d174ed1bd7 ("ARM: OMAP4: MPUSS PM: remove unnecessary
> shim functions for powerdomain control") this is no longer used.
>=20
> The code continues execution after context restore on the same CPU,
> so we can just use pm_info->pwrdm.
>=20
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--maH1Gajj2nflutpK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jDKkACgkQMOfwapXb+vKtLACfVZ9KXYe7o/TIDG5OEIN9EC3R
NzQAn1+QROYC4Pb01avEehDBz1epcXDX
=h1+g
-----END PGP SIGNATURE-----

--maH1Gajj2nflutpK--
