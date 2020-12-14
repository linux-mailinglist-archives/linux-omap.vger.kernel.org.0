Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189B72D9CD4
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 17:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439967AbgLNQjE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 11:39:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:42986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732019AbgLNQis (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 11:38:48 -0500
Date:   Mon, 14 Dec 2020 17:38:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607963887;
        bh=VJEsXMf6+jJkIRyPOgifKlUc0PCf96MkWYaRUGKUipk=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=OFBzu68YT2OIL6Sq6txEtdfOEqILWd7LhMfHOK8njTIXvA4lR9BaI5+FEOoqY/yq8
         G+nzmunkkRWMSkdrDyALYhql/Ei5uZsmfBrE4B0GwdNvYfo6//nI0Gs7tjL0jzi+xP
         hxF9O6mFr9Rd0R80UxFbakHN4qYp3OGA1ZIZv2abhs9WW4zNyQI9SjIn3HdP+zhJyP
         mV5Lle2SWC46Sw7zSk1hrLDT7kHdiPtXrov3Vx/3MRpYMsO7tfd0B4W0j4fPpj2n2C
         BC4SkLmp5ND9GxZi8f82AvH+4HL+KEOG1SQOBhuSw5r/ldOU4u7guP7uU3KHKg0x5V
         qkPYXxgAPqMLA==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 25/29] drm/omap: dsi: split video mode enable/disable
 into separate func
Message-ID: <20201214163804.b6t47zj2zu6ud2o4@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-26-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c3r2kafugvpdfft6"
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-26-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--c3r2kafugvpdfft6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:51PM +0200, Tomi Valkeinen wrote:
> Clean up the code by separating video-mode enable/disable code into
> functions of their own.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 101 +++++++++++++++++-------------
>  1 file changed, 57 insertions(+), 44 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index c32884f167b8..71de6119d2de 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3207,12 +3207,61 @@ static int dsi_configure_pins(struct dsi_data *ds=
i,
>  	return 0;
>  }
> =20
> -static void dsi_enable_video_output(struct omap_dss_device *dssdev, int =
vc)
> +static int dsi_enable_video_mode(struct dsi_data *dsi, int vc)
>  {
> -	struct dsi_data *dsi =3D to_dsi_data(dssdev);
>  	int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
>  	u8 data_type;
>  	u16 word_count;
> +
> +	switch (dsi->pix_fmt) {
> +	case MIPI_DSI_FMT_RGB888:
> +		data_type =3D MIPI_DSI_PACKED_PIXEL_STREAM_24;
> +		break;
> +	case MIPI_DSI_FMT_RGB666:
> +		data_type =3D MIPI_DSI_PIXEL_STREAM_3BYTE_18;
> +		break;
> +	case MIPI_DSI_FMT_RGB666_PACKED:
> +		data_type =3D MIPI_DSI_PACKED_PIXEL_STREAM_18;
> +		break;
> +	case MIPI_DSI_FMT_RGB565:
> +		data_type =3D MIPI_DSI_PACKED_PIXEL_STREAM_16;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	dsi_if_enable(dsi, false);
> +	dsi_vc_enable(dsi, vc, false);
> +
> +	/* MODE, 1 =3D video mode */
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 1, 4, 4);
> +
> +	word_count =3D DIV_ROUND_UP(dsi->vm.hactive * bpp, 8);
> +
> +	dsi_vc_write_long_header(dsi, vc, dsi->dsidev->channel, data_type,
> +			word_count, 0);
> +
> +	dsi_vc_enable(dsi, vc, true);
> +	dsi_if_enable(dsi, true);
> +
> +	return 0;
> +}
> +
> +static void dsi_disable_video_mode(struct dsi_data *dsi, int vc)
> +{
> +	dsi_if_enable(dsi, false);
> +	dsi_vc_enable(dsi, vc, false);
> +
> +	/* MODE, 0 =3D command mode */
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 0, 4, 4);
> +
> +	dsi_vc_enable(dsi, vc, true);
> +	dsi_if_enable(dsi, true);
> +}
> +
> +static void dsi_enable_video_output(struct omap_dss_device *dssdev, int =
vc)
> +{
> +	struct dsi_data *dsi =3D to_dsi_data(dssdev);
>  	int r;
> =20
>  	r =3D dsi_init_dispc(dsi);
> @@ -3222,37 +3271,9 @@ static void dsi_enable_video_output(struct omap_ds=
s_device *dssdev, int vc)
>  	}
> =20
>  	if (dsi->mode =3D=3D OMAP_DSS_DSI_VIDEO_MODE) {
> -		switch (dsi->pix_fmt) {
> -		case MIPI_DSI_FMT_RGB888:
> -			data_type =3D MIPI_DSI_PACKED_PIXEL_STREAM_24;
> -			break;
> -		case MIPI_DSI_FMT_RGB666:
> -			data_type =3D MIPI_DSI_PIXEL_STREAM_3BYTE_18;
> -			break;
> -		case MIPI_DSI_FMT_RGB666_PACKED:
> -			data_type =3D MIPI_DSI_PACKED_PIXEL_STREAM_18;
> -			break;
> -		case MIPI_DSI_FMT_RGB565:
> -			data_type =3D MIPI_DSI_PACKED_PIXEL_STREAM_16;
> -			break;
> -		default:
> -			r =3D -EINVAL;
> -			goto err_pix_fmt;
> -		}
> -
> -		dsi_if_enable(dsi, false);
> -		dsi_vc_enable(dsi, vc, false);
> -
> -		/* MODE, 1 =3D video mode */
> -		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 1, 4, 4);
> -
> -		word_count =3D DIV_ROUND_UP(dsi->vm.hactive * bpp, 8);
> -
> -		dsi_vc_write_long_header(dsi, vc, dsi->dsidev->channel, data_type,
> -				word_count, 0);
> -
> -		dsi_vc_enable(dsi, vc, true);
> -		dsi_if_enable(dsi, true);
> +		r =3D dsi_enable_video_mode(dsi, vc);
> +		if (r)
> +			goto err_video_mode;
>  	}
> =20
>  	r =3D dss_mgr_enable(&dsi->output);
> @@ -3266,7 +3287,7 @@ static void dsi_enable_video_output(struct omap_dss=
_device *dssdev, int vc)
>  		dsi_if_enable(dsi, false);
>  		dsi_vc_enable(dsi, vc, false);
>  	}
> -err_pix_fmt:
> +err_video_mode:
>  	dsi_uninit_dispc(dsi);
>  	dev_err(dsi->dev, "failed to enable DSI encoder!\n");
>  	return;
> @@ -3276,16 +3297,8 @@ static void dsi_disable_video_output(struct omap_d=
ss_device *dssdev, int vc)
>  {
>  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> =20
> -	if (dsi->mode =3D=3D OMAP_DSS_DSI_VIDEO_MODE) {
> -		dsi_if_enable(dsi, false);
> -		dsi_vc_enable(dsi, vc, false);
> -
> -		/* MODE, 0 =3D command mode */
> -		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 0, 4, 4);
> -
> -		dsi_vc_enable(dsi, vc, true);
> -		dsi_if_enable(dsi, true);
> -	}
> +	if (dsi->mode =3D=3D OMAP_DSS_DSI_VIDEO_MODE)
> +		dsi_disable_video_mode(dsi, vc);
> =20
>  	dss_mgr_disable(&dsi->output);
> =20
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--c3r2kafugvpdfft6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XlOwACgkQ2O7X88g7
+prILg//eeraAoLtGrBjGZLK+T65Hi43W/BGTPf1NTH8Gh3IIoJdWWTIjBY+IRj/
eoq0MQnEk4wURVM3RnpMdAzXCxLNOAiv0mV11DWb4SWKH7zBroulu3Y3hIWtUwu4
2BTXrUJYSUBfdL6oySfvFGLqCHX76N/kRROH63u9Elm5H1Z7LenrO6pZglhhmJPH
sTYkS5HI/9ZynTc7Vq5ZQMwXzet/xcrD1VsINVSVBAEDwbOCxa9i0wWV1x5QrINS
WfjW7F2sHUBS+kG6x9DBtcNOHFfFBa984ccLiI4sv+83fCQtqUz5AqD68hKsqAHM
Fln86PW2l1Ulrbt3Lq+FbMw1AFUacyOEeXDqzLeI80Duxh5fkLFxX9Q+15i9I1wa
dRmlQE03Pd/9X0gd3X5x+iHj7SfTQ1d80VqGYcdF8xY75bD9+a784d9XWiyUmAsJ
rcKxdVnrD1Z1hB5FgCbvALe1okp85KRBNERaPV9kw0DZJwLF0HMGkC2ATxTIhh53
2F5UZ7S4SyVRida5zQJKQNuPLceCjYCJF/DuCCyr5lAqtahX/t1JfBn1TPpUDeQu
CPv9iw1/WWg/wnyr2ZPAdee1lN2MnLtaXfd2dAknopjIyLP8DjdwcxKGeWkOQTkj
lKZwbbW/l7QBP4RRPLG74oxKY/kxDTFZH6n/yrpWXc2xArCDR/w=
=3P0t
-----END PGP SIGNATURE-----

--c3r2kafugvpdfft6--
