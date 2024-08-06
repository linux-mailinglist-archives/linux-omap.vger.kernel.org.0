Return-Path: <linux-omap+bounces-1861-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC994930D
	for <lists+linux-omap@lfdr.de>; Tue,  6 Aug 2024 16:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42449287E15
	for <lists+linux-omap@lfdr.de>; Tue,  6 Aug 2024 14:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3351D47AA;
	Tue,  6 Aug 2024 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEQMgsIS"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD0318D638;
	Tue,  6 Aug 2024 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722954540; cv=none; b=q0PfnAVWcM/5pWld4f/FT7bsakRWCIxAVTj4zlHbTQRMq2gMFJPsiYB88cGrmuYDPu7WKlBXhed7URobOn257GpyqGpNcepm33/WWSufAlcDw09y4d2DEly3QSwZAM05S1QwAm+coonqXWB6wc3UYt24SFSvyq53IcM78L6wsuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722954540; c=relaxed/simple;
	bh=0Hx1Sp3D04anpn/09flgLpvtKrFpagEoFdQXws7Jd5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOcj3oUYK0UNP4bAYY+hl/eF/ass4/GpjriX/dNKmFYpJb7ff+eTBp/lkqTuCLBOUlCNgFWuOU8UbxyoHzBE8isoKC5ZEyhmH/HU/Pfxvn3a4fxZx+zvFjbbrXUHFnnAbBsBCVQnY8fMF+M6ZoGFCwjaepAYVoBCSvcRvKHD/7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEQMgsIS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E713C32786;
	Tue,  6 Aug 2024 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722954539;
	bh=0Hx1Sp3D04anpn/09flgLpvtKrFpagEoFdQXws7Jd5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mEQMgsISHrAucpkdduMCeXk7e3ZKo5LpbJk+K0K0x+9P4LMjkBmuB6X1JKngp7WV5
	 pEOGL09t5c3JNj2ak02CnO9fWJh4XMl1hE5s1ASrf7AiksJanVw4/B5QUQqBNzz+DN
	 2AUTAY+9PAFOHQANDb5qmiWVTMQxKIxhctt8h6FVKqvQqnCwVZaB0nA4bliG5SwDzm
	 abOc10VqctHYg5bPxHOFGf0UO6HHF7EU1e/A7auSWg8d6+2eWINvx8wEyehROn+kxl
	 CGK7bENxY2BRLDNDu20jQuz1GAvU12hliWB3W/6uNeYUHjV3kVxwhL3A6dkVn509gQ
	 by40/W9g6n5cg==
Date: Tue, 6 Aug 2024 15:28:52 +0100
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
Subject: Re: [PATCH 5/9] ASoC: audio-graph-card: use new of_graph functions
Message-ID: <151740cc-4d87-4b13-9dfd-1fa0145b022c@sirena.org.uk>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
 <87frriw8l9.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cezL0FvenkR3DiRm"
Content-Disposition: inline
In-Reply-To: <87frriw8l9.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: One picture is worth 128K words.


--cezL0FvenkR3DiRm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 06, 2024 at 04:58:42AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.

Acked-by: Mark Brown <broonie@kernel.org>

--cezL0FvenkR3DiRm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmayMyMACgkQJNaLcl1U
h9BDjgf+I1ux9GtDYKacTSneur75Qi0XAIzzAKY3sWi71rG40AVO6Fkw3kX8xFNe
rjKBKPes7GIi3oPJXQzleBkX4hawg5/BXWyGO0X4ElCv6CWTXwrkxLkSHxTQrBeI
jJDx+45hvOGxh7TlAiWQt1edXSvWe6tRljwLYM7ogR5d1KKK9Olcw91O1xOszrTU
Ca6MjZFZYYaQcGr/LaIQ+7KX67nVD80cpTmoPXR4iSqhEJOJbOnZ9hB8SavS4iBv
fzVBavalYoSGCBB3TJQs2qxgH6Giqucza14Hwdvg6+vqklV19F8ZtAOD58Ir3wB4
I6SHiuEhZGW0Rg/wUlI2KRulmUmqkA==
=tqHi
-----END PGP SIGNATURE-----

--cezL0FvenkR3DiRm--

