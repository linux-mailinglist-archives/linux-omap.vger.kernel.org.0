Return-Path: <linux-omap+bounces-5207-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6397ACC8357
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A551308CDF1
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 14:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B339E34AAE9;
	Wed, 17 Dec 2025 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EPdsImrU"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705B5230BD9
	for <linux-omap@vger.kernel.org>; Wed, 17 Dec 2025 14:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981445; cv=none; b=EpHcxXEUvva97psMh51c4viwSnqew+pnIpUN94SF1Zm8Narwm5fo0DEyphNq4bNYu3OAfae9J2qyywo6POZodldj+rMgDYoIyXL6t9BOZd6EHncCOVgCS4LSU3qq1Uv6c45PrVVb3+bZu2mlolZCAwC3nxAyRCn4z1PFkq4tyyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981445; c=relaxed/simple;
	bh=NHPbq1dYtFEjvHJOmjrG0z7tkyLA/1ZwEpWOGdSDZyA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=F4HJxhd+hjuJCT6BNax7L6eCIXo9QZmLFTlwStyaAzGR8o9PO6M0x3s8YRFHoFlw7T+JrwMbnobOXRrcgPCEE982BE/AICmYeYWw+Sp08gYFXmTix/gqYTIzk+I2au8ypAohZCieAVE4Qp7nNKp9xjSars7vuZJM86PPrYUAh84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EPdsImrU; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 38201C1A59E;
	Wed, 17 Dec 2025 14:23:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2EA06072F;
	Wed, 17 Dec 2025 14:23:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36CBA102F0AD5;
	Wed, 17 Dec 2025 15:23:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NHPbq1dYtFEjvHJOmjrG0z7tkyLA/1ZwEpWOGdSDZyA=;
	b=EPdsImrU8FJFeSorGa/VDZlybvDbTuwaaEaRJh2BmZvRPWzx157bsPVfQv/rNfZ8ce4c75
	70F3N1udiyVKmYYtUourJJqbIB14hPNtA7qgeoS40NX0sASfppp48oYcBhIEl5cOTBx316
	1q4TBW1zeMdiilnOII9nl1Z9BfcK/pzImS5iXTyl/pOmuJkUXL2Zz7GxLnIppEgDj0ssna
	qL3V1fMWwwUzGA/oeNGpQa62pV/me2JgK3iwymfjJM8NvG322mCuoFAkb3D5AvybRmFHOW
	5dvv352MinuP0PswjdVTgRjgcefuthIR87l7lc5RqWWo7vOmbzE1UbclZKxTzw==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:23:51 +0100
Message-Id: <DF0K65TJOOB8.1G6MD72ZQOGFZ@bootlin.com>
Subject: Re: [PATCH v2 06/20] drm/tilcdc: Remove tilcdc panel driver
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
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
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-6-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-6-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc panel subdriver is a legacy, non-standard driver that has been
> replaced by the standard panel-dpi driver and panel-simple infrastructure=
.
>
> With the device tree bindings removed and all in-tree users migrated to
> use panel-dpi, this driver no longer has any associated device tree
> bindings or users. The panel-dpi driver combined with DRM bus flags
> provides equivalent functionality in a standard way that is compatible
> with the broader DRM panel ecosystem.
>
> This removal eliminates 400+ lines of redundant code and completes the
> migration to standard panel handling.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

