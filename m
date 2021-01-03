Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1172E89F8
	for <lists+linux-omap@lfdr.de>; Sun,  3 Jan 2021 03:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbhACCIV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Jan 2021 21:08:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbhACCIV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Jan 2021 21:08:21 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B78C061573
        for <linux-omap@vger.kernel.org>; Sat,  2 Jan 2021 18:07:40 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 6BB3B1F410BD
Received: by earth.universe (Postfix, from userid 1000)
        id 47AC53C0C94; Sun,  3 Jan 2021 03:07:36 +0100 (CET)
Date:   Sun, 3 Jan 2021 03:07:36 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     tony@atomide.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 1/1] power: supply: cpcap-charger: Add usleep to cpcap
 charger to avoid usb plug bounce
Message-ID: <20210103020736.eznj5v4wlkdgjcuo@earth.universe>
References: <20201230150218.d5ae76983e6dde68dcebff09@uvos.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lf4kdrsotwzf5q3t"
Content-Disposition: inline
In-Reply-To: <20201230150218.d5ae76983e6dde68dcebff09@uvos.xyz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--lf4kdrsotwzf5q3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 30, 2020 at 03:02:18PM +0100, Carl Philipp Klemm wrote:
> Adds 40000 ms sleep before cpcap_charger_enable to hopfully avoid
> the bounce on plug in
>=20
> Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
> ---

This is before cpcap_charger_disable() and I do not follow why you
want to add a delay in this position. Please add a comment before
the usleep providing some information which bounce effect is being
mitigated.

Thanks,

-- Sebastian

>  drivers/power/supply/cpcap-charger.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/=
cpcap-charger.c
> index c0d452e3dc8b..130c61a9f267 100644
> --- a/drivers/power/supply/cpcap-charger.c
> +++ b/drivers/power/supply/cpcap-charger.c
> @@ -631,6 +631,8 @@ static void cpcap_usb_detect(struct work_struct *work)
>  		return;
>  	}
> =20
> +	usleep_range(40000, 60000);
> +
>  	/* Throttle chrgcurr2 interrupt for charger done and retry */
>  	switch (ddata->state) {
>  	case CPCAP_CHARGER_CHARGING:
> --=20
> 2.29.2

--lf4kdrsotwzf5q3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/xJugACgkQ2O7X88g7
+prMWhAApMUzoefMY5lkiOR7eHHcQSVlAgm6w7EqOts49AFD1Dp9e/wgsDoz0vh/
rf4W6giBHlFRmWy3fyW3ykqXRCpaTys/qSFbxqlo69zZc44sG3MTuOQbomTXm/0N
5OFtFWlwVnruj4SdRR6FDyM0QmRyOLXce7RclLT0tM57rXO9skno8TyyhXCchOjZ
bSgIwmfus0P9NRNXuPsxNQFHWIC60jHSRIFmlmq/i2B3hoUefXy5pudyu9qYCe11
AQ5vJVS/NNbmg4fExOFlW+ZmVWDqcjLFK1OX8bvBvmiVYOle5fOwYtqfNyqc1anz
72LFwOs+oerwSy6Ev269pwfbnTDVaV7OdmocV0KTOjvl+SBePNXFcRbxBArXwHpl
tf7wSnkgfMoS9jDCBjb1UONcs5jYpiAoeP7YjGgQvBu6f4r99hcUmO9I0sXX2JhZ
BRRWOYfH7o7I3Jqg7a60gBpw7UCOjPIo9i/0vQnMjzpLa/41mGbVRne/Ecvy/GsW
U+W6rQNCTV+w03NfRUZCptviLmpLFR4V/8Gi5NRrnHlYT7XN8Bh8lFZu3a0zBOVW
Pey+u6L/6ogVfpRxXfBJ/FmQhqtUiEe1My7GWCw47zOXakEdRSbN+fiXsczgSP0I
jyut+JzRaau0Ar+gZji/HsffRa0kXEnp9Rtw5uRzpSWSdG4INPU=
=5UPo
-----END PGP SIGNATURE-----

--lf4kdrsotwzf5q3t--
