Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB001C1F0E
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 22:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgEAUxU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 16:53:20 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58712 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgEAUxU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 May 2020 16:53:20 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BF18D1C020C; Fri,  1 May 2020 22:53:18 +0200 (CEST)
Date:   Fri, 1 May 2020 22:53:18 +0200
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
Subject: Re: [PATCH 6/6] ARM: dts: omap4-droid4: Configure modem for
 serdev-ngsm
Message-ID: <20200501205318.GH6043@duo.ucw.cz>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200430174615.41185-7-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9sSKoi6Rw660DLir"
Content-Disposition: inline
In-Reply-To: <20200430174615.41185-7-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--9sSKoi6Rw660DLir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-04-30 10:46:15, Tony Lindgren wrote:
> Let's enable the TS 27.010 /dev/gsmmux* interfaces via Linux n_gsm that
> can be used for voice calls and SMS with commands using a custom Motorola
> format.
>=20
> And let's also enable the kernel GNSS driver via serdev-ngsm that uses a
> dedicated TS 27.010 channel.
>=20
> Note that voice call audio mixer is not supported yet.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9sSKoi6Rw660DLir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqyMPgAKCRAw5/Bqldv6
8qoRAJ9XBGCn30K6iNApi0jst74YNd76XQCglCkMyqQcOwEfx4JuRZ1mYhOAndQ=
=k4vN
-----END PGP SIGNATURE-----

--9sSKoi6Rw660DLir--
