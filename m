Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9293C2398
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jul 2021 14:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbhGIMnV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Jul 2021 08:43:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:44616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229671AbhGIMnV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 9 Jul 2021 08:43:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11A3E6135B;
        Fri,  9 Jul 2021 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625834437;
        bh=9GYxC6vUPYJkAA1MTlDePNCYv1ISJaSOZsZokped54E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fkQiV9+CZvyGfZpdYhEJMSzjB8K/SMBtZYYVrIozLDAyKXPZf0mUg2ioZ+mlo6S+u
         WGw3il8gXBSh0gjpkXq65ob/H1vW9QF1e22djwKinVQnYlG0N3yMQcvohh7xcyRiP0
         kpHiBFE6DcXjww45NcaSAHX/NR2ZUiSaUk5MHtOLX7kPm9zl1KOYVWS+exVGRidVnu
         3XguHlgcB0moftdZJQCvT2QMhs3gaiK7FtFC/0j92wOYSs0DrZfrB+qsIw5hrA4XJ7
         wlY7nKU5CVfk/aCSXf8B/G5wsDEd750TNfQQMawAWyxeD29lbIXo7e0GuboL2sJkvf
         nprStr583wV4w==
Date:   Fri, 9 Jul 2021 13:40:04 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>,
        alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: Re: [PATCH v2 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and
 OMAP4 support
Message-ID: <20210709124004.GB4112@sirena.org.uk>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
 <20210707173245.GK4394@sirena.org.uk>
 <b800e9ff-c8dc-ca09-8b2d-a750f05edb12@gmail.com>
 <YOftKVAsRaxtEY8n@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline
In-Reply-To: <YOftKVAsRaxtEY8n@atomide.com>
X-Cookie: This fortune intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 09, 2021 at 09:31:05AM +0300, Tony Lindgren wrote:

> > The ASoC patches are not affected by this, it is just that we need to
> > block SIDLE mode in a different way than how I did it in the last patch.

> > I'll take a look on how to implement the needed quirk for the McASP
> > module, then I can send the dts+ti-sysc patch to linux-omap.

> OK sounds good to me.

So should I queue the ASoC patches and then let the DT patches go via
Tony's tree?

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDoQ6MACgkQJNaLcl1U
h9BpEwf/RDjneK8FOo/V4xfEzRLQw0/z4J1+SNvQEN37DefWi3rKL5Mo+BB/UvIX
Qx3J5MiMqoyryicmB7f9c/FDsxLyVqwlUAOmrQy5RZPW2MqDp/QxAl3VXgMQehVr
PqmX59jRubMzfg2PozhSNgAOL6k/+aVM20ZS3EWf7l1YwiJenmqnJnSieDdQ9NHx
3skDk3XRWXHH/wH/PFzuoKtw6SfXHO0IDYmqYGY3pcCA6C+a4HGcKgQKNLrJHw2c
BLnGoR2JAPlf7yVxSQqzqZlcaUrU2KDb0rkEFOq0Yrqu0bozl2Rb287V6rzJEHaK
25CzSrT4fpR/KwlYWGc8fsXgu4YDwQ==
=rVrk
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
