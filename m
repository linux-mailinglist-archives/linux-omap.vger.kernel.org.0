Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B411EAED36
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2019 16:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732767AbfIJOhf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 10:37:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:53634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726066AbfIJOhf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Sep 2019 10:37:35 -0400
Received: from earth.universe (unknown [148.69.85.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95C0121479;
        Tue, 10 Sep 2019 14:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568126254;
        bh=y1WgrtzyvFdOq+b4d4REujchX5rk4th/6G7OOccfmxM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iYlI8DaVumn332PgaHqmbGve4wfPHMu0RUKeSPGg0tR/ZBCA5cMBGisOPvfJ5WTat
         QFfogJ1XfKG4+7MXP5TZNCCqhaSNCAgjaVnZ0lZ9X2TpoxJ9fC0zIbRwf7lAqP9XiG
         1a67UW/obuJuytpzOoVZrwD9QXBSgZWniN83km5U=
Received: by earth.universe (Postfix, from userid 1000)
        id 8B5D53C0CFA; Tue, 10 Sep 2019 16:37:32 +0200 (CEST)
Date:   Tue, 10 Sep 2019 15:37:32 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Paul Walmsley <paul@pwsan.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Russell King <linux@armlinux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC] ARM: omap3: Enable HWMODS for HW Random Number Generator
Message-ID: <20190910143732.3g3q4acvnx2pqvjx@earth.universe>
References: <20190828150037.2640-1-aford173@gmail.com>
 <20190905230443.GA52127@atomide.com>
 <CAHCN7xKxffJUV2V2CCuw0iPqUm4LJT28GMrcF2=8rDJQM2dOOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qrixv7njwauekhyc"
Content-Disposition: inline
In-Reply-To: <CAHCN7xKxffJUV2V2CCuw0iPqUm4LJT28GMrcF2=8rDJQM2dOOw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--qrixv7njwauekhyc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 10, 2019 at 08:56:49AM -0500, Adam Ford wrote:
> On Thu, Sep 5, 2019 at 6:04 PM Tony Lindgren <tony@atomide.com> wrote:
> > Oh and this needs to default to status =3D "disabled" for
> > HS devices like n900 as it needs to use the omap3-rom-rng.
>=20
> I don't know enough about the HS version of the OMAP3, but what's the
> main difference between omap3-rom-rng and this one?

The OMAP HS chips have the bus firewall configured to block direct
access to some cryptography related devices. The kernel will crash
with a bus error, if you try to read/write the registers for
protected devices. The omap3-rom-rng avoids this by communicating
with the security middleware component instead of directly accessing
the RNG hardware.

-- Sebastian

--qrixv7njwauekhyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl13tSkACgkQ2O7X88g7
+prv8g//byjix58ZdQFHZMVKdcFO70kTP9egx8f9Bsi2ZGMy3ybyYweRBD1xerSj
9ytb9qNeNKC1Tn9R4HXWF2s0uG8YiCCwYv8XO2RGD1gBYc+ohxHMgu2LUHkqrYkd
4ch8aa6vWOfoYz5p6RZ4TSMifa6pEL/Dntv73BZ2iWyIPNFiU3G0JYERDwh1k2mE
zJQ/eEq/1G+ztEYBSa5HoRSLQUfgbpRWdnjw/WMQZMYIGb67iKJhEnFRl9bKdiS+
Bj0od1d1EuQWiYclgBn2qGrfxKbweSmX9rDGTsQKzzb32zUSYLd5eh4m6dpO3Cea
eWNc4w0cBN5XXDjmVf400xtdbhl4GNS0gwfHUb6QCHp4aSPKGIvv3rU2vt5Rf+HI
K/u+3sywozcr9D6NbgmTyGNRRUxpZZe7QZdAtIaZChEcwi8FgtCxmeAtnUyXHNxr
+0vPFHKA3IFKHfR2pNKu2UlS7HbKxUg+ZEgCq6dUAVGQ8BdNK5/a26MbJCASEGor
OLfajRDyxnyFSlV2rKMh2Ich5oD39lI+rwA2jIJf+EbcHAudd25/4mGxc6Gb2oBb
PgogxAzpXE95iStDWlUeoS/8Jh0hQtD/zb9amYgvwYSookOL9Wt39x5iMovt8IBm
pHpoVJGzv5+DB874xaKn0jUe988yQdhym1joC+xayv+LGfBQvkE=
=hSyU
-----END PGP SIGNATURE-----

--qrixv7njwauekhyc--
