Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED2C212ABB6
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2019 11:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbfLZKrs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 Dec 2019 05:47:48 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:46714 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfLZKrs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 26 Dec 2019 05:47:48 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 461BB1C210C; Thu, 26 Dec 2019 11:47:46 +0100 (CET)
Date:   Thu, 26 Dec 2019 11:47:45 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 1/3] phy: cpcap-usb: Prevent USB line glitches from
 waking up modem
Message-ID: <20191226104745.GJ4033@amd>
References: <20191222181704.61511-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n8884J15jRwcBTvu"
Content-Disposition: inline
In-Reply-To: <20191222181704.61511-1-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--n8884J15jRwcBTvu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2019-12-22 10:17:02, Tony Lindgren wrote:
> The micro-USB connector on Motorola Mapphone devices can be muxed between
> the SoC and the mdm6600 modem. But even when used for the SoC, configuring
> the PHY with ID pin grounded will wake up the modem from idle state. Looks
> like the issue is probably caused by line glitches.
>=20
> We can prevent the glitches by using a previously unknown mode of the
> GPIO mux to prevent the USB lines from being connected to the moden while
> configuring the USB PHY, and enable the USB lines after configuring the
> PHY.
>=20
> Note that this only prevents waking up mdm6600 as regular USB A-host mode,
> and does not help when connected to a lapdock. The lapdock specific issue
> still needs to be debugged separately.
>=20
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Nothing obviously wrong in the series.

Acked-by: Pavel Machek <pavel@ucw.cz>

Patch 2/ does not apply on top of 5.5-rc3 AFAICT.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--n8884J15jRwcBTvu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4Ej9EACgkQMOfwapXb+vIVDwCgsLXA2R5ymkM+dKDCkoshG8JI
nVIAoJQy8dACWRuOZq0suNiLYN2+KBgC
=+Xku
-----END PGP SIGNATURE-----

--n8884J15jRwcBTvu--
