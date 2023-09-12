Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6417579D4D9
	for <lists+linux-omap@lfdr.de>; Tue, 12 Sep 2023 17:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236343AbjILPbX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Sep 2023 11:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236410AbjILPbN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Sep 2023 11:31:13 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC2C10EB;
        Tue, 12 Sep 2023 08:31:09 -0700 (PDT)
Received: from mercury (dyndsl-091-248-213-163.ewe-ip-backbone.de [91.248.213.163])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4FD2E660731E;
        Tue, 12 Sep 2023 16:31:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694532668;
        bh=GcRf6NZqzSJ/ZejYxqfXP7qn6W6Jnrp/hSglkVCFlrs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nG0I9x5/OTM8Pkkjta1E6/B5IYvdYrU3qRVrbx4685ao0soN/75ACmc8TOebDMj4W
         k+lzFHVR8iOQzulHF3x2qx1DkK4+1HapoyeCzZBY8bnp24zB0QaWLyBv3BF5YZL0V2
         Y6flQxS+jgA1JeDmZC2rUPrnumYhEwiQmJzmpvoWLDfkQL3DV6TPXutRei0wgmin/O
         6eqb7+VDeVY3S42fGt8O/0jmrWv0FyJSVYns02pd9pcs+/GX0PWVkU8xELMaKlOAcP
         FaL9C+Lp0szSPlX7ZNWWrYJs2+C5F2+UD0Oj4x0u4JuVrzHcCiCWK1Xyjnz6dueZFZ
         qg60moI++Ycxw==
Received: by mercury (Postfix, from userid 1000)
        id 929911060929; Tue, 12 Sep 2023 17:31:05 +0200 (CEST)
Date:   Tue, 12 Sep 2023 17:31:05 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 3/4] ARM: dts: ti: omap: Fix noisy serial with
 overrun-throttle-ms for mapphone
Message-ID: <20230912153105.sflbdvbwxwy2q7kn@mercury.elektranox.org>
References: <20230911040828.39386-1-tony@atomide.com>
 <20230911040828.39386-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qx6z5pkdcgg6ri3h"
Content-Disposition: inline
In-Reply-To: <20230911040828.39386-3-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--qx6z5pkdcgg6ri3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 11, 2023 at 07:08:26AM +0300, Tony Lindgren wrote:
> On mapphone devices we may get lots of noise on the micro-USB port in deb=
ug
> uart mode until the phy-cpcap-usb driver probes. Let's limit the noise by
> using overrun-throttle-ms.
>=20
> Note that there is also a related separate issue where the charger cable
> connected may cause random sysrq requests until phy-cpcap-usb probes that
> still remains.
>=20
> Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: Carl Philipp Klemm <philipp@uvos.xyz>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

A bit of a hack, but I guess it improves the status quo, so:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi b/ar=
ch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
> --- a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
> @@ -640,6 +640,7 @@ &uart1 {
>  &uart3 {
>  	interrupts-extended =3D <&wakeupgen GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH
>  			       &omap4_pmx_core 0x17c>;
> +	overrun-throttle-ms =3D <500>;
>  };
> =20
>  &uart4 {
> --=20
> 2.42.0

--qx6z5pkdcgg6ri3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmUAhDkACgkQ2O7X88g7
+po3gA//T6aRUe305LA5x00jmtGJfD6JORhtsa1FXPvtHh7T/wyAJhCMCe4ve68d
6dd8uiVazWKr5HEaoOK7U4lqHig3oG+6gWYfk1SCtDH1+xONGYmNZ3OYxH8H2y95
VahWMsuexrd6MRkHmNbvDHQ5kkq3QxftawHoCRWU5ixljluPVTpYnPivjkt1dxM8
3sog9H3Hll0/ievr+yi/fdDjibE4QHEezlbS7pAtCxkGH8dP3gD8RT6JD+5e+wVP
cJM8G9u6GXaATLnw+8nYHyStLBelufIMCW9Z9Eh17j3QlFqhvzZAxtEkfTa8DPRk
9k2fK7CV5Bf4DjthBy23Ht2z+CYgfi6IHoUv0l4VmKehRSslwypCGTA/MrtVpXB/
mDziSI75VFJIVRIAbl04vmOsSEjm9G0sMhuG5DMmSXxtvRcM7MgotaDCYl+SAVkO
GxD9wUToS+PMg3i/e/dH7XxJ7NqFtu6W4UnbmC621UG/uVHwZqPkUkfjJ3cdr5EB
ZcMWhE1Nm0aKkl8RSVMYG8V8c9Ir0ZhtlAVOkXx8pijk/JeFZ1791XmmgdYsO6l3
djY8ATFB4jU61npmf0yK2GQjUiH3ZXx/zqT3G2r37vw13wh8QSjSyDVCb3lm/HxS
qHh7syn6iDt/DewrmiG9ZPzEbkJ248OAayBruk1hwgEcCXHH6+k=
=YM5S
-----END PGP SIGNATURE-----

--qx6z5pkdcgg6ri3h--
