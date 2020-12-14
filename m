Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD482D9868
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 13:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731706AbgLNM4D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 07:56:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:53334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393401AbgLNM4B (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 07:56:01 -0500
Date:   Mon, 14 Dec 2020 13:55:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607950520;
        bh=wL6tbZ04v3VSegFNbcSa5SbxeXlD9tm/Hi7QXVOhENI=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=fAy9CJ3KK849dwH5VmOqBd65Yda7jbzpRytuOsrzSKaiQ734otfsdMiR4w/v1trry
         a7I+WyQOUscaIT0GqPoicin6FwUT/GQ1J1QRraZ4k/4dh65Yg+tjhjBRlxOWGDmWTl
         2dnpWzSUsjpsAAOcNsFU5nP+6mYE+G0C/RtzZ2hSDHoZ8EL8gF81mSpFMun6qu/hOS
         zwN+JNrtq5txMkAp9U3u2SbeKo4kuuVQAknyxbUIHczMVioOhhSy+30EfeFfdBPEAe
         Sc6BmO42iol71SNfWwXLzJ0DlyESl/nppZPqHyLMBawTq0SZBz0AZLpKqw920jyyKf
         f5f1XpL8wD8rw==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 57/80] ARM: dts: omap5: add address-cells & size-cells
 to dsi
Message-ID: <20201214125518.5wrwpg2zputslrj7@earth.universe>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-58-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fgz5cvclt2rkobwi"
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-58-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--fgz5cvclt2rkobwi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2020 at 02:45:15PM +0200, Tomi Valkeinen wrote:
> Add address-cells & size-cells to DSI nodes so that board files do not
> need to define them.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
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

--fgz5cvclt2rkobwi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XYLYACgkQ2O7X88g7
+ppeYA//bd2FmbxtnNJaqj/4Q0A4Bt/Rr+bY7cC/6RK7YdL0SvxGgT1B2QFE/Oh1
GESKJGNOnH35z0n0nQZa2mPJXfuLEeMekgq0vInvCca3V9ANb6mZQroPYFbMjAhD
wlhKfZN7YdpimSG4r8nGhdUo9N8ZDeulVzdtCZlKvr4S1rXS7UckqtJox4HpIamJ
0CCcfVZ6fCtqeKq4cQGiywFHXit07bO9tOMZDyAi38y3PngQXRaO9vCFnnidhPWm
7V44/fuAjcgKbdDGLrh7IcW/yd6doH212BHiOmOYcDwGxXmxTcBpVRudfRPwdCGp
lA5cf+QeP65iu9Ak0gCHsuMZ8gLoGMoblP38BmlybEyCNMcx3e6J3NC5WMVXCsKC
XNZs6CctZlpOonKgfwJkB1JHQJsfyJli8kqMPXj/xE4YfVC4tgI1rxw0fgie4A8h
rxa8kXAfsz0hwFgkxePH/HRr93BxHm1xs911b4tD7nZ4I4Er8D/fLeo2grncJG3x
mdEOXUoOq6eSbU5zL/691xuhXVk32pV011pLu1J23/zZbkhMqU5G8eN3Wf5kb9Ul
kp99/88umY9XbQavtWyebhUw07Bo+3fhgqS069tE4e7t6kToX9qUt4V6sCrnG+/n
zuspHniYZ5SnngSUme2+4SgFb9ZeKKgZfz6gUJhiWLoyncB8USw=
=cil5
-----END PGP SIGNATURE-----

--fgz5cvclt2rkobwi--
