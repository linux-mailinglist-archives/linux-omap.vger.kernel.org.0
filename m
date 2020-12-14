Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817E32D9859
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 13:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438525AbgLNMyN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 07:54:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:52878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731645AbgLNMyM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 07:54:12 -0500
Date:   Mon, 14 Dec 2020 13:53:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607950411;
        bh=SB38sjV05ytjlFouFcsreWtv51mdQpttd8pp4gXuAMg=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=gZDcWcbtrUdgNLVfXtK2scUN7//7U7YuIjl2yxHjwm1UPbwhsazGFUWDfioRZN3dJ
         icSxOLGvGCXY6CRPreWXLYOu2GBWkqI7jwpDyBPa0ObTjxf4YSEYD0rzLMW2lOheGl
         ehu11joI7i6X4RmPMszeX/HiVGLctpT/sFQAU1ek8eiSaRoU+VaEPNWWSySP1SatP5
         PYgQNQ/XrE2xtBJ4GbZK7F484eFBVSZZ1SduyHO6AeRcOfq5lKzhM/q6GvkmkSsbd8
         v8DoASCmR2Z4o6jEwJ8qB/u9Ess/RNU7bkxsTY+IhFsYZtf1MfXfoPtPzSpFrCNzHU
         L/k4fNcp+HJ0g==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 51/80] drm/omap: remove unused display.c
Message-ID: <20201214125329.g77nnhmlyizfrhbs@earth.universe>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-52-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xdm7nv5yiwmn63pm"
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-52-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--xdm7nv5yiwmn63pm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2020 at 02:45:09PM +0200, Tomi Valkeinen wrote:
> The functions in display.c are not used, so drop the file.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/Makefile      |  2 +-
>  drivers/gpu/drm/omapdrm/dss/display.c | 58 ---------------------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h |  4 --
>  3 files changed, 1 insertion(+), 63 deletions(-)
>  delete mode 100644 drivers/gpu/drm/omapdrm/dss/display.c
>=20
> diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/M=
akefile
> index 33fe7e937680..21e8277ff88f 100644
> --- a/drivers/gpu/drm/omapdrm/Makefile
> +++ b/drivers/gpu/drm/omapdrm/Makefile
> @@ -18,7 +18,7 @@ omapdrm-y :=3D omap_drv.o \
> =20
>  omapdrm-$(CONFIG_DRM_FBDEV_EMULATION) +=3D omap_fbdev.o
> =20
> -omapdrm-y +=3D dss/base.o dss/display.o dss/output.o dss/dss.o dss/dispc=
=2Eo \
> +omapdrm-y +=3D dss/base.o dss/output.o dss/dss.o dss/dispc.o \
>  		dss/dispc_coefs.o dss/pll.o dss/video-pll.o
>  omapdrm-$(CONFIG_OMAP2_DSS_DPI) +=3D dss/dpi.o
>  omapdrm-$(CONFIG_OMAP2_DSS_VENC) +=3D dss/venc.o
> diff --git a/drivers/gpu/drm/omapdrm/dss/display.c b/drivers/gpu/drm/omap=
drm/dss/display.c
> deleted file mode 100644
> index 7b7ee2019eae..000000000000
> --- a/drivers/gpu/drm/omapdrm/dss/display.c
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (C) 2009 Nokia Corporation
> - * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> - *
> - * Some code and ideas taken from drivers/video/omap/ driver
> - * by Imre Deak.
> - */
> -
> -#define DSS_SUBSYS_NAME "DISPLAY"
> -
> -#include <linux/kernel.h>
> -#include <linux/of.h>
> -
> -#include <drm/drm_connector.h>
> -#include <drm/drm_modes.h>
> -
> -#include "omapdss.h"
> -
> -static int disp_num_counter;
> -
> -void omapdss_display_init(struct omap_dss_device *dssdev)
> -{
> -	int id;
> -
> -	/*
> -	 * Note: this presumes that all displays either have an DT alias, or
> -	 * none has.
> -	 */
> -	id =3D of_alias_get_id(dssdev->dev->of_node, "display");
> -	if (id < 0)
> -		id =3D disp_num_counter++;
> -
> -	/* Use 'label' property for name, if it exists */
> -	of_property_read_string(dssdev->dev->of_node, "label", &dssdev->name);
> -
> -	if (dssdev->name =3D=3D NULL)
> -		dssdev->name =3D devm_kasprintf(dssdev->dev, GFP_KERNEL,
> -					      "display%u", id);
> -}
> -
> -int omapdss_display_get_modes(struct drm_connector *connector,
> -			      const struct videomode *vm)
> -{
> -	struct drm_display_mode *mode;
> -
> -	mode =3D drm_mode_create(connector->dev);
> -	if (!mode)
> -		return 0;
> -
> -	drm_display_mode_from_videomode(vm, mode);
> -
> -	mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> -	drm_mode_set_name(mode);
> -	drm_mode_probed_add(connector, mode);
> -
> -	return 1;
> -}
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omap=
drm/dss/omapdss.h
> index 4e7ae164de4f..90e41c635e45 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -300,10 +300,6 @@ struct dss_pdata {
>  	struct dss_device *dss;
>  };
> =20
> -void omapdss_display_init(struct omap_dss_device *dssdev);
> -int omapdss_display_get_modes(struct drm_connector *connector,
> -			      const struct videomode *vm);
> -
>  void omapdss_device_register(struct omap_dss_device *dssdev);
>  void omapdss_device_unregister(struct omap_dss_device *dssdev);
>  struct omap_dss_device *omapdss_device_get(struct omap_dss_device *dssde=
v);
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--xdm7nv5yiwmn63pm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XYEkACgkQ2O7X88g7
+poNng/8DlpMefYihBf9TP2BpT9QEQ1yizL2hVBeyySY4qL3OFXDtypMiMf/WvG2
YFxdb4Xaq7dqFMhnnqou2sS2+mo0n6XE++fVWkiz9Y+qnqy8jx9z/UMfDitbI2ug
oMWru5jV7GFiH7M/fDdHEBwsuLgP+tm85cBeJ5PNLcZI13Rre4kD4lU/3OUGbrNy
oqoPydl1mvb6LjKxckVu2VQUCLRHff292IZku47HltnzFzCo4MJrDwaiVhDD4ZAc
QKdH+HutgYNTV0+FoOcCJ2G+eBvsVCXN+z/K9bHCH4UVsEslLwlKQvUFkJSOnUkv
ps5x1+ZFAmnaL3NY6AWzIRUwpWn09+9t027vCPpG4KnBT+ZLcFgqwF+xeXo7yeXC
NPVZVaI0se53IUojIHlnpABJ++WaXKfe58obqy84BSVfunB1B9YN/lUWp51682/y
/L5hHHhdnwMhKMZ6c+I0bSZfieC1ragAaEAN09/in97h4KAb7v2tOR+QOb1gBGBJ
fITv4IbPzSM4dSRQujzBOr3sbXCPh44p7Djn7U7dCLPPHtTdLkpovq/rN3bgUAXC
Vg7GAI92jvbzVyDS11ZH3i22uAy92LjiXr7OWdVAihKjI7EByTFktsNx4GhT6mXT
b5UMdHEqwzIzH0x00/v7fbVlmjdQk+fA1iGuS+1VO7AQUVathXg=
=wl3Y
-----END PGP SIGNATURE-----

--xdm7nv5yiwmn63pm--
