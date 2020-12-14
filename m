Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31812D9894
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 14:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407693AbgLNNLL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 08:11:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:56706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbgLNNLL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 08:11:11 -0500
Date:   Mon, 14 Dec 2020 14:10:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607951430;
        bh=QceA5IOcmvnizvMKaNr51StFZeA9L+mW8EzUZ69co5s=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=QWAF/ICcWSVEfl01NevVI/kRoEjgcMNQUpaqwblIB6PYrKvOlHKucniYvVYMCgRo9
         wfykKCx7liPBLikilZksw3vkASW6rO7Uu1W8e25lENb6cQ1mzZUnK97cP0d+ut1z4V
         noq4CFOGAOB7hqf4wdvukOAFsabEmHsE0GNVMFFBxt/AQgbUx2xXAMoUKH2E0h0xxw
         tgho7FkOPobUnbafQ/lh8lKUGUVjMn7SsZSIiF9sjwoAKfWRy7viyc4xbdFqP6rQLQ
         mLez+jGgthRSNN7fJCibRJZh0NG+HxL2GTCsDr33+DOE6bMY7O4CCVycwo59Fayjc+
         TQTbyZOK36X8Q==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 05/29] drm/panel: panel-dsi-cm: set column & page at
 setup
Message-ID: <20201214131028.hjk4emzip5yyb7el@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-6-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p2e36hh2kbb2ic5q"
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-6-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--p2e36hh2kbb2ic5q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:31PM +0200, Tomi Valkeinen wrote:
> Set the column & page address once during setup, instead of relying the
> DSI host driver to set those.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/panel/panel-dsi-cm.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel=
/panel-dsi-cm.c
> index 38f79dca1fd0..556f9a2c5c0c 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -170,6 +170,22 @@ static int dsicm_get_id(struct panel_drv_data *ddata=
, u8 *id1, u8 *id2, u8 *id3)
>  	return 0;
>  }
> =20
> +static int dsicm_set_update_window(struct panel_drv_data *ddata)
> +{
> +	struct mipi_dsi_device *dsi =3D ddata->dsi;
> +	int r;
> +
> +	r =3D mipi_dsi_dcs_set_column_address(dsi, 0, ddata->mode.hdisplay - 1);
> +	if (r < 0)
> +		return r;
> +
> +	r =3D mipi_dsi_dcs_set_page_address(dsi, 0, ddata->mode.vdisplay - 1);
> +	if (r < 0)
> +		return r;
> +
> +	return 0;
> +}
> +
>  static int dsicm_bl_update_status(struct backlight_device *dev)
>  {
>  	struct panel_drv_data *ddata =3D dev_get_drvdata(&dev->dev);
> @@ -307,6 +323,10 @@ static int dsicm_power_on(struct panel_drv_data *dda=
ta)
>  	if (r)
>  		goto err;
> =20
> +	r =3D dsicm_set_update_window(ddata);
> +	if (r)
> +		goto err;
> +
>  	r =3D mipi_dsi_dcs_set_display_on(ddata->dsi);
>  	if (r)
>  		goto err;
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--p2e36hh2kbb2ic5q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XZEQACgkQ2O7X88g7
+poDlhAAoqPyyfYRxY2zrekDSG8SjYPA0ndZqERw8piEu1bej8WxtKG06lv8uHkq
HN/SYQthn2D0d6GlbGA1vDDiE2auVjfWDIVg2oDu0EnCqTvAfzDmNsE6gKGk8C32
uhSQTJQ+FDZvmge9fnkuOALzUdfuDs5cC86XtStVz45FdcaT98dLYh+iq+anhMd4
i+Nor1YikOdMjwOEK1R0sUQd7arYPF0AuFyt8fV0dQqvHztaDasFTc6plTXtc8vd
dgjSmmWW9H4xDgeI098ln7en2t5TPfmdCyLjibO11ZYfXKw4H6UdQrtjiZQWuVBD
dzRfuKCEEplkIZrwbvlIExxPeuyqzoEuF/V5sLnJLZ3dqoHCanRf4JUlvdoya2Wu
TEMuFsf9t3pc2fMSsxDNOG08BTuX/sv1UTe20Muen9Ptv9aLcOj9mMvGR7Vjt214
qtvioH4IrXRsnVtScV18GcvGGUJbN6+Jjfu8rOdllP4aHBYZfvwRS2XRdn6Rwoj4
96YcxwiVUvqVZHSWTgCiPAawd0TUrYDDyoR4Mn42xVYSiHa3J0VMUZGVWNTNuAKZ
zj0TFFRowJ7d2eGsL9RfdwiUQgAmQWWuoF8qI6q/joXMcUTw/SxfovJHTFk0/4oP
WTSSAMhJYcRtMYf8OCVNps+9SX9g8A6aREI8M7rJYvEsw5sMaCk=
=gxkl
-----END PGP SIGNATURE-----

--p2e36hh2kbb2ic5q--
