Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551192D9893
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 14:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbgLNNKz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 08:10:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:56622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbgLNNKy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 08:10:54 -0500
Date:   Mon, 14 Dec 2020 14:10:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607951414;
        bh=dKv1H+q20h9wB+EQwZeyqYDNnPUSysxHzXC4mfbm/iw=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=fGxYOCWi2KbOMU80qO83Q7TkHPWueqO1YswJFwEUrYOTxJQyVND4NSefEV0pRF4Sv
         svzmEbDMrIw/4/WF6zc6TudENehBp9Q2meAA+JrtheZIiF96E5yhVBHFlg1HXf69M3
         7egM1Z4iZmt5lYXgilCd6z5Gtakq5OxPOEp23o1scsR6y+glUUh2f4HDQGfXc1R3o1
         BdyTq4QxB30ERlGvxo7CBph0reA83J9B9b0ouaLDx7yCZmldKFY3ed4FpvvAKgHPnB
         3MZ9nVcytwppMxS6YwU3DNJWaPAzmFnacHMncpHJpzVoj519LbTuP7nhCCNPmOGeUm
         R4jUfN/+2SaOw==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 04/29] drm/omap: dsi: set trans_mode according to
 client mode_flags
Message-ID: <20201214131012.fq2372anlaq5em4f@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-5-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6athqr4jx65ves64"
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-5-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--6athqr4jx65ves64
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:30PM +0200, Tomi Valkeinen wrote:
> The DSI host driver currently ignores the video mode flags in
> client->mode_flags. Add the code to take the transfer mode from client's
> mode_flags.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index c3592c6db977..7fee9cf8782d 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -5140,6 +5140,13 @@ static int omap_dsi_host_attach(struct mipi_dsi_ho=
st *host,
>  	dsi->config.lp_clk_min =3D 7000000; // TODO: get from client?
>  	dsi->config.lp_clk_max =3D client->lp_rate;
> =20
> +	if (client->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> +		dsi->config.trans_mode =3D OMAP_DSS_DSI_BURST_MODE;
> +	else if (client->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +		dsi->config.trans_mode =3D OMAP_DSS_DSI_PULSE_MODE;
> +	else
> +		dsi->config.trans_mode =3D OMAP_DSS_DSI_EVENT_MODE;
> +
>  	dsi->ulps_auto_idle =3D false;
> =20
>  	return 0;
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--6athqr4jx65ves64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XZDMACgkQ2O7X88g7
+poa8RAAqUOJ7cKqVdrqk2uVFqOxHnf0mZaGbceU28OXEjIydmjKKVo17zB4i/6P
PzIhDCgkz7tdbuaaE0N7ZNg9ZnFH5m9PPMHGc6oy88P3E3H4PUSg9I0u72u8mrKo
6v56L4JB2WFd/MsLJhKOkiNZx1ijpAQ6mgsS+dsgGHfBTaRuZTHfG++/HzEDM9mw
pLAHeVcDHV+retGikDFtQ8xVsNWqbd/yGinulXzONugTaAaJlQ76FFJtWunAo+vu
fb6wcdzeET7NSM86jzG/uKFrZQ3c6sycDbeWEreVkMXw1Dx/UV/9MQVa6i3Nie8D
EQSq9HFIrtIonMnxPYTr/2mdCECl6ewjt+yooyToZstU8lzzVZ1UvDEVGL/C5Wrj
FUQzsyqxAGIKly/X7pw9pG7vDVUqT2gNg+4B5PiOyHpQWLSA3H0S3hOG/SO6CPrT
5BgRPj2WRNEOsujg3qGVIqSImvLHOw3VAwi6Dg/11L4YPZrfEny9YbF7YC6YpTpZ
BDdXztPvpQDqKOpMJI0Y7aQ4rkB7lu+UkkZiXHHZVZdNm4wWji9WdLNcLPK41ICg
WgpIn9EIwXQ7KtfGZRPZ8psZJewtQEvKqRBeWuVMqg+9KzJJRkp7+wbjtx6KJA9/
PYaI2S0QG8QlFqQzpIJAu2ukIlFq7nOKLqU21i7wW+DDve3CPFc=
=J6Rp
-----END PGP SIGNATURE-----

--6athqr4jx65ves64--
