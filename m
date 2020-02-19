Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC96165334
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 00:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgBSXym (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Feb 2020 18:54:42 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:37314 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbgBSXyl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Feb 2020 18:54:41 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 88D151C013D; Thu, 20 Feb 2020 00:54:40 +0100 (CET)
Date:   Thu, 20 Feb 2020 00:54:40 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        agx@sigxcpu.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        jjhiblot@ti.com
Subject: Re: [PATCH] backlight: add led-backlight driver
Message-ID: <20200219235440.GA25196@amd>
References: <20200219191412.GA15905@amd>
 <20200219194540.GD37466@atomide.com>
 <20200219205322.GA1227@duo.ucw.cz>
 <20200219211513.GE37466@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <20200219211513.GE37466@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > If you guys instead want me to pick these both into my fixes
> > > branch, just let me know and I'll do the explaining why these
> > > are needed as fixes. Basically we no longer have a way to enable
> > > the LCD backlight for droid4 manually starting with v5.6-rc1
> > > unlike earlier.
> >=20
> > If you are willing to do that, it looks like good solution from my
> > point of view.
>=20
> OK. I'll apply them but won't push out yet in case Lee is already
> applying the driver change..
>=20
> Pavel, care to ack the dts patch?

It looks okay to me (but did not test it yet).

Acked-by: Pavel Machek <pavel@ucw.cz>

Thanks,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5NysAACgkQMOfwapXb+vKgwQCfSG1WQ+wP9YnFU9eAwSt70YBM
p5IAn3MbCGg5s3cuMBDzM1Q7mLOb3XWJ
=1Ygd
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
