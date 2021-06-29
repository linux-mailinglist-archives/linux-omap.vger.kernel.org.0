Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2C73B7611
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jun 2021 17:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbhF2QCT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Jun 2021 12:02:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:60820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232698AbhF2QCR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 29 Jun 2021 12:02:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2A4F61DC8;
        Tue, 29 Jun 2021 15:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624982390;
        bh=3fNptDKllSl4MIh2U5gB1Zigz6crx2HTk7AGZpvD4B4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OxeiSFn/ewRCxthRx++vD4qDdFjdbLZ0cHjl3vGyCmWOVE9Sx48oT6u2JhRl6c7Cz
         YFV+HA7vix3oTQVVc+XTJy2RGFLrVRp4WxVkEJG5cdqY8d+LXC0HiO1ffLrW8CkpBJ
         T8CBfowY4cRs7mdsmchsQzc2ljZhssVwE/VL6TOPzXuOB7zx9XTxYAqbhr9mrdIvvG
         EYJL7SCMbtvj5z1xwRgugzIyE/wCNb7fbjrvHqatdqBrO13Z26a7+fpNYYe/QHZG6v
         Sk009fu8h51cMjVKQPKAttiiNHHr7PznJNuYy8wJr8yX9mRPkTkzut36wirG8otOOI
         v9wDeHBQpZpmA==
Date:   Tue, 29 Jun 2021 16:59:22 +0100
From:   Mark Brown <broonie@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: Re: [PATCH] regulator: palmas: set supply_name after registering the
 regulator
Message-ID: <20210629155922.GD4613@sirena.org.uk>
Mail-Followup-To: "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
References: <4ed67090bc048442567931ede8f1298a0b312b28.1624980242.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ylS2wUBXLOxYXZFQ"
Content-Disposition: inline
In-Reply-To: <4ed67090bc048442567931ede8f1298a0b312b28.1624980242.git.hns@goldelico.com>
X-Cookie: Use extra care when cleaning on stairs.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--ylS2wUBXLOxYXZFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 29, 2021 at 05:24:03PM +0200, H. Nikolaus Schaller wrote:
> Commit 98e48cd9283d ("regulator: core: resolve supply for boot-on/always-=
on regulators")
>=20
> introduced a new rule which makes Palmas regulator registration fail:
>=20
> [    5.407712] ldo1: supplied by vsys_cobra
> [    5.412748] ldo2: supplied by vsys_cobra
> [    5.417603] palmas-pmic 48070000.i2c:palmas@48:palmas_pmic: failed to =
register 48070000.i2c:palmas@48:palmas_pmic regulator
>=20
> This seems to block additions initializations and finally the
> Pyra-Handheld hangs when trying to access MMC because there is
> no mmc-supply available.

What is that rule and how is this patch intended to ensure that Palmas
meets it?  As covered in submitting-patches.rst your changelog should
explain this so that in review we can verify that this is a good fix.
The change itself looks worrying like it just shuts the error up and
could cause problems for other systems.

--ylS2wUBXLOxYXZFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDbQ1kACgkQJNaLcl1U
h9DIiwf/QNeehFinHTeQZWdzbtPraUFsYgyN9gaoYDvjaR+eqK9gbtmkwq/eR0n7
pWgGtnaKcUEyJiiBi3Ir6j/jpWRXXLaFCcN6JYpt2DUNcgNs20i8sZI0MHmvZDrO
DeawckIPkgmoszz9PoTG9RBT3ak2nNlOhUuwD9UQNDcMXOOxwqF3wBeho5BsJpB9
50uKoqJ0pAoqTaQGC2kTa272TqED5ZP4Y6dzzG8mmMpWEYILUqVPb3W5Gqq1nxZE
pFbmCoL49cRvB3v7mCMhj4DP8ZoAZJ+uaYjTFjY9mqH+BOxIOGhsUu8iR/kqR/ZV
fH8VtIeHeipDUgat0kmvspdgwI6Ogw==
=SWW9
-----END PGP SIGNATURE-----

--ylS2wUBXLOxYXZFQ--
