Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 611B32D9891
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 14:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389597AbgLNNKe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 08:10:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:56450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726238AbgLNNKd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 08:10:33 -0500
Date:   Mon, 14 Dec 2020 14:09:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607951392;
        bh=Om4At/iWxZmtCHFK13AH+hcGkxk36oypPrFfiePhy+Q=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=QlTz/ebyNry2YzbXiwRaWqNuK0USra00/p0wKWZ65nvBPhDN0TJOu06ilJGQBrdZD
         74kGoNYVWbqKaYSOuEzbphqV3Ij/gOPgjIYO0idPEDdHLF53Vs0Uyv/b23cKbtFfNG
         kKO6oXWrjHnSAI31sOLjK2POL5ZFqeOt5rIJxghyJKnxDh7cZ6xbkeEaIPBzKfHlTV
         cGlObHatQbk+vj9gUJyrhRvcElPlLwhxQ/vEnqkRPpODA8JHHZv5rz4QrqXn1Qf5ZC
         bA6xHrhSxjqCR6UlDSjbjeqEpvaH0Df/qUuuY4Skrlyl9EYl2g91qWCg2bd153iJNx
         9ST15dEyPnT8Q==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 02/29] ARM: dts: omap5: add address-cells & size-cells
 to dsi
Message-ID: <20201214130951.gzaw2dpfyod4oltf@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-3-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="giq2blqog2yahvgu"
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-3-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--giq2blqog2yahvgu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:28PM +0200, Tomi Valkeinen wrote:
> Add address-cells & size-cells to DSI nodes so that board files do not
> need to define them.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Acked-by: Tony Lindgren <tony@atomide.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  arch/arm/boot/dts/omap5.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> index 2bf2e5839a7f..e6f6947965ef 100644
> --- a/arch/arm/boot/dts/omap5.dtsi
> +++ b/arch/arm/boot/dts/omap5.dtsi
> @@ -517,6 +517,9 @@ dsi1: encoder@0 {
>  						clocks =3D <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
>  							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
>  						clock-names =3D "fck", "sys_clk";
> +
> +						#address-cells =3D <1>;
> +						#size-cells =3D <0>;
>  					};
>  				};
> =20
> @@ -549,6 +552,9 @@ dsi2: encoder@0 {
>  						clocks =3D <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
>  							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
>  						clock-names =3D "fck", "sys_clk";
> +
> +						#address-cells =3D <1>;
> +						#size-cells =3D <0>;
>  					};
>  				};
> =20
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--giq2blqog2yahvgu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XZB4ACgkQ2O7X88g7
+pooHw//auYD7EXlgoFzZZMgzGx0pZZyLvVCfqwli5j5ILId9zLvIOzCREmtsATH
MCz+kNfOEXZG0Om/obi8gSp4EavDceKmc34zrQMMHVaEWCQEl6tWV2sGCigZXUp0
hrB8oWuyjFEIFNqnVC9bFyOWLGfxOEX2aJqM4YddomSBzzgTJkbdPfN9YnOhIvTC
xX+MCH42kFBuAVda12lvYeigNx5u0Wg69Lu28s3GLvi+vk6R6Gggmf0YHZDi/pFI
G7ckljiLLUDvnmbMAWldPSW9O/EUqNY7xMKIZbE3jcbLgP8V5LuhcNt24U1Otxrn
qOgwu3HaA8n9z5Aq5hBMIhftiv8eA3yfAgdDIAShOIgGW5H1CRevaGK5zsMfOZ3i
0cm6CUoyUxqlCGZ+yhT92EM04wxPH+4GULa+uSuse/aCGHTbTeQENPbE7iNd3yNh
HigIEFboKS4NXEtqwunlmrHsDTv8ekYbgpgA8OIO8kCdP+aD0zDKGoj9W0p64+kv
9vieUI5fiVddIx5U8THMLZDcpIZ6LyIujrccBguoH52pCePizSQCLB6lkrCRhSUH
dEV2rmdDgj1X0zHzFcxr7ET4FhRu4cQRrzQhF2H4MyF3z6FD+n/NCp8HwVbgnzKU
HqK44fxTUJmiujU4VlLRHFyTF9Quj9RhJCPQsdr2uvKmr8mo7EM=
=TrkO
-----END PGP SIGNATURE-----

--giq2blqog2yahvgu--
