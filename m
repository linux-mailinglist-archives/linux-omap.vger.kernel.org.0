Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F285B170A6A
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 22:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbgBZV2X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 16:28:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:49314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727486AbgBZV2X (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 16:28:23 -0500
Received: from earth.universe (unknown [185.62.205.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E84DA2072D;
        Wed, 26 Feb 2020 21:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582752502;
        bh=vTjZV9LH0lSNC00MV7TiIqFiABVMwEyk7AT2GLPN8Zc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VcA1E60fdGhORNw5u7+fhInp3FmP3zEkQj+vR+DpO4KM5ijQJb1JJAfYvphus7VR7
         qwq3u1AAO605NCxGUwHGBXObjt38DNtgN6/bCctFWIMQLSlMvYTs8IoYrDJZ8pGpmM
         yH3/Fsxx93TEbv7M+oERyoQQeevozzhMQzlojyIs=
Received: by earth.universe (Postfix, from userid 1000)
        id 7B05E3C0C83; Wed, 26 Feb 2020 22:28:19 +0100 (CET)
Date:   Wed, 26 Feb 2020 22:28:19 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 04/56] omap/drm: drop unused dsi.configure_pins
Message-ID: <20200226212819.6d3sm4uor6xsgxsw@earth.universe>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-5-sebastian.reichel@collabora.com>
 <20200224234249.GI16163@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bjnlebujg5pfdiav"
Content-Disposition: inline
In-Reply-To: <20200224234249.GI16163@pendragon.ideasonboard.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--bjnlebujg5pfdiav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, Feb 25, 2020 at 01:42:49AM +0200, Laurent Pinchart wrote:
> Hi Sebastian,
>=20
> Thank you for the patch.
>=20
> On Tue, Feb 25, 2020 at 12:20:34AM +0100, Sebastian Reichel wrote:
> > The panel-dsi-cm's ddata->pin_config is always NULL, so this
> > callback is never called. Instead the DSI encoder gets the pin
> > configuration directly from DT.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 11 -----------
> >  drivers/gpu/drm/omapdrm/dss/dsi.c               |  1 -
> >  drivers/gpu/drm/omapdrm/dss/omapdss.h           |  2 --
> >  3 files changed, 14 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/=
gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > index 3484b5d4a91c..e7fe5d702337 100644
> > --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > @@ -68,8 +68,6 @@ struct panel_drv_data {
> >  	int width_mm;
> >  	int height_mm;
> > =20
> > -	struct omap_dsi_pin_config pin_config;
> > -
> >  	/* runtime variables */
> >  	bool enabled;
> > =20
> > @@ -623,15 +621,6 @@ static int dsicm_power_on(struct panel_drv_data *d=
data)
> >  		}
> >  	}
> > =20
> > -	if (ddata->pin_config.num_pins > 0) {
> > -		r =3D src->ops->dsi.configure_pins(src, &ddata->pin_config);
> > -		if (r) {
> > -			dev_err(&ddata->pdev->dev,
> > -				"failed to configure DSI pins\n");
> > -			goto err_vddi;
> > -		}
> > -	}
> > -
> >  	r =3D src->ops->dsi.set_config(src, &dsi_config);
> >  	if (r) {
> >  		dev_err(&ddata->pdev->dev, "failed to configure DSI\n");
> > diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdr=
m/dss/dsi.c
> > index 79ddfbfd1b58..8c39823a8295 100644
> > --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> > +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > @@ -4892,7 +4892,6 @@ static const struct omap_dss_device_ops dsi_ops =
=3D {
> > =20
> >  		.enable_hs =3D dsi_vc_enable_hs,
> > =20
> > -		.configure_pins =3D dsi_configure_pins,
> >  		.set_config =3D dsi_set_config,
> > =20
> >  		.enable_video_output =3D dsi_enable_video_output,
> > diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/om=
apdrm/dss/omapdss.h
> > index cbbe10b2b60d..b0424daaceed 100644
> > --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> > +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> > @@ -292,8 +292,6 @@ struct omapdss_dsi_ops {
>=20
> I think you can drop the definition of the omap_dsi_pin_config structure
> earlier in this file too, as well as the OMAP_DSS_MAX_DSI_PINS macro.
> With this fixed,

No, the struct is still used by the code setting up the pins from
DT.

-- Sebastian

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> >  	/* bus configuration */
> >  	int (*set_config)(struct omap_dss_device *dssdev,
> >  			const struct omap_dss_dsi_config *cfg);
> > -	int (*configure_pins)(struct omap_dss_device *dssdev,
> > -			const struct omap_dsi_pin_config *pin_cfg);
> > =20
> >  	void (*enable_hs)(struct omap_dss_device *dssdev, int channel,
> >  			bool enable);
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--bjnlebujg5pfdiav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5W4vMACgkQ2O7X88g7
+pqePxAApLpFQxopPa01eUuh5tLD4BEATyQilGqlt4pZUxGnKwJQednBm+L5IAq/
ugVyU/0CfUDAMPLLs6bzOwPFzpAqtG76jWDcqLHabO/ElaUDmmwUURWxvuEHpcHb
fBBVak4fQeZDszgsgNhBXAxyp17/GvywfvGoV8xYyW+KBnYyUIYWEj4YrTP2JSWT
gOqy5WiPEcQh0lurBFOUiOGBjOAQFnGx0ST6h5VlUCMnvR6hEnCzMZJ3KQDPA5Wt
M2xD3UYqXRniAOMqw6rdaHUGK9noB78Om6mXcDU3Wgn12h+J7lLeHoB5CQR5t8bG
EMrR3dbqB7qH88bNB2oJJHL4upbiM7RQNPqkOaSefP0zpD5/4f5Fa4GwKZDYApFc
HTepgg43LfIVElygq2iBVkj2w2s4wUSR5qD1B6oi/veNT4mJl3vfMQLqlJueDZJ5
5UpPDRouZbldvUsbp/I3+rO2OVy2s2HjbX3jOgeC2Zhhu8bfhkDxeHekNsjfu4N4
9ax6ZPNIFa2XQxbvSgFEKpARYyRUZvRW8oenwk6/2O8G0GlGexlm8e/qTyQnpjIR
YRzDNJ3ajssNEOTDBGoZgOp0AMRdKhcQobnMgEDlNzMOPlNRj7xEiOkQddBRuWDJ
F3k2ctbu7ZuqXdvX7FecLyJR5JRxyFKINy8qvI29PRi3TOFysuI=
=bMEA
-----END PGP SIGNATURE-----

--bjnlebujg5pfdiav--
