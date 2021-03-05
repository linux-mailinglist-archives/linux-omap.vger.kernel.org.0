Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAFCB32E6A7
	for <lists+linux-omap@lfdr.de>; Fri,  5 Mar 2021 11:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhCEKrB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Mar 2021 05:47:01 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:45984 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhCEKqk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Mar 2021 05:46:40 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 57AFC1C0B7D; Fri,  5 Mar 2021 11:46:35 +0100 (CET)
Date:   Fri, 5 Mar 2021 11:46:35 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Johan Hovold <johan@kernel.org>
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
Message-ID: <20210305104635.GA16695@duo.ucw.cz>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-4-tony@atomide.com>
 <20200527192817.GA2587830@bogus>
 <20200528095151.GE10358@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
In-Reply-To: <20200528095151.GE10358@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > For motorola modem case, we may have a GNSS device on channel 4.
> > > Let's add that to the binding and example.
> > >=20
> > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > ---
> > >  .../devicetree/bindings/serdev/serdev-ngsm.yaml          | 9 +++++++=
++
> > >  1 file changed, 9 insertions(+)

>=20
> And since we're describing a mux, I think you need nodes for the virtual
> ports rather than a reg property in what should be a serial client. That
> is something like
>=20
> 	serial@nnn {
> 		modem {
> 			compatible =3D "etsi,ts27001-mux";
>=20
> 			serial@4 {
> 				compatible =3D "etsi,ts27001-serial";
> 				reg =3D <4>;
>=20
> 				gnss {
> 					compatible =3D "motorola,motmdm-gnss";
> 				};
> 			};
> 		};
> 	};
>=20
> This way you can actually use serdev for the client drivers (e.g. for
> gnss), and those drivers also be used for non-muxed ports if needed
> (e.g. over USB).

I have done changes you requested, and then hit "serdev is busy
because it can have at most one child" limit in the code. You have
pretty clean driver in your inbox, and no reply. No help with serdev
core limitations, either. Can you start to communicate?

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYEIMCwAKCRAw5/Bqldv6
8vX6AKDEZXZzQRsFq96/zZjnwyH4M5OK9ACgvXWJAfROdL/PovAeI57QNdO1xfY=
=nOBS
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
