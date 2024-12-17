Return-Path: <linux-omap+bounces-2848-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 876AD9F5850
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 22:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26D9F188E6F3
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 21:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E8E1F9AAD;
	Tue, 17 Dec 2024 21:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVimyfjb"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C71D79BB;
	Tue, 17 Dec 2024 21:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734469296; cv=none; b=CvC5qppHBMuE6BDo9rlWGMAy8mFdwHWm9ckEhqkxU124LKBqZngMUFE7za7rlyCwEF4/5Wu7YSPZlcBFgtiSh5wEjTGOru7jR8dsD5PoY+2099oi1Vzq6HOa+nC6wnORliX9l4oaJPLORq6mnLADSWpDIcahI1ToGMUzyZsOqWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734469296; c=relaxed/simple;
	bh=VUTPzTzwFVOLmuJLL7CWUZhd9L/dIR/ROldGB7DsnoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBLwGyYeORZRi+fLK3jg3Ra6x88fGaaoJTCodfzNDpSL70h0h8jlXF3TRz0gFwvS1j/Fi2LHJ/bTvg+0hzbHyeG5r4RsvittKlLy1gSV0T5hZmBIrpxmvp00ECUOO1bAxfClUeWOSczGdSfIQnZQWGGVOxtGFkQ7KCgPNzaBrFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVimyfjb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C274C4CED3;
	Tue, 17 Dec 2024 21:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734469296;
	bh=VUTPzTzwFVOLmuJLL7CWUZhd9L/dIR/ROldGB7DsnoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVimyfjbA64s6dDiO9fOvlX6QOta3iH1rS8ERqdG+tqM7jiy1Thy2f5559sWBviGD
	 ODVT3T03iTKRKBRzLEK/jzr/jO/jmmF8kwlTgKmV7sbfyubNNH66hJLINII+ZEZRDu
	 iwl6x4Ak5p1GkIC6X5wKIFzLc3JdPyicBxn7HDIBYDaEldRiRGZSL3fQh9NV17ZyiH
	 tuqf/Edx81hpCSyZkEjdzQZjFed5NBCxj4dBsiYrxQP7S+00+3hWPqAygW5ZFU0ybM
	 iqGayZrO5oVRsgpHBdannKTn4z9zx0dELEYopKt6CgP7jlIl9zLJ2LCfkVvUnuYgGS
	 GfCYQ68bbwH7A==
Date: Tue, 17 Dec 2024 21:01:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
	rogerq@kernel.org, tony@atomide.com, lgirdwood@gmail.com,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	m-leonard@ti.com, praneeth@ti.com
Subject: Re: [PATCH v1 2/4] regulator: tps65219: Update driver name
Message-ID: <23dd1912-31cf-4e99-8fb0-0fbd68eee8e2@sirena.org.uk>
References: <20241217204526.1010989-1-s-ramamoorthy@ti.com>
 <20241217204526.1010989-3-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w2s6dpggywszs1sx"
Content-Disposition: inline
In-Reply-To: <20241217204526.1010989-3-s-ramamoorthy@ti.com>
X-Cookie: The sum of the Universe is zero.


--w2s6dpggywszs1sx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2024 at 02:45:24PM -0600, Shree Ramamoorthy wrote:

> Follow the same naming convention in tps6594-regulator.c with
> tpsxxx-regulator instead of tpsxxx-pmic.

>  static struct platform_driver tps65219_regulator_driver = {
>  	.driver = {
> -		.name = "tps65219-pmic",
> +		.name = "tps65219-regulator",
>  		.probe_type = PROBE_PREFER_ASYNCHRONOUS,

This isn't just a naming convention thing AFACIT, the MFD registers the
new name so the driver wouldn't previously have loaded.  How did this
ever work?

--w2s6dpggywszs1sx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdh5qkACgkQJNaLcl1U
h9B4Igf/e8JHlXkUwidCE7brRSxYGPTGGWSDZ4qaea6p6ip875qLUpSvPpN+bA3e
DEhI2lEkeyrGc2o5vza73yr1i35ilq/ipBjilvbg+Y9Nvpls74HEgWbvvHspCwDY
BTTENSjPL6nSr1LEsOuIDOPU3Sk0dln0OFr5SFYx4V40knClnR2LuJ/o3ifdikRv
e/BAhnAPqbfDxVws+olal+wQCGPTbNXwUpG13y+rHVDR2htc1jtXM7o+S3Ftq1s5
8q6CuaDHjh0qtFy9D8J3wLYmNWqzYHCDLRgq19PpVhpug4WjG0KpfAVGZsLBQUNe
4vxWCPQbmYz+GZxnoW6SHF9Nid7GsQ==
=whWH
-----END PGP SIGNATURE-----

--w2s6dpggywszs1sx--

