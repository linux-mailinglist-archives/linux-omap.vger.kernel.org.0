Return-Path: <linux-omap+bounces-1509-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B74900974
	for <lists+linux-omap@lfdr.de>; Fri,  7 Jun 2024 17:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 184B11F228F8
	for <lists+linux-omap@lfdr.de>; Fri,  7 Jun 2024 15:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC60199222;
	Fri,  7 Jun 2024 15:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KswXNit0"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FBE197A9E;
	Fri,  7 Jun 2024 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717775012; cv=none; b=EgCOAg8ELhyTJy2G4raHzKr81mZKtO3yQ99T0/bYie9X3uTsbrl+qRFbjHhq+yviP3CSqcRJ/JM0I2rnbbfoUfHnN30drbc7GyiUqQmA3dQEhJQ3m0NpuqUt0svbRSsGi8qAOYjTN8ijLWC+Dfvf+82OA84kzwqbh4OZ+rNckro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717775012; c=relaxed/simple;
	bh=Oak7/RY7bDtE/YffJGOhtWBTzO+b3JvmAbgh9CNNL7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Glnv3R78ao3cY9Zf9RRYMt74fEYqhTtM/GpF2+lQ3PrJIgXIwP2z+bKgcsHIh8v+/HbXDRum5BgDHrdAlU30Tn8Dkf5qTypiOawlSZRF1cKBYUuccBtSib0Jx8mOcgKVI18GeqPp0wxxIefY03RaV3RjmqTuc89B8S8dLXZDKG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KswXNit0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EF2C2BBFC;
	Fri,  7 Jun 2024 15:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717775011;
	bh=Oak7/RY7bDtE/YffJGOhtWBTzO+b3JvmAbgh9CNNL7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KswXNit0c+KzUCH64bi5nQnmphSXrUOvAZmYXkidLEAMmcZQZrGHZ9mkL/CaV1DRY
	 Yd+MZeCZRdEkqnzOHaZt697IySBQxQDCCKfUdk/IJRpwWbq0W7QBMhfXqhnclhY6wZ
	 ee1f3+CzYq7h8LJ1tterkxhX1MRNtFfmTq90IpTf+RI0coPB/5BkUB0W8G16s+Qndh
	 9ljjAnCzetjixTcNDHuBn1fjPE/jEjCSV4TFSocFZTE8+/tRVfsjy5sHc65QCGa4Co
	 H+qTZo0BQNibIWPAs2sMh0SecbRZct0H80wVPiil1EZI6zCCJugakAheoXMuKwTDHl
	 KLf/z7U0gSohg==
Date: Fri, 7 Jun 2024 16:43:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH] ASoC: ti: omap-hdmi: Fix too long driver name
Message-ID: <ZmMqoA9nsEDh2jK5@finisterre.sirena.org.uk>
References: <20240606070645.3519459-1-primoz.fiser@norik.com>
 <dac7fba4-c7e3-4be9-8072-625d723e6cf5@gmail.com>
 <71d7754e-f72c-4a04-b03e-a0ee0e24c9e0@sirena.org.uk>
 <fe0ec57b-dad3-4666-abe3-75bcb65fa7df@norik.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E3iFsJivvgUV/9q+"
Content-Disposition: inline
In-Reply-To: <fe0ec57b-dad3-4666-abe3-75bcb65fa7df@norik.com>
X-Cookie: Your love life will be... interesting.


--E3iFsJivvgUV/9q+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2024 at 08:14:40AM +0200, Primoz Fiser wrote:

> So card->name = "HDMI" for v2?

Yes, please.

--E3iFsJivvgUV/9q+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZjKp8ACgkQJNaLcl1U
h9BIcQf+LZpGbmqKcuAK05OwRDTh/tjjeSbQCs1/T/tGLfIz1M1M8fJGpjcIYdnA
0MZdFPYqPs/dBjNMjhCVCYp1X3U8jKDL01dVSLfR35ZZ3cGv9mMxi/+V2S1qELIV
8Da+8IA7JrqutzC+7cmFkmMrz7xGzp/jNWaBMet2upvkcXKAXBahSP6ICD9P0Qus
xritGwfbPQ1xVfSU6Yd4pPngP8Ak6sYTGsV9AuHyX9bk3UHtLxUu4Za2rwiT5mJy
e79W34zajligov/lRXgM8FdEjiFo/7yaZv5EWq9LZYc0A0VXRSlPAMtrd5aUawFz
7kCm7CHFW9FvxWn2oFVA6vqaLHqJcw==
=Wz2C
-----END PGP SIGNATURE-----

--E3iFsJivvgUV/9q+--

