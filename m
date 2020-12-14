Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7E02D9CF3
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 17:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729730AbgLNQtN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 11:49:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:47764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440217AbgLNQtH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 11:49:07 -0500
Date:   Mon, 14 Dec 2020 17:48:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607964505;
        bh=9kMLCfSpuFQdWZPs6kc2Uydre4Z/2uro9ImhzGPkKJQ=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=tkEgm+Xh+sn3rUFce+lG/uTmRKTA5/ePP25836VpjJ6HNZMwqDvFK+wJh+mmpCTCx
         JeayDMFl5h77ANoIS/XPqYx1wXInSyk9hTXdidTBAqMgQs0v+R8r3kA+p2vPm2wzjx
         KT2NvKg//ifSAvESEUhpbZNHyK6yUSgBnMe7lThOKNUNnmgeY0BwRTQMjWXwWk7z43
         HogrP91egfucyi8t0EO+q8XSHCjfVEZrs9fB9rjodrCay+3rOFKKnV4kpd1bKZ6slh
         xBHbLdeNYr+oCcQUGI6M0ZlcFqV64SGVMiLJ+FfYrj1DKCxX8/toSmXS5mio2WmZQy
         fWIiu0h4Qaeqg==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 28/29] drm/omap: dsi: fix DCS_CMD_ENABLE
Message-ID: <20201214164823.kfnrialhet2sc6yi@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-29-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k57dygny366smvxb"
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-29-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--k57dygny366smvxb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:54PM +0200, Tomi Valkeinen wrote:
> We only need to set VC_CTRL:DCS_CMD_ENABLE for command mode panels when
> the HW has DSI_QUIRK_DCS_CMD_CONFIG_VC quirk. The old code did this
> right by accident, but now we set DCS_CMD_ENABLE for video mode panels
> too.
>=20
> Fix this by skipping the set for video mode.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index b2aa07a09dcd..53a64bc91867 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3406,7 +3406,8 @@ static void dsi_setup_dsi_vcs(struct dsi_data *dsi)
>  	REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 1, 1); /* SOURCE_VP */
>  	dsi->vc[VC_VIDEO].source =3D DSI_VC_SOURCE_VP;
> =20
> -	if (dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC)
> +	if ((dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC) &&
> +	    !(dsi->dsidev->mode_flags & MIPI_DSI_MODE_VIDEO))
>  		REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 30, 30); /* DCS_CMD_ENABLE =
*/
> =20
>  	dsi_vc_enable(dsi, VC_CMD, 1);
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--k57dygny366smvxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/Xl1cACgkQ2O7X88g7
+pqx/RAAmu58Nc/or4zCAqFsoAP1bahuUaJ2wNAUZUExKvWhp9zvFOtu8s978iV+
9p4awL4afpkydCd8Qii4M1OKO55UHYV6PN0aEUeszhJU5WuSS+Qv68TT175MYgO7
PPBWxByK57E/3ab9fPkzzpGKqHJkolf71hekwzPbaCPBumnap/zcch5XCX2nI4Do
hGfkkLl/uZZRoZyNSuZzyhgoWEZgvkcEDFGSYMhlQpAQObsoDzCF6KcYxDIXuTaR
bBGwt9CcdPTVr5nJF20puRUiwqAjn1k5zZoSbjRuTQs6XR2u9IxZ+8gnsF9WKe5X
ZQVpGoMGboeaO9FHog0zc5pjXE4Q61iL5rLB4iTyThUV63Mf5rvCkUSqaMT5LugQ
nFMKLBAQnSYbV6/dfMa1oNy1Gkqt/vA4RBpwxwHHbD5N2kitWWAtwWCajukObkIz
lqCuKEB+MG3gJwYorFxi8yDyqoWKKHqPNf7nmTmYkgOYXbaLCUCbu65PrK7gL0Od
6T+ot0FnRJEqANsBXWes1s8UtgpRd59auK9Y4jV8vIjMgGhateUtEpb9qnzIyTX9
aYrKg3maJUqOaP//JVq0JBmhF5NaKYN3Nw1ZwwEpW39o0y5by8zdBCkdAfsA7GZi
O3ESViGRWrOYNZPrRPhmYlpfxcXdRg8cg7HagTVd6Quj5TwOcXI=
=Cfp0
-----END PGP SIGNATURE-----

--k57dygny366smvxb--
