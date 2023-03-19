Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2AF6C0543
	for <lists+linux-omap@lfdr.de>; Sun, 19 Mar 2023 22:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbjCSVJ4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Mar 2023 17:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjCSVJz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 19 Mar 2023 17:09:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5699718166
        for <linux-omap@vger.kernel.org>; Sun, 19 Mar 2023 14:09:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pe0GL-0002OT-MM; Sun, 19 Mar 2023 22:08:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pe0G8-005Ikp-Ii; Sun, 19 Mar 2023 22:08:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pe0G7-006FDZ-Jd; Sun, 19 Mar 2023 22:08:07 +0100
Date:   Sun, 19 Mar 2023 22:08:08 +0100
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
        Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
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
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/51] video: fbdev: Convert to platform remove callback
 returning void
Message-ID: <20230319210808.apsba7oj32kt7ree@pengutronix.de>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
 <ff758418-f1da-e297-1829-251b8a5b1ec3@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wzczx3bc4ifbxgea"
Content-Disposition: inline
In-Reply-To: <ff758418-f1da-e297-1829-251b8a5b1ec3@gmx.de>
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


--wzczx3bc4ifbxgea
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[Dropped Bartlomiej Zolnierkiewicz and Michal Januszewski from Cc, their
email addresses bounced]

On Sun, Mar 19, 2023 at 07:04:54PM +0100, Helge Deller wrote:
> Hello Uwe,
>=20
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
>=20
> Regarding the new "remove_new" struct member I'd prefer a better name but=
 don't
> have any idea yet...

Ideally we won't have to life with it for long. The eventual plan is to
switch back to "remove" once all drivers are converted. So I didn't
think intensively about a better name. Did you know that struct
i2c_driver has a "temporary" .probe_new() callback since 2016?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wzczx3bc4ifbxgea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQXebcACgkQj4D7WH0S
/k6QzAf9FFe2XXai/3YyjlJCEmMUktQCnGsZAQL0Q6KlNzN/QDhFin/mK+//+AWd
fr9WI9Gvg8J2cb9k0wI5/gp/8qNlttscKB+YgE5GrE/Cph4oZg3CKWx3SBYQewPf
kaVGx0cjiL/TCMe2/aDf7c8RshaJdKgeiY0L4g7MEaH6OSU/cR2jwZyjKzodH8bj
nNJPVJviqsma1znGkf1odS40YiHP5VqDGvPmSXz/6Z3P/CMb4/WymZULgameRAdm
O3MaikHNKGY72mqrQgM4W5UYNWBRFVYf2XuGQF9CV423/8O1hqQ5/cxXXblKBCRJ
OiI7uoY3VVdDKivhWmJyIZDJkfdWEg==
=s2rT
-----END PGP SIGNATURE-----

--wzczx3bc4ifbxgea--
