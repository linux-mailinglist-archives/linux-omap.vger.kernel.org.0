Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9B3170B82
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 23:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727746AbgBZWZj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 17:25:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:36792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727709AbgBZWZi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 17:25:38 -0500
Received: from earth.universe (unknown [185.62.205.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA16924656;
        Wed, 26 Feb 2020 22:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582755937;
        bh=igfHD7faK6qtj0Bem9+JCiVb5arncfdfkwjHeRmHj0U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GCJAiicAvbMM7NH61BAA0jTrFbOCRpyMaXiivMJ+9WKNJe0vBk/zmXZXEJ3d6CqLf
         zG1YkiiOdIxyVIWRUVNjOeFlBxbcPi1mp1oZ0BovXXBB0Gleq9L1G4OV69yVL9nLAc
         ozlvO1QPLxFS3kOmPiAXrZhRy23G+oUFJxcVz8kM=
Received: by earth.universe (Postfix, from userid 1000)
        id 480473C0C83; Wed, 26 Feb 2020 23:25:35 +0100 (CET)
Date:   Wed, 26 Feb 2020 23:25:35 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 04/56] omap/drm: drop unused dsi.configure_pins
Message-ID: <20200226222535.7lk2br3ccuzlrj5q@earth.universe>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-5-sebastian.reichel@collabora.com>
 <20200224234249.GI16163@pendragon.ideasonboard.com>
 <20200226212819.6d3sm4uor6xsgxsw@earth.universe>
 <20200226213630.GH4770@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zwsdibeujo5o6odi"
Content-Disposition: inline
In-Reply-To: <20200226213630.GH4770@pendragon.ideasonboard.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--zwsdibeujo5o6odi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Wed, Feb 26, 2020 at 11:36:30PM +0200, Laurent Pinchart wrote:
> > > I think you can drop the definition of the omap_dsi_pin_config struct=
ure
> > > earlier in this file too, as well as the OMAP_DSS_MAX_DSI_PINS macro.
> > > With this fixed,
> >=20
> > No, the struct is still used by the code setting up the pins from
> > DT.
>=20
> Indeed, my bad. I think I'd pass the unsigned int num_pins and const int
> *pins to dsi_configure_pins() directly to drop the structure, but that
> can be done in a subsequent patch (maybe it is already :-)).

I added quite some cleanups at the end of the series, but there is
still quite a few cleanups possible within the DSI encoder
(including this one). Cleaning up dsi.c takes some time and rebasing
this code gets annoying.

After this series the cleanups mostly are internal to dsi.c and
should reduce merge conflict probability.  Also I feel a bit
uncomfortable, since we currently have no DSI video mode user.
Nikolaus Schaller is working on adding support for such a system, so
it would be nice to get that supported first making it possible to
do easy bisecting for issues introduced by refactoring. (This is not
specifically about dsi_configure_pins of course)

> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> This tag holds.

Thanks.

-- Sebastian

--zwsdibeujo5o6odi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5W8FwACgkQ2O7X88g7
+poALxAAh6eJfUzRzPfAYGt0TnDZ+b51XydSJGHxkini56T53mK3FfjW7prwQihX
5shPu/gIE0gVS07C7wNpInEXfhKjVdPbPRsYrnGGlVEk+tU6O8FHdU7qITRWAZFe
HGfptvs/sDaXMIenyLN8H28lrQRmbQPdUvD429naidtbLZPWk+n3QyPqIxvatMdm
4aLZNmmcNdmm8Nt36U5I9h2aicWTNixQtEQIJQ41X0eU/VWrrcWEpZXQoRAChYEy
EASFBSC7S1hI69qMdV+lqH4J2F9O9OR5lA3RQr+vURAdfzVbbp8txAX5UufbxP1A
wABpg36HjpsubCrd0y+Uru8oIk0SXeZQryFAeDC/FSpCupuYLpELsUG6lCt9EKZ8
o9w94Zf3bNafFKMKlF/r5cD9Z4objq3uTZEwPt69ad1ayB9TWJO50KgVmpuz6o3/
xbprhuGNiogifXc5IZumjeHhT6+/ePm/TKL3KGrwENLAZ00lJK+PDGuvALIIKxMo
JcGjrJIndC/7djEdK09KQSz69smRaSILr9cP3TE6UU723TPatTIeJEjgD9+wMuOE
e49Qvwhu/Y7rDI3QqkGNHQsuaGTaquwdbJ6g1NnQXWGJrqKWBPhGTU6ih4gKXJoo
GEWWkKhmvKUYT9iWw8u8gibzMG6cMBSSWzZTWS/YHzqneNNJ/QY=
=Puod
-----END PGP SIGNATURE-----

--zwsdibeujo5o6odi--
