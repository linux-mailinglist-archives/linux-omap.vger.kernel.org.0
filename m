Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE50A2D9C63
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 17:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgLNQSL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 11:18:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:52754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440204AbgLNQSJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 11:18:09 -0500
Date:   Mon, 14 Dec 2020 17:17:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607962647;
        bh=c1K+krtUaBbI/TA7v2TyJKDGs1Z5TXt72dnX1Ep2DAM=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=eJJM3UAjjh1eA2Sh79sH95tAu9Z7E4Y29d3xHK/Fb8mEsDX+d0Pg5LHQYAMkvTluo
         bIyLhb4OKi6qieZY8Qj8lTqWrfXX2SMUKylZwQzJL+3Rmo1FFAuPSKHAOp5lF9SS61
         6efl+dULr/SL/SHYTPvOMItKikHof53yfM+WuLEfwyBG9PgkYwUGhVJNqmsHv9VaE5
         jgQL6EYS8TMBBAtPMop5jWjD7/4m4IunpuqbZRmDP/P+Mzt/xE0IMtJwLlXF0A7sS2
         31iH7CZ3wGbraiTTUXjpedFT9bWF/RZF3/BeFAB2jB4O2DNtxfYlItQhbaV0//lrJ0
         cSmsiztuC/eYA==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 21/29] drm/omap: dsi: display_enable cleanup
Message-ID: <20201214161725.hxbvstdrqp2u3y22@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-22-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lnu4432oenmvxfuw"
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-22-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--lnu4432oenmvxfuw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:47PM +0200, Tomi Valkeinen wrote:
> We can drop dsi_display_enable(), which just calls
> _dsi_display_enable(), and rename _dsi_display_enable() to
> dsi_display_enable().
>=20
> The WARN_ON(!dsi_bus_is_locked(dsi)) in dsi_display_enable is extra and
> can be dropped, as _dsi_display_enable() has the same WARN_ON().
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index 44b8e42b52ec..961b991f6498 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3743,7 +3743,7 @@ static void dsi_display_uninit_dsi(struct dsi_data =
*dsi, bool disconnect_lanes,
>  	}
>  }
> =20
> -static void _dsi_display_enable(struct dsi_data *dsi)
> +static void dsi_display_enable(struct dsi_data *dsi)
>  {
>  	int r;
> =20
> @@ -3772,16 +3772,6 @@ static void _dsi_display_enable(struct dsi_data *d=
si)
>  	DSSDBG("dsi_display_ulps_enable FAILED\n");
>  }
> =20
> -static void dsi_display_enable(struct omap_dss_device *dssdev)
> -{
> -	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> -	DSSDBG("dsi_display_enable\n");
> -
> -	WARN_ON(!dsi_bus_is_locked(dsi));
> -
> -	_dsi_display_enable(dsi);
> -}
> -
>  static void _dsi_display_disable(struct dsi_data *dsi,
>  		bool disconnect_lanes, bool enter_ulps)
>  {
> @@ -3856,7 +3846,7 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi,=
 bool enable)
>  			return;
> =20
>  		dsi_bus_lock(dsi);
> -		_dsi_display_enable(dsi);
> +		dsi_display_enable(dsi);
>  		dsi_enable_te(dsi, true);
>  		dsi_bus_unlock(dsi);
>  	}
> @@ -4947,7 +4937,7 @@ static void dsi_bridge_enable(struct drm_bridge *br=
idge)
> =20
>  	dsi_bus_lock(dsi);
> =20
> -	dsi_display_enable(dssdev);
> +	dsi_display_enable(dsi);
> =20
>  	dsi_enable_video_output(dssdev, VC_VIDEO);
> =20
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--lnu4432oenmvxfuw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XkBUACgkQ2O7X88g7
+pq6YA//cRHW1MZbJl5+QVXPMVkGXvAdrnMrzUoJ8twq9RVhNMlz+VRhawD4HFAD
l33Rf5pz/aMiecVoFMRNp28VXOyD0lO0boPBnwPfq/0YcYpTBbFXcEJqDEQVJiAg
eKwEC+YVPFi1wW6kzm2Ynw9nQno0ie21G8qV7CTyD68Nzknaj++AVLXgIn31m0oT
SRN/aSMEngpqCdqRr7mfBOGr4BzxzMkuPSV3Zyg2wlrrq+cSp8voLeM7mQKmIeU5
MiP57A0XXyqWNDO2j8EKfrvpdoB6onON4xXe93MNVF4ylfZH1uByhcOvY+v8dtkw
g2eBuYfCpeafcp54fvh712innZF4M0pdhfTISmWmUQDuuY8qw8iocQwNkK1qwDW3
pf+xjjYy6pIOivsD3zPWMPL79Rw7TTsYuLlBprsJeLYgrIIUv4n7OWkKmJ5e8hic
S/haAnPSESnAG/qDjCnwM3xiAvBUfVaBbJbxTXnXWW1eI4Y5iEJC1WYUxc1MW1xY
YNbslHGpEF9pbZMVeK8QxlHWI7JkndPj1MbaE6xSEI77YmT7riVv7unWn2JERsgg
YdQYkOk7eHYe4PfqKBfYN3GjWQcYCAXLMXs86l2sYBvcjlGm1o9r9fWYphfpLFgQ
rWX+78oBRrd6Wf2KMNsiF/o/ayae8TndEO35UupXuIIQU1jhnIU=
=Yhnq
-----END PGP SIGNATURE-----

--lnu4432oenmvxfuw--
