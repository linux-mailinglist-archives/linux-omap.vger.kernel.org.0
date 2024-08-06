Return-Path: <linux-omap+bounces-1860-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB409492FA
	for <lists+linux-omap@lfdr.de>; Tue,  6 Aug 2024 16:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FD91286E3F
	for <lists+linux-omap@lfdr.de>; Tue,  6 Aug 2024 14:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169D517AE13;
	Tue,  6 Aug 2024 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9SWzfoO"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9561818D644;
	Tue,  6 Aug 2024 14:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722954508; cv=none; b=iEXDbnX9FD+5r7AxRrupIeL8CTl2Qlx0MwAXNB2QORj4IVZ37H4ynFqAwChoNfAZUak8tfVu8yP5NkDdvwY4qoRYKaofyKAQ/tAJvx8ey4wU/fgh7yqV+oJxveeeqvUZlZHyqbi1sfPelHJ2ryGS6vpgQduw1P9pr/94uYo9KMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722954508; c=relaxed/simple;
	bh=+boXmLYjOqKIhuo+Pxlk9RkC7FnDtE0lcqsPWW9QEtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhvNuF9Cqwje9jIvSRXO395IxzThfhqrwXKDhdmiq8+REbFf8ckO6tfohjMxBR0WuzkuCBECgfFT5FgSxht3AIO44qZAw1WW4Boum7noyXs5e+Kdx+n0uKIOggdCTiB7Q31HNcn0NjsMTkeqtG+o0erebMm9k+s0Bs1/0gmQ23g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9SWzfoO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CA3C4AF09;
	Tue,  6 Aug 2024 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722954508;
	bh=+boXmLYjOqKIhuo+Pxlk9RkC7FnDtE0lcqsPWW9QEtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K9SWzfoOrfJ6IlogordiXtWykn9daOV2XDKJ2z3fOAJAFSNcrlSCt7eeXbLEWPwv9
	 S/zE+R3rCJPwNp/if2nzZ1yul467ut0Lv4/45o75zjafzGcgg0hCcnNZbVmwQeiT6B
	 wGj1QqfadlXls8LXCGm9ev6RUm2sRApgZVCn56yi9tPGPd30qb0xm/Zx4TPkAXffwU
	 Ju35dzeIAnJI7B3HkQKjkiOhVtdN8cxjQxUB2+E9en5AhrLfqMndF9oj0SAGkOBo1F
	 8WWjXpXjVJHQ5lmbK9TqcT93tfwRjDlsGz332J3aQlTPVmY60G6nDorAilq28mh6kZ
	 4+aSnOky1gySg==
Date: Tue, 6 Aug 2024 15:28:20 +0100
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
Subject: Re: [PATCH 4/9] ASoC: rcar_snd: use new of_graph functions
Message-ID: <97be3c05-9806-414d-bd96-127166992c3a@sirena.org.uk>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
 <87h6byw8le.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="srqWlU1lK7ancdIA"
Content-Disposition: inline
In-Reply-To: <87h6byw8le.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: One picture is worth 128K words.


--srqWlU1lK7ancdIA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 06, 2024 at 04:58:38AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.

Acked-by: Mark Brown <broonie@kernel.org>

--srqWlU1lK7ancdIA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmayMwMACgkQJNaLcl1U
h9Ds+wf+PgWlgGI/k2T4toN4PxdGHQGI6pR0qXqXGxXZMeeyGa+O5xMVwKXcA4MK
YepXFEa5pfSzHFosjgHoFBhQhvbHNWbMNS9UC6hEYI1hRSnBRtrkMFtDM2XbR183
abFO1TVlrwT21xNI7XMzQKXW7Eo2cPvqiOYlAvA1XLqUmGwn18ISf0tvkRCR0Yi6
xUPQzpz/+Xk1Ja2dao3ibaynguJ0UdKh4BSOQIn4Mqjr09Q3swpWIKjR+3Jdj+w1
n5gUQ118ZBwwn3A/996z0A+lYjv/a6+s32ZVK2/yLqeLdi5eAUnf2SuEWn7VmMMu
xfpyEU3JXwsDXLM/8XOu/VcufnJ8aw==
=p8Ke
-----END PGP SIGNATURE-----

--srqWlU1lK7ancdIA--

