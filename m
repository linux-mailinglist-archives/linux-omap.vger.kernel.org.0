Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F63346E7E
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 02:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbhCXBJv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Mar 2021 21:09:51 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51064 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhCXBJc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Mar 2021 21:09:32 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3E6581C0B7D; Wed, 24 Mar 2021 02:09:29 +0100 (CET)
Date:   Wed, 24 Mar 2021 02:09:27 +0100
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
Message-ID: <20210324010927.GA12937@amd>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-4-tony@atomide.com>
 <20200527192817.GA2587830@bogus>
 <20200528095151.GE10358@localhost>
 <20210305104635.GA16695@duo.ucw.cz>
 <YEINdpPgud99a7qm@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <YEINdpPgud99a7qm@hovoldconsulting.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Fri 2021-03-05 11:52:38, Johan Hovold wrote:
> On Fri, Mar 05, 2021 at 11:46:35AM +0100, Pavel Machek wrote:
> > Hi!
> >=20
> > > > > For motorola modem case, we may have a GNSS device on channel 4.
> > > > > Let's add that to the binding and example.
> > > > >=20
> > > > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > > > ---
> > > > >  .../devicetree/bindings/serdev/serdev-ngsm.yaml          | 9 +++=
++++++
> > > > >  1 file changed, 9 insertions(+)
> >=20
> > >=20
> > > And since we're describing a mux, I think you need nodes for the virt=
ual
> > > ports rather than a reg property in what should be a serial client. T=
hat
> > > is something like
> > >=20
> > > 	serial@nnn {
> > > 		modem {
> > > 			compatible =3D "etsi,ts27001-mux";
> > >=20
> > > 			serial@4 {
> > > 				compatible =3D "etsi,ts27001-serial";
> > > 				reg =3D <4>;
> > >=20
> > > 				gnss {
> > > 					compatible =3D "motorola,motmdm-gnss";
> > > 				};
> > > 			};
> > > 		};
> > > 	};
> > >=20
> > > This way you can actually use serdev for the client drivers (e.g. for
> > > gnss), and those drivers also be used for non-muxed ports if needed
> > > (e.g. over USB).
> >=20
> > I have done changes you requested, and then hit "serdev is busy
> > because it can have at most one child" limit in the code. You have
> > pretty clean driver in your inbox, and no reply. No help with serdev
> > core limitations, either. Can you start to communicate?
>=20
> It's on my list, but time is limited.

Everyone's time is limited. Do you have any time estimates?
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmBakUcACgkQMOfwapXb+vKILgCguk02XmGCGT45kaSLl4YMEI8t
Pg8Anj3W57z1I+Jd1ss9/yNRWNRJKPwT
=lAtf
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
