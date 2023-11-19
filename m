Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B46C7F0500
	for <lists+linux-omap@lfdr.de>; Sun, 19 Nov 2023 10:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjKSJlG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Nov 2023 04:41:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjKSJlF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 19 Nov 2023 04:41:05 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159A8A8
        for <linux-omap@vger.kernel.org>; Sun, 19 Nov 2023 01:41:02 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r4eIA-0005Rk-61; Sun, 19 Nov 2023 10:40:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r4eI6-00A5r4-UB; Sun, 19 Nov 2023 10:40:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r4eI6-003a79-Kd; Sun, 19 Nov 2023 10:40:34 +0100
Date:   Sun, 19 Nov 2023 10:40:34 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        kernel@pengutronix.de, netdev@vger.kernel.org,
        Yunsheng Lin <linyunsheng@huawei.com>,
        Ravi Gunasekaran <r-gunasekaran@ti.com>,
        Marek Majtyka <alardam@gmail.com>,
        Stanislav Fomichev <sdf@google.com>,
        Simon Horman <horms@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/7] net: ethernet: ti: cpsw: Don't error out in .remove()
Message-ID: <20231119094034.qxsq3n6nuxn3e4je@pengutronix.de>
References: <20231117091655.872426-1-u.kleine-koenig@pengutronix.de>
 <20231117091655.872426-3-u.kleine-koenig@pengutronix.de>
 <4cabffc1-7ff9-4277-b508-5902f42b47cb@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4c7vy6dzxccj4rvj"
Content-Disposition: inline
In-Reply-To: <4cabffc1-7ff9-4277-b508-5902f42b47cb@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--4c7vy6dzxccj4rvj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Roger,

[dropping Mugunthan V N from Cc, their address bounces, and adding the
net maintainers that I failed to do for the original submission]

On Sat, Nov 18, 2023 at 12:00:08PM +0200, Roger Quadros wrote:
> > -	cpts_release(cpsw->cpts);
> > -	cpdma_ctlr_destroy(cpsw->dma);
> > +	if (ret >=3D 0) {
> > +		cpts_release(cpsw->cpts);
>=20
> cpts_release() only does clk_unprepare().
> Why not do that in the error path as well?

I thought I saw the pm suspend do a clk_unprepare, but I don't find
that. Indeed this step shouldn't be skipped.

> > +		cpdma_ctlr_destroy(cpsw->dma);
>=20
> cpdma_ctrl_destroy() not only stops the DMA controller
> but also frees up the channel and calls dma_free_coherent?
>=20
> We still want to free up the channel and dma_free_coherent in the
> error path?

Then we need to split the function and only do the software part. I
don't have hardware to test this change and getting it right without
testing seems to be hard.

May I suggest that only do the conversion to remove_new (that doesn't
modify the resource leak behaviour) and you care for fixing the leaks?

My change would then just look as follows:

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index ca4d4548f85e..1251160b563b 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1722,14 +1722,16 @@ static int cpsw_probe(struct platform_device *pdev)
 	return ret;
 }
=20
-static int cpsw_remove(struct platform_device *pdev)
+static void cpsw_remove(struct platform_device *pdev)
 {
 	struct cpsw_common *cpsw =3D platform_get_drvdata(pdev);
 	int i, ret;
=20
 	ret =3D pm_runtime_resume_and_get(&pdev->dev);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to resume device (%pe)\n",
+			ERR_PTR(ret))
+	}
=20
 	for (i =3D 0; i < cpsw->data.slaves; i++)
 		if (cpsw->slaves[i].ndev)
@@ -1740,7 +1742,6 @@ static int cpsw_remove(struct platform_device *pdev)
 	cpsw_remove_dt(pdev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
=20
 #ifdef CONFIG_PM_SLEEP
@@ -1795,7 +1796,7 @@ static struct platform_driver cpsw_driver =3D {
 		.of_match_table =3D cpsw_of_mtable,
 	},
 	.probe =3D cpsw_probe,
-	.remove =3D cpsw_remove,
+	.remove_new =3D cpsw_remove,
 };
=20
 module_platform_driver(cpsw_driver);

A similar question for the other two cpsw drivers.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4c7vy6dzxccj4rvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVZ2BEACgkQj4D7WH0S
/k6iIwf5AYEnbzvJQJ7CBkRhXx9nLE7Qkrw2vQuskmtqFFlx4Nc8Z14qOLR1/EQp
0XEcbQG7h5lVvUcjyDMq6iaFZAbW22mwgx0a0aE8g41auVSZWC7sAXXQLfNRKlyG
aMV0qNSYQufU0K9mynMk36C+/+nXuUE3zXx1hhwcI1YI15O3xb+GBGHF4qeKViMF
e7B98UDIVSv5GUrgBTRgGwVKx22Luk7xCMcDLmF479Vd2bxFRtLRQ17Rk7T7NJBg
06YLa6OG5mUVO/LnUVuZzzSlrU4OXTiY7XgGCZQZYyVxwh0P4I4K1T53sIfPuQBA
19YqZ/ftDCPh/yDYm45w8Y3p4HveWg==
=WPwL
-----END PGP SIGNATURE-----

--4c7vy6dzxccj4rvj--
