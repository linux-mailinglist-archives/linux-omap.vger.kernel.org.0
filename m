Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A884179D4CC
	for <lists+linux-omap@lfdr.de>; Tue, 12 Sep 2023 17:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233996AbjILP3e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Sep 2023 11:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjILP3d (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Sep 2023 11:29:33 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC28110D9;
        Tue, 12 Sep 2023 08:29:29 -0700 (PDT)
Received: from mercury (dyndsl-091-248-213-163.ewe-ip-backbone.de [91.248.213.163])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A62E9660731E;
        Tue, 12 Sep 2023 16:29:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694532568;
        bh=XnEP1BKlT634AYUIHBVJe7zvi+g5YyTPJw+SRc2rQ60=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QsVT3fVygJEh1XLiLx7FCYcw6VuzGwcgfbwykyz56B17Uy6+ApDw3lXPdm0trGKGy
         xDjz9bVWBO+XzonQPD+O9bXHFi+pggcTDEKcBeQPb7wrg6qI46aDSdNKT+fFi4ANsM
         TxGvxBu/IyOm6am0EXSxMqIOli0/89xM6wHjxGg4zMVY65GaOmAbipmgvcltJEtQxX
         2aaQKdVL0+p5PETxa0VYHAVearA8KfboAe5s8dc1edKgWVgswj+WDrH9ksi3aiv4l2
         So2URHmmtHU/glIp5hG8Lcu/Tv6adCL1XzKbofzOQZYcUpIPw11adczblOeAcF2s+3
         kR9hEIBfN+xJA==
Received: by mercury (Postfix, from userid 1000)
        id 7AB331060929; Tue, 12 Sep 2023 17:29:26 +0200 (CEST)
Date:   Tue, 12 Sep 2023 17:29:26 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/4] ARM: dts: ti: omap: motorola-mapphone: Fix
 abe_clkctrl warning on boot
Message-ID: <20230912152926.m24zo6lgxkwl37ct@mercury.elektranox.org>
References: <20230911040828.39386-1-tony@atomide.com>
 <20230911040828.39386-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="muwlkieyvxcofpaq"
Content-Disposition: inline
In-Reply-To: <20230911040828.39386-2-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--muwlkieyvxcofpaq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 11, 2023 at 07:08:25AM +0300, Tony Lindgren wrote:
> Commit 0840242e8875 ("ARM: dts: Configure clock parent for pwm vibra")
> attempted to fix the PWM settings but ended up causin an additional clock
> reparenting error:
>=20
> clk: failed to reparent abe-clkctrl:0060:24 to sys_clkin_ck: -22
>=20
> Only timer9 is in the PER domain and can use the sys_clkin_ck clock sourc=
e.
> For timer8, the there is no sys_clkin_ck available as it's in the ABE
> domain, instead it should use syc_clk_div_ck. However, for power
> management, we want to use the always on sys_32k_ck instead.
>=20
> Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: Carl Philipp Klemm <philipp@uvos.xyz>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Fixes: 0840242e8875 ("ARM: dts: Configure clock parent for pwm vibra")
> Depends-on: 61978617e905 ("ARM: dts: Add minimal support for Droid Bionic=
 xt875")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi b/ar=
ch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
> --- a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
> @@ -614,12 +614,12 @@ &rng_target {
>  /* Configure pwm clock source for timers 8 & 9 */
>  &timer8 {
>  	assigned-clocks =3D <&abe_clkctrl OMAP4_TIMER8_CLKCTRL 24>;
> -	assigned-clock-parents =3D <&sys_clkin_ck>;
> +	assigned-clock-parents =3D <&sys_32k_ck>;
>  };
> =20
>  &timer9 {
>  	assigned-clocks =3D <&l4_per_clkctrl OMAP4_TIMER9_CLKCTRL 24>;
> -	assigned-clock-parents =3D <&sys_clkin_ck>;
> +	assigned-clock-parents =3D <&sys_32k_ck>;
>  };
> =20
>  /*
> --=20
> 2.42.0

--muwlkieyvxcofpaq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmUAg9YACgkQ2O7X88g7
+poOyw//aihh5hROGPQqRgM+hGV/Vm569Zh/1gJxLYV8caN7xaoWdzUhjXdjZo/+
qwbiAVvwUji5zCKhBDt6bRoSunUdJPRWXKERZSNtWfWTN5ynFAV+Y+247uHg5uJk
85jUGT4m6YGaGJ5E0OHlwMG0heMdo7B0qCspAzuaYXNZE5d6RI47qBMNw+ATVwdh
8M7UfQkI1ktvCiYSqqFJeLiBYVqjAyCE56eei8aN9JFsVAwFf/uylcHtNiwjmQfJ
kr6Q/8YuDpcdbAWqWnNna3ZDIrCgz0BI8aG3MMYvYRQln0e291NVpQ1WCwdlAI+C
JTMBF6UdvbaUaDHDpSXvBRcXVKZtG9Zjs6Izy24owdV4OxPmG5o66FU+udhd3iRe
15CZHnHGSYYlfpuFp5Ys887vig1kUcO1YRL79GPJhYSkwGZV8Ag6ZvReJJXH1IxL
BnBZL7FUiYILEwmfNkqXPju6LxUzNSIoCxFV3RweKVcXOSIpxf0w3gbgmSE19noC
9vrMcZ8DYPVzfD+p8mkZaoY74hstuz9cpE55CVEqDe13Pu0g+Tb8X3aIx2HqtwjM
vZXQvBNNFI7ta5v1OEn3VEF+Xv18QYcIafDhq5sQY35SBknB3fhDFnHpdpyYxCXE
Dpi2CfcF/1evEN22Q5r15lrpWSU/hc8NNuqEU8hnsOh3xI3A64o=
=iuVW
-----END PGP SIGNATURE-----

--muwlkieyvxcofpaq--
