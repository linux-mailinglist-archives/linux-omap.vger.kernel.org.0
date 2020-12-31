Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4102E80BA
	for <lists+linux-omap@lfdr.de>; Thu, 31 Dec 2020 15:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbgLaOed (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Dec 2020 09:34:33 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39218 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbgLaOed (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Dec 2020 09:34:33 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 257A21C0B79; Thu, 31 Dec 2020 15:33:52 +0100 (CET)
Date:   Thu, 31 Dec 2020 15:33:51 +0100
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
Subject: Re: [PATCH 2/3] ARM: dts: motorola-mapphone: Configure lower
 temperature passive cooling
Message-ID: <20201231143351.GA22726@duo.ucw.cz>
References: <20201230084232.19221-1-tony@atomide.com>
 <20201230084232.19221-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <20201230084232.19221-2-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The current cooling device temperature is too high at 100C as we have a
> battery on the device right next to the SoC as pointed out by Carl Philipp
> Klemm <philipp@uvos.xyz>. Let's configure the max temperature to
> 80C.

Well... I am hitting even the 100C limit under load quite easily,
IIRC. I believe my Droid idles around 80C.... so this is likely to
make it... less useful.

Let me re-try and get some more numbers...

Best regards,
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX+3hTwAKCRAw5/Bqldv6
8u//AJ4yV1Qv0S5aUf+UyyuFGvFE5ZmPNgCgqO1gV/3lFzvqopLSY9+X2QprRT8=
=qDxr
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
