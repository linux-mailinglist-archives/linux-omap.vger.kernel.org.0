Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3087B2B57
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 15:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388624AbfINNFn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Sep 2019 09:05:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:57318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388575AbfINNFn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Sep 2019 09:05:43 -0400
Received: from earth.universe (unknown [185.62.205.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4DB2206A4;
        Sat, 14 Sep 2019 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568466342;
        bh=gU4CO6duH0AH0YKj1jI15GcCTMmQHOV1AnE0wHF0lbE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lsxJAW04dWcvUE0tzwucaUjD5aoqdG4PqgTbESOsIaaQBBk7k6373iozOifsrjsVL
         heLPLCjCzXjXa270ZhP+OP+6LGJZ2Nq6F95cBNHU3uA2IrtzjLPvKHfdysEM+HMcGM
         YPLyJ2AmpSCohiG7Ft7g0A95DppKBJ/mYJXuTEs8=
Received: by earth.universe (Postfix, from userid 1000)
        id 3C6603C0CA2; Sat, 14 Sep 2019 15:05:40 +0200 (CEST)
Date:   Sat, 14 Sep 2019 15:05:40 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-crypto@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/6] Non-urgent fixes and improvments for omap3-rom-rng
Message-ID: <20190914130540.jvtxaame7pat7jph@earth.universe>
References: <20190913220922.29501-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mdog2bpqvzul6dqe"
Content-Disposition: inline
In-Reply-To: <20190913220922.29501-1-tony@atomide.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--mdog2bpqvzul6dqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 13, 2019 at 03:09:16PM -0700, Tony Lindgren wrote:
> Here are fixes and improvments for omap3-rom-rng that's been broken for
> a while.
>=20
> The first four patches get it working, and then the last two patches add
> support for runtime PM.

Nice cleanups, the series is

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Assuming you use clk_prepare_enable() in the runtime PM handler, I
suggest to add another patch and go all the way to managed resources:
devm_add_action() can be used for disabling runtime PM and
devm_hwrng_register() can be used to register the hwrng device.

-- Sebastian

--mdog2bpqvzul6dqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl185ZkACgkQ2O7X88g7
+ppqNA/+JmsrHxkgYD+ip05tbafR/Z7vXD250VZkgq+1vhiP5xn3FfwHTGHmNB02
WSnGZFh1i5i1XleRfA/2ITvoaqT3EhCx89DZPqrg1GYiUR/Ol3HhIh8axTOs331G
KIFbTI3ZGH3pVqS7N77Egf4vGqmv/rUUnMZjm8b6flGVpLL4WvqPpGvs8Yglxdmq
j+EntLH/jD+vm1MdaTgTLL7DchwgCW0uonukbfMKZqan8p7S9akqhvxmIo+G9OdV
Ok19HmlUf/Mplg959p6HjaE0ycZ/6j2r7PZQrnYlzIyt6jyvbusIZPawOW7LSkWE
0TU6c00OHJwDN0dM5oL23AZM9I3kR5HF4Dd9Cfk1VaWnFpEumOrP1sjp0Czb2ZgL
bVtlqfkhu+LDF052Sb544DbYICaRj6OB4LICDM6IEkPiwLgquK2vu0BmAIXmUMNV
wEmQW+u2fIqDxUez15RSpgnToI35NFXj8XotFdyDtMpuNqM6hsV6wadMEE/j83l/
8BJ0+RR4ftudQWdFTDDmyPPnbADAnRLjb4RF1HJWd94u1PrX88q5CHag1gPE+Jq+
XpUIZDjezBO9srd3UWteMBFGdpKTdxMQsfhxav/a11vMe+RAXcyKzzGg6rvCSx+X
YMnq5CJdagSR1nmSFEJuv3lENUgBXxniwRX7EFbxsOE46kV2IXc=
=lttE
-----END PGP SIGNATURE-----

--mdog2bpqvzul6dqe--
