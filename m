Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAA429A3D0
	for <lists+linux-omap@lfdr.de>; Tue, 27 Oct 2020 06:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505592AbgJ0FBq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Oct 2020 01:01:46 -0400
Received: from letterbox.kde.org ([46.43.1.242]:41274 "EHLO letterbox.kde.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505591AbgJ0FBp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Oct 2020 01:01:45 -0400
X-Greylist: delayed 378 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Oct 2020 01:01:44 EDT
Received: from archbox.localdomain (unknown [123.201.39.96])
        (Authenticated sender: bshah)
        by letterbox.kde.org (Postfix) with ESMTPSA id 7E1E5285096;
        Tue, 27 Oct 2020 04:55:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
        t=1603774525; bh=+jQoV5QELo2pHtxGt2jqATJDN6iscHewe0kYCj9ygCg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KoLtrGRXyraVQ8kxNJ8lJoDy121/wx3FjX4+5K9Id3PYUiqc8OaBPNtPsUYaMWI0V
         nvcd4LNdV9LHvHbT189Up9oxwuppiIjS7uxCqMGc5AW3snOYSnWDbbDKMa8qxnOHRC
         iSy0bPOE53kEGzx9rqmSTUZHyvqbIKj1o4GNFOzuDBUtqgq5kZp6HcwTI4HwhXRu60
         ZAKhhxYcuunnw4TZXkO7UZA04NvwteTpJlW40yX1iJxerlVXrycqAv9VHms+jeHTe5
         7cIslsZ5xy+uXDQ89n7PHcDhAXYYR3rARtX0QOuuP1BU8VDSxys0aGO56oj4ThzRYx
         ekuyUN9JWDDPQ==
Date:   Tue, 27 Oct 2020 10:25:19 +0530
From:   Bhushan Shah <bshah@kde.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>, clayton@craftyguy.net
Subject: Re: [PATCH] usb: musb: fix idling for suspend after disconnect
 interrupt
Message-ID: <20201027045519.GA947883@aquila.localdomain>
References: <20191126034151.38154-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <20191126034151.38154-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tony,

On Mon, Nov 25, 2019 at 07:41:51PM -0800, Tony Lindgren wrote:
> When disconnected as USB B-device, we sometimes get a suspend interrupt
> after disconnect interrupt. In that case we have devctl set to 99 with
> VBUS still valid and musb_pm_runtime_check_session() wrongly things we
> have an active session. We have no other interrupts after disconnect
> coming in this case at least with the omap2430 glue.

So I had been debugging a issue with musb_hrdc driver preventing a
suspend on the pinephone, which is Allwinner A64 platform.

Namely, if I have USB connected, and I try to suspend, it would hang
until USB is disconnected. After enabling tracing, I realized that is
hanging after this commit. Reverting it makes device suspend and resume
correctly.

Some more of debugging notes can be found at,

https://gitlab.com/postmarketOS/pmaports/-/issues/839

I wonder what would be right solution here? Disable this quirk somehow
for device?

Regards

> Let's fix the issue by checking the interrupt status again with
> delayed work for the devctl 99 case. In the suspend after disconnect
> case the devctl session bit has cleared by then and musb can idle.
> For a typical USB B-device connect case we just continue with normal
> interrupts.
>=20
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/usb/musb/musb_core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c
> @@ -1943,6 +1943,9 @@ ATTRIBUTE_GROUPS(musb);
>  #define MUSB_QUIRK_B_INVALID_VBUS_91	(MUSB_DEVCTL_BDEVICE | \
>  					 (2 << MUSB_DEVCTL_VBUS_SHIFT) | \
>  					 MUSB_DEVCTL_SESSION)
> +#define MUSB_QUIRK_B_DISCONNECT_99	(MUSB_DEVCTL_BDEVICE | \
> +					 (3 << MUSB_DEVCTL_VBUS_SHIFT) | \
> +					 MUSB_DEVCTL_SESSION)
>  #define MUSB_QUIRK_A_DISCONNECT_19	((3 << MUSB_DEVCTL_VBUS_SHIFT) | \
>  					 MUSB_DEVCTL_SESSION)
> =20
> @@ -1965,6 +1968,11 @@ static void musb_pm_runtime_check_session(struct m=
usb *musb)
>  	s =3D MUSB_DEVCTL_FSDEV | MUSB_DEVCTL_LSDEV |
>  		MUSB_DEVCTL_HR;
>  	switch (devctl & ~s) {
> +	case MUSB_QUIRK_B_DISCONNECT_99:
> +		musb_dbg(musb, "Poll devctl in case of suspend after disconnect\n");
> +		schedule_delayed_work(&musb->irq_work,
> +				      msecs_to_jiffies(1000));
> +		break;
>  	case MUSB_QUIRK_B_INVALID_VBUS_91:
>  		if (musb->quirk_retries && !musb->flush_irq_work) {
>  			musb_dbg(musb,
> --=20
> 2.24.0

--=20
Bhushan Shah
http://blog.bshah.in
IRC Nick : bshah on Freenode
GPG key fingerprint : 0AAC 775B B643 7A8D 9AF7 A3AC FE07 8411 7FBC E11D

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEs8s2ZVJUC+Bu6a2XEZaMRJKMrvwFAl+XqDQACgkQEZaMRJKM
rvwZxQf/Rwr6YcGIHrL5wupDQ4MnUSqnoSkGVDz0vLTydkPb0mjY6gAWTmTYbMgo
eNQaugYMtGAOxsJ7XzVI22944ea0Y2YHFBTTQp9HmzzskU+9mJgHIsinp/e+tvyr
MUIzppDxeqsnoDBKW0mKJfBVpcfr0hCi3tA7vMqS6XDywcqACtcB+adzaN6qkmB5
kSJT+pKVrxnbQVslPQxqkoQ4JP33snXHDUXQlfxL+b38QpkAmQEylmN98D+Z6WQq
+Jxd7Dh299z8dY5of7FDam7mP0ZhV1TfaT/OpsG1CTXctEA+i1WElQiLO3omsKVG
aqW2QfTu2WguwnVqml7ij5eI8NsT5g==
=iXHC
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
