Return-Path: <linux-omap+bounces-1862-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E0194931A
	for <lists+linux-omap@lfdr.de>; Tue,  6 Aug 2024 16:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4F011F21C2C
	for <lists+linux-omap@lfdr.de>; Tue,  6 Aug 2024 14:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7331D27A3;
	Tue,  6 Aug 2024 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obsp8+xN"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7111C3F0A;
	Tue,  6 Aug 2024 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722954668; cv=none; b=LTqtlryt2tAHyJyouZsSMnCT1r19Ozim0U0RjvvvnC508HNgcWVhsui/O0dGxqskEheYvO1e13JnriWfHQ2Fynd+E/MOkyq9SAUmSjuYkelSHyaLqjnEVfvPKrpW4I+SWstJjTRVoeYXK505wH71y5AvHCagGnH+/8va8UN4paE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722954668; c=relaxed/simple;
	bh=z9Z+g2feDnkuhfvIGe/3YA3l9cpUOQrggJcUaFTCHSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qcmajm2dX1jyudhuWBM/MqBOsfM76Sf2EfFc9Zfg2rhM6WeXnIh4HHmjGm7dyE9aRALkKqCy77ellgwMBiWWBw38ip3t01rWMIjyprgdXOGmjFrwgNUbRmTyrCJzq87Uh/ZAfQCdGYKr71auqCH2wsI+URdFOFxf2dXDRhVzh1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obsp8+xN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6F5C4AF09;
	Tue,  6 Aug 2024 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722954668;
	bh=z9Z+g2feDnkuhfvIGe/3YA3l9cpUOQrggJcUaFTCHSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obsp8+xN5zt6o407KwVLtuBGkJRaQ3lleXX2XMVXdE07H+7189ETnUKv6mzJ3A11o
	 VUA8uSWUd3JB+4867dYWg+RrRDvOsoml2MoxFSv9nxcHH7wZ+pw8xpCuWOlUlgy5pD
	 4zGa42yEl5YJqrRp+gwujnbwrK4kzKT4zkCmkMoxjy3XxOE1BRFKejfwsndwC7us6u
	 ap7pBThfUCYKm/+gnamciSriQx/WZONvyftc+RXw/ah4Kk/6DGwTyZ0pr3Y4Px9kMv
	 wSZdkZAtanHy7tbK5j+PdsGh0OxXm50W1qNgI6JhRGzy7D9Vz9kZ2WcIwDKaqfA4li
	 tHYJvK/GAPrbQ==
Date: Tue, 6 Aug 2024 15:30:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 6/9] ASoC: audio-graph-card2: use new of_graph functions
Message-ID: <69dddb47-d213-4bab-9254-3e106c6f4901@sirena.org.uk>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
 <87ed72w8l5.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rB+6M9oEMqdlod6b"
Content-Disposition: inline
In-Reply-To: <87ed72w8l5.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: One picture is worth 128K words.


--rB+6M9oEMqdlod6b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 06, 2024 at 04:58:46AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.

Acked-by: Mark Brown <broonie@kernel.org>

--rB+6M9oEMqdlod6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmayM6IACgkQJNaLcl1U
h9CTwAf/Rp21kyj9Xxk/Pgim3nZw/IcEQiQrO6hVmgLckzIHLowfAKfMHUqbxAgj
VXm75UKaVh8XHua24r5snBRJPfW+enIHuUEQ6AJ78zPT+Pbu34QC0fmTzbpc/8RJ
sNBDx96xPxdHab9mqWpxwIzzIBpTpUUQN+5nuUxwB8lcVLsxWQ+uYdkYPcSd+kXL
BPn01TohuSAzI8zjLX5P/+9jW0f3VPpk1shUnoKAXbQt6aYoDfoKfcj/YUaS0VLX
rM257+kSHiWLGxkcuc4b5pd7hY70ZnWF5n1jgE3fNv85ro3THq5RLzLryrYy+KCm
nq4Vz1m2Hlp2gQ8MuykKVTjJ9JheRA==
=ySqz
-----END PGP SIGNATURE-----

--rB+6M9oEMqdlod6b--

