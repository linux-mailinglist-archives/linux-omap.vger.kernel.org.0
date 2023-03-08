Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 884F66B0E19
	for <lists+linux-omap@lfdr.de>; Wed,  8 Mar 2023 17:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbjCHQEj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Mar 2023 11:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbjCHQEP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Mar 2023 11:04:15 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7911AB4F44
        for <linux-omap@vger.kernel.org>; Wed,  8 Mar 2023 08:02:35 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZwEb-0002Aj-1k; Wed, 08 Mar 2023 17:01:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZwEZ-002kUL-F7; Wed, 08 Mar 2023 17:01:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZwEY-003KO4-KZ; Wed, 08 Mar 2023 17:01:42 +0100
Date:   Wed, 8 Mar 2023 17:01:41 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mark Brown <broonie@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH 0/8] ARM: Convert to platform remove callback returning
 void
Message-ID: <20230308160141.ct6x3a7x7trkx2dh@pengutronix.de>
References: <20230308100012.2539189-1-u.kleine-koenig@pengutronix.de>
 <adaf8b7c-f1a7-4770-adb6-31ced13d64d2@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wljixglgwyusnend"
Content-Disposition: inline
In-Reply-To: <adaf8b7c-f1a7-4770-adb6-31ced13d64d2@app.fastmail.com>
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


--wljixglgwyusnend
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 04:06:47PM +0100, Arnd Bergmann wrote:
> On Wed, Mar 8, 2023, at 11:00, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >
> > this patch series adapts the platform drivers below arch/arm to use the
> > .remove_new() callback. Compared to the traditional .remove() callback
> > .remove_new() returns no value. This is a good thing because the driver=
 core
> > doesn't (and cannot) cope for errors during remove. The only effect of a
> > non-zero return value in .remove() is that the driver core emits a warn=
ing. The
> > device is removed anyhow and an early return from .remove() usually yie=
lds a
> > resource leak.
> >
> > By changing the remove callback to return void driver authors cannot
> > reasonably assume any more that there is some kind of cleanup later.
> >
> > All drivers in arch/arm returned zero unconditionally in their remove c=
allback,
> > so they could all be converted trivially to .remove_new().
> >
> > Note that this series depends on commit 5c5a7680e67b ("platform: Provide
> > a remove callback that returns no value") which is included in v6.3-rc1.
>=20
> Looks good to me,
>=20
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>=20
> > I'm unsure who will pick up this series. Will it go as a whole via arm-=
soc? Or
> > will the individual maintainers pick it up?
>=20
> I can take it through the soc tree, please send it to
> soc@kernel.org once you are done getting Acks.
>=20
> Since all eight patches in the series have the exact same
> changelog text and are all trivial, I'd prefer them to be
> folded into a single patch if that works for you.

No, they are not all identical, they all have their individual subject
prefix :-)

Honestly: I don't care much. I split it because for most other
subsystems that's what the respective maintainers seem to prefer.

I'll care for that, i.e. wait a bit to give others the chance to ack (or
object) and then send it as you recommended. Thanks.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wljixglgwyusnend
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQIsWIACgkQwfwUeK3K
7AlReAf+JSNxIpWJ8GtBZ/TLHPUXPBKI6UIanrESMnnqmRQxr1Qq3vQP8xrZKNV+
Z6jh6S11MJuEk9zd7J3W5XUY3YXJbXoJpoGwpVvph8cR8vGGubtQNTCExhpoRHKc
8dsIQwExGdbfNpvrCAiurB4KiS8TqqO48cwpgS4gn3W0khrkz/x2nBucX1foFf0F
bJNf2WZBFUj36/jekTOGBpA2kMW8dtf/jB6NZGezgy2y+GmhkduTQklZ8WafkDFh
AcNun7mwLFRnpAtHu68ggIi8BDHNVMIDsWB7uUMDIC8vL1zC3f0HNyRq4XdC5HWU
a1w/6rgDKDS38sdcZ0saeA04pxwhhw==
=wJrL
-----END PGP SIGNATURE-----

--wljixglgwyusnend--
