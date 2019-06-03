Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06CBF32AD6
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jun 2019 10:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbfFCI3s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Jun 2019 04:29:48 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55616 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfFCI3r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Jun 2019 04:29:47 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 7D2FF80295; Mon,  3 Jun 2019 10:29:35 +0200 (CEST)
Date:   Mon, 3 Jun 2019 10:29:45 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
Message-ID: <20190603082945.GA29122@amd>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
In-Reply-To: <20190527112122.GJ5447@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Here is another round of the DSI command mode panel patchset
> > > integrating the feedback from PATCHv5. The patches are based
> > > on v5.2-rc1 tag. It does not contain the patches required for
> > > OMAP3 support (it needs a workaround for a hardware bug) and
> > > for automatic display rotation. They should get their own series,
> > > once after everything has been moved to DRM panel API. I think
> > > DRM panel conversion should happen _after_ this series, since
> > > otherwise there is a high risk of bricking DSI support completely.
> > > I already started a WIP branch for converting DSI to the DRM panel
> > > API on top of this patchset.
> >=20
> > Looks good to me. For some reason I can't boot 5.2-rc2 (on x15) so I ha=
ven't
> > been able to test yet. I'll pick the series up in any case, and I'll te=
st it
> > when I get the kernel booting.
>=20
> Great good to have these merged finally :)
>=20
> Hmm I wonder if some x15 models are affected by the SoC variant
> changes queued in my fixes branch?

I still don't see the patches in next-20190603 . Are they expected to
be there, or should I use different tree?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz02nkACgkQMOfwapXb+vJNjwCgxBzU0XaaaAImhYPAPGMUURue
jMUAoJpDkOfXt+oO5pGBCMG6SHJyy49H
=nupB
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
