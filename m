Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFA72B5C8F
	for <lists+linux-omap@lfdr.de>; Tue, 17 Nov 2020 11:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgKQKEh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Nov 2020 05:04:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:42818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725994AbgKQKEg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 17 Nov 2020 05:04:36 -0500
Received: from earth.universe (dyndsl-095-033-154-055.ewe-ip-backbone.de [95.33.154.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63DF52225E;
        Tue, 17 Nov 2020 10:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605607475;
        bh=FEzDtj+sUhFv2whVreNZ715gdK0MXLz+XJ2OUOlf6cY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=erXge0Fhv2G16jXNViHSrsNA2H0bRCIm8F2fuar1Fy7nUqlsGVZpv6ts2feqz6mst
         XlsT4tRGN1wffIX5lqP1PcyZ1j8GtXaFi7a7QzkiBrUNmxYTY+DwMbAVwjcsMjY3Lq
         A4DJpwwwAj4sAl4J7wfzmxpzsMxcuqwjxwGYfR0c=
Received: by earth.universe (Postfix, from userid 1000)
        id D13363C0C8E; Tue, 17 Nov 2020 11:04:32 +0100 (CET)
Date:   Tue, 17 Nov 2020 11:04:32 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 30/56] drm/omap: dsi: move panel refresh function to
 host
Message-ID: <20201117100432.7hfh2t3khuijgwr7@earth.universe>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-31-tomi.valkeinen@ti.com>
 <20201109101003.GA6029@pendragon.ideasonboard.com>
 <6118c70e-6dc5-2d87-fc68-266cd3eeb66c@ti.com>
 <20201111155854.GH4115@pendragon.ideasonboard.com>
 <fca968af-9554-041a-c416-0781da8b70ca@ti.com>
 <20201116092253.GE6540@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="st5ewojvixjr4cns"
Content-Disposition: inline
In-Reply-To: <20201116092253.GE6540@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--st5ewojvixjr4cns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 16, 2020 at 11:22:53AM +0200, Laurent Pinchart wrote:
> On Thu, Nov 12, 2020 at 10:08:21AM +0200, Tomi Valkeinen wrote:
> > On 11/11/2020 17:58, Laurent Pinchart wrote:
> >=20
> > >>>> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/dri=
vers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > >>>> index 030a8fa140db..1582960f9e90 100644
> > >>>> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > >>>> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > >>>> @@ -177,27 +177,6 @@ static int dsicm_get_id(struct panel_drv_data=
 *ddata, u8 *id1, u8 *id2, u8 *id3)
> > >>>>  	return 0;
> > >>>>  }
> > >>>> =20
> > >>>> -static int dsicm_set_update_window(struct panel_drv_data *ddata,
> > >>>> -		u16 x, u16 y, u16 w, u16 h)
> > >>>> -{
> > >>>> -	struct mipi_dsi_device *dsi =3D ddata->dsi;
> > >>>> -	int r;
> > >>>> -	u16 x1 =3D x;
> > >>>> -	u16 x2 =3D x + w - 1;
> > >>>> -	u16 y1 =3D y;
> > >>>> -	u16 y2 =3D y + h - 1;
> > >>>> -
> > >>>> -	r =3D mipi_dsi_dcs_set_column_address(dsi, x1, x2);
> > >>>> -	if (r < 0)
> > >>>> -		return r;
> > >>>> -
> > >>>> -	r =3D mipi_dsi_dcs_set_page_address(dsi, y1, y2);
> > >>>> -	if (r < 0)
> > >>>> -		return r;
> > >>>> -
> > >>>> -	return 0;
> > >>>> -}
> > >>>> -
> > >>>
> > >>> I can't tell whether this is common to all command-mode panels, or =
if
> > >>> there could be a need for panel-specific update procedures, so I ca=
n't
> > >>> really ack this patch.
> > >>
> > >> I can't say either, but all the command mode panels I know need and =
support this. And, afaik, we
> > >> have only the single cmd mode panel driver which we add in this seri=
es.
> > >=20
> > > Now that I think about it again, isn't it a layering violation ?
> > > Shouldn't the DSI host handle DSI commands transfers, with the panel
> > > driver taking care of specific DSI commands ?
> >=20
> > Well, the DSI host (the HW) already handles specific DSI commands, as i=
t does the update with DCS
> > Write Start/Continue commands. The update is initiated from omap_crtc, =
via dssdev->dsi_ops->update().
> >=20
> > We could perhaps add a new function to drm_panel_funcs, say, prepare_up=
date, which could then do the
> > above.
> >=20
> > Although I think the above code is not strictly speaking required, as t=
he panel should remember the
> > column and page address, and as such, they could be set just once at co=
nfig time.
> >=20
> > However, I remember debugging issues related to this. And with a quick =
test, I can see that things
> > break down if I just do the above once in the panel's setup. But things=
 work if I send a DSI NOP
> > instead in the dsi host. So looks to me that either the OMAP DSI or the=
 panel I have need some
> > command transmitted there. It probably has to happen between two frame =
transfers.
> >=20
> > There are also other things related to update which I'm not so happy ab=
out: 1) the TE gpio irq is
> > handled in the dsi host driver now, even if it's a panel gpio, 2) the d=
si host driver snoops the DSI
> > packets sent by the panel, and catches TEAR_ON/OFF packets, and then ch=
ange internal state accordingly.
> >=20
> > So... I could change the dsi host driver to only send a NOP, and do the=
 page/column call from the
> > panel's setup. That simplifies the code.
> >=20
> > Or I could add the new function to drm_panel_funcs, and send a NOP from=
 there. But if this "needs a
> > NOP" is an OMAP DSI feature, the panel driver is not the right place fo=
r it. I also think that
> > managing the TE cleanly needs more thought, and probably requires some =
more interaction between the
> > dsi host and the panel. It might be better to look at both the update c=
allback and the TE at the
> > same time.
>=20
> I'm fine addressing both issues on top of this series. My concern is
> that an incorrect split of responsibilities between the panel driver and
> the DSI host driver will result in panel drivers being compatible only
> with specific DSI hosts. It's a difficult issue, but I think we need to
> extend the DSI API to handle this cleanly.

Just some background info, since I looked into this while moving
the driver to the common drm/dsi infrastructure (I used existing
DSI drivers as reference):

IIRC most DSI host drivers do not seem support command mode at all.
Some seemed to support it from within the host driver, though. I
remember Exynos getting the TE gpio in the host driver and using
the IRQ routine to self-refresh (which would effectively always
refresh wasting lots of power compared to only refreshing on page
flip).

Also there are some command mode panel drivers (can be found by
looking for drivers _not_ setting the MIPI_DSI_MODE_VIDEO flag):

 * panel-novatek-nt35510.c
 * panel-samsung-s6d16d0.c
 * panel-samsung-s6e63j0x03.c
 * panel-samsung-s6e3ha2.c
 * panel-sharp-lq101r1sx01.c
 * panel-sony-acx424akp.c

So extending the DSI API will involve more drivers than omapdrm and
its DSI command mode panel driver and should probably be done in its
own series.

-- Sebastian

--st5ewojvixjr4cns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl+zoCoACgkQ2O7X88g7
+ppi3xAAgSRaAOSwaZH1xHmd9yWXHB0OVGSmSAAlZxEGqMAXLnngmKaMM2tWO4VV
CQVlmb2WcsEpDJhAzcQcBC7s23scnxcd20HclQT3z0EGA+KZX5S48rEMu51c5Cq9
jDtiCW9JyDFqevIyt3hmzrbfi62KymBjGjCWWN0yBxyH2MAIPcZEm1C4sHf+Hdzm
zPVydQptFjNtivB+PXuDW6uiSHJGdei0HcBDssqiy90Kr9E7awJ0apEomznLf4Yw
DjyKzP1VmYXkv0puCNRnlY2qV33wrAnJZIZgzR3YzfNRx2oUFHxGrDJx/FzZbmDL
W101mGZp1ezVp0kocsa6YJOpJbFXcXp53VBwn8rkvg1LWQFvsOdQvrQHHjunaUtY
s1dHKhW/JivFLJtA+0goqu4L9De4lW5rfd1oRO1qv5J+g9AAcbabKE2z1tSNPakr
qgBg+RLYHt8ZesRTYn6TndqX4LmeXRXeNOuuCLR1ol49gLIZJlLs0RTmWQl2jHM2
Y7WtfnhMicArZs1aOr8OTMywKDZzgQi7WZAVA1PwKHbS6La/1P9LCNRwXryb2x5i
TfN7t/Dqjxvo0AThZS3w72e/SMAkGzGOW32p5G5jbFLQ0yS3Dez1Jr0ztIZcqmU7
U52pYN/Cl+PQndxmGDL5B6daN5qTVywczKI8R+nfo1OmkAhj/Fs=
=KFQm
-----END PGP SIGNATURE-----

--st5ewojvixjr4cns--
