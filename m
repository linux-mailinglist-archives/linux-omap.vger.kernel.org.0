Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610C31C1E5D
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 22:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgEAUX3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 16:23:29 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56044 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgEAUX3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 May 2020 16:23:29 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BDE8C1C020D; Fri,  1 May 2020 22:23:27 +0200 (CEST)
Date:   Fri, 1 May 2020 22:23:27 +0200
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
Subject: Re: [PATCHv6 0/6] n_gsm serdev support and GNSS driver for droid4
Message-ID: <20200501202327.GB6043@duo.ucw.cz>
References: <20200430174615.41185-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline
In-Reply-To: <20200430174615.41185-1-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Now without the chardev support, the /dev/gsmtty* using apps need
> to use "U1234AT+CFUN?" format for the packets. The advantage is
> less kernel code, and we keep the existing /dev/gsmtty* interface.
>=20
> If we still really need the custom chardev support, that can now
> be added as needed with the channel specific consumer driver(s).
>=20
> My guess is that at least with the pending ofono patches, we just
> want to use the raw interface for /dev/gsmtty* interface and stop
> pretending we have a modem that is AT compatible.

The series:

Tested-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqyFPwAKCRAw5/Bqldv6
8qojAKCDhhsS3gVWzAv7kmsqIRpAZu0MwgCfXTfHZf3W8Um9tldLGB9c52a1r/E=
=I/R5
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
