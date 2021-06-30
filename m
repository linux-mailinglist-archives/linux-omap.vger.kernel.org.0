Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFE73B81D1
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jun 2021 14:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234529AbhF3MQH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Jun 2021 08:16:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:39482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234574AbhF3MQE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Jun 2021 08:16:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D566361997;
        Wed, 30 Jun 2021 12:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625055215;
        bh=OyCw+ikwvw8c7rChwbi6jaEqfCROeE3MhtEECfeyTIM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vEjPdFRc4feX/UKaUUeBvt8QePG+KmBsFh2aCQK0eYlgoUDnjL497sgbnkgr4EQwe
         egD1tS/iMFEqkp/UB+FYZvqAfMFxKPJ/utN/Osc+S42fBry9SoNaNkfnIx8khiP8Ii
         WVO4z4WPfzQWFLBiXt7l985tw9kYVjV1aQCI2bPUrX3evm9kcpVARtQGCD8Gfgn3B+
         iq4Im8aPpYEAHEwNpe6WACDec/7yE2buDcl1OLlJ+0IIPLADIRqAcv4aHVbfm5O1L/
         j83v2w0R13fYLQcvYLp8eeE+4Tct784yMK9PuAZdjePEesckt0TeXvp7RZUcrJKNpS
         LgIRRVmqOBpGw==
Date:   Wed, 30 Jun 2021 13:13:07 +0100
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
Message-ID: <20210630121307.GA5106@sirena.org.uk>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <7B58B1BF-9D65-4CEC-B7D1-4EFDB2C0CB4E@goldelico.com>
X-Cookie: Use at own risk.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 29, 2021 at 10:21:45PM +0200, H. Nikolaus Schaller wrote:

> There seems to be a deadlock in probing:

> 	e.g. ldo3_reg depends on vdds_1v8_main supply
> 	vdds_1v8_main depends on smps7_reg supply
> 	smps7_reg depends on vsys_cobra supply
> 	vsys_cobra depends on nothing

> This would normally lead to a simple chain as you described above. But
> ldo3_reg and smps7_reg share the same driver and can probe successfully or
> fail only in common.

I don't see any deadlock there?  Just a straightforward set of
dependencies.  Anything circular would clearly be a driver bug.

> Now if ldo3_reg defers probe through the new rule, smps7_reg is never
> probed successfully because it is the same driver. Hence vdds_1v8_main can
> not become available. And the Palmas continues to run in boot initialization
> until some driver (MMC) wants to switch voltages or whatever.

The driver should just register all the DCDCs before the LDOs, then
everything will sort itself out.  It's *possible* you might see a system
trying to link things together regulators of the same type but that's
very unusual as it makes the system less efficient.

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDcX9IACgkQJNaLcl1U
h9COXwf/caYZXMc4O3Gw4MusQCx6GuJHZ6aEdMBbGsvxVBMUZeL6hJk3wLjJmrR0
oYOmtcsdcrg+JkHAmqCi9FCVhW9a/0+lfXORD43C5p0fzbvWhshu0ttopy5YaJWk
hE7PnW/UhHxnAZudCZY2aSb8hhbCxyLPmt9wv65+1ebFkiZYjN7SbgJ50HMWE+sz
piVqtpBGqZYBYbDFQfiFPjJoylkbH3l5t/2g9LxrdHcJ9PdI0pi9OTAVMarJfiTU
h6v7XWIDp4M7lv/EvWI+3NGX+n1YKAhg32FLeh8Z7ywp1kzEG0S4VnvgYT/xNd25
wP9QkpT3FfR1YxcHCd4vp5TO2cZyDQ==
=LGB7
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
