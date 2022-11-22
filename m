Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 825AD633AA4
	for <lists+linux-omap@lfdr.de>; Tue, 22 Nov 2022 11:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbiKVK5d (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Nov 2022 05:57:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232571AbiKVK5c (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Nov 2022 05:57:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E9618E
        for <linux-omap@vger.kernel.org>; Tue, 22 Nov 2022 02:57:25 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxQxl-0002Q8-Br; Tue, 22 Nov 2022 11:57:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxQxi-005pgs-OL; Tue, 22 Nov 2022 11:57:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxQxi-000mPh-W1; Tue, 22 Nov 2022 11:57:11 +0100
Date:   Tue, 22 Nov 2022 11:57:10 +0100
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
Message-ID: <20221122105710.5aow5qsri6pikgri@pengutronix.de>
References: <20221121115525.36362-1-tony@atomide.com>
 <20221121144000.7weeyfbbulltfxmd@pengutronix.de>
 <Y3uPvYqaILNiYW8K@atomide.com>
 <bb5ac0cf-84eb-165f-40bb-0f3c9afe084f@linaro.org>
 <Y3xTi5JeLPSWchT7@atomide.com>
 <20221122093650.oouke2utlkvdd7r6@pengutronix.de>
 <Y3ymZphck8JM6g9B@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="givfcopdnzebzg6s"
Content-Disposition: inline
In-Reply-To: <Y3ymZphck8JM6g9B@atomide.com>
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


--givfcopdnzebzg6s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2022 at 12:37:26PM +0200, Tony Lindgren wrote:
> * Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> [221122 09:26]:
> > On Tue, Nov 22, 2022 at 06:43:55AM +0200, Tony Lindgren wrote:
> > > * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221121 16:05]:
> > > > On 21/11/2022 15:48, Tony Lindgren wrote:
> > > > > * Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> [221121 14:=
30]:
> > > > >> On Mon, Nov 21, 2022 at 01:55:24PM +0200, Tony Lindgren wrote:
> > > > >>> Let's allow node numbering in decimal format too.
> > > > >>>
> > > > >>> Simple human-readable increments/IDs are usually decimal, hex i=
s only for
> > > > >>> addresses as noted by Krzysztof Kozlowski <krzysztof.kozlowski@=
linaro.org>.
> > > > >>>
> > > > >>> Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > >>> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > >>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.o=
rg>
> > > > >>> Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > > >>> ---
> > > > >>>  Documentation/devicetree/bindings/pwm/pwm.yaml | 2 +-
> > > > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >>>
> > > > >>> diff --git a/Documentation/devicetree/bindings/pwm/pwm.yaml b/D=
ocumentation/devicetree/bindings/pwm/pwm.yaml
> > > > >>> --- a/Documentation/devicetree/bindings/pwm/pwm.yaml
> > > > >>> +++ b/Documentation/devicetree/bindings/pwm/pwm.yaml
> > > > >>> @@ -13,7 +13,7 @@ select: false
> > > > >>> =20
> > > > >>>  properties:
> > > > >>>    $nodename:
> > > > >>> -    pattern: "^pwm(@.*|-[0-9a-f])*$"
> > > > >>> +    pattern: "^pwm(@.*|-([0-9a-f]|1[0-5]))*$"
> > > > >>
> > > > >> I wonder why you don't make this:
> > > > >>
> > > > >> +    pattern: "^pwm(@.*|-[0-9a-f]*)$"
> > > >=20
> > > > Yes, the '*' should be within ().
> > >=20
> > > Sorry I guess I don't follow. So for what type of naming is the secon=
d '*'
> > > actually needed here, or is it needed at all?
> > >=20
> > > We only want to match the following:
> > >=20
> > > pwm@1234
> > >=20
> > > pwm-0
> > > ...
> > > pwm-f
> > >=20
> > > And now also:
> > >=20
> > > pwm-0
> > > ...
> > > pwm-15
> > >=20
> > > Is there yet another format I'm missing?
> >=20
> > I think there is a misunderstanding about the type of pattern here. Do
> > we talk about a shell pattern where "[0-9a-f]*" matches a name starting
> > with a hex digit followed by any number of any caracter, or is it a
> > regexp where the * means "any number of the preceding pattern", so
> > effectively a word consisting of only hex digits.
> >=20
> > The .* part makes me think we're talking about a regexp, so the old
> > pattern ("^pwm(@.*|-[0-9a-f])*$") means that
> >=20
> > 	pwm-1-2-3-4
> >=20
> > is allowed but
> >=20
> > 	pwm-10
> >=20
> > isn't. And I think what we want is:
> >=20
> > 	"^pwm(@.*|-[0-9a-f]*)$"
>=20
> Heh so this fails for just node name pwm:
>=20
> pwm: $nodename:0: 'pwm' does not match '^pwm(@.*|-[0-9a-f]*)$'
>=20
> Maybe that's why the second '..)*$' was there originally for?
> And adding it back there fixes pwm but allows pwm-1-2-3..
>=20
> > (or maybe better "^pwm(@.+|-[0-9a-f]+)$" ?)
>=20
> And this too fails for just pwm node name.

Then let's pick:


	"^pwm(@.+|-[0-9a-f]+)?$"

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--givfcopdnzebzg6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN8qwMACgkQwfwUeK3K
7Ake2AgAjuMvQTv8ml8XCA4yUBHa6yn+K9YSkwkJ7oV9jEPcmyY5IcQMw1DJJQyC
u4Dz9YFfGptMFvWcVSWUoo/Oj4SY4tIIYpjke3/h2r+DLMkUNGaecPqJ8+PeIgQG
HoqsyBvW6CVEN9uJTVEStsw5oCWkkK2qwmBImU26ZcYR30mUtwajrHc6ArpMeKXi
XsS4DiGOdpEi1WKFrj3tS01rfRbpIRGBGmo+LzLYCH6lybXrYgcYSlzhvHZazHKD
BSKsjRzzP2HS5uhAweqBYMsCG/TFrzgfCo6U5hpsefo35F85wbijJac0btoFF4r5
H5tYXy9uBJt6bNxtktkHy0NuJRBR3A==
=+H2H
-----END PGP SIGNATURE-----

--givfcopdnzebzg6s--
