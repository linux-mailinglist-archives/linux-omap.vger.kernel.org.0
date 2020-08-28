Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D962558BA
	for <lists+linux-omap@lfdr.de>; Fri, 28 Aug 2020 12:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgH1Kla (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 Aug 2020 06:41:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:59876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728218AbgH1KlT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 28 Aug 2020 06:41:19 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57A58208CA;
        Fri, 28 Aug 2020 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598611278;
        bh=6Jy5osIekF1eRSyRLKgOVRMHKrMJiONYDyZHh+m9wo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zpwit3OISzTSUF6VA4jARDxtTB875KlzQ5oeU0tfHwVR7CcShaD1kYDaMBYo62nCT
         M0LYukKGxDmZGtCDPk5kte5KY3WHMf2DpmwViufMj6yer+w40cTBIR/XlnRBqJ2GiQ
         6iWNFl+FpMmGeN1NtGvDOINZnUu1Tpihr33YvujA=
Date:   Fri, 28 Aug 2020 11:40:41 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Marc Zyngier <maz@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Roger Quadros <rogerq@ti.com>, kernel-team@android.com
Subject: Re: [RESEND PATCH v2] mfd: syscon: Use a unique name with
 regmap_config
Message-ID: <20200828104041.GA5566@sirena.org.uk>
References: <20200727211008.24225-1-s-anna@ti.com>
 <0c1feaf91b9d285c1bded488437705da@misterjones.org>
 <74bc1f9f-cc48-cec9-85f4-3376b66b40fc@ti.com>
 <78b465b080772b6ba867e39a623c2310@kernel.org>
 <ef1931eb-5677-d92c-732d-b67b5263425d@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <ef1931eb-5677-d92c-732d-b67b5263425d@ti.com>
X-Cookie: Your fault -- core dumped
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 27, 2020 at 03:32:05PM -0500, Suman Anna wrote:

> Can you clarify the lifecycle expectations on the config->name and do you have
> any suggestions here?

The regmap name is expected to be managed by the caller and should be
live as long as the regmap is live, it is almost always static data.

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9I3ygACgkQJNaLcl1U
h9Cotwf7BX59rjEfAObc6EiYDMQHTXxS21y4XOOQc9TXVA7RqlqkVgdFO8EZokWi
CYvwidVwx5kEMY4HA1f5LiOGDDYO9WYTdc/7KPvqs6+5YuIfbnZ2Pc11M5LnD13a
ffJa35UwFRo7haxGmwYZzZ43dH8+A47UXc2XN4cEKQr2ASijddQF1eedjlIUsOXC
VC+er9LwBK6QlEi32LX20E29lt3a0nggZEd3HgPQ7JwfTSKak5gcMIrHi0K3Hi2S
xmkQq9SGYuUtRS4G9sHtu5xB++vsQ2TOi0G3Taupb4V9Was12unUKrn6MXQxtNHb
alngi0rC1PRkLrMn2RDXIoDreF6cOQ==
=rgya
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
