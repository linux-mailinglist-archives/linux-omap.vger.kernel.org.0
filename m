Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30141B218F
	for <lists+linux-omap@lfdr.de>; Tue, 21 Apr 2020 10:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgDUI2o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 04:28:44 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42176 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgDUI2n (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Apr 2020 04:28:43 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8B2911C01E0; Tue, 21 Apr 2020 10:28:41 +0200 (CEST)
Date:   Tue, 21 Apr 2020 10:28:40 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/4] serdev: ngsm-motmdm: Add Motorola TS 27.010 serdev
 modem driver for droid4
Message-ID: <20200421082840.GA4540@amd>
References: <20200319173755.65082-1-tony@atomide.com>
 <20200319173755.65082-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <20200319173755.65082-3-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> $ printf "ATH\r" > /dev/motmdm1
> H:OK
>=20
> Also SMS can be sent with this patch using /dev/motmdm3 for sending,
> and /dev/motmdm9 for receiving messages, and /dev/motmdm10 can be
> used for SIM access.
>=20
> Note that the audio mixer needs additional patches though. I will be
> sending those as a separate series of patches.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

Some minor comments are below.

> +++ b/drivers/tty/serdev/protocol/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Serial bus device driver protocol specific configuration
> +#
> +
> +config SERIAL_DEV_NGSM_MOTMDM
> +	tristate "Motorola Modem TS 27.010 Serdev Protocol Driver"
> +	depends on N_GSM && PHY_MAPPHONE_MDM6600
> +	help
> +	  Select this for Motorola modems using TS 27.010 serial line
> +	  discipline such as MDM6600 modem found on Motorola Mapphone
> +	  devices like Droid4

I'd add "." at the end of sentence.

> +/*
> + * Character devices for DLCI channels with no serdev drivers
> + */
> +static int motmdm_cdev_open(struct inode *inode, struct file *file)
> +{
> +	struct motmdm_cdev *cdata;
> +	int ret =3D 0;
> +
> +	cdata =3D container_of(inode->i_cdev, struct motmdm_cdev, cdev);
> +	get_device(cdata->dev);
> +	nonseekable_open(inode, file);
> +	file->private_data =3D cdata;
> +
> +	down_write(&cdata->rwsem);
> +	if (cdata->disconnected) {
> +		ret =3D -ENODEV;
> +		goto unlock;
> +	}
> +
> +unlock:
> +	up_write(&cdata->rwsem);

You can delete goto and the label here.

> +static int motmdm_cdev_release(struct inode *inode, struct file *file)
> +{
> +	struct motmdm_cdev *cdata =3D file->private_data;
> +
> +	down_write(&cdata->rwsem);
> +	if (cdata->disconnected)
> +		goto unlock;
> +
> +unlock:
> +	up_write(&cdata->rwsem);

And here... unless it is some kind of preparation for next patch?

> +MODULE_DESCRIPTION("Motorola Modem TS 27.010 serdev driver");
> +MODULE_AUTHOR("Tony Lindgren <tony@atomide.com");

Missing ">" at the end of email address.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6errgACgkQMOfwapXb+vLKngCgkkW+3ZbDTRZSC7kzmpY07JCQ
TVMAnRS8p/yLo9zJbEAFPgQyYe7v11+4
=5CCg
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
