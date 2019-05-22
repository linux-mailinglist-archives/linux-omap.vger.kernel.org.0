Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE6C269C0
	for <lists+linux-omap@lfdr.de>; Wed, 22 May 2019 20:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbfEVSVz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 May 2019 14:21:55 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59660 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728272AbfEVSVz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 May 2019 14:21:55 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id A821780313; Wed, 22 May 2019 20:21:42 +0200 (CEST)
Date:   Wed, 22 May 2019 20:21:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv6 4/4] drm/omap: add support for manually updated displays
Message-ID: <20190522182152.GA10003@amd>
References: <20190403195413.djfrgzuj7povdksi@earth.universe>
 <20190403201326.3127-1-sebastian.reichel@collabora.com>
 <20190403201326.3127-5-sebastian.reichel@collabora.com>
 <20190404001109.GZ49658@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <20190404001109.GZ49658@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-04-03 17:11:09, Tony Lindgren wrote:
> * Sebastian Reichel <sebastian.reichel@collabora.com> [190403 20:14]:
> > This adds the required infrastructure for manually updated displays,
> > such as DSI command mode panels. While those panels often support
> > partial updates we currently always do a full refresh.
> >=20
> > The display will be refreshed when something calls the dirty callback,
> > such as libdrm's drmModeDirtyFB(). This is currently being done at least
> > by the kernel console and Xorg (with modesetting driver) in their
> > default configuration. Weston does not implement this and the fbdev
> > backend does not work (display will not update). Weston's DRM backend
> > uses double buffering and the page flip will also trigger a display
> > refresh.
>=20
> I've tested this with Linux next and the latest lm3532
> patches and it works fine as long as we leave out the
> backlight =3D <&lcd_backlight> entry from dts like I
> replied in the lm3532 tread. So as far as I'm concerned,
> we're good to go:
>=20
> Tested-by: Tony Lindgren <tony@atomide.com>

I've tested this on 5.2-rc1, and it is still neccessary, still needed,
and still not merged.

How can I help? Can the patches simply be picked up for drm tree?

Tested-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzlk0AACgkQMOfwapXb+vJXQQCfQd2JMKV5aE0IX8qcHplWoUFq
tQsAn2FpwuQw/t+w9mpUiAiZ/CP53ppT
=FNwu
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
