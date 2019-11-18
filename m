Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2CE31007A9
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 15:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfKROvp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 09:51:45 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:33130 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfKROvp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Nov 2019 09:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574088703;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=4Q0DX8jQIGKw8CJ/saZVBLA56ATthF66g7P4lECTFNM=;
        b=dDy4fdpzgjVR4CVxDbCR/TNROEsgGVNqlqrA0/dUi9h+k2xdl/v2KdWCYuBuifUV8y
        +mBMKKoP3KJb5zWsvCbHnPEinRmow8h+V12Q/ZEYGgHcem17z5AHoZbrNHHe9lL+emTe
        USQ5bO/ocFEEt2N/AjmZRj0ML+YDG/oHYb9s5gBBQwOCFbIjkEvNSkVVY9okTTlWSmw/
        z7M9VCoaX/XrBupMBtp8GnEJ/uGLhwlE/z67coz6keGG0tPTiUoBZjxN/ulYl7f6ibaj
        HyZ6ZOz/xGDwxMdOzZS4/35rpRBaZ3t2Dj2cZ04XngzcesLdWdtP5eRkUUBQh1uyyvYF
        riUg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMlw43pqoI="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vAIEpfTZM
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 18 Nov 2019 15:51:41 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFCv1 32/42] drm/omap: dsi: convert to drm_panel
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191118144558.abix5y555jk63szb@earth.universe>
Date:   Mon, 18 Nov 2019 15:51:44 +0100
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <9681B365-9174-43CE-BCAE-ED986F182935@goldelico.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com> <20191117024028.2233-33-sebastian.reichel@collabora.com> <D109D867-1C8E-44F6-9C91-AF55BCB3FDD3@goldelico.com> <20191118144558.abix5y555jk63szb@earth.universe>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 18.11.2019 um 15:45 schrieb Sebastian Reichel =
<sebastian.reichel@collabora.com>:
>=20
> Hi,
>=20
> On Sun, Nov 17, 2019 at 08:23:05PM +0100, H. Nikolaus Schaller wrote:
>>> [...]
>>=20
>>> +	drm_panel_init(&ddata->panel, dev, &dsicm_panel_funcs,
>>> +		       DRM_MODE_CONNECTOR_DSI);
>>> +
>>=20
>> This leads to
>>=20
>> drivers/gpu/drm/panel/panel-dsi-cm.c: In function 'dsicm_probe':
>> drivers/gpu/drm/panel/panel-dsi-cm.c:552:2: error: too many arguments =
to function 'drm_panel_init'
>>  drm_panel_init(&ddata->panel, dev, &dsicm_panel_funcs,
>>  ^
>> In file included from drivers/gpu/drm/panel/panel-dsi-cm.c:22:0:
>> ./include/drm/drm_panel.h:150:6: note: declared here
>> void drm_panel_init(struct drm_panel *panel);
>>      ^
>>=20
>> (when applied to v5.4-rc7)
>=20
> The patchset is based on drm-next from
> https://anongit.freedesktop.org/git/drm/drm.git
>=20
> For v5.4-rc7 it needs to look like this:
>=20
> +	drm_panel_init(&ddata->panel);
> +	ddata->panel.dev =3D dev;
> +	ddata->panel.funcs =3D &dsicm_panel_funcs;

Ah, ok. The issue with changed parameters seems
to already be fixed by two patches in linux-next
and therefore soon in v5.5-rc1.

>=20
>>> [...]=20
>>=20
>> Otherwise the patches compile fine and my work-in progress
>> DSI panel driver is probing, but not initializing.
>=20
> Ok, I tried not to break video mode support, but I do not have any
> hardware. Make sure to set the MIPI_DSI_MODE_VIDEO flag in the panel
> driver.

Indeed, this may be missing (can't look into the code at the moment)...
Or I did something wrong when refactoring the driver.
We will find out.

BR and thanks for the great work,
Nikolaus


