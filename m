Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFD02D9CD7
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 17:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729220AbgLNQkl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 11:40:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:43772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440224AbgLNQke (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 11:40:34 -0500
Date:   Mon, 14 Dec 2020 17:39:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607963993;
        bh=Q4YN9lr1l5AY3qFHFhcaSKSoKuIYhiMbTFcLXTFnEuo=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=L6Fl2vm7IK9cxdOOJmBybDpKtG3M2agvpdsminXI6J0pJTzQd8vvIrCVAAz93ztu1
         gUyKfUUKuJoBo6PZbdVsulgMGqPCWoin1QbhpFUsbffE1/X3vEBghdFJcTvv5bpe1e
         mCI1hc1R20e/joaWVI6dP9Lkqsv1dO7yWPeTRhVIwkNbpmGEVNtYocnaiZBCUbwo85
         SRvwrEvH2O9FMCBTPxTj/z4HkHl9vai4HrhajMefry34mKpqwJpeFK7fM/jFMr011L
         9Yn1HYS8t4q6CnkeX4jiHVuoZ/hJXyFCgjciw0xm+OEjcwDsvrvNCXA1K5BmtZWZC0
         tOmOO6IxFVs5A==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 26/29] drm/omap: dsi: fix and cleanup ddr_clk_always_on
Message-ID: <20201214163951.r5vzounolcm526va@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-27-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="py3z4vflggoqzjsk"
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-27-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--py3z4vflggoqzjsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:52PM +0200, Tomi Valkeinen wrote:
> The driver ignores MIPI_DSI_CLOCK_NON_CONTINUOUS, and always uses
> non-continuous clock.
>=20
> Fix this by using MIPI_DSI_CLOCK_NON_CONTINUOUS and at the same time,
> drop ddr_clk_always_on field which seems pretty useless.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 12 +++++-------
>  drivers/gpu/drm/omapdrm/dss/dsi.h |  2 --
>  2 files changed, 5 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index 71de6119d2de..cc8b169b2223 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -1734,11 +1734,10 @@ static int dsi_cio_init(struct dsi_data *dsi)
> =20
>  	dsi_cio_timings(dsi);
> =20
> -	if (dsi->mode =3D=3D OMAP_DSS_DSI_VIDEO_MODE) {
> -		/* DDR_CLK_ALWAYS_ON */
> -		REG_FLD_MOD(dsi, DSI_CLK_CTRL,
> -			dsi->vm_timings.ddr_clk_always_on, 13, 13);
> -	}
> +	/* DDR_CLK_ALWAYS_ON */
> +	REG_FLD_MOD(dsi, DSI_CLK_CTRL,
> +		    !(dsi->dsidev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS),
> +		    13, 13);
> =20
>  	dsi->ulps_enabled =3D false;
> =20
> @@ -3646,7 +3645,7 @@ static void dsi_setup_dsi_vcs(struct dsi_data *dsi)
>  	dsi_force_tx_stop_mode_io(dsi);
> =20
>  	/* start the DDR clock by sending a NULL packet */
> -	if (dsi->vm_timings.ddr_clk_always_on)
> +	if (!(dsi->dsidev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
>  		dsi_vc_send_null(dsi, VC_CMD, dsi->dsidev->channel);
>  }
> =20
> @@ -4155,7 +4154,6 @@ static bool dsi_vm_calc_blanking(struct dsi_clk_cal=
c_ctx *ctx)
>  	dsi_vm->hfp_blanking_mode =3D 1;
>  	dsi_vm->hbp_blanking_mode =3D 1;
> =20
> -	dsi_vm->ddr_clk_always_on =3D cfg->ddr_clk_always_on;
>  	dsi_vm->window_sync =3D 4;
> =20
>  	/* setup DISPC videomode */
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.h b/drivers/gpu/drm/omapdrm/=
dss/dsi.h
> index 478fc10bd18d..476069fda082 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.h
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.h
> @@ -212,7 +212,6 @@ struct omap_dss_dsi_videomode_timings {
> =20
>  	enum omap_dss_dsi_trans_mode trans_mode;
> =20
> -	bool ddr_clk_always_on;
>  	int window_sync;
>  };
> =20
> @@ -224,7 +223,6 @@ struct omap_dss_dsi_config {
>  	unsigned long hs_clk_min, hs_clk_max;
>  	unsigned long lp_clk_min, lp_clk_max;
> =20
> -	bool ddr_clk_always_on;
>  	enum omap_dss_dsi_trans_mode trans_mode;
>  };
> =20
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--py3z4vflggoqzjsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XlVYACgkQ2O7X88g7
+pqvkhAAlYK5rTnbMc8+9bWixVLkm1Q4mr8ZvduEmlvtmmzc/weQpvG5o341prey
qIg7Hy9qZ4B/JJoVzTkpbm5Edoqe5tL52s+THcDU/OzsjRdDCBelttLc9jtgGetU
hWfkeDXUUsTbzAq2Oim4qtenZcMvKpa2vH1hbCAPm81cDTeUGrZjuhqg8Bdmx+Bg
3PV9c7cmQBM2mMUIEi/G88T6NQjruHJ25enCUpS6DfC4neRNngTHGWRSQMDDfKyE
pdqZSWC6sEQg89rwzI4oa4BeX29liJP21dLtV7xyimj0/oIyrDU0J5Nqypda4kwX
T76Q0hn2XxINDABLlAqXgw6b93JQsPrOvbyolS8oIt/pY9bixaaDjYDk4+2bnnCR
WVxzcxvMXMXpZl688AaLJB5xJogSLd2xS9f587wJgMrrfVbjZmlKPqhqAcVUrtJ0
ztfdLj46RZb0XmEq/VXXf97uJ+DMhhYy+uyieGuRBJbnkod0UFgQ0poOZJv5XMyx
NlHwhU/AwHNYDHaxXX4dpn+B5r5QS40lotouypTx/NjIBtXNW82wIo+8C+NLm/Y1
Je+ygZG+GYI9nipRl7+tnNpgMhl3F+GtP6vhpGxtdtjFZRQHtYVYT7zmdUFkWwWL
917gbrm+/0ZDEvGOAyjlRjSY+jG8GK9Uauie1vMdp69X3TIB0t0=
=eOJk
-----END PGP SIGNATURE-----

--py3z4vflggoqzjsk--
