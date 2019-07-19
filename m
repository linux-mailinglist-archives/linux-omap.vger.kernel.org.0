Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2CF66E405
	for <lists+linux-omap@lfdr.de>; Fri, 19 Jul 2019 12:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfGSKLp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 Jul 2019 06:11:45 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:32827 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbfGSKLp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 19 Jul 2019 06:11:45 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 0CA3780302; Fri, 19 Jul 2019 12:11:30 +0200 (CEST)
Date:   Fri, 19 Jul 2019 12:11:41 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Pavel Machek <pavel@denx.de>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, johan@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: USB Modem support for Droid 4
Message-ID: <20190719101141.GA18760@amd>
References: <20190718201713.GA25103@amd>
 <20190719052205.GK5447@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <20190719052205.GK5447@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> * Pavel Machek <pavel@denx.de> [190718 20:17]:
> > From: Tony Lindgren <tony@atomide.com>
> >=20
> > Droid starts to have useful support in linux-next. Modem is tricky to
> > play with, but this is enough to get basic support.
>=20
> Below is a better patch using option driver adding support for all
> the ports. I'll send it out with a proper description after -rc1.

Thanks!

It works for me, too.

Tested-by: Pavel Machek <pavel@ucw.cz>

> @@ -83,6 +83,12 @@ static void option_instat_callback(struct urb *urb);
>  #define HUAWEI_PRODUCT_K4605			0x14C6
>  #define HUAWEI_PRODUCT_E173S6			0x1C07
> =20
> +#define MOTOROLA_VENDOR_ID			0x22b8
> +#define MOTOROLA_PRODUCT_MDM6600		0x2a70
> +#define MOTOROLA_PRODUCT_MDM9600		0x2e0a
> +#define MOTOROLA_PRODUCT_MDM_RAM_DL		0x4281
> +#define MOTOROLA_PRODUCT_MDM_QC_DL		0x900e
> +
>  #define QUANTA_VENDOR_ID			0x0408
>  #define QUANTA_PRODUCT_Q101			0xEA02
>  #define QUANTA_PRODUCT_Q111			0xEA03
> @@ -968,6 +974,10 @@ static const struct usb_device_id option_ids[] =3D {
>  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x7B) },
>  	{ USB_VENDOR_AND_INTERFACE_INFO(HUAWEI_VENDOR_ID, 0xff, 0x06, 0x7C) },
> =20
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MOTOROLA_VENDOR_ID, MOTOROLA_PRODUCT_MD=
M6600, 0xff, 0xff, 0xff) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MOTOROLA_VENDOR_ID, MOTOROLA_PRODUCT_MD=
M9600, 0xff, 0xff, 0xff) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MOTOROLA_VENDOR_ID, MOTOROLA_PRODUCT_MD=
M_RAM_DL, 0x0a, 0x00, 0xfc) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MOTOROLA_VENDOR_ID, MOTOROLA_PRODUCT_MD=
M_QC_DL, 0xff, 0xff, 0xff) },
> =20
>  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_V640) },
>  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_V620) },

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0xl10ACgkQMOfwapXb+vLrVACfXkgc5UNVTqP4Cs6nTFriszl9
quwAmwWLaqYxjvrh50FxYi5/99eL4kxh
=GSbE
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
