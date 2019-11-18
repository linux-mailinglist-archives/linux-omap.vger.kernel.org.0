Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF5A100771
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 15:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfKROdh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 09:33:37 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56246 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfKROdh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Nov 2019 09:33:37 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 0CDE928D7EE
Received: by earth.universe (Postfix, from userid 1000)
        id 8C7BA3C0C78; Mon, 18 Nov 2019 15:33:32 +0100 (CET)
Date:   Mon, 18 Nov 2019 15:33:32 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com
Subject: Re: [RFCv1 11/42] ARM: dts: omap: add channel to DSI panels
Message-ID: <20191118143332.nyyr6hb4b5c34xew@earth.universe>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-12-sebastian.reichel@collabora.com>
 <2db2d505-2f92-621c-ba7c-552b89255594@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7gyttedf64o66f7u"
Content-Disposition: inline
In-Reply-To: <2db2d505-2f92-621c-ba7c-552b89255594@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--7gyttedf64o66f7u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 18, 2019 at 03:05:07PM +0200, Tomi Valkeinen wrote:
> On 17/11/2019 04:39, Sebastian Reichel wrote:
> > The standard binding for DSI requires, that the channel number
> > of the panel is encoded in DT. This adds the channel number in
> > all OMAP3-5 boards, in preparation for using common infrastructure.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >   .../devicetree/bindings/display/panel/panel-dsi-cm.txt      | 4 +++-
> >   arch/arm/boot/dts/omap3-n950.dts                            | 3 ++-
> >   arch/arm/boot/dts/omap3.dtsi                                | 3 +++
> >   arch/arm/boot/dts/omap4-droid4-xt894.dts                    | 3 ++-
> >   arch/arm/boot/dts/omap4-sdp.dts                             | 6 ++++--
> >   arch/arm/boot/dts/omap4.dtsi                                | 6 ++++++
> >   arch/arm/boot/dts/omap5.dtsi                                | 6 ++++++
> >   7 files changed, 26 insertions(+), 5 deletions(-)
>=20
> Is this required only in the .txt, or also by the driver? This does break
> backward compatibility with the dtbs, and there's always someone who won't
> like it.

I add a compatible string for the Droid 4 panel in addition to the
generic one, which is not really required and just a precaution in
case we need some quirks in the future.

But I had to add the DSI channel to DT, which is required to follow
the standard DSI bindings. We cannot use the generic infrastructure
without this change. Technically it should have been there all the
time, it is only working because it is currently hardcoded to 0 in
the panel driver.

TLDR: Yes, it is required by the driver and it does break backward
compatibility for N950 (panel does not yet work on mainline, since
the OMAP3 quirks are missing in the omapdrm DSI code), omap4-sdp (
untested, I do not know if its working) and Droid 4 (known to be
working with current mainline code, most likely people update their
DT anyways).

-- Sebastian

--7gyttedf64o66f7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3Sq7gACgkQ2O7X88g7
+pomnQ/+NDCGBbuhvwe0NciJeQx4ay66qWzTVPX4mhQJ74usiePwJ546KxTh+jFn
QIMBkbYs/dVbxizZMvKL3p4s+kOKB3QjDrT0hc3CC29C/F2j32vgpwUG89I94DuQ
9Kdd4Gec0wB45EFrKLr/kd+VHN2BivdjoUVcyhGqiPtamwXB/Oc70Ql42mIuQMb5
v3ujMPXGnTOfKpBbAAA5xULcApa0ZAHO7/+tupsZIXPEr+6yXR1nqED9Typ/AHVM
yEzDh3pQKTeK8fPzENll12LWfQ/lN4mMj1xH0JC3ouTUexCj8T7FrmupvTk/pOG9
isEX3OL/x0EK1upqMZQuFrECITX3E1916u+3LedOlCKCKVQhBQ0l5E6PUebZB5eY
EYGD4+ous5/m+Ygn34DWoxklcSQYfQzqLFpCKUx9S2bzREnUm0SeNEIkX0fPxc6f
u7FnrVrbC/VZ8rZX8zfUgPRkVIsGBVHSVBL8QVW3+X1pLVtpIqGD/eKcd9pvE+5I
Wod3+A8lvAk0VJ2P4ijtvroFix5kz8kRORS2ovGYowwfOT9vLj2DzZUWXjdHPQ2/
b7XVn9/LjH/yVipQmm4phoPqXtxxFHuhnXLA4sl6tV/FzP2laVZoYJAyqSsy+taq
yKwCaR65BC8Qjaa1yHbYY57klDdaLQidqDccvGELHYb6kNOslfc=
=ow+4
-----END PGP SIGNATURE-----

--7gyttedf64o66f7u--
