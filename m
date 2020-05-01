Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 489AA1C1F01
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 22:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgEAUvy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 16:51:54 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58552 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbgEAUvx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 May 2020 16:51:53 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F0BBE1C020D; Fri,  1 May 2020 22:51:51 +0200 (CEST)
Date:   Fri, 1 May 2020 22:51:51 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 5/6] gnss: motmdm: Add support for Motorola Mapphone
 MDM6600 modem
Message-ID: <20200501205151.GG6043@duo.ucw.cz>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200430174615.41185-6-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bO4vSxwwZtUjUWHo"
Content-Disposition: inline
In-Reply-To: <20200430174615.41185-6-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--bO4vSxwwZtUjUWHo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-04-30 10:46:14, Tony Lindgren wrote:
> Motorola is using a custom TS 27.010 based serial port line discipline
> for various devices on the modem. These devices can be accessed on
> dedicated channels using Linux kernel serdev-ngsm driver.
>=20
> For the GNSS on these devices, we need to kick the GNSS device at a
> desired rate. Otherwise the GNSS device stops sending data after a
> few minutes. The rate we poll data defaults to 1000 ms, and can be
> specified with a module option rate_ms between 1 to 16 seconds.
>=20
> Note that AGPS with xtra2.bin is not yet supported, so getting a fix
> can take quite a while. And a recent gpsd is needed to parse the
> $GNGNS output, and to properly handle the /dev/gnss0 character device.
> I've confirmed it works properly with gpsd-3.20.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bO4vSxwwZtUjUWHo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqyL5wAKCRAw5/Bqldv6
8mfcAKCJxdx+I2WyBgPJhT+5+9Hk/E8QIgCfboYS3+XC0diN76TZ/F5hVji8Ghw=
=myFc
-----END PGP SIGNATURE-----

--bO4vSxwwZtUjUWHo--
