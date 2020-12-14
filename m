Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697A92D9865
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 13:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439282AbgLNMzM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 07:55:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:53142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438578AbgLNMzF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 07:55:05 -0500
Date:   Mon, 14 Dec 2020 13:54:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607950465;
        bh=vTJ41r+Pcx1/YVFMh9o2+NFN3VDzQjgghWSBrN8fvP0=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=juYXQ0mryU1M3FLFniMdWhS+1v690FKqWRIFYjZwCQGpdEyN+QIPwahL2W4q1QWip
         lICD6G4YxmDY8obXhI24OvOUBgOBJ/MKdo0Wk5FXku6qInl9vSdpQTtnhM2c/243uv
         teVaiIbOGrPa55VGyg9yvG4msQHyRjO5FnYAm+bhbzq7MPySSLaZ4O9Vb1KDg/e4oP
         UiSmWuIVU8geKu3U9VybA6ppauoZpRZNSiTuie0yZ04ZjZUmcSvXZ1BxQGYOX/zSIn
         m13+3fH2spm/lqRLbAZI5KyHoXOGzYerXvRw69tPFQoderMwYIAPeW/0vAfe9+3+dP
         tQxy+Ley/akiQ==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 55/80] drm/panel: panel-dsi-cm: use
 MIPI_DCS_GET_ERROR_COUNT_ON_DSI
Message-ID: <20201214125423.3jtmsnndu4e7vvhq@earth.universe>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-56-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uit5csyydjsz5qjq"
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-56-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--uit5csyydjsz5qjq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2020 at 02:45:13PM +0200, Tomi Valkeinen wrote:
> Use the common MIPI_DCS_GET_ERROR_COUNT_ON_DSI define instead of
> driver's own.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/panel/panel-dsi-cm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel=
/panel-dsi-cm.c
> index 35a0c7da1974..cb0d27a38555 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -27,7 +27,6 @@
>  #include <video/of_display_timing.h>
>  #include <video/videomode.h>
> =20
> -#define DCS_READ_NUM_ERRORS	0x05
>  #define DCS_GET_ID1		0xda
>  #define DCS_GET_ID2		0xdb
>  #define DCS_GET_ID3		0xdc
> @@ -225,7 +224,7 @@ static ssize_t num_dsi_errors_show(struct device *dev,
>  	mutex_lock(&ddata->lock);
> =20
>  	if (ddata->enabled)
> -		r =3D dsicm_dcs_read_1(ddata, DCS_READ_NUM_ERRORS, &errors);
> +		r =3D dsicm_dcs_read_1(ddata, MIPI_DCS_GET_ERROR_COUNT_ON_DSI, &errors=
);
> =20
>  	mutex_unlock(&ddata->lock);
> =20
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--uit5csyydjsz5qjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XYH8ACgkQ2O7X88g7
+ppoVg//dyvK+Y/clbdJXFuYK0RdldfsA6FUuKQe6HR5NbHggp/+ZbrpITQBAyHU
KDL52UJXYTPn8KNoOgAvMBXRmL+M6x6aHDsRD7st3XfheFmY0s09mjOkArhGAfeZ
ykNtlkH/pGTQMMBDfPbL73GRtkBoEyy34/8xgHe8a1tSCsdzVOiYLb5Ravx2d7FU
qIpZv9msIH44637LQ9i/1DgU9R2mOQvjAZwBnBbV/pC2eRpP9Uxfx+XR7IRZdg0V
eAzjZ66/6JdgdrrL61yCPM0KMT9IrP7yZ5s/6X4khNcRHj8Jwk+nbJScz1/a2ZYh
5DrKetveh4npaHwk+69G3+mWpFACyhu7zgH2WtLguwsNuMj4oRPIGI6JbZXcuFE0
A3v/JmUUF+hE7aMVoOkkmKzKs51o0Bx63hpup+p1tyPLTqZShWtGi7Hz1ABUHmxy
kU8VPVwlECJmP80RYsI3ZL0yvVV+5cWNyIfQ9lwkEIGdUMjmysRT5LtNpXFh4izM
KbG3S3buLp9qNDiVfLSKaR4G02ArNe8FKxl3wsGog3whw9sXmhX7T58jo7h6qxQf
pXKpKzXseqeI7+PSNSfRU3jlrl2DDXZBbTmS2COEDx+wpS5tT1+2QgNKof/rUwei
y0LsMWYM1TligiN7h6Vrr4AeMaIu3iZKdxoqQbc+U8RTKWqiJ6A=
=4TVE
-----END PGP SIGNATURE-----

--uit5csyydjsz5qjq--
