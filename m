Return-Path: <linux-omap+bounces-3854-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 152BAAD71C3
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 15:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54CCC3AD0F5
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 13:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4DA25B1D8;
	Thu, 12 Jun 2025 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bofp8ZTg"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B18923C50F;
	Thu, 12 Jun 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734369; cv=none; b=ed205qAlSIHE6kd7p7rqTjE82T3PteFq8Z9FDvVDAZ7aGiVMZ6GoJ0LnWlWCrvcqBbOwbG0KK1whP3ZaiBMFfDFbnwLOZEPIxUocrYj0KiD3BO+6i/pbYJ3P9FVOQCQZjslfM9WqL/6i5xG1oANdrUyJ1ZcDE4ki0efU3uBmZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734369; c=relaxed/simple;
	bh=Zmq7LwoPt7MZJE/08CV/hmDhdIJv4EK5akZLX8g6Swk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8TGdhiBr5cl9lhk2nlsTdq9+Xo3rgD/h9fsSmEHJS5UI6n2N4K5EsxdUSEb0w/eu2qNvnn4w0K6dpL/lPqMr7UAB8QIUmmt7B+C1vhe6Cm+CxO13OpjzVu5JUcyFzMa21HK+LeFmYjF361MK3eyQNMOXIkdjAWe/Mr38xsr1Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bofp8ZTg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E44C4CEEE;
	Thu, 12 Jun 2025 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749734369;
	bh=Zmq7LwoPt7MZJE/08CV/hmDhdIJv4EK5akZLX8g6Swk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bofp8ZTgYCZ2pKDEwAV3kCP1qSAF8tHnj2pTmRuDfrO/7pyE48oSyygMGr9VP2UY5
	 JXdXbyGdib651JSC0XTB52jFYIm0BPEf1NnG+mbvlhIydtGImsD33guECyqhiqrH+d
	 rvM0KJLYUU4vEPDjKUmvzsyMJX/x5gAWg9PZEfS5Juf37qpMogSDxYEYVJ8je8AUdV
	 mCb/XyjcZ/d7zax6KRCaE6upz6qRGllGARlCmwDN9E+LOIDIxiZWRlRMGn8AWn3v6E
	 olQnFfGYN8bSLRJceUGIwPKgIUs1lNPpTA+IylkfFQFyBxYzBm+IRuXRiTPJ3xi4pr
	 SsGc66ndSd40A==
Date: Thu, 12 Jun 2025 14:19:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/5] arm: omap2plus_defconfig: Enable TPS65219
 regulator
Message-ID: <90c50d23-1a70-47e4-a80d-c951f7afc5df@sirena.org.uk>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-5-5278026b7498@bootlin.com>
 <1d87fa3b-c3b9-44fd-9e61-7f1ffadcfb0c@ti.com>
 <20250612081255.255be21e@akair>
 <ef6d6315-6517-4c8b-bf76-e41bb72bae8d@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GNSy8GOpRYA2RVtl"
Content-Disposition: inline
In-Reply-To: <ef6d6315-6517-4c8b-bf76-e41bb72bae8d@ti.com>
X-Cookie: Biz is better.


--GNSy8GOpRYA2RVtl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 12, 2025 at 08:09:59AM -0500, Andrew Davis wrote:
> On 6/12/25 1:12 AM, Andreas Kemnade wrote:

> > So there need to be a bunch of patches to add the missing stuff.
> > omap2plus_defconfig is there and support for boards are added.

> Yes multi_v7 is still missing stuff for some boards we want to
> support, and we are working on adding those needed modules now.

> We won't get feature parity in multi_v7 if we keep adding new
> boards to the old omap2plus_defconfig. For this patch series
> how about we add support to both defconfigs?

Keeping the more specific defconfigs around is handy as they're much
smaller and therefore faster to build, but I do agree that the
multi_vX_defconfigs should also work.

--GNSy8GOpRYA2RVtl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhK09oACgkQJNaLcl1U
h9BQ4gf+LYAiC+6SJGmRoNcTP/UfS3rf/D+1XLuJJYKWsIh7wkg6m3pLmH2zMtG9
QmBwEAumEqTdKxNiujtRn5Y4wFw3w2WA3PLQtPpr+o1qSVfxxFLxggM/BNz6uQH8
ALc56Y8Ft/mUSfEod2xzbUe31gnfGyQ3X2TrwXyEd/97Shu4T89o8nNBcZPLLZkM
ETR3Raif3ZXYRwMefhT/eDl0Qd8S95Yoyj754c9wcd4Al0KFJpKw9z4F8gkLM6jb
13GP3UQ4w5kW7Qft4OkPeV1bufB31Xo7zx6DYT9SXjfZGgyCQteRDym5y6QKgCv5
gPJl3KnWCXq/IauwmreGj56PaPQKvA==
=xL1X
-----END PGP SIGNATURE-----

--GNSy8GOpRYA2RVtl--

