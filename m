Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC3ECECDE
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 21:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbfJGTew (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 15:34:52 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:15247 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbfJGTew (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 15:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570476890;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=dbFdvdKxQBL0uUdYkCNbwfdo/lUnBsJwjvDyfAJone8=;
        b=oYYnHgPjKVcenVk4J4CeJt3v/pzm48Uk6u/2AjjTyHkugTqCdNneyR+OEqkuHA3NKA
        xhdE9ker5NWYdarYYmRlJd27Mi6lrBrSM28GydOq2B1Zj/hLatRdLQT13evgPhS6VRGl
        I8oG7812PtSepidsi2PHq0Ho+jwREQkhLX0p/4AzlHrxqQ1pAJBo/+D5dahMA8iyj9JN
        xEKz1x84FJkQlF/sLq6HYikdHUZz5NP9as46eACbSnuZHschFNxjoz3GqUGz4Vmtoksa
        JCQMV4o/IvZLkiFOHPoM8SoW22/ZABLoAGVjPHsJVENqDQmT2r1XXd96SkV3lEQVFab8
        +YXQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMgw47ty6c="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v97JYnqsA
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 7 Oct 2019 21:34:49 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 5/5] drm/panel: tpo-td043mtea1: Fix SPI alias
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191007170801.27647-6-laurent.pinchart@ideasonboard.com>
Date:   Mon, 7 Oct 2019 21:34:49 +0200
Cc:     dri-devel@lists.freedesktop.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        thierry.reding@gmail.com, sam@ravnborg.org,
        letux-kernel@openphoenux.org, Tony Lindgren <tony@atomide.com>,
        Jyri Sarha <jsarha@ti.com>, linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D69D88E3-F124-452D-BD3D-DE50484FBD35@goldelico.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com> <20191007170801.27647-6-laurent.pinchart@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 07.10.2019 um 19:08 schrieb Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>:
>=20
> The panel-tpo-td043mtea1 driver incorrectly includes the OF vendor
> prefix in its SPI alias. Fix it, and move the manual alias to an SPI
> module device table.
>=20
> Fixes: dc2e1e5b2799 ("drm/panel: Add driver for the Toppoly TD043MTEA1 =
panel")
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # OpenPandora

> ---
> drivers/gpu/drm/panel/panel-tpo-td043mtea1.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c =
b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> index 84370562910f..ba163c779084 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> @@ -491,9 +491,17 @@ static const struct of_device_id =
td043mtea1_of_match[] =3D {
>=20
> MODULE_DEVICE_TABLE(of, td043mtea1_of_match);
>=20
> +static const struct spi_device_id td043mtea1_ids[] =3D {
> +	{ "td043mtea1", 0 },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(spi, td043mtea1_ids);
> +
> static struct spi_driver td043mtea1_driver =3D {
> 	.probe		=3D td043mtea1_probe,
> 	.remove		=3D td043mtea1_remove,
> +	.id_table	=3D td043mtea1_ids,
> 	.driver		=3D {
> 		.name	=3D "panel-tpo-td043mtea1",
> 		.pm	=3D &td043mtea1_pm_ops,
> @@ -503,7 +511,6 @@ static struct spi_driver td043mtea1_driver =3D {
>=20
> module_spi_driver(td043mtea1_driver);
>=20
> -MODULE_ALIAS("spi:tpo,td043mtea1");
> MODULE_AUTHOR("Gra=C5=BEvydas Ignotas <notasas@gmail.com>");
> MODULE_DESCRIPTION("TPO TD043MTEA1 Panel Driver");
> MODULE_LICENSE("GPL");
> --=20
> Regards,
>=20
> Laurent Pinchart
>=20

