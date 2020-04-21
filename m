Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDC0D1B3153
	for <lists+linux-omap@lfdr.de>; Tue, 21 Apr 2020 22:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgDUUjf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 16:39:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35068 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgDUUjf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Apr 2020 16:39:35 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 576541C013D; Tue, 21 Apr 2020 22:39:33 +0200 (CEST)
Date:   Tue, 21 Apr 2020 22:39:32 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Pavel Machek <pavel@denx.de>, Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv5 0/4] n_gsm serdev support and protocol driver for
 droid4 modem
Message-ID: <20200421203932.GA21523@duo.ucw.cz>
References: <20200319173755.65082-1-tony@atomide.com>
 <20200421115920.GA16890@amd>
 <20200421124820.GB784065@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <20200421124820.GB784065@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-04-21 14:48:20, Greg Kroah-Hartman wrote:
> On Tue, Apr 21, 2020 at 01:59:20PM +0200, Pavel Machek wrote:
> > Hi!
> >=20
> > > Here's v4 set of n_gsm serdev support patches, and the related protoc=
ol
> > > driver for the modem found on Motorola Mapphone phones and tablets
> > > like droid4.
> > >=20
> > > This series only adds basic character device support for the serdev
> > > driver. Other serdev consumer drivers for specific devices will be
> > > posted separately.
> > >=20
> > > The patches are against v5.6-rc series.
> >=20
> > And it would be good to get them into v5.7... pretty please :-).
>=20
> No, 5.7 is not ok for this, and i think it already needs a respin as
> this is not in my patch queue anymore.

Umm, I meant v5.8. OTOH it is new hardware support, and phone without
modem is pretty much useless, so ... v5.7-rc3 should not be
_completely_ out of question ;-).
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXp9aBAAKCRAw5/Bqldv6
8o94AJ96H+8JzKl/Nq+To644ZocIUfDqFACeMR/pndEi5w/lGOiGaSVnaZLBRk0=
=F8am
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
