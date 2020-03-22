Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1207218ED0B
	for <lists+linux-omap@lfdr.de>; Sun, 22 Mar 2020 23:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgCVWmd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 22 Mar 2020 18:42:33 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58798 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgCVWmd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 22 Mar 2020 18:42:33 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3991D1C033E; Sun, 22 Mar 2020 23:42:31 +0100 (CET)
Date:   Sun, 22 Mar 2020 23:42:30 +0100
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Droid 4 in -next -- still no backlight was Re: [PATCH 1/4] tty:
 n_gsm: Add support for serdev drivers
Message-ID: <20200322224230.GB28082@amd>
References: <20200319173755.65082-1-tony@atomide.com>
 <20200319173755.65082-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline
In-Reply-To: <20200319173755.65082-2-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> We can make use of serdev drivers to do simple device drivers for
> TS 27.010 chanels, and we can handle vendor specific protocols on top
> of TS 27.010 with serdev drivers.

I took all three series (

[PATCHv3 0/3] Lost key-up interrupt handling for omap4-keypa
[PATCH 1/3] Input: atmel_mxt_ts - use runtime PM instead of
[PATCHv5 0/4] n_gsm serdev support and protocol driver for d

) and applied them on top of next-20200320.

Good news is that result boots. (So I did partial testing of the patches).

Bad news is that I still don't have working backlight. I do have LED
and there's backlight device connected to the LED, so I can't control
the LED directly, but the screen is black (and I don't see boot
messages either).

Before I start debugging, does screen work for you in -next, or do you
have some fixes I could try?

Thanks and best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl536dYACgkQMOfwapXb+vKBJQCeIUN5N8vMzmkvY9E6nubpW6wN
P7IAoKaO0YTconM1rcr4rigfmHCyJeJk
=q+Wl
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
