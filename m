Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D10AB7162BB
	for <lists+linux-omap@lfdr.de>; Tue, 30 May 2023 15:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbjE3N4d (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 May 2023 09:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjE3N4c (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 May 2023 09:56:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135B78E
        for <linux-omap@vger.kernel.org>; Tue, 30 May 2023 06:56:31 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3zpp-0002Fr-M0; Tue, 30 May 2023 15:56:25 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3zpo-003tBy-MK; Tue, 30 May 2023 15:56:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3zpn-009WDo-LL; Tue, 30 May 2023 15:56:23 +0200
Date:   Tue, 30 May 2023 15:56:21 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] hwspinlock: Convert to platform remove callback
 returning void
Message-ID: <20230530135621.34psftds7ymrdvmt@pengutronix.de>
References: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de>
 <20230412171610.ji5czj5c77banf6d@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="olg5h6fahaia7uo2"
Content-Disposition: inline
In-Reply-To: <20230412171610.ji5czj5c77banf6d@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--olg5h6fahaia7uo2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Apr 12, 2023 at 07:16:10PM +0200, Uwe Kleine-K=F6nig wrote:
> On Tue, Mar 14, 2023 at 07:00:20PM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > this patch series adapts the platform drivers below drivers/hwspinlock =
to use
> > the .remove_new() callback. Compared to the traditional .remove() callb=
ack
> > .remove_new() returns no value. This is a good thing because the driver=
 core
> > doesn't (and cannot) cope for errors during remove. The only effect of a
> > non-zero return value in .remove() is that the driver core emits a warn=
ing. The
> > device is removed anyhow and an early return from .remove() usually yie=
lds a
> > resource leak.
> >=20
> > By changing the remove callback to return void driver authors cannot re=
asonably
> > assume any more that there is some kind of cleanup later.
> >=20
> > The omap driver could return -EBUSY. This is first changed to return
> > zero to drop the duplicated error message. I assume this error path is
> > dangerous. For sure the platform device binding goes away and so
> > devm_platform_ioremap_resource is undone. So probably the user of the
> > hwspinlock that prevented its removal will soon access an unmapped
> > virtual address resulting in an oops. This is true with and without my
> > patch. IMHO hwspin_lock_unregister() shouldn't return an error code but
> > care that all users go away and then return void.
> >=20
> > After this change the two platform_drivers can be trivially converted to
> > .remove_new().
>=20
> Gentle ping!
>=20
> Who is supposed to apply this series (or point out a good reason to not
> do that)?

Still no maintainer feedback on my series :-\ Would a resend help?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--olg5h6fahaia7uo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR2AIQACgkQj4D7WH0S
/k7dggf+ODF1m3jtKl6F+UkJAuatg9btwG2VZW7LjwpFFWazIkNGxelYwkdCfzi6
lkHvRjmClvlPmosk/cCwO6ymXkVbu8ok6gonlkrT09H6fN51/cW6T4o5hSbK91k7
gf/nMxXl2V7irjQ8j/Emm+29Yrb3pkUB+wYm2LTYK0gUImIaIaLfeCTToHiGR+KP
vGMNTb5V5Z2Q1TNMKgtzoeyJFmCAIIIQcQ+Sj2c5NTOb57I1Kaj1iF6ODXSRxlkx
fR0xDY1mAdrK+N25QEC3vDOm51DCbYqjmlt3TschWqTb77TIi0nxkdJWKy94rQet
ZLGg9Xaa5R3KxZI+Wr97hNjQsy2QIA==
=ZUlE
-----END PGP SIGNATURE-----

--olg5h6fahaia7uo2--
