Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35C603B873A
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jun 2021 18:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhF3QsP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Jun 2021 12:48:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:47854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhF3QsO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Jun 2021 12:48:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E544561462;
        Wed, 30 Jun 2021 16:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625071545;
        bh=b4EG3FctjD+P2bVnJsm0/NJB1of9hQu0Bo1Xezaz8t0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MhygzgX2Wv/YcBJ3Or/nKpNouqY9zqBYNFI6l32cR+ue6LYdmgZw6VxxltmJMEjVv
         oMhdhR1XHlNLDXShI3PJkgNIWzxQiXvBjo9i2i+nK6X4VLH5Twg1UGhcwYDUC5+hM7
         4vLhCH6BBv44CVRo4R62S98UvsOC17YznyTk7rnykre8c8s/Q8sBtHwcayNhX1cE81
         IpPUhuA//3giHo26Ixl/dXnyZNoTypacD3iClVno2qyk5rRVBWkMi1v4ab+G5MBUJL
         3mmyZ2HVwtl3q4MV3bJmpDFOHulNJWOCMbxPixe/YBrKk9t+bMdawi7vbDNXTzDto2
         clk2teG6zqJFQ==
Date:   Wed, 30 Jun 2021 17:45:17 +0100
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
Message-ID: <20210630164517.GI5106@sirena.org.uk>
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
 <20210630130425.GF5106@sirena.org.uk>
 <E57CB314-F56C-4B33-81E8-7927564DB751@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o71xDhNo7p97+qVi"
Content-Disposition: inline
In-Reply-To: <E57CB314-F56C-4B33-81E8-7927564DB751@goldelico.com>
X-Cookie: Use at own risk.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--o71xDhNo7p97+qVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 30, 2021 at 04:43:14PM +0200, H. Nikolaus Schaller wrote:
> > Am 30.06.2021 um 15:04 schrieb Mark Brown <broonie@kernel.org>:
> > On Wed, Jun 30, 2021 at 02:29:02PM +0200, H. Nikolaus Schaller wrote:
> >>> Am 30.06.2021 um 14:13 schrieb Mark Brown <broonie@kernel.org>:

> >  It's a super weird hardware design if the DT is accurate,

> I get the impression that the vdds_1v8_main is in the DT (omap5-board-common.dtsi)
> only as an alias for smps7. Maybe to get more flexibility in overwriting
> in board files? I.e. replace the power controller without having a fixed
> definition of smps7 elsewhere.

It doesn't seem to have any effect in software and the input is
specified at the same voltage as the output which would be very unusual.
No idea why you'd do any aliasing, you can already name the regulators
with DT handles and with user visible strings.

> Looking into the schematics of the OMAP5432EVM or the Pyra handheld does
> not reveal a physical regulator. It is just that the output signal of
> smps7 is called "VDDS_1v8_MAIN".

It could be something incorrectly factored out of some early prototypes
or something.

> Therefore, a completely different approach could be to remove fixedregulator-vdds_1v8_main
> and replace by smps7_reg.

If there's no physical regulator on the board then that is indeed a DT
bug, the fixed regulator just shouldn't be there.

> But is changing the DT the right solution if the Palmas and Fixed regulator
> drivers can't handle the untouched DT which is logically correct (not physically)?

Well, it's a good thing to do anyway since the DT is supposed to
accurately reflect the hardware.  Like I say splitting the LDOs and
SMPSs can also be done independently and should separately resolve the
issue.

> > it's hard to see how it's not going to be hurting efficiency.

> Well, I think the regulators are enabled only once during boot so nobody
> notices an issue.

When I say having an extra regulator in there hurts efficiency I'm
saying that the power losses from regulation will be increased as
there's more of it happening.

--o71xDhNo7p97+qVi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDcn5wACgkQJNaLcl1U
h9Cdrwf8CtXZ8EO02rOrbfxyRsTjm8Xyqd25vm+80N20eY7Xl1ThsRH3X631k75B
b8tz2pI6Q/A2XVeuL2VAnDW8CTapvuUSDn0jaf/ssE4gHgokam/JDE62rfBpT6ks
H48Ai9rLMydVMG1fpA41jguR8cT8TAWOLw2XAhx+foKYIcE1bbweNIYfYhmPzhBS
rmkOMnKUyUlsT0nC2LB3VQs51yjWB3l/fstRCrpKCFvSUD62jAIyoaNw3fmXtYKM
AdwPa8FqYJrMyoBaO1HqazU8Ymg/mRKjo3BxYlCRiuCO1LRTCJiidQZdTOotwH+F
Z236+9KYGqx3J2kAlExfpiQTakCCtw==
=Z582
-----END PGP SIGNATURE-----

--o71xDhNo7p97+qVi--
