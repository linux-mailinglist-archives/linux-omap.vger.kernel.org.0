Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE71D2D986D
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 13:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387697AbgLNM5X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 07:57:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:53514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407568AbgLNM5O (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 07:57:14 -0500
Date:   Mon, 14 Dec 2020 13:56:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607950593;
        bh=Y1NdELXCln4XaNZ26Buq5jG8PhDlTjRlzjtzQY7qQiM=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=YzCHcac8IbuTyNy4YmFpHmhPOb8joX1+fcgd4uYnLvG2UfEdEam0fsJhYdv7+3LLa
         /89Z7JLU+EGJaqatGFbyQbQstWpmSQSzPDiWJLe8ihupuw59gyAKUlBJdqae24Jqdk
         Yxl0q51pP0BXdZRE4j0gwxSO8XPOQQXCgUBkdYsgExcYhIpMfdi2iCbWrCprIeQHle
         0cMBh2HhRiisp/kXLtpgbplFGRDnUs4PvF6ZsY7jqDzNhtK1q8tH/o0sG5KEu2nsJX
         RgMHqTUBtZcT7wqcErqxDr+RuCT9BCKtFXhuL96lsxczdDLCjcyz4gEPgZVM7tDdfv
         eHJgoEv2OamcA==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 59/80] drm/omap: dsi: set trans_mode according to
 client mode_flags
Message-ID: <20201214125631.gzzfv3cq3t67ru5t@earth.universe>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-60-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tqywm7p7uria6k7v"
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-60-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--tqywm7p7uria6k7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2020 at 02:45:17PM +0200, Tomi Valkeinen wrote:
> The DSI host driver currently ignores the video mode flags in
> client->mode_flags. Add the code to take the transfer mode from client's
> mode_flags.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
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

--tqywm7p7uria6k7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XYP8ACgkQ2O7X88g7
+ppM4A//eAkGFogToRhdLzqcSHjV6hLxfxGBcnaOenjr0uO9rxDxba7xhZCY8Muo
lDoYPrwYElAPVf5h/nGJCACu8jtN+YbnUCw/yjKgDBPVu3x0QjC+AnzidiIcB/sX
sXRH8eSE0uWOvmhYJQhhL9AbMH+JffQAW3uYvuB8Ns3Df/DND3ArB2YbKknQ47Cb
lskr7f0QaSutFxqI6z4WPfefAM8wZyXp/brVd+F/pam/I3Usy+DgySVDHtkNANo6
IUue78K00QkGj5lN1WWywQQ/5jN7rab5MfXTpupXrGQTcMa8ir9GeqpAIlCDxRu+
Bds8hcc4rV9Urbb40EH/kjagOcl4Ddx+O0FTDagNtg8nnBAya6XhJLzNd/LoM5UY
qIvCnS6pYaSY3xGvC/iu00Ehd8B26myfxWRx0/oogH8gDdNVm6IyVyK+V07epqKJ
dUMtsnS2Fj7Ht0g6SQNlps8HPe7DwfTH/EMt3/OsIjffmoTw9rxpncAXiQGjC5up
mgxQegHthI93ctkTn8pYzFFfaHQjxAiV9BaUP5zYeKwRwdGR/kwwQwB7yYeBZ8Uu
BQgtmcLd4oW//VWEihgQU8wc8+SHOpJgQjp5wiuHbRzJCWkcB5pZxF+4Ae6giwPs
Kt2JOgYvN09KQl5MAp6mDULtmU9ou0Nj/9HKj9Gm/FpCt2UeR3E=
=DsGt
-----END PGP SIGNATURE-----

--tqywm7p7uria6k7v--
