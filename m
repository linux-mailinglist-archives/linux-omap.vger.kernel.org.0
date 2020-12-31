Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2B52E7F0E
	for <lists+linux-omap@lfdr.de>; Thu, 31 Dec 2020 10:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgLaJoN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Dec 2020 04:44:13 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54674 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgLaJoM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Dec 2020 04:44:12 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2E56C1C0B77; Thu, 31 Dec 2020 10:43:16 +0100 (CET)
Date:   Thu, 31 Dec 2020 10:43:15 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: motorola-mapphone: Add 1.2GHz OPP
Message-ID: <20201231094315.GB22962@amd>
References: <20201230084232.19221-1-tony@atomide.com>
 <20201230084232.19221-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline
In-Reply-To: <20201230084232.19221-3-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Carl Philipp Klemm <philipp@uvos.xyz>
>=20
> The omap4430 HS HIGH performance devces support 1.2GHz opp, lower speed
> variants do not. However for mapphone devices Motorola seems to have
> decided that this does not really matter for the SoC variants they have
> tested to use, and decided to clock all devices, including the ones with
> STANDARD performance chips at 1.2GHz upon release of the 3.0.8 vendor
> kernel shiped with Android 4.0. Therefore it seems safe to do the same,
> but let's only do it for Motorola devices as the others have not been
> tested.
>=20
> Note that we prevent overheating with the passive cooling device
> cpu_alert0 configured in the dts file that starts lowering the speed as
> needed.
>=20
> This also removes the "failed to find current OPP for freq 1200000000"
> warning.

> +&cpu0 {
> +        /*
> +	 * Note that the 1.2GiHz mode is enabled for all SoC variants for
> +	 * the Motorola Android Linux v3.0.8 based kernel.
> +	 */

I'm pretty sure it is GHz, not GiHz.

> +        operating-points =3D <
> +	        /* kHz    uV */
> +	        300000  1025000
> +	        600000  1200000
> +	        800000  1313000
> +	        1008000 1375000
> +		1200000 1375000
> +        >;

Is it intended to be 1.008GHz, or is it a typo?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl/tnTMACgkQMOfwapXb+vI4qQCgmCEMvL7rgscRnAgMGnWydan+
fwcAn0qy0m2hMKa4Uriapr8wxFGkhXA1
=gSni
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
