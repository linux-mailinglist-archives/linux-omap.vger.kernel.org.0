Return-Path: <linux-omap+bounces-5161-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AAFCB3B89
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 19:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92C23300E453
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 18:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FC832825E;
	Wed, 10 Dec 2025 18:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O6jczRAH"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0FD3271ED;
	Wed, 10 Dec 2025 18:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765390267; cv=none; b=TE0oacPru+ldhoS1aW0tHu7DxZ7IMLXyA88ZnEFeAeNdR0VfinJtgxZ7QMi9hgbJf7YMIMH+mkXIMJUab92+acSiNnb2UwzKy3OA+bZxd91RirzDI+JpN/VVKL6Nrzi3rYBik+xNA9n4XV3P+eq2XkLqwRr1bbyHglyeUL41EKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765390267; c=relaxed/simple;
	bh=11D+FbyBRjBd7dRkaGNZbGmzx6wWeykWSe7o2lp4Unw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=S82qD8jgAnmGt+bo18UJFWCrHayWHUOO/MNIcBEAs8EsYRzbev9iEwsF+uqcJorDHt2+VhRG1BI0ck1f/Io5zg9A5TXqc31imZRShN4QbJWFVemAJUn3IahJ7cu4G4/zsExJO/2LNRc5oqxod/3Yw0b8UXbSuYppV4KbFbzOYcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O6jczRAH; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 46C371A20B2;
	Wed, 10 Dec 2025 18:10:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D59F760714;
	Wed, 10 Dec 2025 18:10:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63FF8103C8CB3;
	Wed, 10 Dec 2025 19:10:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765390254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zHScQ9epIs7tSkBpcNfLT2ySqJpIcU3hl0yiRWEMSxU=;
	b=O6jczRAHlyE369TuBgKbSoI5sr+D8r2p/p/jJJNzLR9kXxPqm7i8xrI7fQB90odCyPIXe1
	4YZEYdjGPIrzpd27WpJ88/6qed4b09CpY+O8jxnssomse8LoTt8CSvaA6wr3dlSpRtijCJ
	vAHmY6R0ZD1eQUyUZarC66Ne+Ux/2RcQd5t77tAyFL1OfRlXrUkmm1ZMn+BPB5r7RdTl7h
	Qk+hr7+AYIIFJwhZj0Tgwd+BKfz6bdCRIMotppabJdlVf4Bs8C4uOdOKVnpS/5nLW/u5hk
	/fANJbwQ2wd/+NdKjXBdlPyCrER7pQDgNesMJqkCFPh9spNiUJ1olbTsiUR65A==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 19:10:45 +0100
Message-Id: <DEUQM2HNEOQU.3K4ZPL44GVZAJ@bootlin.com>
Subject: Re: [PATCH 03/21] drm/tilcdc: Remove simulate_vesa_sync flag
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
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
X-Mailer: aerc 0.20.1
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-3-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-3-49b9ef2e3aa0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi K=C3=B6ry,

On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc hardware does not generate VESA-compliant sync signals. It
> aligns the vertical sync (VS) on the second edge of the horizontal sync
> (HS) instead of the first edge. To compensate for this hardware
> behavior, the driver applies a timing adjustment in mode_fixup().
>
> Previously, this adjustment was conditional based on the simulate_vesa_sy=
nc
> flag, which was only set when using external encoders. This appears
> problematic because:
>
> 1. The timing adjustment seems needed for the hardware behavior regardles=
s
>    of whether an external encoder is used
> 2. The external encoder infrastructure is driver-specific and being
>    removed due to design issues
> 3. Boards using tilcdc without bridges (e.g., am335x-evm, am335x-evmsk)
>    may not be getting the necessary timing adjustments
>
> Remove the simulate_vesa_sync flag and apply the VESA sync timing
> adjustment unconditionally, ensuring consistent behavior across all
> configurations. While it's unclear if the previous conditional behavior
> was causing actual issues, the unconditional adjustment better reflects
> the hardware's characteristics.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>
> Only few board currently use tilcdc not associated to a bridge like the
> am335x_evm or the am335x-evmsk.

Have you tested this change on any affected board?

The change looks good to me but without some testing it would be risky.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

