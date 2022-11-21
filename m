Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 433576326B5
	for <lists+linux-omap@lfdr.de>; Mon, 21 Nov 2022 15:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbiKUOsT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Nov 2022 09:48:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbiKUOrE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Nov 2022 09:47:04 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C375CD28AD
        for <linux-omap@vger.kernel.org>; Mon, 21 Nov 2022 06:41:12 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox7xw-0004wY-P9; Mon, 21 Nov 2022 15:40:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox7xt-005fnr-Os; Mon, 21 Nov 2022 15:40:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox7xu-000akk-0z; Mon, 21 Nov 2022 15:40:06 +0100
Date:   Mon, 21 Nov 2022 15:40:00 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: Allow decimal format in
 addition to hex format
Message-ID: <20221121144000.7weeyfbbulltfxmd@pengutronix.de>
References: <20221121115525.36362-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mvnzhqz5rtb7bfhq"
Content-Disposition: inline
In-Reply-To: <20221121115525.36362-1-tony@atomide.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--mvnzhqz5rtb7bfhq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2022 at 01:55:24PM +0200, Tony Lindgren wrote:
> Let's allow node numbering in decimal format too.
>=20
> Simple human-readable increments/IDs are usually decimal, hex is only for
> addresses as noted by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org=
>.
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm.yaml b/Documentati=
on/devicetree/bindings/pwm/pwm.yaml
> --- a/Documentation/devicetree/bindings/pwm/pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm.yaml
> @@ -13,7 +13,7 @@ select: false
> =20
>  properties:
>    $nodename:
> -    pattern: "^pwm(@.*|-[0-9a-f])*$"
> +    pattern: "^pwm(@.*|-([0-9a-f]|1[0-5]))*$"

I wonder why you don't make this:

+    pattern: "^pwm(@.*|-[0-9a-f]*)$"

Is there a use case to match

	pwm-1-2-3-4-5

?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mvnzhqz5rtb7bfhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN7jbEACgkQwfwUeK3K
7Ak8dgf/atfKNt71rGzkk4AfyRplgjB1ipeRHY5+IS01+0ucveDejarUIE4B/i2T
ORZmHocWEjjLq4invfvjxNDwlJsp8L8HM8xOt9Kugj892DbNnJ/8iXvV334fwH4S
uNBShNMfq9KYqNsrknxI5IFWXUetgOPbcnHluyZivNTIsbIQxAmPJNBS3Mti7m//
FjD+bHBELl2vXz6wM1oAjkQOZB0rGE0g3UqU7cScGKkX8igwx6FG1Ld1mQSL37ok
zEvmTVyC1kCtdUi+ZDRZGcXCG+rIRnLRxPNfzTAEoxfYckqdXOyPzqu5y8Fe8S9l
ADMczadutThcO+1jTvE/yMGnt4MTeA==
=vPi1
-----END PGP SIGNATURE-----

--mvnzhqz5rtb7bfhq--
