Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11622D568F
	for <lists+linux-omap@lfdr.de>; Sun, 13 Oct 2019 17:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbfJMPIV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Oct 2019 11:08:21 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45497 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729269AbfJMPIU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Oct 2019 11:08:20 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id D044680238; Sun, 13 Oct 2019 17:08:03 +0200 (CEST)
Date:   Sun, 13 Oct 2019 17:08:15 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 8/8] ARM: OMAP2+: Initialize voltage controller for omap4
Message-ID: <20191013150815.GF13278@amd>
References: <20191010001224.41826-1-tony@atomide.com>
 <20191010001224.41826-9-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="TeJTyD9hb8KJN2Jy"
Content-Disposition: inline
In-Reply-To: <20191010001224.41826-9-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--TeJTyD9hb8KJN2Jy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-10-09 17:12:24, Tony Lindgren wrote:
> We're missing initializing the PRM_VOLTCTRL register for voltage
> controller. Let's add omap4_vc_init_pmic_signaling() similar to what we
> have for omap3 and enable voltage control for retention.
>=20
> This brings down droid4 power consumption with mainline kernel to somewhe=
re
> between 40 and 50mW from about 70 to 80 mW for the whole device when runn=
ing
> idle with LCD and backlight off, WLAN connected, and USB and modem modules
> unloaded.
>=20
> Mostly just rmmod of omap2430, ohci-platform and phy-mapphone-mdm6600 are
> needed to idle USB and shut down the modem. And after that measuring idle
> power consumption can be done with reading sysfs entry every ten seconds =
for
> /sys/class/power_supply/battery/power_avg. Then rmmod of phy-cpcap-usb wi=
ll
> save few more mW, but will disable the debug UART.
>=20
> Note that sometimes CM_L4PER_UART1_CLKCTRL at 0x4a009540 does not idle
> properly after unloading of phy-mapphone-mdm6600.

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--TeJTyD9hb8KJN2Jy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jPd8ACgkQMOfwapXb+vKc6QCfTInHiCOojLoYl+MSblD5nQ+O
DR4AoKLHNZ8Zwjp6K/Te03yOdXiHsdQx
=5UcY
-----END PGP SIGNATURE-----

--TeJTyD9hb8KJN2Jy--
