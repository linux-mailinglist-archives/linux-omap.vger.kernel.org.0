Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA4871630E
	for <lists+linux-omap@lfdr.de>; Tue, 30 May 2023 16:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbjE3OF0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 May 2023 10:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232904AbjE3OFY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 May 2023 10:05:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7A4C5
        for <linux-omap@vger.kernel.org>; Tue, 30 May 2023 07:05:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3zwD-0003Sh-GG; Tue, 30 May 2023 16:03:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3zvu-003tca-VI; Tue, 30 May 2023 16:02:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q3zvt-009WG3-VA; Tue, 30 May 2023 16:02:41 +0200
Date:   Tue, 30 May 2023 16:02:39 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     Yihao Han <hanyihao@vivo.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Alexander Shiyan <shc_work@mail.ru>,
        Dongliang Mu <dzm91@hust.edu.cn>,
        Peter Jones <pjones@redhat.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Timur Tabi <timur@kernel.org>,
        Xuezhi Zhang <zhangxuezhi1@coolpad.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Stephen Kitt <steve@sk2.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Yu Zhe <yuzhe@nfschina.com>, Xu Panda <xu.panda@zte.com.cn>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        Hyunwoo Kim <imv4bel@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wang Qing <wangqing@vivo.com>,
        Kristoffer Ericson <kristoffer.ericson@gmail.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Zeng Heng <zengheng4@huawei.com>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
        linux-omap@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/51] video: fbdev: Convert to platform remove callback
 returning void
Message-ID: <20230530140239.qevvxcuaqufv6hwj@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
 <ff758418-f1da-e297-1829-251b8a5b1ec3@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bnfkrholsive5e6z"
Content-Disposition: inline
In-Reply-To: <ff758418-f1da-e297-1829-251b8a5b1ec3@gmx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--bnfkrholsive5e6z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Dropped a few recipents that resulted in bounces before]

Hello,

On Sun, Mar 19, 2023 at 07:04:54PM +0100, Helge Deller wrote:
> On 3/19/23 00:53, Uwe Kleine-K=F6nig wrote:
> > this series adapts the platform drivers below drivers/video/fbdev to us=
e the
> > .remove_new() callback. Compared to the traditional .remove() callback
> > .remove_new() returns no value. This is a good thing because the driver=
 core
> > doesn't (and cannot) cope for errors during remove. The only effect of a
> > non-zero return value in .remove() is that the driver core emits a warn=
ing. The
> > device is removed anyhow and an early return from .remove() usually yie=
lds a
> > resource leak.
> >=20
> > By changing the remove callback to return void driver authors cannot
> > reasonably assume any more that there is some kind of cleanup later.
> >=20
> > The first patch simplifies the remove callback of one driver to obvious=
ly
> > always return zero. After that all drivers are converted trivially to
> > .remove_new().
>=20
> Thanks for that patch series. It's a nice cleanup.
> I've applied it to the fbdev "for-next" git tree for now to get some comp=
ile testing.
> I hope that's ok for you.

I found patches #7 up to #51 in next, but the first 6 patches are
missing. I guess this wasn't' done on purpose?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bnfkrholsive5e6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR2Af4ACgkQj4D7WH0S
/k7fcAgAhQtUQep3ieXfPdx48MXj3Vo7YHNUrrshT5bmWhmUNobb6zbidQ0oXZgm
U3/So+jY9f4ckmvcciAXhCOWyS4nTmtz37ll49zN64lGaNx52FcdlXJTO0yXCsHH
mCJ6kYJTujB5SPN8HX1qutW6YPBXQU/NDVfwKVtL+rKtyIBILPjvYPr1oR1b7yqG
ctGm0FrYfsTWt0QxtJ9RKIZ0K3aS4KVw3MIYhrU2Ia0WnOp7kDX8pHTodWmSa1Mo
4Q94Li8myjIht2cen4KYlfUYb5HjbPkoW3WaDMuTCDgMWiPZLvLHRyUGmhgj5IVz
b5F2RVP5DKQuSRcfK6b2i3tG6/wN7Q==
=RqLu
-----END PGP SIGNATURE-----

--bnfkrholsive5e6z--
