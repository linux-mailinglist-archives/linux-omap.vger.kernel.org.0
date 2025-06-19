Return-Path: <linux-omap+bounces-3923-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4162AE0CCA
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 20:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 311EF16A336
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 18:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651FB28C867;
	Thu, 19 Jun 2025 18:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nq/w7R90"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027CC28C020;
	Thu, 19 Jun 2025 18:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356855; cv=none; b=q9mzFIoXdOVkJ+CdFapT5xqIunseA+s2UKN9Aq88Ung3SuP5It6zeaCln0qoJupqgz2TKBA2NhYZWADDXb33gbrzQ0z5vnIDnFbTmj/Au/AvDLGInUrcynJPSwUIZMxu96y+H4bbL0EXKc2zCA/6JPEGG7NzYUcl14EbzITENYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356855; c=relaxed/simple;
	bh=THphBqwO73zMJDdFs0oArumv2MigE1AeI/tF8nksvmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHtjofsIgo8PTi5vayPTM62/1zC6ogMiX/hyZAFnegxalLb40tVcoVvO66EMt8IGDWCng4ynqFmfLbwLR204sGtS4SNz5PUoPFxs/6LBhsiDQC5jrlyD0N5k3hJDu4mmXZKmcn8LBXsp6NqRYysDjavEos0CR7KNpH7QgGoLEEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nq/w7R90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254DEC4CEEA;
	Thu, 19 Jun 2025 18:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750356854;
	bh=THphBqwO73zMJDdFs0oArumv2MigE1AeI/tF8nksvmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nq/w7R902cNAFfWZ/MJVUBNLLHLyL+K7GR7Iu6rR8kZi7zekrEWIAWOyoZzznJSgK
	 g3f3oo7nwAJ9DmbcDGmseMtTJcOkRucYsqtf5t2gyQpkcKEAOd5DwaTESAVcpmhL6I
	 8Mlbel8tAKJWPuRbu1ZJCIv0+bUQjpYhoy4yLI24xT7t7CuW2rCsfwOd6uX98DRXTZ
	 8WHsFLeLVW2K2C+JCP6EdUqqBD+K4xcIffZDodKT6eqQTseXPLmfR750nanV3rT8aH
	 9lAM/KzsfjTCZOW4VE1KbK3EEZOPNPXM9gUcn58gRR8t0/6IOgt7+Dwo0E2drcSdpW
	 6ksABTtxzyGuw==
Date: Thu, 19 Jun 2025 19:14:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Dhruva Gole <d-gole@ti.com>
Cc: s-ramamoorthy@ti.com, lgirdwood@gmail.com, aaro.koskinen@iki.fi,
	andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
	tony@atomide.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com,
	Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH] Revert "regulator: tps65219: Add TI TPS65214 Regulator
 Support"
Message-ID: <d0d7e7f9-c558-4bcc-9e79-a4af21f24f5b@sirena.org.uk>
References: <20250619153526.297398-1-d-gole@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ckZQGnCRmqMlmbTm"
Content-Disposition: inline
In-Reply-To: <20250619153526.297398-1-d-gole@ti.com>
X-Cookie: Reapply as necessary.


--ckZQGnCRmqMlmbTm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 09:05:26PM +0530, Dhruva Gole wrote:
> This reverts commit f1471bc435afa31c8c0c58551922830dc8f4b06b.
>=20
> This was causing boot regressions [1] on many BeagleBoard platforms
> like the AM62x based BeaglePlay and PocketBeagle-2.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--ckZQGnCRmqMlmbTm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhUU3AACgkQJNaLcl1U
h9BLngf9GlY6EwT6kBDAu6jUO7EO5vrGyCnyK/J3vxJlkyIS9/8ThR+bRzaltldL
k+9FpCIDOeRI1oxoKR5l7U7orpJIgc32DXtIMBdUKLm2T/Jv9sVBCGXdWK2IrBFE
WS8crlcWTO0mu7YyDQ0gPxOoOYVphYu5GC5e3GlvcPI1H81JCOk7sx56uUgOf2Y/
P5GSTROHwixDTxOmpc0NZOaj+2RzhjWNiVPeOp5Qj5kbpVyQQHsyhI5Jt5Ysjk8B
MgRNgzbczf0+XGll9PUQG2/L7Xw2O7ihiYUrJFJ8VTPiwWhkdghYaUVH1rH4qIDo
eTWStx+FysX1LoXagdAkzqg1PXUHDw==
=MaEg
-----END PGP SIGNATURE-----

--ckZQGnCRmqMlmbTm--

