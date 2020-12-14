Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9132D986C
	for <lists+linux-omap@lfdr.de>; Mon, 14 Dec 2020 13:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731990AbgLNM4v (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Dec 2020 07:56:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:53406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406837AbgLNM4k (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Dec 2020 07:56:40 -0500
Date:   Mon, 14 Dec 2020 13:55:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607950559;
        bh=5fo/iqFWPytNPmuLv3+MDc4IxE4hjglwHwF807lULN4=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=j4Y77JrTvlXkk5XbPHN4rEslk2JkNT97gudHnDxGfgRbnp00Xlncz0hP4MrnmMhC0
         c7PK2KYAVmn+O3/+8NVmS7PvIsyk0SMnf5udn4BioKbEw7wIlyuSGTMtwycgU8GvAP
         UvEsGkZ/KjVlQ8RwAcsDXZ39tS108bSsT2xPydZSnZr9jsyVedcXVInF0o/B+nRBBZ
         iRvTtSbvdkpOXZSPT8tqYRh/+2m54pfI/34N7rJGhdPw1sWqvTfppk4JM6xdF+p+Xh
         lhR8FCiCOHeejbvy8sXNAj1Sad7bxobteRtpeeXfy8LM2w4mNz7jCeWjCbKhu8zHbc
         cq1GIl8wkky7Q==
From:   Sebastian Reichel <sre@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 58/80] drm/omap: pll: fix iteration loop check
Message-ID: <20201214125557.wky535e4rhzm5opp@earth.universe>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-59-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dkp3jws36s6gh6xq"
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-59-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--dkp3jws36s6gh6xq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2020 at 02:45:16PM +0200, Tomi Valkeinen wrote:
> If the PLL calc function is given bad parameters, n_start/m_start may be
> higher than n_stop/m_stop, which leads to the loops iterating through
> the whole u32 number space.
>=20
> Fix this by failing early on such cases.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/pll.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/pll.c b/drivers/gpu/drm/omapdrm/=
dss/pll.c
> index 1212f3cc52d1..12926218c436 100644
> --- a/drivers/gpu/drm/omapdrm/dss/pll.c
> +++ b/drivers/gpu/drm/omapdrm/dss/pll.c
> @@ -222,6 +222,9 @@ bool dss_pll_calc_a(const struct dss_pll *pll, unsign=
ed long clkin,
>  	n_stop =3D min((unsigned)(clkin / fint_hw_min), hw->n_max);
>  	n_inc =3D 1;
> =20
> +	if (n_start > n_stop)
> +		return false;
> +
>  	if (hw->errata_i886) {
>  		swap(n_start, n_stop);
>  		n_inc =3D -1;
> @@ -239,6 +242,9 @@ bool dss_pll_calc_a(const struct dss_pll *pll, unsign=
ed long clkin,
>  				hw->m_max);
>  		m_inc =3D 1;
> =20
> +		if (m_start > m_stop)
> +			continue;
> +
>  		if (hw->errata_i886) {
>  			swap(m_start, m_stop);
>  			m_inc =3D -1;
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--dkp3jws36s6gh6xq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XYN0ACgkQ2O7X88g7
+prTZBAAqcYdKQmLjTNdgO2AjW0w1di4EuCDlcAlOPsGPlTYH+jNHO0ebb3F6gPn
WPn99tyhSYsDk9nC+T83onx837tNU00RlulrKO8s1y5BezeUeD1taOA65Xe+6S22
AtRCzx4XleLF3c9iu+anSxR89ihEnTYVNZKIU7IqEExe49FS+AGb37iyUeHkn0TR
sGJUeE1AItQT6aHJ2Eltbf1ZSxpBE7JAvLNnttl21F0IMwnU+7Gxc+p9hLvqXY+h
gcXT1av/Ui9YmcmWlqqk/sHyagywyZIhS2V27vE+J0eyIHyCnLs5f/mmZijo5NFL
y9PrOruVOXrFVC+lyT0K4yXXdgCVkjzSHDyk0ufVzb8x42evhMmHXCJbYfYbQvwQ
OD7DnqcFTHOGufTxRWhh+1HgWKypIDOwGEcMhbs94QzCbOA0nmyH4ZbvQEAabPZq
upvdJ030HKD76ecmylc9s3E3IVv04XjPe6eRuu6WjGwAnqTyIw5wM8PzPd8lzQWq
mxS/tn57W9aPvWW8fW1vmnVEUqsmOox+eBOyhL001LbYOc5o4S4/LG6NgKxRw6fs
k6IzclbSk9Zwr0VNfSFLaS3WieTrGhv1ppYJ1JR9Ka4FRSpQjZ+t8kuN5CKYMN7d
RaXLIS6KpwEcKEckBLt9aZEhsl1iHO+GkV83lH+UxZi1xbGDqgg=
=9ZE1
-----END PGP SIGNATURE-----

--dkp3jws36s6gh6xq--
