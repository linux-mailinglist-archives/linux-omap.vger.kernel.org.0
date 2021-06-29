Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0E43B7819
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jun 2021 20:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234267AbhF2S7e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Jun 2021 14:59:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:53950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233442AbhF2S7e (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 29 Jun 2021 14:59:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D459F61D88;
        Tue, 29 Jun 2021 18:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624993026;
        bh=YKPMrz8p6USeylnOi301yNp22irRAZI4DHFiTuYtmxs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NW4b0SYZpQGkloKcXNL7KdRv4iTODkVZXYL99OWvgyoYJ+zOL/yN9r/0oZh8U1rM4
         +5I9IJDpzg6eF71hS1DXLC9lzAvUPtULGQNSiZZbpAULDlbxuam0Xf4SxykYqVqFIF
         CD3kXPLSWL3P+Jel2gu9tBezAjKk4xni9wNuq2pJtZM5+T1YFuslcJvJ79O2D80xUE
         ITLV9eGk6QUEw+b8V0VRGMMEAukAXrreNNKaT32R2U9o82hEXeFKSaQkL5w529Sdgr
         C667kSsyX81lxXftRBG2DOkQU/Pis3KlwTdiU/841XhtkoEevTFLUAQljag/KIdqkX
         jmw0b/z81BOLQ==
Date:   Tue, 29 Jun 2021 19:56:38 +0100
From:   Mark Brown <broonie@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] regulator: palmas: set supply_name after registering the
 regulator
Message-ID: <20210629185638.GG4613@sirena.org.uk>
Mail-Followup-To: "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Peter Ujfalusi <peter.ujfalusi@gmail.com>
References: <4ed67090bc048442567931ede8f1298a0b312b28.1624980242.git.hns@goldelico.com>
 <20210629155922.GD4613@sirena.org.uk>
 <2C7C3A47-4A5B-4052-98FC-7A96E2F138CA@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Content-Disposition: inline
In-Reply-To: <2C7C3A47-4A5B-4052-98FC-7A96E2F138CA@goldelico.com>
X-Cookie: Use extra care when cleaning on stairs.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 29, 2021 at 08:34:55PM +0200, H. Nikolaus Schaller wrote:
> > Am 29.06.2021 um 17:59 schrieb Mark Brown <broonie@kernel.org>:

> > What is that rule and how is this patch intended to ensure that Palmas
> > meets it?
> >  As covered in submitting-patches.rst your changelog should
> > explain this so that in review we can verify that this is a good fix.

> I am very sorry, but I simply believed that it is not necessary to copy&p=
aste or
> describe this because it appears not to be difficult to retrieve.

So, I did actually look at the commit but I couldn't figure out what the
change was supposed to do about it.

> This rule (rdev->supply_name && !rdev->supply) did not exist before 98e48=
cd9283d
> and it seems to return early with EPROBE_DEFER if there is a desc->supply=
_name defined,
> but no supply resolved.

> The Palmas driver is setting desc->supply_name to some string constant (i=
=2Ee. not NULL)
> and is then calling devm_regulator_register().

Right, this is how a regualtor driver should specify the name of its
supply.

> So it was working fine without having the supplying regulator resolved. A=
FAIK they
> just serve as fixed regulators in the device tree and have no physical eq=
uivalent.

No, not at all - it's representing whatever provides input power to the
regulator.  There may be no physical control of it at runtime on your
system but that may not be true on other systems.  It's quite common for
there to be a chain of regulators (eg, DCDCs supplying LDOs) and then
they all need to get get power managed appropriately and you don't end
up thinking a regulator is enabled when the input regulator is disabled. =
=20

> My proposal just moves setting the supply_name behind devm_regulator_regi=
ster() and
> by that restores the old behaviour.

This means that we won't actually map the supply and any system that
relies on software handling the supply regulator will be broken.

> Well, unless...

> ... devm_regulator_register() does something differently if desc->supply_=
name
> is not set before and changed afterwards. It may miss that change.

We resolve supplies during regulator registration, this would
effectively just skip mapping of the supply.

> So I hope for guidance if my approach is good or needs a different soluti=
on.

What I would expect to happen here would be that once vsys_cobra is
registered the regulators supplied by it can register and then all their
consumers would in turn be able to register.  You should look into why
that supply regulator isn't appearing and resolve that, or if a consumer
isn't handling deferral then that would need to be addressed.

--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDbbOUACgkQJNaLcl1U
h9CIWAf9E4Bei/0k3rpQf3FzxtGt6MF+K/BdH10fr68RNNk8EORb289fVbxbLkDe
7aXMwq6c/zZ5w7ulUbe5nMlwOgJvY6/n1wizYCOTfa2NlZVgQmaHAXk4PDif+Rui
EVsY5bM4Y3gIrEHA9M7Sa5VY9g0D8EHhPUDD0xZCXQPyCba7kPzFc+G7O4GM0XUl
xFJ9xhGBklF6Jus09YNcZCPrHzRseTlRjUOAaRqNd7xFEOZENfdbd8fKgSp9xIIM
RRguU01SBzokl6wVcd/7hUUqBOvZUhc5kYnHeYpca7iW4dlKebeRq73UISbBNnxa
vsl7g1WsQkAI4Jw0bA2VRigON5nG5w==
=oX/V
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--
