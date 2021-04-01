Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA50335128F
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 11:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233553AbhDAJn3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 05:43:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:56794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230284AbhDAJnG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 1 Apr 2021 05:43:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8958560FE8;
        Thu,  1 Apr 2021 09:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617270185;
        bh=Yrz9+JUWWWv7fTZsYX+1n7GPNYO74iP0u1uRWzNvi1k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LTMT1i2w1rDsrdehRnXN2kA8j/04CGtN/4wASwI2hC7otfSvjl5Qeu1cdjaRV22Qf
         /+i35ov2TbqjwLFeSq2UQEQlS8Or7pnp3G4E80tGTzm+DqzO1r8C4FYfDDVStLNMru
         RIhd8uT3508g70HvDpF0M+EEBXMewf/gzM/nqGYSQrbCusQzjwtpvClxLtMuJx1VCK
         UQT+C7BQDeNLx96rNQ7NhulvzPPNDCGN7Odrs5vfus7tURnPvvq/b8AvX6XDpy/fLg
         9Usu14BmlWtw8dU4nWbN23KPkb5uNHsXEh57UE4H0OurWELIWEM/b41PUddtWzUb1n
         ACGOgpgVykG3g==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lRtqw-0008PZ-UA; Thu, 01 Apr 2021 11:43:02 +0200
Date:   Thu, 1 Apr 2021 11:43:02 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: serdev: ngsm: Add binding for GNSS
 child node
Message-ID: <YGWVpvEci16RpAOg@hovoldconsulting.com>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-4-tony@atomide.com>
 <20200527192817.GA2587830@bogus>
 <20200528095151.GE10358@localhost>
 <20210305104635.GA16695@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/Hd9/fYkpnpPNgUL"
Content-Disposition: inline
In-Reply-To: <20210305104635.GA16695@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--/Hd9/fYkpnpPNgUL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 05, 2021 at 11:46:35AM +0100, Pavel Machek wrote:
> Hi!
>=20
> > > > For motorola modem case, we may have a GNSS device on channel 4.
> > > > Let's add that to the binding and example.
> > > >=20
> > > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > > ---
> > > >  .../devicetree/bindings/serdev/serdev-ngsm.yaml          | 9 +++++=
++++
> > > >  1 file changed, 9 insertions(+)
>=20
> >=20
> > And since we're describing a mux, I think you need nodes for the virtual
> > ports rather than a reg property in what should be a serial client. That
> > is something like
> >=20
> > 	serial@nnn {
> > 		modem {
> > 			compatible =3D "etsi,ts27001-mux";
> >=20
> > 			serial@4 {
> > 				compatible =3D "etsi,ts27001-serial";
> > 				reg =3D <4>;
> >=20
> > 				gnss {
> > 					compatible =3D "motorola,motmdm-gnss";
> > 				};
> > 			};
> > 		};
> > 	};
> >=20
> > This way you can actually use serdev for the client drivers (e.g. for
> > gnss), and those drivers also be used for non-muxed ports if needed
> > (e.g. over USB).
>=20
> I have done changes you requested, and then hit "serdev is busy
> because it can have at most one child" limit in the code. You have
> pretty clean driver in your inbox, and no reply. No help with serdev
> core limitations, either. Can you start to communicate?

Heh, look at the devicetree example above that I gave you back in March.
It has the virtual serial ports described ("serial@4"), which you were
missing.

Johan

--/Hd9/fYkpnpPNgUL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCYGWVogAKCRALxc3C7H1l
CP6uAQDltdfufHVUrRYNBelpVl3fEoTsf1GoHJoqhBC24nKaSAEA3NEtBSgdOhRM
Pv+uTEMD+C+Z5GqmUMgcrl1pzCWVIwM=
=JZxP
-----END PGP SIGNATURE-----

--/Hd9/fYkpnpPNgUL--
