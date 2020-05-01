Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1891C0F64
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 10:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgEAIVS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 04:21:18 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33806 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728334AbgEAIVO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 May 2020 04:21:14 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 780AD1C020C; Fri,  1 May 2020 10:21:12 +0200 (CEST)
Date:   Fri, 1 May 2020 10:21:11 +0200
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
Message-ID: <20200501082111.GA7501@amd>
References: <20200430174615.41185-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <20200430174615.41185-1-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Now without the chardev support, the /dev/gsmtty* using apps need
> to use "U1234AT+CFUN?" format for the packets. The advantage is
> less kernel code, and we keep the existing /dev/gsmtty* interface.

Actually... yes, this works. But no, this is not "existing" tty
interface.

ttys work per character, and this interface definitely does not... it
is "packet" based, write() syscalls need exactly right lengths. You
can't just open minicom, and type "U1234...". You can't paste it,
either (I tried). tty controls like start/stop bits and baud rate are
useless here. CR/LF conversions are unwanted/dangerous because it is
confusing hard to debug if you get them wrong.

Now, I don't see reason why this could not be made to work, and it may
be more important to have something in mainline and work with that. So
if you can make this into -next, I'll not complain too loudly. But it
is... still wrong and I liked motmdm* more :-).

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6r2/cACgkQMOfwapXb+vJWVQCgmZWp4uW4WcDVtKcZ64vezhLQ
cwAAn2QiA0rySRtYXW2XeiPwWH7txj3y
=CjiR
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
