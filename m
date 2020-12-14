Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACEA2D9A0B
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 15:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438089AbgLNOdU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 09:33:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:36326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727309AbgLNOdL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 09:33:11 -0500
Date:   Mon, 14 Dec 2020 15:32:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607956350;
        bh=+XX8nd7wqxTxWCRCfIhmwnkI4H4Zgc+u/I1W2Oo647Q=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z/JyOJJSm16ILQGPr9e3jinWeqFrNU1F2+hHR4Zt5S++52Cwbfi0H0JKaQcPTtKZ4
         1NrU9IQMV/6dQTrtMlE1yiE9Hfuc5GbEMcoZNNeUQog7eO9vwu0ZPmg6WPmrViA9ua
         gH4W2n1yhXVYrO8kZylLLGQVpwXIMqIDR5occSLOSC6dRvzNPnpGJwJrfQRSrJdLQM
         sd8d3F+SY09CLuzaQXOCToKY4EyM6O3X+8+3IykA/2HtqKYRwhmcQ2U7AJ+bRL2IAV
         3SaFRzu772EFgaHp9iF0143hJAeGpE2GxiXBBnyz/YUM4TARe9ohlZog2P6vDBZTcG
         U8yFBCg1+P5Mw==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 08/29] drm/omap: dsi: drop useless channel checks
Message-ID: <20201214143228.m5kewrbo4xoa63ob@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-9-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hgmnzglpnhbyj5dh"
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-9-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--hgmnzglpnhbyj5dh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:34PM +0200, Tomi Valkeinen wrote:
> A DSI peripheral can have virtual channel ID of 0-3. This should be
> always the case, and there's no need in the driver to validate the
> channel.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 11 -----------
>  1 file changed, 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index 5e13478010db..c78ae99c8742 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3902,9 +3902,6 @@ static int dsi_update_channel(struct omap_dss_devic=
e *dssdev, int channel)
>  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
>  	int r;
> =20
> -	if (channel > 3)
> -		return -EINVAL;
> -
>  	dsi_bus_lock(dsi);
> =20
>  	if (!dsi->video_enabled) {
> @@ -5068,12 +5065,8 @@ static int omap_dsi_host_attach(struct mipi_dsi_ho=
st *host,
>  				struct mipi_dsi_device *client)
>  {
>  	struct dsi_data *dsi =3D host_to_omap(host);
> -	unsigned int channel =3D client->channel;
>  	int r;
> =20
> -	if (channel > 3)
> -		return -EINVAL;
> -
>  	if (dsi->dsidev) {
>  		DSSERR("dsi client already attached\n");
>  		return -EBUSY;
> @@ -5123,10 +5116,6 @@ static int omap_dsi_host_detach(struct mipi_dsi_ho=
st *host,
>  				struct mipi_dsi_device *client)
>  {
>  	struct dsi_data *dsi =3D host_to_omap(host);
> -	unsigned int channel =3D client->channel;
> -
> -	if (channel > 3)
> -		return -EINVAL;
> =20
>  	if (WARN_ON(dsi->dsidev !=3D client))
>  		return -EINVAL;
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--hgmnzglpnhbyj5dh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/Xd3wACgkQ2O7X88g7
+ppMrBAAnuCKS+fRyWqjmS1cA25e3RzZQdKF3/dTPt3OqiJptcP1JS9UYswBe/z0
gCbKcW+Wzd7jmDwkkjVcBWsAo8LEFVy76887UwEVflhzgDBST1Z78Dpctzo3bblt
mPk5Zy4Yt1vDyco+Xj6DrzZUIfk1s7AxSkPPcN0zTHt1xKGkUQCbxeyP89eOxGM8
EP9NR4mOuK7C2PA0anQN3edHhgh+uAJQqkmIg30gEagezOgxaDdcWIVSy6YKoU4j
3JiV4wqzor2VNhaazVU73KEVsRo5n83GLV/Q3PyseyXRjpSlk/0W5DSrVWUXe1Q0
bPU7PBCBLkmim7cWUcmAtXJWD3+5/3BBwvwf2QfxpFxVG7U0VAeOgaxVulKRqU23
5bliXj4vpOf0nDm/x6RHfh8hNf++QWAmXVSvS5+KIBURJrfUsolpaTElej7n/0+p
eEQRHl62o4ntnJxGlq1AxZCchmFKKLXQQa8jXl+v+CgLSTKYqLF1e6tDB55ET9yS
tgksLltgjVDetxIrZdGaqAqIka/MROB4NTgPGcM1r/rnqZ4s+teMEWT6wKHd/xIE
tcfKBTamZse3kKNdOFBqPvO1+6+qQVSr03c6ViOcY5rCQIf0NSpvZqiWPEKswOaB
Ff7r0WU4BOkmqxaMHllE8rwy0PFTeHqU4Ipe+Jwe7gdIpLQacZM=
=/WBP
-----END PGP SIGNATURE-----

--hgmnzglpnhbyj5dh--
