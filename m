Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C34F210079C
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 15:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbfKROqC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 09:46:02 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56342 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfKROqC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Nov 2019 09:46:02 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 1498528FB23
Received: by earth.universe (Postfix, from userid 1000)
        id CDFA13C0C78; Mon, 18 Nov 2019 15:45:58 +0100 (CET)
Date:   Mon, 18 Nov 2019 15:45:58 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [RFCv1 32/42] drm/omap: dsi: convert to drm_panel
Message-ID: <20191118144558.abix5y555jk63szb@earth.universe>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-33-sebastian.reichel@collabora.com>
 <D109D867-1C8E-44F6-9C91-AF55BCB3FDD3@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nzgirlzrs4zg55h3"
Content-Disposition: inline
In-Reply-To: <D109D867-1C8E-44F6-9C91-AF55BCB3FDD3@goldelico.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--nzgirlzrs4zg55h3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 17, 2019 at 08:23:05PM +0100, H. Nikolaus Schaller wrote:
> > [...]
>
> > +	drm_panel_init(&ddata->panel, dev, &dsicm_panel_funcs,
> > +		       DRM_MODE_CONNECTOR_DSI);
> > +
>=20
> This leads to
>=20
> drivers/gpu/drm/panel/panel-dsi-cm.c: In function 'dsicm_probe':
> drivers/gpu/drm/panel/panel-dsi-cm.c:552:2: error: too many arguments to =
function 'drm_panel_init'
>   drm_panel_init(&ddata->panel, dev, &dsicm_panel_funcs,
>   ^
> In file included from drivers/gpu/drm/panel/panel-dsi-cm.c:22:0:
> ./include/drm/drm_panel.h:150:6: note: declared here
>  void drm_panel_init(struct drm_panel *panel);
>       ^
>=20
> (when applied to v5.4-rc7)

The patchset is based on drm-next from
https://anongit.freedesktop.org/git/drm/drm.git

For v5.4-rc7 it needs to look like this:

+	drm_panel_init(&ddata->panel);
+	ddata->panel.dev =3D dev;
+	ddata->panel.funcs =3D &dsicm_panel_funcs;

> > [...]=20
>=20
> Otherwise the patches compile fine and my work-in progress
> DSI panel driver is probing, but not initializing.

Ok, I tried not to break video mode support, but I do not have any
hardware. Make sure to set the MIPI_DSI_MODE_VIDEO flag in the panel
driver.

-- Sebastian

--nzgirlzrs4zg55h3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3Srp0ACgkQ2O7X88g7
+pq1lA/4pMsF1FS+Pczm/n204zcWufVsXGBuB55VPkGY/6mZrZ6H7VtljkhqbXF/
+U1QN1u43Gvqe56udG1H8NquR8hsh58tZXsFIc/K+Bjw6fjjxPjhji5I4jV8c5Hq
B86vL5AJ8U8h9vddp+PRUtVQmt4n1GbfHdxd+cn/1oXXFXjUWO0w3iEjDycnwfwo
lvmCmPvp/ub5NmLH2ny5qUA1rGP602AWNYejZzzW/qdRtYJ60PmDbDUHPboOaW3t
EaxdmQG8VTZz8s/g3gSW5di/cJ/57NmjGmmRBMs9Gt8S4ohU6/tyNGe2WJUt4zip
tWWcAxwvU2qHX2wygZdVwIRipw6A3O69lqyz+uQ5QFlxhH9+q38CCbx9F6D8xzen
ib/i4UT3Sl1rfo3VvRMkHGTmgJtBqCHOiaYVBeBoB/8HF5PGzuzUmjKCn2e6RWoI
jqZSx5TNEOGl5LAwjNjIxQK12+G+ZjMJ0PfhXxSVyduY0ch+Od1gVx0UmOCP70T9
0tht1070P4E4tiddDDIeOobXjmzzxXVIuzBgj/Wa6Q5npEq+KYBlcGSI+PpHqyyN
3VjEIH01+e5qf9y5uxiOKW0OI203eI2Rtg5OyCYcf3Poo2edPgMKftQHpfcRd4Xo
l6c2EXvuYiHTSM+c4TK2EpGF+GrK/HNkw83/NLBs8ce2qeCQOA==
=SUyE
-----END PGP SIGNATURE-----

--nzgirlzrs4zg55h3--
