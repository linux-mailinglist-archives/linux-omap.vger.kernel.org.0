Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA38B32E6C6
	for <lists+linux-omap@lfdr.de>; Fri,  5 Mar 2021 11:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhCEKw3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Mar 2021 05:52:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:33770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229599AbhCEKwY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 5 Mar 2021 05:52:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 501A264F69;
        Fri,  5 Mar 2021 10:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614941544;
        bh=YYFzJma7zPx4Kx3dA3oKfvxHgcFcm+y+m6Z9cpi1RXk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SYCbDYm2bs55j0V0duYtz91QVE52tSxQlCsdvcac2lKYpuiuay6YuL5a+7jWH6TZv
         OHdTSHL5iuYSD02/MB7ooyd8jA50ovQj4afhohZMkmVTrlfQp4Rs0rz78kKaZOSZM5
         xekYAeR/8QmRbBNVbfoygKygey1lHuKFv+e7IF0dR4VN0ny/8tWD03FJMsWDpxdt8Q
         VANeLVftwSBxGF+Np1v0yRo5Q7JgCIuA5yxXH+yWi18GfYEo1rFChnCJEMKL3dJsnF
         dqlYLUwa2zbU9pPHUU3nA/b4BLj6nfYFYuK3HRdloVzaYKjosV5EShS1PCxmkdd9yP
         0AUiVjJcst2Jw==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lI84U-0001Yt-Ju; Fri, 05 Mar 2021 11:52:38 +0100
Date:   Fri, 5 Mar 2021 11:52:38 +0100
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
Message-ID: <YEINdpPgud99a7qm@hovoldconsulting.com>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-4-tony@atomide.com>
 <20200527192817.GA2587830@bogus>
 <20200528095151.GE10358@localhost>
 <20210305104635.GA16695@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="A5wAKrPZ7DidaG1c"
Content-Disposition: inline
In-Reply-To: <20210305104635.GA16695@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--A5wAKrPZ7DidaG1c
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

It's on my list, but time is limited.

Johan

--A5wAKrPZ7DidaG1c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCYEINcgAKCRALxc3C7H1l
CNanAP45syeXlOG4v/I+wR7BTnVQTdv8OY+hPRVuS2HbPHKjdQEAgMOFWA3iYjdn
TXZlX4ZWGN9dajvLxlA3fh0WLvSIsQQ=
=Vfjl
-----END PGP SIGNATURE-----

--A5wAKrPZ7DidaG1c--
