Return-Path: <linux-omap+bounces-3194-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE8A1A38F
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 12:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 897C2188C51E
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 11:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC81520F070;
	Thu, 23 Jan 2025 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+MNMNGx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB3720E70C;
	Thu, 23 Jan 2025 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632983; cv=none; b=gUhwy1TkXwbO2utkCE4HOF73wEPxjuxo1uXyhlKq5kjW9jZVNuqCch5YqZntlzq5UuQzp2Buf8NSqnuBCGmKWz0WJDO3a4a3jAWL4CBS2ZoK4+tUeznldy8fGIb73XE9jsXSTaNpJJnaVhfMy3ePtC8QymlztY2EHYE9YI+OSAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632983; c=relaxed/simple;
	bh=JQpnWSLvcUXnxcIEbk5HWSRN1U80GEye+47kmsw6z+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cj1zZdE0CFxs/zfDId9QCzlUQEQWqqvTg7Pghq1ME3HlL+DERPvkD/Ojlx9I7AXi25mFuTOXmyTkq0vxO/LpMjJobE9GMc9FHp/KCtceELBgY/e0t72ek5Ron76FnblDNSmFzt65Qejnn+is1sXHS30qOvEjMH7dxRg3RCFUedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+MNMNGx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9982EC4CED3;
	Thu, 23 Jan 2025 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737632983;
	bh=JQpnWSLvcUXnxcIEbk5HWSRN1U80GEye+47kmsw6z+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+MNMNGxx4WKYcZpjxKTcKjw9NW6Ss9W5x1oCfzdpZCfjD5EtQYN0CzHUsx3jR3rc
	 EXZ0bKcWIgM677Q1HSPE3ZaCAq8GayOZBj/6upWIbpIMX56Cl8PVNu1aPP+71AJgFN
	 1NTBUSy79WGs9HXNrkPxnuwXAJ5oz7qujHwmrRH0vWDOnsF9ez4SiPVUrNwbivSt8d
	 8Su5FvbhY/4qDe5i+uGYqWuqdKbLLaHktLrEvkPh0fXwD+MJjQc7FgDfAz21aBtYgR
	 HC5fUYtzMMAxc++noRbLAZ+4NM8NhK4ZG1PaMUYXaQFDJo/oIOq4UkwSvmlnEp46Oq
	 avIx8vZfj+OkA==
Date: Thu, 23 Jan 2025 11:49:38 +0000
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
Subject: Re: [PATCH v2 3/5] dt-bindings: mfd: motorola-cpcap: Document
 audio-codec interrupts
Message-ID: <a60f468e-857a-4f4c-b3d9-3ee8faf6602a@sirena.org.uk>
References: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
 <20250122164129.807247-4-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EDn2e2kTBvOtiq5X"
Content-Disposition: inline
In-Reply-To: <20250122164129.807247-4-ivo.g.dimitrov.75@gmail.com>
X-Cookie: Never kick a man, unless he's down.


--EDn2e2kTBvOtiq5X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 22, 2025 at 06:41:27PM +0200, Ivaylo Dimitrov wrote:
> Add DT binding for the audio-codec headset detection interrupts.

Lee, would it be OK to merge this via ASoC?

--EDn2e2kTBvOtiq5X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeSLNEACgkQJNaLcl1U
h9AS4Af+L81zQkihJtGBHw8Au0C8XQRrOZOe8juBJ56PEl5NxhhkEqS6HgplRhob
o+7XRa9xQFRyI1JNbHDRVU2N46CeSk6/3PTsC/wZU7HRX8ziy4j4y7oYn7lNES6l
EQSvN9A3UN9uBF26Q1kT0ZlRp0OmZHUJskKuTl8e4J+kQomL8HyWx6FhAzQ8PcEY
RR5FIdYkOWyoGSR4sfCvxNiGLoDmKuvrj4963uLGzzmDHgh7IlArDLLujcP5gleE
MmipntedI2q37O+cSOOa3B+RrsejYtukQUCVYn5X8LpSNMZdnpJq/DFBfS09ees8
vxyLp1OWEuuPq24mKwZaSAga7Ua0NQ==
=HQCu
-----END PGP SIGNATURE-----

--EDn2e2kTBvOtiq5X--

