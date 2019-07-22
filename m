Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97B6D70AFC
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jul 2019 23:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730555AbfGVVEK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jul 2019 17:04:10 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:56026 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729059AbfGVVEK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 Jul 2019 17:04:10 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 1FA5880410; Mon, 22 Jul 2019 23:03:55 +0200 (CEST)
Date:   Mon, 22 Jul 2019 23:04:07 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        linux-leds@vger.kernel.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] Enable backlight when trigger is activated
Message-ID: <20190722210407.GA25617@amd>
References: <20190718190849.GA11409@amd>
 <22d7eca4ad8aa2e73933c4f83c92221ce6e0945a.camel@collabora.com>
 <20190722075032.GA27524@amd>
 <6fc6af89-1455-7665-47e7-0568ecd87c9c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <6fc6af89-1455-7665-47e7-0568ecd87c9c@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> This looks fishy.
> >>
> >> Maybe you should use a default-state =3D "keep" instead? (and you'll h=
ave
> >> to support it in the LED driver).
> >>
> >> That'll give you proper "don't touch the LED if it was turned on" beha=
vior,
> >> which is what you seem to want.
> >=20
> > Actually no, that's not what I want. LED should go on if the display
> > is active, as soon as trigger is activated.
> >=20
> > Unfortunately, I have see no good way to tell if the display is
> > active (and display is usually active when trigger is activated).
>=20
> default-state DT property can be also set to "on"
> (see Documentation/devicetree/bindings/leds/common.txt).

Ok, thanks for the hint, that could work. (I thought we were using
default trigger to set the LED "on").

Now...this gives me option of 0% or 100% brightness, while best would
be 10% brightness.... but I guess we can live with that ;-).

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl02JMcACgkQMOfwapXb+vI4ugCeInwKolmtAnBHOQNVsMS09AdN
Kr8AnAq4ihyjYP61ghzcLq9l2lbwoALF
=guhn
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
