Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79A8348531
	for <lists+linux-omap@lfdr.de>; Thu, 25 Mar 2021 00:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234008AbhCXXUJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 19:20:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:34184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230204AbhCXXTy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 19:19:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A73C061A17;
        Wed, 24 Mar 2021 23:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616627993;
        bh=M+caePj/MaM8hZubVUh6n+2kPk37gkKDLFCHXlHjACU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d+qYPJZYPtaueW+o5rc+h3xs6JLW5R+JSocU4XzxbVHherOTJsno4vVcnLpReHodh
         Hpptdrbl1Jg7+tRmKllnOA1q6AMhVQdaP7iJjiq40GaQLp4Pio7dlSm/cJ25Z6Gy/O
         OdH0/IbVYj3l62Z/i+NcOB4gWEWnH//b66msZX/fAHPNIfC5hBx3QPnB+94jR2oHk8
         lgneSCCjV/zm/siE5uIh0kRoLRNvnvkrZY0P3At5qkiLtLF1GEijC0G2qflAY6NZ4X
         lg+sVKSu/vMCeWNEGYrck9P4orj019sjeZ+OuI4bSZ/vXBkgUSSE3ryBcxNXfSR1CF
         bIurcKaLgTxpA==
Received: by earth.universe (Postfix, from userid 1000)
        id 711B93C0C96; Thu, 25 Mar 2021 00:19:50 +0100 (CET)
Date:   Thu, 25 Mar 2021 00:19:50 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        devicetree <devicetree@vger.kernel.org>,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/5] ARM: dts: add battery phandle to cpcap_charger
Message-ID: <20210324231950.fntsn5hhvewio2vb@earth.universe>
References: <20210117224502.0f9a0e80dfd4841ad26a9914@uvos.xyz>
 <YFsoWjUYhhzo5Tdo@atomide.com>
 <20210324154219.m4xwm3bayzlele6e@earth.universe>
 <C2FC7740-006A-430F-AA29-67572473D18B@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g3fkg7gdcld4ogfn"
Content-Disposition: inline
In-Reply-To: <C2FC7740-006A-430F-AA29-67572473D18B@goldelico.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--g3fkg7gdcld4ogfn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 24, 2021 at 05:21:52PM +0100, H. Nikolaus Schaller wrote:
> > Am 24.03.2021 um 16:42 schrieb Sebastian Reichel <sre@kernel.org>:
> > I think the patch is also wrong, since the information is already
> > described in DT - just the other way around: The battery references
> > the charger.
>=20
> Just curious for other devices to be properly defined:
>=20
> Does a battery have its own driver?
> Can it be addressed (through I2C or similar mechanisms)?

Linux power-supply subsystem expects chargers and batteries
with battery being smart battery. I guess this has been
designed following the ACPI specs. On embedded devices this
usually means battery =3D fuel gauge.

> Is it closer to the processor (being the root node of DTS) or
> farther away than the chargers?

It depends? :) There are systems with smart batteries reachable
via I2C and gpio-charger device, which cannot be controlled and
just having an enable gpio (and thus being in the root node).
OTOH there are systems, that lack a proper fuel gauge and have
advanced I2C chargers.

> My observations is that usually chargers have drivers and need to
> reference battery information to adapt their behaviour.

I believe you are talking about chemistry information e.t.c.
that's available from the simple-battery node?

> So IMHO it would be more natural to have a charger reference the
> battery.

Direction was not something I came up with. I took over the
subsystem years ago when this was already in place. It's a
core thing in the subsystem and definetly cannot be changed
anymore:

Documentation/devicetree/bindings/power/supply/power-supply.yaml

In general sometimes the battery needs charger info and sometimes
charger needs fuel gauge info. The thing is, that this does not
mean we need phandles in both directions. One phandle is enough
to have the required information, everything else can be handled
by kernel frameworks. That's preferred, since it does not create
ABI.

-- Sebastian

--g3fkg7gdcld4ogfn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmBbyRAACgkQ2O7X88g7
+ppABhAAmGFxDxqe7RNFMEeIUPrP34Rt+/FhZ6ET2WYHiWRl8vm3VavrKC2YbMlc
+ZLevP0EsztTH3IPpUkgBiH1y33Wjl2dbtGQobusBz6Un9MzAyr0IJ/Fg19WtHqp
jiPd8EDlIqb7BG9orD9jnK7OtRYYtOZEvuElHXq5JnmJ7BIUEn677rywdVggBfTV
z3Z+JczfOFbkcDpG6uZCN39JDTmBQzWD27otiPvpaxohkUUCwWjiEPDOKolUYq4K
Nn53ivuF/veHZQ6TiNFnMSBg+Vhf6HV96ZfTEjV4LXnxaQCXFlYNKZn8dJ+3zExk
OkXUb2UkpE1WkwgMkGuTQeHmI21RlhM6gRZiHjLyEXA1PuufXYQukfkMP99SallS
k/ywd7mOGLrHw3/9qQAgMpsUH0J8gq5UnG14ZV5ovNDO6Nc2oQ2TMMCdjcnuK5ET
5CVh3wrc8tYER6+/FmaGWV+higOJZMoGcZgDJyoUK6irkG8HUDZlRrhopWE/3p9S
bYkWuuwA2VbfAxCdxusmM51TOf2HDBz/JZQFt6yaT2ktjCXYgGOdTq53aVYVm+Nk
qO0Cu4PcOijMSPB+Q//+9SXhZpGMNIgsMYqBXBfTwa0kJJHHfVwscusQc20f4Wgk
vWQ4uVgeQHVsvX+mAzIGlt5xMYqay/ueeuObneB38yIX/EPMDH4=
=cyNr
-----END PGP SIGNATURE-----

--g3fkg7gdcld4ogfn--
