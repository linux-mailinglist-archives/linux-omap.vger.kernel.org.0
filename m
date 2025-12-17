Return-Path: <linux-omap+bounces-5217-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 794B7CC841D
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39083306FE6E
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 14:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BC7361DCF;
	Wed, 17 Dec 2025 14:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="i557slcF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11BB361DCB
	for <linux-omap@vger.kernel.org>; Wed, 17 Dec 2025 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981610; cv=none; b=QNZoI9HoAGc1/sFJBrs1zYYNOAF6LXI2SCB+4eb9NOBJumsJV1+TkgBkwqoS32eDXK/iHm8tdmgHzzcZyLi5fBzt04kJQ2Lbuk+ETbCLzTvLWnWVmAMCh+K8HO/hdTDhpmY+JTAblMG9wL0KfCoIm0IkmXPkeCn8VHJf4nyasXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981610; c=relaxed/simple;
	bh=kdrcbRuNfNIYwqnVXaEJgUbwBUAE3RshqH8HZodpWVU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=iH3fM4/a84kGGviBsreOJxIwl5xTqn2xoJaGVbVwwzBVPs6pgvE/s7u9rWb+v7wHcRG3La0ZXMmXy7xBOTBxJceTIfWz8zxDtDpKc9cxAL1r2SqHJjY+IF9B/7th0Bi10J5FjXVmrwBjT5lR+4rojPvq9tOiEaAqG4MgpbiK89Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=i557slcF; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F2280C1A59F;
	Wed, 17 Dec 2025 14:26:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 802546072F;
	Wed, 17 Dec 2025 14:26:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15734102F0AD5;
	Wed, 17 Dec 2025 15:26:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YDX1qXUbxhjoP2T+6sGXnAdfnWZpwmfhKaz+lWV9Ox0=;
	b=i557slcFQjwF4LQaQPzNhGuODav4tNj9ltFajgy5V9vFyDFB+He4fnZNUOo0gJEsxrDs7d
	FrNuHM8bi5+k1L/PJGhrrVC5UoVynX2II1ImSypDmv/uGWa752fHg/g9c18PLFF+7Ut1yL
	miWheZ4RFC05VPHCgP1e8SIgowzxuqWgEASqM7rMrHAa2iQ2symcSpKAmt7vWojs0jjXwo
	Cr8R9uam6K1DwxEBC0czPKqb1H5ivLqCzTtIcOdCflCTuAZzNcG3/1JxZ/cZqPfHuVgMBH
	psUIG/+yKlXWbwPvw3PYCUt+LEqCa0S7AFgLdasBF4oWFwqxwI8Q6M77LJEOHw==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:26:41 +0100
Message-Id: <DF0K8BWFMM5G.2DEY7RJB6SSBA@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 19/20] drm/bridge: tda998x: Add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
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
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-19-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-19-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Dec 11, 2025 at 5:39 PM CET, Kory Maincent (TI.com) wrote:
> Add support for the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to allow display
> controller drivers to create their own connectors. This modernizes the
> driver to work with the current DRM bridge framework.
>
> The implementation includes:
> - Refactoring detection and EDID reading into bridge-usable helpers
> - Adding bridge operations: edid_read, detect, hpd_enable, hpd_disable
> - Setting appropriate bridge ops (DRM_BRIDGE_OP_EDID, DRM_BRIDGE_OP_DETEC=
T,
>   DRM_BRIDGE_OP_HPD) and connector type (HDMIA)
> - Skipping connector creation when DRM_BRIDGE_ATTACH_NO_CONNECTOR is set
> - Handling conditional connector cleanup in bridge_detach
>
> The driver maintains backward compatibility by continuing to create its
> own connector when the flag is not set.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

