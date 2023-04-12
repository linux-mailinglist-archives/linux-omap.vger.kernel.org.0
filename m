Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D21F6DFC84
	for <lists+linux-omap@lfdr.de>; Wed, 12 Apr 2023 19:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjDLRQr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Apr 2023 13:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbjDLRQq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Apr 2023 13:16:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E095D9763
        for <linux-omap@vger.kernel.org>; Wed, 12 Apr 2023 10:16:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pme4r-0002qW-23; Wed, 12 Apr 2023 19:16:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pme4p-00AmxJ-Ki; Wed, 12 Apr 2023 19:16:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pme4p-00CfO5-0R; Wed, 12 Apr 2023 19:16:11 +0200
Date:   Wed, 12 Apr 2023 19:16:10 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, kernel@pengutronix.de,
        Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH 0/3] hwspinlock: Convert to platform remove callback
 returning void
Message-ID: <20230412171610.ji5czj5c77banf6d@pengutronix.de>
References: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d6p2kczjkqfe3gmc"
Content-Disposition: inline
In-Reply-To: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--d6p2kczjkqfe3gmc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 07:00:20PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> this patch series adapts the platform drivers below drivers/hwspinlock to=
 use
> the .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver c=
ore
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warnin=
g. The
> device is removed anyhow and an early return from .remove() usually yield=
s a
> resource leak.
>=20
> By changing the remove callback to return void driver authors cannot reas=
onably
> assume any more that there is some kind of cleanup later.
>=20
> The omap driver could return -EBUSY. This is first changed to return
> zero to drop the duplicated error message. I assume this error path is
> dangerous. For sure the platform device binding goes away and so
> devm_platform_ioremap_resource is undone. So probably the user of the
> hwspinlock that prevented its removal will soon access an unmapped
> virtual address resulting in an oops. This is true with and without my
> patch. IMHO hwspin_lock_unregister() shouldn't return an error code but
> care that all users go away and then return void.
>=20
> After this change the two platform_drivers can be trivially converted to
> .remove_new().

Gentle ping!

Who is supposed to apply this series (or point out a good reason to not
do that)?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--d6p2kczjkqfe3gmc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ251kACgkQj4D7WH0S
/k5orwgAr2N2w9T3gGg6Ic0Ff3bAAQsb6lA3sToRxH+WLMg5wPHEZV0wf6nfMMOr
2D2ChvSB9t+HZZBRt07wrugH9irqBYpzkkZbK5Sl7uutltTB4LIhFTo2676O4sXm
jrHpLQWssu6XiN5j+Nzj3dOC5JL9k1uQ9trTD2PsNdN9y5azRVNXfAnpUUmVzGXJ
QBRosllH59W/0I3aNybw5CrMU0Vm/Hm43Audhd0mmaBlwv9/RBjFyys6zPqYsh0G
yzYH/VQChx5lfHP9P3ylcHtnqAKCeU6+rkZ80GgW8BI+PlkCKXkh09cTn3axMUf5
HJpyXwRWp6SaNfA5nR2OzeRTUidnYg==
=n+tf
-----END PGP SIGNATURE-----

--d6p2kczjkqfe3gmc--
