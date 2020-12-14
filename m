Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 103822D9B81
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 16:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730884AbgLNPw1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 10:52:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:35886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439511AbgLNPwV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 10:52:21 -0500
Date:   Mon, 14 Dec 2020 16:51:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607961100;
        bh=GjjKET4ROYd7vLP7YotwEKVQ4QwC7/hdTLGB/6/o5f4=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=uobXXG+1bulKxufS3tamsopLW/60bCyy4kQztN8qlpVoOSrabZW1sFL7gumWKFRkf
         sTS1WKa2bwKK79gHJWM/2VObyL8UvMuM9kNDf13wWfazubHJt9uAksDY1TBQq6UO4k
         Drey7ipreNwMMtZO1YAO9EoyMDDMzu+XgrijPSetGys3d8abef5o1xjqkI6viohHcw
         Y/S/UBzYsITdu/A1EBC+mwjpg5oCaKhqap/2jWvr+gSZ5dw5a2Zv26OC6T3wPuslh/
         BoM3m2p175BJjmO2Oy9FkaI/F9dU+HDdDDgjt/Nks0PRKtn9jO9SykL8eOmH8WcQDj
         3VF1yfn9XcTEA==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 14/29] drm/omap: dsi: enable HS before sending the
 frame
Message-ID: <20201214155138.jriutvnibw3pk7qe@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-15-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tsbhh7tmwgh3viju"
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-15-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--tsbhh7tmwgh3viju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:40PM +0200, Tomi Valkeinen wrote:
> We currently use a single VC for sending commands and pixel data. The
> LP/HS mode for pixel data is correctly set to HS by accident, as we have
> set the VC to HS already earlier.
>=20
> However, if we use a different VC for video data, the VC is in LP mode.
> Fix this by always enabling HS mode before starting a frame update.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index 544f5f1eed91..9d210a020916 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3918,6 +3918,8 @@ static int dsi_update_channel(struct omap_dss_devic=
e *dssdev, int vc)
> =20
>  	dsi_set_ulps_auto(dsi, false);
> =20
> +	dsi_vc_enable_hs(dssdev, vc, true);
> +
>  	/*
>  	 * Send NOP between the frames. If we don't send something here, the
>  	 * updates stop working. This is probably related to DSI spec stating
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--tsbhh7tmwgh3viju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XigoACgkQ2O7X88g7
+ppGUg//WF3Q3gopohSbdLxQ7pIXBQwLeudSwLtH+HvpxfEcqtpXaq0sdiowaQjX
ddD8uPncmyiswc4eAYad/uQzDBMxfxq61Jpj3yACQYYTRuxoLn3cF6SZ8fDyMurJ
gS6csq3HXWy9vzRkAWExfyodwod5jH0oz9Jn2xrDdiCtaWIBGdRGH6FCgW6CUAx+
Rd3Q7Xmq1PJjnaHgGtL+N+tCWRE+yOmpnsfBgpqEx9GXSecsbbZ7pUhxzDTMwy8x
fVJVCaf7LVDr8yd44JOrAeD7HniWdz/BGSodWE6ihlYMoxmc/qw/yWJrGn4jxff+
3Ea8OK6wN/cEOh5gvRXHU3WAIv0O+wVXzdxLubPTWRjMVEen9nsVusA0pmVj+ES8
GpfiWK48wh2LLvuY7ewxAUQus22T/Eb/27GnEr9e8/Ywn9zjTpJZL8DlW6eqwCC+
c9rjdKpQrr4doMTqy/Bb3aNybMAylIgwgRzKgdBM4BrqHuy6GxbBRxSAbwOOMC3P
cO/H5XNHOikCT6YygNOnkxbP3vsSRokAuPX/sShlre5LhVqGjLgPTILupYSjl3RF
SoLp/zE9OzXC4xx2quXS6f+8VJh2hVSohWQnJR2c21cfNMiRBbK1NratjxVwC+8L
U7VErq4c3J3vMR0HPM8Oc6gP1GhEQlwwHxcHZKLTDlQbsHw/oyA=
=V9Nd
-----END PGP SIGNATURE-----

--tsbhh7tmwgh3viju--
