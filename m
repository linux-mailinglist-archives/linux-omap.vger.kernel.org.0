Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC461C2051
	for <lists+linux-omap@lfdr.de>; Sat,  2 May 2020 00:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgEAWGl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 18:06:41 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37590 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgEAWGl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 May 2020 18:06:41 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 680671C020C; Sat,  2 May 2020 00:06:39 +0200 (CEST)
Date:   Sat, 2 May 2020 00:06:37 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Pavel Machek <pavel@denx.de>, Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv6 0/6] n_gsm serdev support and GNSS driver for droid4
Message-ID: <20200501220637.GA19818@amd>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200430222605.GA10922@duo.ucw.cz>
 <20200501145252.GC37466@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <20200501145252.GC37466@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-05-01 07:52:52, Tony Lindgren wrote:
> * Pavel Machek <pavel@denx.de> [200430 22:27]:
> >=20
> > > My guess is that at least with the pending ofono patches, we just
> > > want to use the raw interface for /dev/gsmtty* interface and stop
> > > pretending we have a modem that is AT compatible.
> >=20
> > I tried to get it to work... it was not fun and I did not get far.
>=20
> OK. Yeah it's now 2020 and still dealing with serial port stuff :)

Yeah, and scary thing is... it is 2020 and serial port is _still_
complex and hard to understand and debug :-).

> OK :) I still need to update the ALSA related patches on top
> of this $subject series.

Let me know when you have these.

								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6snWwACgkQMOfwapXb+vIzIgCgh+kpNi03IGiu3qZaCkJjxrwn
ZugAnRiL9aPdP7Z2i/pEXCljELO8idBA
=2YyH
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
