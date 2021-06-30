Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C73F53B8989
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jun 2021 22:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234022AbhF3ULj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Jun 2021 16:11:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:39172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233899AbhF3ULi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Jun 2021 16:11:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2056261220;
        Wed, 30 Jun 2021 20:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625083749;
        bh=q2DNNaBfHjfMGZ6v+6whLo9Bzquzv0M/PVbTQxs8TcE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jrhrpm8nx8aBA0YRNM05PdIIBAE/TziDVUv5bIg05qJOP9EsUXmYHuNpezOgu2ov/
         PDtoZIPjk845oXHAwWlO4pb21xvi5uS/OJ7sKbEnHufVus+WWO5zx22go5FHrizzi1
         yXh8JmZaPDu/8JX428Dsv8LS/9TPD2drUyF8uq3ewYAiiBpu/f6QGVUceAMoINElE3
         appJOaldjG71eXsil1s6pldPC8t3oBb2EgZTixOzRBirdkh/IQe8sB5suQjGW/Ls32
         /prNmCIlBnHK5JLTdL0O2srnzvZP3LjHc+nHkpt0waBNUOb0JnLot+b202bve9ohxR
         xOLJtIUW5FY5A==
Date:   Wed, 30 Jun 2021 21:08:40 +0100
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
Message-ID: <20210630200840.GJ5106@sirena.org.uk>
Mail-Followup-To: "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Graeme Gregory <gg@slimlogic.co.uk>,
        Liam Girdwood <lgirdwood@gmail.com>, Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Peter Ujfalusi <peter.ujfalusi@gmail.com>
References: <20210629155922.GD4613@sirena.org.uk>
 <2C7C3A47-4A5B-4052-98FC-7A96E2F138CA@goldelico.com>
 <20210629185638.GG4613@sirena.org.uk>
 <7B58B1BF-9D65-4CEC-B7D1-4EFDB2C0CB4E@goldelico.com>
 <20210630121307.GA5106@sirena.org.uk>
 <02EE05C2-588F-4D50-8A37-46CC3B0C302C@goldelico.com>
 <20210630130425.GF5106@sirena.org.uk>
 <E57CB314-F56C-4B33-81E8-7927564DB751@goldelico.com>
 <20210630164517.GI5106@sirena.org.uk>
 <54FC87BA-D45A-4ABF-B233-2A70B4A4A632@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yzvKDKJiLNESc64M"
Content-Disposition: inline
In-Reply-To: <54FC87BA-D45A-4ABF-B233-2A70B4A4A632@goldelico.com>
X-Cookie: Use at own risk.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--yzvKDKJiLNESc64M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 30, 2021 at 07:17:28PM +0200, H. Nikolaus Schaller wrote:

> Splitting into many regulators also needs to touch the device trees
> to have individual compatible entries which currently do not exist.

No, it doesn't.  There's absolutely no need for any specific mapping
between Linux devices and compatible strings or nodes in the DT, we can
create any number of Linux devices for any number of compatibles - just
look at MFDs (where we create multiple Linux devices for a single DT
compatible string) or system devices (where we create Linux devices with
potentially no node in the device tree).

> On the other hand, a theoretical system could have a real fixed regulator
> in between (maybe a power switch?) and should still work. Why should=20
> driver core care about that case and not the core system it is using?

For deferred probe to be guaranteed to work we really should have one
regulator per Linux device but in practice that is overhead and effort
that almost never buys us anything in practical systems (I can't
emphasize strongly enough how unusual chains of more than two regulators
are) so we don't enforce doing that.

--yzvKDKJiLNESc64M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDcz0gACgkQJNaLcl1U
h9Alhwf6A/l+yQTivY2BnuVIBZ3uHpdIaDRcqTQsayu6wYKFdGu7joB5ljdLvUkp
IKqZ6KyC2h4CoZqT9nxIdQM8ZXn+JCjjdbiZ6fXJ8+o879/BgAPR1meYwAB6KCMD
upl1DDewOLR/9Z3Rq60KAOD9Q7U6ypsoDfqjWtVJu115gUrgSOPB/Mc0/1g+BUwA
EFd7gbvqgM5vlM8ADJn6SRfm3JbApGQBOoV+0kUvChN3os4gUzmQfcZPI2tCywvD
WFJogLXGFpEIr+GZiQEZsKLe0lFR81OS/QdZ7JSdYFJHlYdM4bXlhRCWnFBwSNlF
oZ2RK4T665bSAUVBUPMZgt9MvqK7Ew==
=XMMb
-----END PGP SIGNATURE-----

--yzvKDKJiLNESc64M--
