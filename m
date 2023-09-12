Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E70A179D4A3
	for <lists+linux-omap@lfdr.de>; Tue, 12 Sep 2023 17:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236255AbjILPSP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Sep 2023 11:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236178AbjILPSO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Sep 2023 11:18:14 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5BD212E;
        Tue, 12 Sep 2023 08:18:10 -0700 (PDT)
Received: from mercury (dyndsl-091-248-213-163.ewe-ip-backbone.de [91.248.213.163])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 85994660731E;
        Tue, 12 Sep 2023 16:18:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694531889;
        bh=wUgn4yJqWM2bSNm5mRsVV5O/E7nUNgCaMxCsYyDQfe8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nJ1nHxXjzAJJ6CCZzrYEiahnq4MsuUWbLmNgw/dvqOsd5eFF7ibvpp5Mt5iPuf/80
         bvzkNq3n6CmJbHkJrcefHdGHcwjoeprLE5VehxnGtisoLkTqTZAmQ5ewDmKKsMAdgh
         yBZYaNZTT5z9hQtde21DfM9DPfP8s3Kh6m7zyJyelkZ3ZGccujIx3kUaQrAoJj+ejF
         v2FALfHcyTc1RcVwKOZ5OqRTW4VgIhgXH+m2gXu6EESQSrxJehTLBMCiLaliumwq+2
         K4qile6rmrSrGcfQ+6DuCKmx/p5x4m4XUxUVztWHSx8gh75mhR0C8DbxAxKaXmv1eL
         cZbibWIEu9Iww==
Received: by mercury (Postfix, from userid 1000)
        id 966061060929; Tue, 12 Sep 2023 17:18:07 +0200 (CEST)
Date:   Tue, 12 Sep 2023 17:18:07 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] ARM: dts: motorola-mapphone: Add mdm6600 sleep pins
Message-ID: <20230912151807.y7h7tvbldmfljmjd@mercury.elektranox.org>
References: <20230911035828.36984-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ekf4yjsajtq7woel"
Content-Disposition: inline
In-Reply-To: <20230911035828.36984-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--ekf4yjsajtq7woel
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 11, 2023 at 06:58:28AM +0300, Tony Lindgren wrote:
> The sleep pins never got added earlier probably because the driver was not
> behaving correctly with the sleep pins. We need the sleep pins to prevent
> the modem from waking up on it's own if the reset pin glitches in deeper
> SoC idle states.
>=20
> Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  .../dts/ti/omap/motorola-mapphone-common.dtsi | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi b/ar=
ch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
> --- a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
> @@ -67,7 +67,8 @@ hdmi_regulator: regulator-hdmi {
>  	fsusb1_phy: usb-phy@1 {
>  		compatible =3D "motorola,mapphone-mdm6600";
>  		pinctrl-0 =3D <&usb_mdm6600_pins>;
> -		pinctrl-names =3D "default";
> +		pinctrl-1 =3D <&usb_mdm6600_sleep_pins>;
> +		pinctrl-names =3D "default", "sleep";
>  		enable-gpios =3D <&gpio3 31 GPIO_ACTIVE_LOW>;     /* gpio_95 */
>  		power-gpios =3D <&gpio2 22 GPIO_ACTIVE_HIGH>;	/* gpio_54 */
>  		reset-gpios =3D <&gpio2 17 GPIO_ACTIVE_HIGH>;	/* gpio_49 */
> @@ -476,6 +477,23 @@ OMAP4_IOPAD(0x142, PIN_OUTPUT | MUX_MODE3)
>  		>;
>  	};
> =20
> +	/* Modem sleep pins to keep gpio_49 high with internal pull */
> +	usb_mdm6600_sleep_pins: usb-mdm6600-sleep-pins {
> +		pinctrl-single,pins =3D <
> +		OMAP4_IOPAD(0x0d8, PIN_INPUT | MUX_MODE3)
> +		OMAP4_IOPAD(0x07c, PIN_OUTPUT | MUX_MODE3)
> +		OMAP4_IOPAD(0x072, PIN_INPUT_PULLUP | MUX_MODE7) /* Keep gpio_49 reset=
 high */
> +		OMAP4_IOPAD(0x14e, PIN_OUTPUT | MUX_MODE3)
> +		OMAP4_IOPAD(0x150, PIN_OFF_OUTPUT_LOW | PIN_INPUT | MUX_MODE3)
> +		OMAP4_IOPAD(0x07e, PIN_INPUT | MUX_MODE3)
> +		OMAP4_IOPAD(0x07a, PIN_INPUT | MUX_MODE3)
> +		OMAP4_IOPAD(0x078, PIN_INPUT | MUX_MODE3)
> +		OMAP4_IOPAD(0x094, PIN_OUTPUT | MUX_MODE3)
> +		OMAP4_IOPAD(0x096, PIN_OUTPUT | MUX_MODE3)
> +		OMAP4_IOPAD(0x142, PIN_OUTPUT | MUX_MODE3)
> +		>;
> +	};
> +
>  	usb_ulpi_pins: usb-ulpi-pins {
>  		pinctrl-single,pins =3D <
>  		OMAP4_IOPAD(0x196, MUX_MODE7)
> --=20
> 2.42.0

--ekf4yjsajtq7woel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmUAgS8ACgkQ2O7X88g7
+pq7KQ//b1jE2qW5thVccJfpcKI0x8PvWOX9gpltf8UqzTgQQyt2tfRXGL6erBMt
AaS9TQo/K10eodda6nTywQ+q3N6QC5bR5/0JlgjjneEwAc/kYxflxHtfnPnd9p9u
Xh+YHjtpm3DzCo/j/FUvKcAgLlnL4e08j0Ao/WsxJjyitJrxccrq+8fMRvL8xjqB
y+1eqKIzVg21y3sgjxDiBOlu/GvEmxyFyXL4qdVkpsSanyRZEqv+zzuyRcYDKkQk
zDPlC4ehdrfntZv8y171YDFrziiLy4wsLyiq7KHWH3Mb5314XZgJSYgmQzwpggqg
1YhHJNTLFOjEnaAXMLt5ax4re9ZK8izcvs1SJmqkJ2YzKjlidOlS4hpLbG/uu5A3
kcQ++15D9DSpHCpjyQHFqLejYuwlVAjR4Y+YLbO0xRCMDOR16TBvHAZCxxfa0RA2
+9pbT6ifD+2sx1fJvAR1UBVX3PGs+dMVroOevVJLPLTwkIVN6Pim2+sqt+zdKhH2
rOTSYS2Zc/yDAwj5IJv+WRoWw+1PLbGUvcBBSpxtDJBQfQUhUh8CARSUyaOnZ4Pw
7sTsQOprpHap8R+yMci6PkzevQYWBsl1ZVd0bfbrtDFImSDkEjJpG7CzPO053mlW
qllCvr3tOWs4YNtxkDUUSIkgyOqoMq26Mif6NwVBEx80U2Ntj5Y=
=KL6z
-----END PGP SIGNATURE-----

--ekf4yjsajtq7woel--
