Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6E215CDA6
	for <lists+linux-omap@lfdr.de>; Thu, 13 Feb 2020 22:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727891AbgBMV54 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Feb 2020 16:57:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:52962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726780AbgBMV54 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 13 Feb 2020 16:57:56 -0500
Received: from earth.universe (unknown [185.62.205.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A6AD24680;
        Thu, 13 Feb 2020 21:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581631074;
        bh=R3sxgy+mdg91wW+6Haz7xIGPfOrm3a7jt0NPiy78oXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AaThAp/E3n9sE1y/nfQxwj7a2ad1kqv6/94U62JPF+OMjk4D4LVrnnQaONZZMvUf4
         ib5SF1kl+1R3mWxD1oqEr+AD2boAjT8df9f2eCqITcNxn4f+EIGXptWFDOBK+A4ZW5
         GBmBwV3bJg+73/iwZfxW8tkDIT1Sb/o4zFsL6hpE=
Received: by earth.universe (Postfix, from userid 1000)
        id 00D9D3C0C83; Thu, 13 Feb 2020 22:57:51 +0100 (CET)
Date:   Thu, 13 Feb 2020 22:57:51 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
Message-ID: <20200213215751.tzkma6v7nkos6r5g@earth.universe>
References: <20191212203550.GB4892@pendragon.ideasonboard.com>
 <add3d8af-6977-68e6-fb77-2fa748c4714a@ti.com>
 <b39e52f1-3e73-5f26-6206-0956cf482631@ti.com>
 <20200211110712.GB28355@pendragon.ideasonboard.com>
 <3b4d10c6-7cb2-af53-3a39-31eef441bfdd@ti.com>
 <98da360f-880b-af56-b285-4d9b39f8a342@wizzup.org>
 <20200211160524.GE64767@atomide.com>
 <87b1111e-af06-1e2a-8baa-c3f9a15f1874@ti.com>
 <20200211162719.GF64767@atomide.com>
 <d7e51d54-ffb3-2792-8bdb-73fc627fd675@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7zwud3dbglg3r2xl"
Content-Disposition: inline
In-Reply-To: <d7e51d54-ffb3-2792-8bdb-73fc627fd675@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--7zwud3dbglg3r2xl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 11, 2020 at 07:22:14PM +0200, Tomi Valkeinen wrote:
> On 11/02/2020 18:27, Tony Lindgren wrote:
> > > We are still missing DSI command mode support, and moving it
> > > to the common DRM model.
> >=20
> > Nope, DSI command mode support has been working just fine for
> > a while now :) And Sebastian has a WIP git tree of the common DRM
>=20
> Indeed... It had been going on for so long that now my mind is
> stuck at dsi-command-mode-not-yet-in =3D).

Welcome in the future :)

> > model changes for it. I don't think we have devices with DSI
> > command mode working for omapfb but not for omapdrm?
>=20
> Yes, I think that is true.

Note, that OMAP3 quirk is missing (IDK if its supported in omapfb,
haven't used it for ages). I planned to have a look at OMAP3 once
the patchset moving omapdrm DSI to common DRM is merged, which
needs a non-trivial rebase.

> > What got missed for v5.6-rc1 is the LCD backlight patch though,
> > I think the only issue there is default-brightness vs more common
> > default-brightness-value usage if you have any input to that.
>=20
> At least for some boards a power supply is needed, and I think
> there was no conclusion on who should enable that. It didn't seem
> to fit in anywhere...
>=20
> But need to check on the latest status. I wasn't following that
> work closely, as JJ was working on it.

FWIW omapdrm's DSI driver is ready for that and omapfb is not :P

-- Sebastian

--7zwud3dbglg3r2xl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5FxlwACgkQ2O7X88g7
+pqvXA/8Df37jp3rBllH6fS56foegeRsSHQqA9OT3z7T/hNIOJK4yQ0sRefOv72Q
ESnuruZy3O04dvEDN+5wc0OHpoaxYlWnHDUZXD2lSWn6pqGXTKPESDfE9eV3iX/w
UbZH39t+l2aZz76rh2Ryln58orgg1XQLzQhw2G5s9Lqr3X1olzs/oDq4WgWboEix
XZdbtn6XrCa5kotrGoBMpVKsxgXG17Y2gHPOQnBuDYUKNM1niHIUUteUgnz9w/YH
pomiTehfhfg7INgWYZFCiovuPPs8KX37Ut9ZJkJ3FGwDRKWk76O8PYDSdmiNfYsr
jqdTH6aEwJVEJKnFv9GTmxknU8WuSnkP5vXFtiy/wli/pczXwKOIoGOc+M+zwvAY
3tbNMq9eXKFHV/QnDsszJDXn32KM1CPCrns+aD7OYV8YlJZekVUXgSwQqhQ6BZWs
qAaZGS9VHybvtgGipNr1AZazfdUel5bmu+IQvJvVxg83lR50jBhKLTzl8AHf/SS+
4zCOa8Nzx14EQ24iRe6YZyGkb7t6KZ3BUbLpZHq1THqmJW7LCYgIn8sSKoPPvwrx
b+vPbZVdkH7W8GJOH+wVUQQbmrm55uhS53sMFpiBK1e6GN4uIfRr5TpFSk5JrWCd
q+Q9XM4o3Cxr6KM8ycXg5h5SoaJDtdYPIYwXMS4G4SOjb/Ob2rs=
=YggO
-----END PGP SIGNATURE-----

--7zwud3dbglg3r2xl--
