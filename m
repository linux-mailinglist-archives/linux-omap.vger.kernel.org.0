Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 914841007D5
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 16:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbfKRPDH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 10:03:07 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56564 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbfKRPDH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Nov 2019 10:03:07 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 38F8E28E629
Received: by earth.universe (Postfix, from userid 1000)
        id 57AAF3C0C78; Mon, 18 Nov 2019 16:03:01 +0100 (CET)
Date:   Mon, 18 Nov 2019 16:03:01 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [RFCv1 11/42] ARM: dts: omap: add channel to DSI panels
Message-ID: <20191118150301.vvnsmztfxo76ghwe@earth.universe>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-12-sebastian.reichel@collabora.com>
 <2db2d505-2f92-621c-ba7c-552b89255594@ti.com>
 <20191118143332.nyyr6hb4b5c34xew@earth.universe>
 <7CBD93FA-60AB-4313-BF9C-230BDE2DAE7D@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u72uliej37qvmfri"
Content-Disposition: inline
In-Reply-To: <7CBD93FA-60AB-4313-BF9C-230BDE2DAE7D@goldelico.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--u72uliej37qvmfri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 18, 2019 at 03:37:12PM +0100, H. Nikolaus Schaller wrote:
> > Am 18.11.2019 um 15:33 schrieb Sebastian Reichel <sebastian.reichel@col=
labora.com>:
> > On Mon, Nov 18, 2019 at 03:05:07PM +0200, Tomi Valkeinen wrote:
> >> On 17/11/2019 04:39, Sebastian Reichel wrote:
> >>> The standard binding for DSI requires, that the channel number
> >>> of the panel is encoded in DT. This adds the channel number in
> >>> all OMAP3-5 boards, in preparation for using common infrastructure.
> >>>=20
> >>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> >>> ---
> >>>  .../devicetree/bindings/display/panel/panel-dsi-cm.txt      | 4 +++-
> >>>  arch/arm/boot/dts/omap3-n950.dts                            | 3 ++-
> >>>  arch/arm/boot/dts/omap3.dtsi                                | 3 +++
> >>>  arch/arm/boot/dts/omap4-droid4-xt894.dts                    | 3 ++-
> >>>  arch/arm/boot/dts/omap4-sdp.dts                             | 6 ++++=
--
> >>>  arch/arm/boot/dts/omap4.dtsi                                | 6 ++++=
++
> >>>  arch/arm/boot/dts/omap5.dtsi                                | 6 ++++=
++
> >>>  7 files changed, 26 insertions(+), 5 deletions(-)
> >>=20
> >> Is this required only in the .txt, or also by the driver? This does br=
eak
> >> backward compatibility with the dtbs, and there's always someone who w=
on't
> >> like it.
> >=20
> > I add a compatible string for the Droid 4 panel in addition to the
> > generic one, which is not really required and just a precaution in
> > case we need some quirks in the future.
> >=20
> > But I had to add the DSI channel to DT, which is required to follow
> > the standard DSI bindings. We cannot use the generic infrastructure
> > without this change. Technically it should have been there all the
> > time, it is only working because it is currently hardcoded to 0 in
> > the panel driver.
>=20
> Is it possible to change it to default to channel <0> if reg is not
> specified?

Currently nodes without reg property are skipped by of_mipi_dsi_device_add()
and of_mipi_dsi_device_add() fails if reg node is missing. Technically
it should be possible to default to channel 0 there. That affects all
platforms, though. Considering the small amount of boards affected, I think
its better to just fix the DT. Also the fixed DT does not make problems
with older kernels and can be backported.

> > TLDR: Yes, it is required by the driver and it does break backward
> > compatibility for N950 (panel does not yet work on mainline, since
> > the OMAP3 quirks are missing in the omapdrm DSI code), omap4-sdp (
> > untested, I do not know if its working) and Droid 4 (known to be
> > working with current mainline code, most likely people update their
> > DT anyways).

-- Sebastian

--u72uliej37qvmfri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3SsqEACgkQ2O7X88g7
+ppfMRAApSsw/G/rsDpnQGm9n+iLZmbAeBL0E2DLv/k2H1ejx6MCTMR27tHfCa0Y
s0x9dNsUF8f0d2Z4ydxAnwN2gUEwZ253s2uvsYZJGgJslgyN3gOyfwQdizzKKjTs
g3YSMgM7npmytE0BdMHnEs974LOPx71aq3JVvad1aPYOYDJsWyjp0KrwH9ptm5Yr
9m/un2PVlR38P1qYzTQ5LLOTrAADns5KAA0wnMnhjlt7tyQODktmesu2YLINg2ST
AAIvGOBCQP66F76uE4mmskEDFkIPmwD0iTOxylJuyvPiFLEzzipGNrADIArKeer2
X+MWr2lTEZGza8+hjXLSwiHYWXs7PUQthkA0bYyG1HX+oFJxL6xVo15Bm47YzKKP
K2Rb42BYBrYA8ueYtsEb/eIyifCOnKdNmlajxd1Q41QEHsU6MlMd3FzEJH8y1pLV
14LgHpnYYXf82mqGGMQpD23Tk94Z88u1W2mMhvcegT44joC7BOO8tXj6QdO3UXh0
Nz8jX4pcYxMN1761d+NEjkK/1srV9aoI3TT+eEmZx7UtbJdhTmUqtfWUe1VRhCks
kVKNbPU1Qq7HyjVB5mABrzSuTNEji3/6efKZF10cV0LCx+DAL26oefzWolEzrrGE
sODbLriQOQRTTOjwRJrWDMxwrzHsB2Vw+efmXZRIafho1cKGBjI=
=24dc
-----END PGP SIGNATURE-----

--u72uliej37qvmfri--
