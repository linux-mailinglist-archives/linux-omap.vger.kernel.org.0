Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4374D39B93F
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 14:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhFDM5a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 08:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhFDM5a (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Jun 2021 08:57:30 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F84C06174A
        for <linux-omap@vger.kernel.org>; Fri,  4 Jun 2021 05:55:44 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id D1F631F435FC
Received: by earth.universe (Postfix, from userid 1000)
        id 42D383C0C95; Fri,  4 Jun 2021 14:55:40 +0200 (CEST)
Date:   Fri, 4 Jun 2021 14:55:40 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/2] power: supply: cpcap-battery: kconfig: depend on
 ( NVMEM || !NVMEM )
Message-ID: <20210604125540.zfhpffdxft3ug46d@earth.universe>
References: <20210423145702.e31dd7be8843d97195f98bd3@uvos.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uqgabsy56ayeubv5"
Content-Disposition: inline
In-Reply-To: <20210423145702.e31dd7be8843d97195f98bd3@uvos.xyz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--uqgabsy56ayeubv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 23, 2021 at 02:57:02PM +0200, Carl Philipp Klemm wrote:
> Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
> ---

This is missing a long patch description, but needs to be squashed
into PATCH 1/2 anyways.

Thanks,

-- Sebastian

>  drivers/power/supply/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index 006b95eca673..0775a8cda265 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -110,7 +110,7 @@ config BATTERY_ACT8945A
> =20
>  config BATTERY_CPCAP
>  	tristate "Motorola CPCAP PMIC battery driver"
> -	depends on MFD_CPCAP && IIO
> +	depends on ( MFD_CPCAP && IIO ) && ( NVMEM || !NVMEM )
>  	default MFD_CPCAP
>  	help
>  	  Say Y here to enable support for battery on Motorola
> --=20
> 2.31.0
>=20
>=20

--uqgabsy56ayeubv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmC6IswACgkQ2O7X88g7
+prEVQ//eKbpEBmauI/91UB9hBtJbkp6f1M4jv+16otuNDZ0Fm64B3U19ZCGCVwW
7cFR9Qah/nEah+cGx9Sj6KBQRIb35mcH3ku1hWrjbhtAzNVDDOKyTK/jR1d5UsQD
DPLcFauCk6mlMEdoWMSToS3Mv5AMcUm+NkQlE56L75W5VVua/UdPx3EWm88GfUlp
ZEtJtv6o68R9UR2WI6shWc7rkP2BrKAfctc8glJ0tSMKDNI4SO90DFdB4+3qOI3g
C2mHukG79up+GndFsV63cxcJuyD0GJZBKrRnlbclT+Gd+llQDjhuUHuQfdnmvKRJ
zZ+X5lplRjR4bIrKVeUpZJlrgGSXMzQQ6C9wLkdTWM07cdk2NINpQak5sM5k0VWp
IwwFqWiQNt/0xLLuHWr0+QK5jffFzsraILVUT0m+TyUCPIxets6EwffX99McpOm8
ZaGaXdaAII4gWi1s9u0NOelyU6trnNGptvmiMTxuGDpC0YF5CS9VbTGQPabtwbW3
ZsWJPj0jRLWI26CD+iap8MGFfrHPn8yNyWEQHUwqWZDLBn3mIWTEjm6QCf/H+NZw
+KSuerg8C+fZdpdL3cyTInbiPHOB7NFYyyRL0lKkAptuTYTIzlKMx1mBCnGj4M+T
QiD0Wb1+Pgv/qV1rz6oWSQ2R6A2r/RcbT4JTKPCfgLgWLArCEiM=
=LByG
-----END PGP SIGNATURE-----

--uqgabsy56ayeubv5--
