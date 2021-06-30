Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6783A3B829E
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jun 2021 15:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbhF3NHX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Jun 2021 09:07:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:53002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234481AbhF3NHW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Jun 2021 09:07:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52A2561466;
        Wed, 30 Jun 2021 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625058293;
        bh=XYyMCuD458bwTC7T3sQcwA4+8SNLInw36EFRAxRUql4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SFa1+Mb4jKyfLIvjSkmUbtmjwxJi0vbNV3cEcwXdM8aA/GtwgHJvCP6leRzYUMbtE
         RirCBUjh5ciPPWyo8qfeCYGFTIxKXwT3dvQ/Hes+3ItxUP2lx0X6avD7y9J08z8Agr
         o42HSg2s4PhXB9SPDHdztESBji+v5qPGUS+ysWq1zFfpldf27SeccM539Ie93AgzjW
         dAjnmu+BVbRAjm+drsKbqh00Zjr0ZyP2+q0SZs1b7BxOqdh64YXftsVzZmeOwlGno/
         vGFQkbyHeRIKlAMD8gP+q8uKqRuVpeBsWFpWxu/dgl9DE3e+sC5U8/LEZQ0bBT+JsJ
         Op8tDI/j+As7g==
Date:   Wed, 30 Jun 2021 14:04:25 +0100
From:   Mark Brown <broonie@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Graeme Gregory <gg@slimlogic.co.uk>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] regulator: palmas: set supply_name after registering the
 regulator
Message-ID: <20210630130425.GF5106@sirena.org.uk>
Mail-Followup-To: "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Graeme Gregory <gg@slimlogic.co.uk>,
        Liam Girdwood <lgirdwood@gmail.com>, Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Peter Ujfalusi <peter.ujfalusi@gmail.com>
References: <4ed67090bc048442567931ede8f1298a0b312b28.1624980242.git.hns@goldelico.com>
 <20210629155922.GD4613@sirena.org.uk>
 <2C7C3A47-4A5B-4052-98FC-7A96E2F138CA@goldelico.com>
 <20210629185638.GG4613@sirena.org.uk>
 <7B58B1BF-9D65-4CEC-B7D1-4EFDB2C0CB4E@goldelico.com>
 <20210630121307.GA5106@sirena.org.uk>
 <02EE05C2-588F-4D50-8A37-46CC3B0C302C@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C94crkcyjafcjHxo"
Content-Disposition: inline
In-Reply-To: <02EE05C2-588F-4D50-8A37-46CC3B0C302C@goldelico.com>
X-Cookie: Use at own risk.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--C94crkcyjafcjHxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 30, 2021 at 02:29:02PM +0200, H. Nikolaus Schaller wrote:
> > Am 30.06.2021 um 14:13 schrieb Mark Brown <broonie@kernel.org>:

> >> 	e.g. ldo3_reg depends on vdds_1v8_main supply
> >> 	vdds_1v8_main depends on smps7_reg supply
> >> 	smps7_reg depends on vsys_cobra supply
> >> 	vsys_cobra depends on nothing

> > I don't see any deadlock there?  Just a straightforward set of
> > dependencies.  Anything circular would clearly be a driver bug.

> I think it could be indirectly circular since ldo3_reg does not find smps3
> registered. But I have to run more tests with printk inserted.

Why would LDO3 have a dependency on SPMS3 given what's written above and
how would that be circular?

> > The driver should just register all the DCDCs before the LDOs, then
> > everything will sort itself out.

> Basically the driver code does it that way. But fails. Probing seems to defer
> until deferral limits (AFAIR there is a timer or counter in the probe deferral
> queue) an does not succeed.

Ah, I see - the issue is the intervening 1.8V regulator.  That's not a
circularity, that's the callout to a separate device in the middle of
the chain.  It's a super weird hardware design if the DT is accurate,
it's hard to see how it's not going to be hurting efficiency.  In any
case simplest thing would be to have separate MFD subdevices in Palmas
for the LDOs and DCDCs, that'll do the right thing.

--C94crkcyjafcjHxo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDca9gACgkQJNaLcl1U
h9CEJwf+MzANyYqTy1Ax8OA8o2JDkeKZ0oYwW2X3m8eldybyGSxOmF9xXOwrs7f/
XN4HdXaetqMbtaKezXqHFMDa/ENCramaXjVL5UJXdm0UDQ/htsdQsJjyqEgfAJ0V
vg4t6D3pr1TMV6cQMZ9FdrY+f39irJc7hiHzKi2hiec52ZrUbj/t4kO4WlhAtNe2
ZHzCx27jCj5TyrEn0mntf6ZBGfKCYrmdOSX4kcv5zsLGxpUbtkYceVjLOprR2pWD
4Nm5L60ewMS8FbBCBwqZXqnV3nPMFi6L+RvEEVMfj6K71X7K/VvYjT09VOf4bAIs
M4lqjYntESZWVklIfA2SNjjRxgUWKA==
=DhC6
-----END PGP SIGNATURE-----

--C94crkcyjafcjHxo--
