Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22CD323549E
	for <lists+linux-omap@lfdr.de>; Sun,  2 Aug 2020 01:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgHAXXG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 1 Aug 2020 19:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgHAXXF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 1 Aug 2020 19:23:05 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4E5C06174A
        for <linux-omap@vger.kernel.org>; Sat,  1 Aug 2020 16:23:05 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 49D722935F9
Received: by earth.universe (Postfix, from userid 1000)
        id 59B173C0B87; Sun,  2 Aug 2020 01:22:59 +0200 (CEST)
Date:   Sun, 2 Aug 2020 01:22:59 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, David Shah <dave@ds0.me>
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
Message-ID: <20200801232259.hitcfosiq6f2i57y@earth.universe>
References: <20200705143614.GR37466@atomide.com>
 <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com>
 <20200706143613.GS37466@atomide.com>
 <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com>
 <20200707180115.GB5849@atomide.com>
 <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com>
 <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com>
 <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com>
 <20200724012411.GJ21353@pendragon.ideasonboard.com>
 <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pwyf74k5fo2yj67d"
Content-Disposition: inline
In-Reply-To: <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--pwyf74k5fo2yj67d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Aug 01, 2020 at 03:43:22PM +0200, H. Nikolaus Schaller wrote:
> > Am 24.07.2020 um 03:24 schrieb Laurent Pinchart <laurent.pinchart@ideas=
onboard.com>:
> > On Thu, Jul 23, 2020 at 09:03:49AM +0200, H. Nikolaus Schaller wrote:
> >>> Am 08.07.2020 um 09:52 schrieb H. Nikolaus Schaller <hns@goldelico.co=
m>:
> >>>> Am 07.07.2020 um 21:04 schrieb H. Nikolaus Schaller <hns@goldelico.c=
om>:
> >>>>=20
> >>>> And what I would need to know before I start to write new code is
> >>>> if is possible to operate a video mipi dsi panel with driver from
> >>>> gpu/drm/panel together with omapdrm (v5.7 and later).
> >>>=20
> >>> I did a quick test on a 5.7.6 kernel with the sysc fixes as
> >>> suggested by Tony.
> >>>=20
> >>> Then I overwrote the compatible entry of our display to be
> >>> orisetech,otm8009a and configured to build the otm8009a panel driver.
> >>>=20
> >>> The panel driver is loaded, but not probed (no call to otm8009a_probe=
).
> >>> It is shown in /sys/bus/mipi-dsi/drivers (and lsmod) but not /sys/bus=
/mipi-dsi/devices.
> >>>=20
> >>> So what should I try next?
> >>=20
> >> Any suggestions if and how it is possible to use a gpu/drm/panel MIPI =
DSI
> >> video mode panel with omapdrm (on OMAP5)?
> >=20
> > For the DSI panel to probe, the display driver needs to register a DSI
> > host with mipi_dsi_host_register(). omapdrm doesn't do so yet, we need
> > to integrate Sebastian's "[PATCHv2 00/56] drm/omap: Convert DSI code to
> > use drm_mipi_dsi and drm_panel" series first. I'll try to review it in
> > the near future.
> >=20
> >> The problem is that our old omapdrm/display driver is broken since v5.=
7 and
>=20
> Fortunately David did fix the broken "reboot" for OMAP5 (when using timer=
8).
> Now I could run an unattended bisect session for the MIPI DSI panel driver
> to find as the first bad commit:
>=20
> commit e7e67d9a2f1dd2f938adcc219b3769f5cc3f0df7
> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Date:   Wed Feb 26 13:24:59 2020 +0200
>=20
>    drm/omap: Switch the HDMI and VENC outputs to drm_bridge
>=20
> This was merged through v5.7-rc1. The problem persists since then up
> to v5.8-rc7 and likely also to v5.9.
>=20
> What I guess from the change hunks is that this is the critical one:
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapd=
rm/dss/output.c
> index 9ba7cc8539a1..ce21c798cca6 100644
> --- a/drivers/gpu/drm/omapdrm/dss/output.c
> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> @@ -60,6 +60,11 @@ int omapdss_device_init_output(struct omap_dss_device =
*out,
>  	}
> =20
>  	if (local_bridge) {
> +		if (!out->bridge) {
> +			ret =3D -EPROBE_DEFER;
> +			goto error;
> +		}
> +

The DSI code calls omapdss_device_init_output with
local_bridge=3DNULL, so this is no called.

>  		out->next_bridge =3D out->bridge;
>  		out->bridge =3D local_bridge;
>  	}
>=20
> Since I have not seen a reference to an omap DSI bridge driver in upstrea=
m kernels
> I would assume that out->bridge is NULL and therefore probing is deferred=
 forever
> and the old MIPI DSI driver (which is still there) is no longer operation=
al.
>=20
> This is consistent with that our (old omapdrm) panel driver is no longer =
probed.
>=20
> >> an experimental gpu/drm/panel driver does not probe. And I assume that
> >> omapdrm/display will disappear completely soon.
> >=20
> > Not before Sebastian's series gets integrated.
>=20
> Is there a simple patch (either from Sebastian's series or other source)
> that fixes this regression until Sebastian's series is fully merged and we
> can move to a module_mipi_dsi_driver based driver?

The purpose of the whole patchset is to move to drm_panel instead of
the omapdrm specific panel code. Some of the review feedback, that I
received implies that my patchset breaks your usecase (video model
DSI panel). The plan is to send it in smaller parts, which makes the
review process a bit simpler and also the rebasing work of the
series itself. The *.txt -> *.yaml binding patch has been queued
for 5.9 and the DT patches are currently waiting to be queued by
Tony. Next step is preparing for mipi_dsi. I will do this in two
steps:

1. patches up to the point creating problems for video mode
2. all the way to mipi_dsi (but not yet drm_panel)

-- Sebastian

--pwyf74k5fo2yj67d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl8l+UcACgkQ2O7X88g7
+pqkLg/8DWp9NdSGYPImKi2woTt2fRU1Pf4VdO10sAfhGuiuOLYNFndKPI0qyFAy
4ppysX0owYCcpsKZmiGyUrbmahpRjErF/C4dcjxLhnZytIAfPeONmcOhz3nyljWb
XRfjpn5TYjrUabPwGD6EVkhHu+WVB03Bl8Vh+ar+DCaOjOGoW2rSXRANc9rvgHD1
EugNLosc5Jer5iJKZoNKdHrTRkrq9VhuT07EScgDdbufX35b1P4yMLpcUPW6Xll5
DuUazOzZV7PtXMxNGjyGDVjGdS6Fr1hX5xXuEMizOdbCq3ShNDaQwQuPlrHB6AQ8
LliJMkM8HStvi9kjrMgZgT+wxQL3FLgt+omoiC7b9yDqebZ4qzhmKgYzUel2EHyl
WLi2ZkpakKAEugaTv7BG20VqVwvpxFxZncMaA7qmGbCD+lMx5v7s/I8IsNcdhahl
fN4nFPNvXNy8UQPvow9gZhQEjI2B88HAD2rK2R9zB/eCkibuKf5XgZ/weS7vh1Wd
DPtz9mUThWYOKnqXR9SlQ4L9WNDISZBGy0TwoYZKW0eXyV8hJnvQE5PbBY3jDSm9
qh1DEd9Nf5iiQyi23Cz5omwH+ScLT8NasHOBcnTaCjjRrOlZYEJhs4oQ9m5nGUbf
c5C0wbO61qCKliZVAxiqXZKArIPTTRGZOVlVwRAPdTYAHhJNB+Q=
=+mXd
-----END PGP SIGNATURE-----

--pwyf74k5fo2yj67d--
