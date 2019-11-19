Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B918102E32
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 22:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbfKSVXN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 16:23:13 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56240 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfKSVXM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 16:23:12 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 2065928BD9C
Received: by earth.universe (Postfix, from userid 1000)
        id A7CFB3C0C78; Tue, 19 Nov 2019 22:23:08 +0100 (CET)
Date:   Tue, 19 Nov 2019 22:23:08 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Merlijn Wajer <merlijn@wizzup.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [RFCv1 11/42] ARM: dts: omap: add channel to DSI panels
Message-ID: <20191119212308.mvwq32zwno2gu5v6@earth.universe>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-12-sebastian.reichel@collabora.com>
 <2db2d505-2f92-621c-ba7c-552b89255594@ti.com>
 <20191118143332.nyyr6hb4b5c34xew@earth.universe>
 <7CBD93FA-60AB-4313-BF9C-230BDE2DAE7D@goldelico.com>
 <20191118150301.vvnsmztfxo76ghwe@earth.universe>
 <20191118225209.GF35479@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a73gbwfpczdi2bom"
Content-Disposition: inline
In-Reply-To: <20191118225209.GF35479@atomide.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--a73gbwfpczdi2bom
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tony,

On Mon, Nov 18, 2019 at 02:52:09PM -0800, Tony Lindgren wrote:
> * Sebastian Reichel <sebastian.reichel@collabora.com> [191118 15:03]:
> > On Mon, Nov 18, 2019 at 03:37:12PM +0100, H. Nikolaus Schaller wrote:
> > > > Am 18.11.2019 um 15:33 schrieb Sebastian Reichel <sebastian.reichel=
@collabora.com>:
> > > > On Mon, Nov 18, 2019 at 03:05:07PM +0200, Tomi Valkeinen wrote:
> > > >> On 17/11/2019 04:39, Sebastian Reichel wrote:
> > > >>> The standard binding for DSI requires, that the channel number
> > > >>> of the panel is encoded in DT. This adds the channel number in
> > > >>> all OMAP3-5 boards, in preparation for using common infrastructur=
e.
> > > >>>=20
> > > >>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > >>> ---
> > > >>>  .../devicetree/bindings/display/panel/panel-dsi-cm.txt      | 4 =
+++-
> > > >>>  arch/arm/boot/dts/omap3-n950.dts                            | 3 =
++-
> > > >>>  arch/arm/boot/dts/omap3.dtsi                                | 3 =
+++
> > > >>>  arch/arm/boot/dts/omap4-droid4-xt894.dts                    | 3 =
++-
> > > >>>  arch/arm/boot/dts/omap4-sdp.dts                             | 6 =
++++--
> > > >>>  arch/arm/boot/dts/omap4.dtsi                                | 6 =
++++++
> > > >>>  arch/arm/boot/dts/omap5.dtsi                                | 6 =
++++++
> > > >>>  7 files changed, 26 insertions(+), 5 deletions(-)
> > > >>=20
> > > >> Is this required only in the .txt, or also by the driver? This doe=
s break
> > > >> backward compatibility with the dtbs, and there's always someone w=
ho won't
> > > >> like it.
> > > >=20
> > > > I add a compatible string for the Droid 4 panel in addition to the
> > > > generic one, which is not really required and just a precaution in
> > > > case we need some quirks in the future.
> > > >=20
> > > > But I had to add the DSI channel to DT, which is required to follow
> > > > the standard DSI bindings. We cannot use the generic infrastructure
> > > > without this change. Technically it should have been there all the
> > > > time, it is only working because it is currently hardcoded to 0 in
> > > > the panel driver.
> > >=20
> > > Is it possible to change it to default to channel <0> if reg is not
> > > specified?
> >=20
> > Currently nodes without reg property are skipped by of_mipi_dsi_device_=
add()
> > and of_mipi_dsi_device_add() fails if reg node is missing. Technically
> > it should be possible to default to channel 0 there. That affects all
> > platforms, though. Considering the small amount of boards affected, I t=
hink
> > its better to just fix the DT. Also the fixed DT does not make problems
> > with older kernels and can be backported.
>=20
> You might be able to do a local fixup at driver probe time using
> of_add_property(). See for example pcs_quirk_missing_pinctrl_cells()
> I added earlier because of similar issues.

That sounds like a good plan. I suppose it could be added for some
kernel releases with a WARN() asking the user to update their DT.

-- Sebastian

--a73gbwfpczdi2bom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3UXTwACgkQ2O7X88g7
+ppfHA/+ID0DwttcEAqc3xElkKPmxfDc6ATcdfmkQhKhnMI7DcqifusgdtDr3eip
YmoDkIa4dmMDHIJESxONUmzS7ZB+U9fPcstbUfsApLaAVrZbJ9L++WNU8RPqxsX8
2JbVR/B1E9r/z0IS+hy1KEEZc66/WX4sgcLe7flQgMSFLBGate0tJdZn97/Ifnka
bwVptQvy1kl0wDtipwE5pbw0hgp4ctwqHFFutEAaIWFCUjfJo+psOpYjOcxjJGub
HcNZPdtPiY5HcpSbOy2v4h/PF07Hc85YrHOpCGirvQ6diFHCTCDR7JhwYlIJWsrs
8/Ob3GOJ9iQI4LON1kF0BjO3YAoTZlWctS/PcLSEQBhQ7cTW2vmROL/KTQ9U2I4L
gazKwbESYoyMrL4rnDb8EJmOKe1/EOhyz+NftUFxuz8aFSFXPVOW9oQRZ2FiKYZm
gpmXPdiN+rJAxPHVcRkZ2sZRH/r8F1tWYuuT18yBmS1ysdDeI9DuDqOoXpTUpSAz
gHubJ7N2+v49RoSHPqR4340z6yK7XKGijNFT5EVjOTKOdatPHMNKjwC3JYWHMBnV
GU4C724Nxh1Lp3ShsW5lIeD90CcaUKRiAtJcTDm+Xx0ckXylL43U4Mr4lnMzcKvq
8tZg0qhp44139GEdHZm1hIkZRbNoELLcmdU2K5zfG14IoAbYJzo=
=/D3e
-----END PGP SIGNATURE-----

--a73gbwfpczdi2bom--
