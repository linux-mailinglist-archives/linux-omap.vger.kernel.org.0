Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC27115D99F
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 15:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbgBNOjA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 09:39:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:37746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728557AbgBNOjA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 14 Feb 2020 09:39:00 -0500
Received: from earth.universe (dyndsl-095-033-170-229.ewe-ip-backbone.de [95.33.170.229])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F1242187F;
        Fri, 14 Feb 2020 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581691139;
        bh=N76ODAvwWtrNolNrfe1v+fSpRmjTv8SwxAx6ymA3JRQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rxcs3mqKxdI60Vdcwf4KgINHcmhzEFYVBYR1bfRa8cO655RDr3SGgwpLeNcD9xfPw
         S9jTLA2hZ0j+MH8dOeloo+sVOptQTI4NE1tAXZ9ukOzjwDTyLgtqhpKZg9Ws0HjjrU
         JsEl5id/SB2Sj2dYJMwujqXYj1M6PH3zFEBMYNPc=
Received: by earth.universe (Postfix, from userid 1000)
        id B9A4B3C0C83; Fri, 14 Feb 2020 15:38:57 +0100 (CET)
Date:   Fri, 14 Feb 2020 15:38:57 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mattias Jacobsson <2pi@mok.nu>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] Input: add `SW_MACHINE_COVER`
Message-ID: <20200214143857.msrkzzsss5hbb43l@earth.universe>
References: <20200214130249.6845-1-merlijn@wizzup.org>
 <20200214130249.6845-2-merlijn@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jwfmyapwtfwrjma4"
Content-Disposition: inline
In-Reply-To: <20200214130249.6845-2-merlijn@wizzup.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--jwfmyapwtfwrjma4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 14, 2020 at 02:02:47PM +0100, Merlijn Wajer wrote:
> This event code represents the state of a removable cover of a device.
> Value 1 means that the cover is open or removed, value 0 means that the
> cover is closed.

This is the opposit of what is being stated everywhere else. It does
not really matter, but it must be used consistently :)

> This can be used to preempt users removing a removable mmc card or even
> the battery, allowing userspace to attempt to safely unmount a card.

I would drop this sentence, since its very specific to the N900. The
name is generic enough to e.g. also apply for desktop machines, which
sometimes have a cover switch for doing a shutdown (because of poor
airflow when open).

> ---

Missing Signed-off-by.=20

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  include/linux/mod_devicetable.h        | 2 +-
>  include/uapi/linux/input-event-codes.h | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_deviceta=
ble.h
> index 448621c32e4d..4c692cb3cc1d 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -299,7 +299,7 @@ struct pcmcia_device_id {
>  #define INPUT_DEVICE_ID_LED_MAX		0x0f
>  #define INPUT_DEVICE_ID_SND_MAX		0x07
>  #define INPUT_DEVICE_ID_FF_MAX		0x7f
> -#define INPUT_DEVICE_ID_SW_MAX		0x0f
> +#define INPUT_DEVICE_ID_SW_MAX		0x10
>  #define INPUT_DEVICE_ID_PROP_MAX	0x1f
> =20
>  #define INPUT_DEVICE_ID_MATCH_BUS	1
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/=
input-event-codes.h
> index 64cee116928e..318a6387cdfb 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -807,7 +807,8 @@
>  #define SW_LINEIN_INSERT	0x0d  /* set =3D inserted */
>  #define SW_MUTE_DEVICE		0x0e  /* set =3D device disabled */
>  #define SW_PEN_INSERTED		0x0f  /* set =3D pen inserted */
> -#define SW_MAX			0x0f
> +#define SW_MACHINE_COVER	 0x10 /* set =3D cover closed */
> +#define SW_MAX			0x10
>  #define SW_CNT			(SW_MAX+1)
> =20
>  /*
> --=20
> 2.23.0
>=20

--jwfmyapwtfwrjma4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5GsPYACgkQ2O7X88g7
+ppRzQ//QSEzbm0KJXw2Jx8UyqQgtHPXk+/qWS4ZxbkS3KGtAulZ+SA+NA9HNUc8
2IUhqlOZkEP8GbOs7kDV2DRm23jdL3prleB7lrU5OVD0b6b2SbIsMIoJ8Jmsyf/R
iKeF/ck0bTkUJk2CtDqs691VT+XLlK0bOiez8JCueCs5FLqpRS7YXjDWQVlKHLN1
FkEDyKypwve7awU4cRBrSKCWDN03JUYm2P20/cUvX0NmtBul68Y7GshN7K7eBENu
0J1UQUgJZtPmmcw5hJ88DjfpWwxEVXGhsjH+Qi/toiIo5qE+sXRUgT4jdZrD+M3f
CNl5y8bhKHYtFVasxocJ0jQRKIc84LWjwjBu+XlYNd5qY6yZJKLxI4oX0tz4CGiG
iuQmYL0UUbpXQLmvnDsrWzqXkxo7HNwpq6qT03MD4HmxSe10CpCPuV9tiM4pofps
RAZjlDEjX/NN2Zuzu5Xu962I7OrfVbxZJjKFNxQ1c1qxAe5s4XNomFh7NN3QHu8v
ucKst2U7S4zsm+nQzNTc3YREjToxkh7EKOF7tC8+4mSYgzy+FCOORTQ/YTIT290F
kdbAhrK8xACVMf67A32RhpJdCtmoa6kJzGElsYvdCJpnICk8s0IsQF1OmWPTCuoW
4jg47ZS02SW4Hp3a0sV7Szdid9a1Bv/7whl/wt7ZeJWWW8DtPwo=
=8n2c
-----END PGP SIGNATURE-----

--jwfmyapwtfwrjma4--
