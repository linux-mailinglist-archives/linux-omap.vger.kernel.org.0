Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B8120B4A5
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 17:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgFZPej (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 11:34:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:45352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbgFZPei (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Jun 2020 11:34:38 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A8302081A;
        Fri, 26 Jun 2020 15:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593185678;
        bh=A7IPRyeuP6/3NqZoUgdzauDP9nrPKQlLllURshwLU9M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=x5COMCfnlxSQlGkB0wod1F7ljUsvO/oPxCZZG4w6XULJQJCD3Sgwk5Lpn6ycRLY0Q
         8drJcWwHrbjeYsiS0HTGNYFlFNaPbogNKzkroYm5yudeMfhZG5jyZr7sUFtqksVX7P
         Tc6/r+EyiowFB3CX0PF4RsBRGHl5jq0scrgQbFOI=
Date:   Fri, 26 Jun 2020 16:34:36 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Russ Dill <Russ.Dill@ti.com>,
        Keerthy <j-keerthy@ti.com>, AnilKumar Ch <anilkumar@ti.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 6/9] regulator: tps65217-regulator: Use the returned
 value of tps65217_reg_read()
Message-ID: <20200626153436.GA6527@sirena.org.uk>
References: <20200626065738.93412-1-lee.jones@linaro.org>
 <20200626065738.93412-7-lee.jones@linaro.org>
 <20200626133304.GB5289@sirena.org.uk>
 <20200626153119.GC177734@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <20200626153119.GC177734@dell>
X-Cookie: Do not disturb.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 26, 2020 at 04:31:19PM +0100, Lee Jones wrote:
> On Fri, 26 Jun 2020, Mark Brown wrote:

> > We should really be logging an error there rather than just returning,
> > that way it's a bit more apparent to someone debugging things what went
> > wrong if there is actually a problem.

> Would you like me to fix that up subsequently?

That'd be great, yeah!

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl72FYsACgkQJNaLcl1U
h9COyQf/WWxpqAzfIH6e2wHDZWmLZGgLpGOgO1ab3hhxJ08G/iU5hVcUJXUT800m
KWCkzSxXk1p9v+eCGJ6scUQ850n7/IHdLIgfDDOlyppoxxttet/Zvg7ZXKk4EPUo
r7Lwt6N8m01b2dFRKz8rzcMRofDc3PY9dvn7ii1yvjcKrbXwi67AUuSdNjaNrIPB
pPFOX8L8BvscOG8Nu1Zx4G04snrrHL76QquV8H5c2G/mqZo69X1eNneRJk6twdZC
UwvK5ls/MYaAwDLixW+/ZBbqWb7jAvL75DA9dzN7UTWsp5sPH/jjTnXtuauIIICT
MK0DiSlRbBlmAoUmH3fnJa8Ih9IFoA==
=0l8u
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
