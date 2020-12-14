Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2777C2D9B90
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 16:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgLNP4l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 10:56:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:37474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731534AbgLNP4e (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 10:56:34 -0500
Date:   Mon, 14 Dec 2020 16:55:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607961353;
        bh=7vCSGPuVmcJcIU053wxeeFt/OHphBY/y22MGgCi5USA=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=d6sNZcyhT7+iZuJ3dO0vhKEuz84fqSaZkvwShFZt78TvNvlCx42L0EK2VjUKhyAA4
         JXQFBUuMrOdbTGXk9PVU+A/OqqHjOAd9v4e05XaoX9oHn6orslR9aBhZCm3wtTlznw
         z6P6HPErBIHOcMkkHPO7kMw5NiAhhQa0SSHEx6hOYO5Aogmr4S6u9jwBJKvGBh7ObY
         T7rKUDTZnNdse0t/8UMkBRfV5m1VNkVtv6bymX5Fv0PhrQZvv1rzCi/plqzx5nSa11
         mNfNDdbtlwXPgJ7UoNz+mSQYuFmkCZ0j1gxzjyjdJ3moaSBHsFcxNWWZl8q4quTXBl
         VuBDNDTRQCQnw==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 16/29] drm/panel: panel-dsi-cm: remove extra 'if'
Message-ID: <20201214155551.k3jpvgjuxn2lr2bk@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-17-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ggtzqcqnf3xbhkml"
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-17-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--ggtzqcqnf3xbhkml
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:42PM +0200, Tomi Valkeinen wrote:
> We have a useless 'if' in the dsicm_bl_update_status(), a left over from
> the conversion to DRM model. Drop the if.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/panel/panel-dsi-cm.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel=
/panel-dsi-cm.c
> index 556f9a2c5c0c..fa564aad7f25 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -202,11 +202,9 @@ static int dsicm_bl_update_status(struct backlight_d=
evice *dev)
> =20
>  	mutex_lock(&ddata->lock);
> =20
> -	if (ddata->enabled) {
> -		if (!r)
> -			r =3D dsicm_dcs_write_1(
> -				ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
> -	}
> +	if (ddata->enabled)
> +		r =3D dsicm_dcs_write_1(ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
> +				      level);
> =20
>  	mutex_unlock(&ddata->lock);
> =20
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--ggtzqcqnf3xbhkml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XiwYACgkQ2O7X88g7
+prvZRAAj8/YuLu7eqqReaHRl8SdWzUXVVAgO+vkMBT8MPnJkEuCeE5NbruHWLqH
8JzJna9aDdEZxVCS0PgPVoJK1SgVsomjfWjReDJaJ5B2rHprG1HcK+5sCClxlOWx
suGTBOqvaeKJkUks/u6ljc6PjZRnpAJqHtbhQDpk3W+rxvmP8fojyDuAO1O8Buzs
amxH4/TfPHBXa583/RHoT3sdq0MJYdAEM/uOYU11F8Wijy7JtfOP2jHJBT2SHqqR
MVWuxV5Vl7A8uEHOiSS5pHGMTCM0yXhdJCgauYjECHvLYUA8e5O+4AizuXxwNAGO
y02FK7Mxzr/n7LQCWjXkSW18CRWLw4nCld584vN+1HWmemIwg9sc0s6l8dsOsGVc
FE2zCg99Nk/7X0Vsp4nXxlL8tzXzF71zPsGXLJZceJAZJIdHp6X0emscpm0oVKW7
oCk/60+8SYGhrAtGHGnL1p1dCkN/KoPryEaAFY2AhZVfKSWnyVrLuhBo/ytwM0DO
/SsxRbdEQNFzLVA9KgX2Ov+Nf/oIAEco59PuJ7BG2HhjNZdfVINI8wgJCmdDAKLh
hPq7jDrHDhXWH1nNNNGD2GYX8U59B0hblGv2+/GoFGDClCq86HY45xk3CaiMP3QN
TvsBejgpNOAJRL7vMW2CzVyM/kY+f9IADNZpxKgalhst1PhOvRA=
=XSBz
-----END PGP SIGNATURE-----

--ggtzqcqnf3xbhkml--
