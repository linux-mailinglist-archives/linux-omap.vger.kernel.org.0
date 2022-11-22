Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84A536338A1
	for <lists+linux-omap@lfdr.de>; Tue, 22 Nov 2022 10:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbiKVJhE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Nov 2022 04:37:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbiKVJhD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Nov 2022 04:37:03 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663C84B99F
        for <linux-omap@vger.kernel.org>; Tue, 22 Nov 2022 01:37:02 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxPi1-00068k-KZ; Tue, 22 Nov 2022 10:36:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxPhz-005p96-Ci; Tue, 22 Nov 2022 10:36:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxPhz-000lf9-GB; Tue, 22 Nov 2022 10:36:51 +0100
Date:   Tue, 22 Nov 2022 10:36:50 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: Allow decimal format in
 addition to hex format
Message-ID: <20221122093650.oouke2utlkvdd7r6@pengutronix.de>
References: <20221121115525.36362-1-tony@atomide.com>
 <20221121144000.7weeyfbbulltfxmd@pengutronix.de>
 <Y3uPvYqaILNiYW8K@atomide.com>
 <bb5ac0cf-84eb-165f-40bb-0f3c9afe084f@linaro.org>
 <Y3xTi5JeLPSWchT7@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6a6iqm4s2kez5pu2"
Content-Disposition: inline
In-Reply-To: <Y3xTi5JeLPSWchT7@atomide.com>
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


--6a6iqm4s2kez5pu2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2022 at 06:43:55AM +0200, Tony Lindgren wrote:
> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221121 16:05]:
> > On 21/11/2022 15:48, Tony Lindgren wrote:
> > > * Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> [221121 14:30]:
> > >> On Mon, Nov 21, 2022 at 01:55:24PM +0200, Tony Lindgren wrote:
> > >>> Let's allow node numbering in decimal format too.
> > >>>
> > >>> Simple human-readable increments/IDs are usually decimal, hex is on=
ly for
> > >>> addresses as noted by Krzysztof Kozlowski <krzysztof.kozlowski@lina=
ro.org>.
> > >>>
> > >>> Cc: Thierry Reding <thierry.reding@gmail.com>
> > >>> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > >>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >>> Signed-off-by: Tony Lindgren <tony@atomide.com>
> > >>> ---
> > >>>  Documentation/devicetree/bindings/pwm/pwm.yaml | 2 +-
> > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/pwm/pwm.yaml b/Docum=
entation/devicetree/bindings/pwm/pwm.yaml
> > >>> --- a/Documentation/devicetree/bindings/pwm/pwm.yaml
> > >>> +++ b/Documentation/devicetree/bindings/pwm/pwm.yaml
> > >>> @@ -13,7 +13,7 @@ select: false
> > >>> =20
> > >>>  properties:
> > >>>    $nodename:
> > >>> -    pattern: "^pwm(@.*|-[0-9a-f])*$"
> > >>> +    pattern: "^pwm(@.*|-([0-9a-f]|1[0-5]))*$"
> > >>
> > >> I wonder why you don't make this:
> > >>
> > >> +    pattern: "^pwm(@.*|-[0-9a-f]*)$"
> >=20
> > Yes, the '*' should be within ().
>=20
> Sorry I guess I don't follow. So for what type of naming is the second '*'
> actually needed here, or is it needed at all?
>=20
> We only want to match the following:
>=20
> pwm@1234
>=20
> pwm-0
> ...
> pwm-f
>=20
> And now also:
>=20
> pwm-0
> ...
> pwm-15
>=20
> Is there yet another format I'm missing?

I think there is a misunderstanding about the type of pattern here. Do
we talk about a shell pattern where "[0-9a-f]*" matches a name starting
with a hex digit followed by any number of any caracter, or is it a
regexp where the * means "any number of the preceding pattern", so
effectively a word consisting of only hex digits.

The .* part makes me think we're talking about a regexp, so the old
pattern ("^pwm(@.*|-[0-9a-f])*$") means that

	pwm-1-2-3-4

is allowed but

	pwm-10

isn't. And I think what we want is:

	"^pwm(@.*|-[0-9a-f]*)$"

(or maybe better "^pwm(@.+|-[0-9a-f]+)$" ?)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6a6iqm4s2kez5pu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN8mC8ACgkQwfwUeK3K
7AnNhQf+PipBtjeFXiEjxBEMz1uj4WmFMbkGxvvhcqQNTWzitEXziNjFBi0SHa7B
7STIIS1e4nLN3EVZeuJTJW7Ie/qzsPtLa56Pm0iuxON8fBNfHZVVsB0DIlhagbO7
qGmMtfQa6z9FAppF9YNAecaNl4dAV3SNPsCxH23zcZdABJGSlDCHQPRQOUWE7Cf/
PxVVN81Ht3znSVAxGkfpQz9pBJrF2CYW/6DhSbvHNzRqsnv2L/kwHSBQjqUKwLPs
0ouZ5F5gv6Y+MGtEwpA9gBygA52sCAtNU3EDjXRfGxAFist7MQ8Niu+lJgESDZCg
166Ym5weIFvH4hYqRVdTpgFhB5qZ9w==
=Jhve
-----END PGP SIGNATURE-----

--6a6iqm4s2kez5pu2--
