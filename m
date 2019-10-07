Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C762CECDD
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 21:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728459AbfJGTdn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 15:33:43 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:14107 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728530AbfJGTdn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 15:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570476821;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=hBBDf3WMhkIUZHGfT8GhaY3Pu2txvTnzOFfltNs8rKg=;
        b=miGTbkjgDdnvZt32FZqE6B7J2aEUyK1o3QIAR3SOJYdO8+mEMqJW7Yp93lDEpUwcW6
        d4H5Z83DcPSXUzLAsb0YEoBQAciRPzWg+km7CEDqLXXSFtFWpWRVycL/nniDtbOu/6Dg
        oIER7PF27Adt6b1vHalAgScYNa+QJn+oEtYvD8Dkl8oCDB9OWPOydLSMjvr53o+k3D4j
        NaSyA9pxTum/KbvmTahgk2lkvCuyyO2QBR01K1IPhDdbdaiEc8iE0e8KsvbXSk7+eKxG
        6QPJyXUv6Wkwx4/wtmlCSXqWHz7J8I5c6fgKiNG9pfm+dnuSQpTrAeUppxzePOO1cx6z
        /Lxw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMgw47ty6c="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v97JXTqry
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 7 Oct 2019 21:33:29 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [PATCH 4/5] drm/panel: tpo-td028ttec1: Fix SPI alias
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191007195849.72562d6b@aktux>
Date:   Mon, 7 Oct 2019 21:33:29 +0200
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        thierry.reding@gmail.com, sam@ravnborg.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4524D803-D5C8-4201-B1B3-7EB88FE1460C@goldelico.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com> <20191007170801.27647-5-laurent.pinchart@ideasonboard.com> <20191007195849.72562d6b@aktux>
To:     Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 07.10.2019 um 19:58 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> On Mon,  7 Oct 2019 20:08:00 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>=20
>> The panel-tpo-td028ttec1 driver incorrectly includes the OF vendor
>> prefix in its SPI alias. Fix it.
>>=20
>> Fixes: 415b8dd08711 ("drm/panel: Add driver for the Toppoly =
TD028TTEC1 panel")
>> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> Tested-by: Andreas Kemnade <andreas@kemnade.info>
Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
>=20
>> ---
>> drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c =
b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
>> index d7b2e34626ef..f2baff827f50 100644
>> --- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
>> +++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
>> @@ -375,8 +375,7 @@ static const struct of_device_id =
td028ttec1_of_match[] =3D {
>> MODULE_DEVICE_TABLE(of, td028ttec1_of_match);
>>=20
>> static const struct spi_device_id td028ttec1_ids[] =3D {
>> -	{ "tpo,td028ttec1", 0},
>> -	{ "toppoly,td028ttec1", 0 },
>> +	{ "td028ttec1", 0 },
>> 	{ /* sentinel */ }
>> };
>>=20
>=20

