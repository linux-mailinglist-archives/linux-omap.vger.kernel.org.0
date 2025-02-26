Return-Path: <linux-omap+bounces-3303-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14175A46EAE
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2025 23:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA9E188975E
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2025 22:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768BC25D1EF;
	Wed, 26 Feb 2025 22:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHMxOX5t"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B1725D1E1;
	Wed, 26 Feb 2025 22:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740609626; cv=none; b=lMCbxIam0s02aluwc39+xSgzYdgkdONTwVZOmQs/013BBlW9zciDtbzVgre8pb+TE+Z0I7JMqRhaWcO1x3bECR4BToMiEFAQnmvbpXc4svNFeOHv3LFUHcqt48ZUgBzUmRXWUrMy+2K8bfOe6hmHCpQrc6L4hnLGDObzNOa+ShA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740609626; c=relaxed/simple;
	bh=Tu1nE4Q3dyBkfNVe3WH+1VRORM2AVFLgDFLmA+vu5Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2MfvfGzNfqmRMo92bC6yTzr/GbFzUh++k4vI7EBuT0HGRubS0zVCAeppsZsnfXU/IVOMGoxE9alVdOaL1uGSg9w07DO3nIsP6SecAJbAzGNSM0M9BTcHbRIhnOKbS0Nkc/q/jRMUL4NaO6uDa8NfKTfSrAnMt5san1bZYH6agQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHMxOX5t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4C7C4CED6;
	Wed, 26 Feb 2025 22:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740609625;
	bh=Tu1nE4Q3dyBkfNVe3WH+1VRORM2AVFLgDFLmA+vu5Eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YHMxOX5tSubQW8hSAELPyOewhU7DnMOHzUPM3K7WVk1IeV06qM94wp9etUCxD1sB3
	 KW46v64/YnrF8sRcMYic8yhmr8Mpu2E/R3DdVMmGtUeWX6xL0vU2QeldT2W68l0wq1
	 6z0JkJLFfv36PdzeWBpOswj2GaYTddI7BNkt/kuPw8vjl+7y06A6YLhVc96+ciEX7P
	 7Xm0ndcD+lKXldwvXV/u3XG0oBuy0s1ht2AXgXmGQPguW4o0oT83jKYUBbIc9qlE6T
	 63LORntFbDo8xw9SAR6BPXGBAY3qwlwxkvqb783S1J0w7DriXdawO7LGS0sNqxa3+w
	 YsxBnXt2wnvrg==
Date: Wed, 26 Feb 2025 22:40:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: lgirdwood@gmail.com, aaro.koskinen@iki.fi, andreas@kemnade.info,
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	m-leonard@ti.com, praneeth@ti.com
Subject: Re: [PATCH v4 0/4] Add TI TPS65214 & TPS65215 Regulator Support
Message-ID: <131466cc-dc54-4251-82f7-5ec9e9c20f26@sirena.org.uk>
References: <20250212191129.467728-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HaBd6upumVx/cA7B"
Content-Disposition: inline
In-Reply-To: <20250212191129.467728-1-s-ramamoorthy@ti.com>
X-Cookie: I've been there.


--HaBd6upumVx/cA7B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2025 at 01:11:25PM -0600, Shree Ramamoorthy wrote:

> Dependencies:
> - Patches 2 & 3 depend on https://lore.kernel.org/all/20250206173725.386720-5-s-ramamoorthy@ti.com/
> - Patch 4 depends on https://lore.kernel.org/all/20250206173725.386720-6-s-ramamoorthy@ti.com/

These all appear to be in the MFD tree without a tag to pull from or
anything so I can't apply any of this stuff until after the merge
window.  I'm not clear why they weren't sent as part of the MFD series?
You should probably resend copying Lee.

--HaBd6upumVx/cA7B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme/mFMACgkQJNaLcl1U
h9A41wf9E9XKpozxVx8/quKsH1uIUSHOnJ8jTvKBHC3jBC97Hkq2zawKIO8ihBLy
pCYgVLGeAIiikzkrAUsioX2KnEhpoScNG5l98oSqz30SRXnoxtMj9ilYVfPYH016
XbaTl/3aJrbqml6f28yj/aZHFdG0fMqkDhaiPtOGdwyQD82fudWW720WSaAsKZUm
P6fimiULpDMsBvNvb70nY3MhHDxKQFJgOQ1igi7TtKIdweksMx/K0S4RBwraie5W
5PU8TNsjDAcldatju8bqg89HZzrb5X/K9oQJH/3GZjEdkN8QaDEON+18KvFB3cT9
wO8jj1LK6M+4h43lghvTC8NlWI0uAg==
=nhrl
-----END PGP SIGNATURE-----

--HaBd6upumVx/cA7B--

