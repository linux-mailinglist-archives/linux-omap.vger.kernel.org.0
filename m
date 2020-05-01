Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5E121C1EC5
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 22:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgEAUoa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 16:44:30 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58026 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgEAUo3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 May 2020 16:44:29 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A7B421C020C; Fri,  1 May 2020 22:44:27 +0200 (CEST)
Date:   Fri, 1 May 2020 22:44:26 +0200
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
Subject: Re: [PATCH 3/6] serdev: ngsm: Add generic serdev-ngsm driver
Message-ID: <20200501204426.GE6043@duo.ucw.cz>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200430174615.41185-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline
In-Reply-To: <20200430174615.41185-4-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> We can have a generic serdev-ngsm driver bring up the TS 27.010 line
> discipline on the selected serial ports based on device tree data.
>=20
> And we can now do standard Linux device driver for the dedicated
> TS 27.010 channels for devices like GNSS and ALSA found on modems.


> +++ b/drivers/tty/serdev/Kconfig
> @@ -22,4 +22,14 @@ config SERIAL_DEV_CTRL_TTYPORT
>  	depends on SERIAL_DEV_BUS !=3D m
>  	default y
> =20
> +config SERIAL_DEV_N_GSM
> +	tristate "Serial device TS 27.010 support"
> +	help
> +	  Select this if you want to use the TS 27.010 with a serial port with
> +	  devices such as modems and GNSS devices.
> +
> +	  If unsure, say N.
> +	depends on N_GSM
> +	depends on SERIAL_DEV_CTRL_TTYPORT

Normally, depends go after "tristate" and before "help" text. I did
not realize this is valid code.

Reviewed-by: Pavel Machek <pavel@ucw.cz>

> +/*
> + * Configure SoC 8250 device for 700 ms autosuspend delay, Values around=
 600 ms
> + * and shorter cause spurious wake-up events at least on droid 4. Also k=
eep the

droid->Droid?

> +static const struct serdev_ngsm_cfg motmdm_cfg =3D {
> +	.gsm =3D &adaption1,
> +	.init_retry_quirk =3D true,
> +	.needs_usb_phy =3D true,
> +	.aggressive_pm =3D true,

Umm. These are unsigned int:1, not bools, so =3D 1 would be expected
here.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqyKKgAKCRAw5/Bqldv6
8txjAJwJqTaTuqG5Df56zqF3mOwZR010dQCfTuwd4x9yo8cT/TgAEsR2HsAJpIE=
=3ue9
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
