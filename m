Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5802E81AB
	for <lists+linux-omap@lfdr.de>; Thu, 31 Dec 2020 19:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgLaSyP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Dec 2020 13:54:15 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:46884 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgLaSyO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Dec 2020 13:54:14 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 876521C0B79; Thu, 31 Dec 2020 19:53:30 +0100 (CET)
Date:   Thu, 31 Dec 2020 19:53:29 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: motorola-mapphone: Configure lower
 temperature passive cooling
Message-ID: <20201231185329.GA28294@amd>
References: <20201230084232.19221-1-tony@atomide.com>
 <20201230084232.19221-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <20201230084232.19221-2-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The current cooling device temperature is too high at 100C as we have a
> battery on the device right next to the SoC as pointed out by Carl Philipp
> Klemm <philipp@uvos.xyz>. Let's configure the max temperature to
> 80C.

It is very possible I don't have power management set up correctly, as
it breaks the modem.

(Additional problem is that shutdown does not work for me, it reboots
instead, so emergency poweroff won't do much good).

Shortly after bootup with kernel 5.9, I was using for motmdm debugging.

19:03, uptime 4min, CPU temp rose from 41 to 43C. Battery and board
are at 28C, 30C. Let me plug in the charger. It draws 350mA from USB.

19:20, CPU still at 43C, board and battery at 30C. That's way better
than I remember.

I ran "cat /dev/zero"; within seconds, CPU is at 52C. It also went
down to 45C rather quickly.

Lets try three instances of cat /dev/zero. Again, 52C in 20 seconds
and it slowly climbs to 58.5C.

Let's try ofono build. 60C rather quickly, then 62C and 65C. It takes
few minutes to climb to 68.5C.

But... this is way better then I remember. Let's hope temperatures
don't climb back during some other use. (Also... machine seems cooler
to touch.)

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl/uHikACgkQMOfwapXb+vK9LACfR1wSOqcfb8LEiCHOD71dfbP2
vJkAoLGNjajcYWJqMAf1m8evlr4fld/X
=R5fC
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
