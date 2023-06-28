Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B79D8740C31
	for <lists+linux-omap@lfdr.de>; Wed, 28 Jun 2023 11:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234296AbjF1JBz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Jun 2023 05:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234288AbjF1IZz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Jun 2023 04:25:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9421FED
        for <linux-omap@vger.kernel.org>; Wed, 28 Jun 2023 01:17:20 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qEQMS-0006Pg-Oi; Wed, 28 Jun 2023 10:17:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qEQMR-00Acx5-H7; Wed, 28 Jun 2023 10:17:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qEQMQ-000ThB-Hs; Wed, 28 Jun 2023 10:17:10 +0200
Date:   Wed, 28 Jun 2023 10:17:10 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 0/3] hwspinlock: Convert to platform remove callback
 returning void
Message-ID: <20230628081710.xfvgl6ktf2pforoj@pengutronix.de>
References: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de>
 <20230412171610.ji5czj5c77banf6d@pengutronix.de>
 <20230530135621.34psftds7ymrdvmt@pengutronix.de>
 <970927f9-f3b8-3c92-e581-a28e3522196c@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7ylt64rlld765h22"
Content-Disposition: inline
In-Reply-To: <970927f9-f3b8-3c92-e581-a28e3522196c@linux.alibaba.com>
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


--7ylt64rlld765h22
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, May 31, 2023 at 09:12:40AM +0800, Baolin Wang wrote:
> On 5/30/2023 9:56 PM, Uwe Kleine-K=F6nig wrote:
> > On Wed, Apr 12, 2023 at 07:16:10PM +0200, Uwe Kleine-K=F6nig wrote:
> > > On Tue, Mar 14, 2023 at 07:00:20PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > Hello,
> > > >=20
> > > > this patch series adapts the platform drivers below drivers/hwspinl=
ock to use
> > > > the .remove_new() callback. Compared to the traditional .remove() c=
allback
> > > > .remove_new() returns no value. This is a good thing because the dr=
iver core
> > > > doesn't (and cannot) cope for errors during remove. The only effect=
 of a
> > > > non-zero return value in .remove() is that the driver core emits a =
warning. The
> > > > device is removed anyhow and an early return from .remove() usually=
 yields a
> > > > resource leak.
> > > >=20
> > > > By changing the remove callback to return void driver authors canno=
t reasonably
> > > > assume any more that there is some kind of cleanup later.
> > > >=20
> > > > The omap driver could return -EBUSY. This is first changed to return
> > > > zero to drop the duplicated error message. I assume this error path=
 is
> > > > dangerous. For sure the platform device binding goes away and so
> > > > devm_platform_ioremap_resource is undone. So probably the user of t=
he
> > > > hwspinlock that prevented its removal will soon access an unmapped
> > > > virtual address resulting in an oops. This is true with and without=
 my
> > > > patch. IMHO hwspin_lock_unregister() shouldn't return an error code=
 but
> > > > care that all users go away and then return void.
> > > >=20
> > > > After this change the two platform_drivers can be trivially convert=
ed to
> > > > .remove_new().
> > >=20
> > > Gentle ping!
> > >=20
> > > Who is supposed to apply this series (or point out a good reason to n=
ot
> > > do that)?
> >=20
> > Still no maintainer feedback on my series :-\ Would a resend help?
>=20
> For the whole patchset,
> Acked-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>=20
> I think Bjorn can help to apply this patchset, Bjorn?

up to now he didn't. I guess it's to late now for v6.5-rc1, but can at
least someone pick it up for the next cycle?

It still applies fine to current Linus's master. With am -3 it also
still applies to current next. If a resend would help, please tell me
what I should choose as base.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7ylt64rlld765h22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSb7IUACgkQj4D7WH0S
/k4uoQf/bVx+G71b8Djc5P93dWX79txtD1lRxu58l6ncqUkmf8CZe6GXqLIBoyQv
FOiNlLyEe4P2Dne91SoBGVOraKNzYYeqA8Wi5HVWUW9rdlirr58HGb+5lR3KWDwY
APqR8sxkAiqNKQyeMDo8PZUgCMVGiGsMoOe0Muzp4s3uVCh60lB5yLkLEjAGwl8c
9616TUr54Z3zCU3c+SGqWhxmIRb1TmgR6ZC7HO4ZwFQVlQesPG1lBDoLJvOkXhwB
jPSQsarxB4QtHwbmnMXgkwzS2LFKnEeBlEzt+bl+K9jlSOY9cCid2mwnZCG5JErJ
Mvgs4a/slk5+50qnX+axOUbb0R5dxw==
=qZWf
-----END PGP SIGNATURE-----

--7ylt64rlld765h22--
