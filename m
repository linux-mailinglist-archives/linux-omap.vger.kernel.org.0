Return-Path: <linux-omap+bounces-5565-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A39D3B05B
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 17:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C6A6304028C
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 16:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93AC2E6116;
	Mon, 19 Jan 2026 16:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IsIoNX19"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475DC28852B
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 16:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839513; cv=none; b=pXxkieAjSwy2zXAEiWVCUMcv9218XfZqySNRSiNPn1BHl1jAdVA3vqCHPdGoPeTyhPcJLM8wR4uGK9WZl08WRFTjXEO1wdIX4fWxmhdOnnbYpNqQdtl4I1QQ5Cm96o0jY6M1+9R+EzDvs8VVacTGzLHc1PU5FNT2WuA2dAqGp8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839513; c=relaxed/simple;
	bh=m1BMxjGrcSHHZi9/Yr11G0UX17OdQCikby1y4gUI09I=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=B9/NRZe9pT3LjOqiBfkLwgiJd42Pa5BsYIypdUL0dLKGz+W5omnT42k6BrN+j8oRLYwLyOeJ9VNLGfokWB3Vl/QXHub9XPRgs0nFhL9/QBlMSUM0LSOvgnWuMQmkqnr81Wx5hSVSYIHeoXP/047v/t85l5fE+jMZgZ/ttPhmPJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IsIoNX19; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D1CC6C214D1;
	Mon, 19 Jan 2026 16:18:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DBFD060731;
	Mon, 19 Jan 2026 16:18:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90B5810B6B157;
	Mon, 19 Jan 2026 17:18:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768839509; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m1BMxjGrcSHHZi9/Yr11G0UX17OdQCikby1y4gUI09I=;
	b=IsIoNX19wW3fBEBYFPCNIYlfr7IqOroFHFj/s/A6LaaTaV13TtTM/6A/QaoX4Ndbw7bRyW
	gOIsAqIlL0G083Lwec87VIY4IsUSizWSLl1sUlwXaIAyQ5ELvFM/rYr3qDtCdEIpqBuK3N
	ebuv2//VcfIxyXvjr75c6P0pk2LCXNdBtXbdq+ekKUb9hlaxc6PfGN3n9c0fX061/AK6Ql
	WlREvzcy8HWNuVeL+XALNCpFH32waywDfxUSBfoCT/Df9nUNufAnFjfkuXyeOx7jrABgHI
	rmOVdXq8l6R2ePv0KfJfjPuJcXrGF9uBgVRk8jIyZliOAPauuAyOMUVakn6nhA==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 17:18:26 +0100
Message-Id: <DFSP9V5ZJM1G.1MMOSI2T6BBHA@bootlin.com>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 15/25] drm/tilcdc: Move tilcdc_init/fini closer to
 probe/remove
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-15-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-15-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> Move tilcdc_init/fini functions adjacent to the probe and remove function=
s
> in preparation for cleanup and modernization. This improves readability
> for subsequent commits that will refactor these functions.
>
> No functional changes, only code reorganization.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

