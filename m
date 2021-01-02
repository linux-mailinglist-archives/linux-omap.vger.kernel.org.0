Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593FF2E880E
	for <lists+linux-omap@lfdr.de>; Sat,  2 Jan 2021 17:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbhABQYS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Jan 2021 11:24:18 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:41500 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbhABQYS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Jan 2021 11:24:18 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8251B1C0B76; Sat,  2 Jan 2021 17:23:34 +0100 (CET)
Date:   Sat, 2 Jan 2021 17:23:34 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Johan Hovold <johan@kernel.org>, phone-devel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv6 0/4] n_gsm serdev support and protocol driver for
 droid4 modem
Message-ID: <20210102162334.GA16186@duo.ucw.cz>
References: <20200421232752.3070-1-tony@atomide.com>
 <20200423114326.GQ18608@localhost>
 <20200423153756.GE37466@atomide.com>
 <20200528082420.GA10358@localhost>
 <20201220224816.GA28213@duo.ucw.cz>
 <20201224080239.GF26857@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <20201224080239.GF26857@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > I'm afraid I'll need some more answers in near future, but for now:
> >=20
> > Tony, do you remember / can you figure out what gsmtty GPS is on? I
> > never used it on that interface, and I can't seem to figure it out.
> >=20
> > My notes say:
> >=20
> > /dev/motmdm1 -- basic support, calls, on/off                           =
        =20
> > /dev/motmdm3 -- send sms interface                                     =
        =20
> > /dev/motmdm9 -- receive sms interface                                  =
        =20
> >
> > (and gsmtty numbering is same)
>=20
> Yes I have not had a chance to look at these for several months now,
> but have the latest set in droid4-pending-v5.10 branch in my github
> tree.
>=20
> The gnss device is at /dev/gsmtty6, see the current droid4-agps tool
> to upload the almanac also on github. That's has turned out to be a
> pretty good gsm serdev test too :)

Treason uncloaked!

While A-GPS is at gsmtty6 I guess, NMEA data are on gsmtty4. And I
could not access that one, due to bitmask reserving it for gnss.

But now I have figured it out, and should have something reviewable
soon.

Thanks for support,

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX/CeBgAKCRAw5/Bqldv6
8mDGAJ4hFqCVNfsoBFMmdNHP0ShhK8RkswCfdxhCfUSA2o0TiLEWex10yiMM7yQ=
=3byw
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
