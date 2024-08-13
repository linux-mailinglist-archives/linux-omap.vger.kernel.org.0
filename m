Return-Path: <linux-omap+bounces-1905-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A717A9500E1
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2024 11:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EF251F21B16
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2024 09:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F65E17B4FA;
	Tue, 13 Aug 2024 09:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gX1FSwZp"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955B41487F9;
	Tue, 13 Aug 2024 09:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723540114; cv=none; b=TYr9e+GIOW/q2KHkTdg/By3hQd1Ynw1qhkyu6KaNudYuJ2fuatRAjJsky+SFNn5WUCyvyLp5VzpUXX47Y1ACBUg+s823CwSjXYpd24CYChdM2DMp8onJ0uASZK9P/W/nJdR3oDLjTYFvJAqXCi33UttdKl60IEiUngLsVcqRWFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723540114; c=relaxed/simple;
	bh=/84SsMkop9pAE0/ilDwpDyknfZaT20JA0YwOVXiSX6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwlZcdxLQzl1HF7jjDGLtwmyqVdbedbpVxdxhIDUTOTmRrQH6ctu42pOSXcpbt++z/3tQN0FolWp0tvlg1ZVuDZRPLOqNcA3gZ9Lu8EXZ1GTBX5GQ3xDm/pnK+h+C9BYDcD2rJpwugqHp2M7OPcWqmF6Mq6Ly4AfX4txKlg/5TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gX1FSwZp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85F9C4AF0B;
	Tue, 13 Aug 2024 09:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723540114;
	bh=/84SsMkop9pAE0/ilDwpDyknfZaT20JA0YwOVXiSX6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gX1FSwZpLAoQiq7Nbnrxyyokw7CW7ZTEQHaDUQRGDUl5qKBTtXJxLpT9wtd09AvBq
	 UHd3Dq54pS4gNOPk5vU6g4n0yDl7t2yXJAYYNkE7iRQUp2KnK9QDbWz72pRHlntEOs
	 K/UcQRTu7dxShMeqHUHwU+0vPg+LO7HkuuXZpX4jEMBRYK7SgENb18Pg1eMbhqUD6x
	 XiT/vlCsm+hCu96xcWKzuPN8y3LmrK/5uhkx907zDvzGNvzJ9mEtmaJPEwKDna0qck
	 +FAdA/1VoiT5MQny88gQIWDGrmJYu93PlwcDLbYsTvaw4+vFxgqG2K8e8dW4jyaUuG
	 LRFDX89gzEX1g==
Date: Tue, 13 Aug 2024 10:08:24 +0100
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
Subject: Re: [PATCH v2 3/9] ASoC: test-component: use new of_graph functions
Message-ID: <28f4e558-734b-4c0f-b1d5-82f31679fb51@sirena.org.uk>
References: <875xsa8gws.wl-kuninori.morimoto.gx@renesas.com>
 <871q2y8gvl.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UvXpPTbsvywwXUHF"
Content-Disposition: inline
In-Reply-To: <871q2y8gvl.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Say no, then negotiate.


--UvXpPTbsvywwXUHF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 09, 2024 at 04:22:38AM +0000, Kuninori Morimoto wrote:
> Current test-component.c is using for_each_endpoint_of_node()
> for parsing "port", because there was no "port" base loop before.
> It has been assuming 1 port has 1 endpoint here.

Acked-by: Mark Brown <broonie@kernel.org>

--UvXpPTbsvywwXUHF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma7IocACgkQJNaLcl1U
h9DL6wf/ccEnzGM5bE26J7HDrPiqIE/eCaPdxcacYmLMDYiMwI+/oImLFkpoyrkQ
BNR0YqfzZSwo1UdmG+p5uFw/qtup8HRTuQUPrttDzkDtWSfVdqLmnFfFas/ELxrs
V3NIGf5hnbULmlch/N8y61Eqe9SSn5S43JxYDiNdd2KlE5U4tiNum4zcM292hIpL
mlaiQCyI9Fcp2HaZEVStyyMAItpHZfXeFqYtKJS9gk8ddu6shM/AoO9DOdZ4CMb7
wggffLNrdtHaviAvgdPDs3DHhNq0m4RIwyLvITG5LMgXmBc6i5Eianf5ZErNRqnV
Zjh41pWBLTPVXSPaYRS1qnP5f7ku1g==
=ODw5
-----END PGP SIGNATURE-----

--UvXpPTbsvywwXUHF--

