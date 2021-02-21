Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C93320DC7
	for <lists+linux-omap@lfdr.de>; Sun, 21 Feb 2021 22:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbhBUVAo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 21 Feb 2021 16:00:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:43920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231180AbhBUVAl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 21 Feb 2021 16:00:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBABE64EB3;
        Sun, 21 Feb 2021 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613940975;
        bh=/cN6BElwNRO7utpxxr5oOogV0crmkCkzi47VJ17rv6Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u5zBCSAc/1TTXkd7Nrq4Qd8xtAs0yta4WTdPkw3gc3Jdx14HrWQs96Ls+tktnoPX4
         3sbr0NBGPcfVOHo5htOoY0llhFi40Fqwz+MAHsfZlvcUYjJI2hq9+B1nVLftCXZBhP
         m6cOamfrR7MgxV6tA4l1+KguVHttHCFrTBZSj1nAveXFmX3vu4cOjSSjauqk4bvvLt
         AwoNBSasNcgEMKHQGfLOmlyJp1olZVakfInV2gg1YkGak0uqB5qEhae9pcJtBJ/2UC
         +BaSNu2izN5iKRkWtduNVSZp4N0zX14jY9eShzW/8CmANbyABr4f8aAkcA5HgUOdxI
         geOnXrgXtaGnQ==
Received: by earth.universe (Postfix, from userid 1000)
        id C3B803C0C96; Sun, 21 Feb 2021 21:56:13 +0100 (CET)
Date:   Sun, 21 Feb 2021 21:56:13 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Tony Lindgren <tony@atomide.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, nekit1000@gmail.com, mpartap@gmx.net,
        merlijn@wizzup.org, martin_rysavy@centrum.cz,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org,
        Carl Philipp Klemm <philipp@uvos.xyz>
Subject: Re: Droid 4 charging
Message-ID: <20210221205613.yuvxoxzi33wa74s3@earth.universe>
References: <20210206131415.GA4499@amd>
 <YCn5+ZPdPojwCz8g@atomide.com>
 <20210219215752.GA31435@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zeqgg3ishmvo4gqn"
Content-Disposition: inline
In-Reply-To: <20210219215752.GA31435@amd>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--zeqgg3ishmvo4gqn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 19, 2021 at 10:57:53PM +0100, Pavel Machek wrote:
> > And then we still need to restart the charger at some point, but that
> > could happen based on much longer timeouts that what we currently have.
>=20
> Li-ion batteries are very slow to self-discharge. This could timeout
> could be week... or maybe a year.

True, as long as the battery is not connected to anything. When connected
to something there are often leak currents. So leak currents must be
measured to figure out a sensible timeout.

-- Sebastian

--zeqgg3ishmvo4gqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmAyyOYACgkQ2O7X88g7
+pr5YRAAo+fP1HPtLciMak9zPcHNVtgFJos4FxbOBpjrju3KAz6ixUhMA1xaze6E
enMYvXKAJGrdRxwr+zcBR6T/ST/YUo5uUJQwd+RjVRnKcZbXXOSQfIKCol8QJMFr
EJEGAS2uS1PqkymwXz47GyQ8/m1wTEXyhwFzmuvivdsPMjkzKVprn+pCUV5a296X
80wwwvFnMr1ENPl+FDU8NkiFuOc9JeGBH9ydmjpg+t6kEMJkqvfe863uEDN24nci
PQVnqVnVx9nyiz9zKp0hkkjMVQYKaGDYhgU/T4gQdx7XRTWGe3NV/5wvvxqiARYI
0tM9teZb5cIYKr+Zh53f0MCB3hRWxJebIrJDMLXa5vtbHQPaLkxcy1ZtnONjn/wO
PLHBq017Sl4gCko1J7slmmoSPPG6BYdGYEOiGdnqjWbYfNhukyPbXH/N6hAGESVv
ThOrr2af2rhXZLENhxfxQfGCkI+Cqwvda6D4Yu3YUt8adJ+7CQocTgHSGsqalSYb
a7i9QWxZw/DCUpiWfs8fOb61N8qPqMmk6D/TWQimomH9OjGn2+aC/kr6eYq34Gks
8tCaZb9d7ItNH5cpHDrBLpj5UdozNJE/YKMSVLYt+1MWQAdMdG5tt9DKE2aqFaSD
u1YDX5a0l2Xix7OjS7HUqVT2rStOIFyUMJhfXtBTYhmlpZZXOmU=
=vZ8i
-----END PGP SIGNATURE-----

--zeqgg3ishmvo4gqn--
