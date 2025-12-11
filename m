Return-Path: <linux-omap+bounces-5167-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FA0CB5635
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 10:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFA39300D17C
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 09:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121A22FB09A;
	Thu, 11 Dec 2025 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fpTiITXf"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5652F998D;
	Thu, 11 Dec 2025 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765446181; cv=none; b=NYMczVOHlkNJRNZgk/ZVgD5NiItXcz3eTgQQFtxdkLGwBWvFn6U2X21M6lQMzza5Ex1zX3T6hQ3SA9QJh03iZGPCY5XBaOWrw8jrXUcCyafF2k2bmLN5mBNcqOnsJ/++SAX1TukU6SwG64xzUu49bDmKIjp6wzdvclVSS1Zh14M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765446181; c=relaxed/simple;
	bh=p4yhiEdqHPp6VgKPdi1QUcpge0/L2Md1zAgoZsacHiI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Z8Nr5sVMnS3NguuOGmQDr6xTqfbkq+9l/dcqwTg84Sn66Bd+EluIwfYuxZhRkD+tHHqZ5CSJfcaQ0+AlV4vCelFkRmMEYqqmEwH9CbXdtrBnlvMLWtf6mY6Y8iuDToSpwe/RC0b2kv0F3fzHv69z1fg99woiQhIm3fQomcq/0IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fpTiITXf; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5DB121A20E3;
	Thu, 11 Dec 2025 09:42:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E8356068C;
	Thu, 11 Dec 2025 09:42:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C738103C8C1E;
	Thu, 11 Dec 2025 10:42:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765446177; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p4yhiEdqHPp6VgKPdi1QUcpge0/L2Md1zAgoZsacHiI=;
	b=fpTiITXfCsh40SYD7VWJHqi5wBsspqquE0CxrrNPLtD/md5AnfSnWGfkUm9SOKrLEVtbnL
	Z99BI3AGBPXDR0+OQyocHivaJ4GAbj0vYuUqmmXmAagdmxWoXPRrJ5OcjiyL8ioHk0yWim
	wpY0vBTo5/BWwy8LYI0rP0emmxYaX2fY/SmBkLwADFA+JGJn8XSxG3hFaieBJCWBpOm/HU
	p/FJHg36tTI8wn+dfe2x/mNnIdUQ3gk7udOy52e3k1fV2JWcNoHA4aYvSEvPHxtnAkjHaz
	7+k8gIyY/HDHS68hfpb3tMQqh3ngJjbJ9UoYaHZFu1nxGVVgS48GAXfNueARhQ==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 10:42:50 +0100
Message-Id: <DEVAFQ7XD89Z.XPEGS4AOAF1W@bootlin.com>
Subject: Re: [PATCH 08/21] drm/tilcdc: Remove component framework support
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
 <20251126-feature_tilcdc-v1-8-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-8-49b9ef2e3aa0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc driver previously used the component framework to bind
> external encoder subdrivers (specifically the TDA998x HDMI encoder).
> With the removal of these subdrivers in previous commits, the component
> framework is no longer needed.
>
> This commit removes all component framework infrastructure including:
> - Component master operations and bind/unbind callbacks
> - The is_componentized flag and conditional code paths
> - tilcdc_get_external_components() and tilcdc_add_component_encoder()
> - TDA998x-specific panel configuration
>
> The driver now uses a simplified initialization path that directly
> attaches external devices via the DRM bridge API, eliminating the
> complexity of dual code paths for componentized vs non-componentized
> configurations.
>
> This cleanup removes approximately 140 lines of code and makes the
> driver initialization flow more straightforward.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

This driver is complex already, supporting two different modes (one of
which used in a single case only) makes it just worse. So this cleanup
looks very useful.

Provided it's tested on hardware:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

