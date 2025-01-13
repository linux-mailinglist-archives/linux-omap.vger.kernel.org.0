Return-Path: <linux-omap+bounces-3097-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B88AA0B798
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 14:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC88E7A2ACF
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 13:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA24235BF7;
	Mon, 13 Jan 2025 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkBhVLYr"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E34233D7C;
	Mon, 13 Jan 2025 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736773210; cv=none; b=O2fW4ebiD5iF/key+WigctmAb5riFrJwDO+p94BrSWkTU7pm+1ZTO1/izgNq4GjNT4JKjj2GrzdtisAsYjDC7p3J46S8prWIcTS30/LF0b2Db013BX4KC1kGhYqgouWyg0ap18NB3U216P3Md1ZNfKHBDIcSjFa7WNFxZkavFrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736773210; c=relaxed/simple;
	bh=8fxejSnj7Vmhk27SVFdD9TVyLiLKcYlRJjTpEcchn3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooeB5Dcnb2789klOWGkWMt5PIHXSDn3XGcCSJgtzQSvKREfdJaVnnDgcoWUpZgPguRnL4KgtdQtJqx/0sB6JRXSQ0WiuqZEh2cv404xXhSIlecpm5gXFY75IoClWDzfrrlCo8shlhjk/hJGqOW8TonNNgj/FJLleJRUOU7sDbyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkBhVLYr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B18C4CED6;
	Mon, 13 Jan 2025 13:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736773210;
	bh=8fxejSnj7Vmhk27SVFdD9TVyLiLKcYlRJjTpEcchn3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fkBhVLYrd9TSA3zGQKNh1iGH0znOgjdbJZDbu80sWuJdIsHGuD6tcAfV00LQ8IC3K
	 mYNpjXzkorrzfKJAFX3M5T/HFscaaXEHbY13AFmSEkxHkp3LKOAJoaGHLJvCZ23KYC
	 SsEbhwXRfvvCFLzM8SDks14zPZlj85PJNVOlAaujR+GYbTABKrIYkNT9F9dVTRZILT
	 vwEuEswUIL2ZCmN5iJyWrZgxJbYBrLVjfAQ2EZcNFb5L2Byg7BcIGyF/hke5jl8sIZ
	 ZF4haaVOVlGyBZsAJ/tWOh1m5LdSN8NlYG7MALd5vh9zPJVZBHZ7iNc4i3gI4Ff855
	 txW+A35PWeXTg==
Date: Mon, 13 Jan 2025 13:00:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/5] ASoC: cpcap: Implement jack headset detection
Message-ID: <cd396e7a-3861-42ea-9e02-c4701e684df2@sirena.org.uk>
References: <20241228114514.91594-1-ivo.g.dimitrov.75@gmail.com>
 <a35c8cfc-d7a1-4c3f-9541-ee247e2490f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3hDDK6MCElFz9qGL"
Content-Disposition: inline
In-Reply-To: <a35c8cfc-d7a1-4c3f-9541-ee247e2490f4@gmail.com>
X-Cookie: You will outgrow your usefulness.


--3hDDK6MCElFz9qGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 07:56:38AM +0200, Ivaylo Dimitrov wrote:
> ping

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--3hDDK6MCElFz9qGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeFDlMACgkQJNaLcl1U
h9DuzAgAhaPADhA+7VYoP5SNGDV/Sq09OSw0JDoYkc2HVCasJ6dnBV1K+t8RMxTT
FGtTMNbZWA6G2kP2yFNLNG786c9ipiBI+8bGrJYroVUHZdatR11i8pjbqJiPpwZZ
JmlPY0xu9+al7s6eYXJ8AcQrU8A0eCQHja67QzI8yZUGD2x/VChYbVIXK8e2G1Tr
Jt/9/3W5oF80oSoVCFZVFuUFP4YRpjzE+I8ggmvkcz0ZEcrX3kT1b8B1ljMbRDit
BMPR+xzi4AyVLL2vmGPdPQb+FlWBYaZ/3XmNEQs40yIw03VVucbzq9hTx6wzWTMj
45piVjT714PN8AAMKFla5lByG4afKg==
=+72S
-----END PGP SIGNATURE-----

--3hDDK6MCElFz9qGL--

