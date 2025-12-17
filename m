Return-Path: <linux-omap+bounces-5214-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE672CC841A
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3167E3058E78
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 14:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA20C34F24F;
	Wed, 17 Dec 2025 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RPYpOyYV"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EBA34E765
	for <linux-omap@vger.kernel.org>; Wed, 17 Dec 2025 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981585; cv=none; b=YUWFBGOGJYOSTdGML4oP4nFNG26JJxlRgyEicsRejCyVFak7g1Cw9eH8qBoXQktVr/3nG6m9tBaSPzC523XWXvC022ePdawyEOe4fEDjXk4dQ4RvW96RDDW3NckcWjJs67OJusMm7Hx0OSBuy0FND2Sc5K/WOFvhL5gce1WlRpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981585; c=relaxed/simple;
	bh=b2NN2dQMMIMWyY2CwDLF2JNtDMv+Z6tQUfqwLsqBg7g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=g+VfNQ3GozdVDMJjo5YFjeMWqh3s5B8I0JOA167pX6v1xP+8lqa3tYtShFNFsCp7rpM9Yi7Ktk1ub87vxxFfYnYXaGeb3bCNpJhzlQaCsiKH6z6HqQteiNebWQufMpw6JJ0n1o/bARB/0216S+WUDhxDFsnmhrOFNJh36JtFIG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RPYpOyYV; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 22019C1A59E;
	Wed, 17 Dec 2025 14:25:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A62DB6072F;
	Wed, 17 Dec 2025 14:26:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 101A2102F0AD5;
	Wed, 17 Dec 2025 15:26:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981580; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b2NN2dQMMIMWyY2CwDLF2JNtDMv+Z6tQUfqwLsqBg7g=;
	b=RPYpOyYVWxLffw4P2Gvc6vqaRomO9Mn24k/k7XhAkb8q6P+r5u7AWM9XG4j1TXWkO2mufi
	iqZg/xLlNNFVhpnL++fww4E/yjxdQXrjtURhDtmI72Eq3DMbI5FQRTBP+w1a2bT4mN5e8h
	NhkugMgtpZuegJOJt4MGfmX4IZ4lntH9CTZzMbBalRFnA/qenQgbvHh29+DqA3dVck+Vrp
	znLmK+H0qYFU2TriFA2K6bToYsaGvn5sufglqmljYUnPVLKhRZjwUESpAQnQs+2aJI2Uv0
	m5jXeY/KmNGQ68jsUInxF++lCy/gdsJKAj1sHupPkrMzE9Ksuw3+AHaR/HrCvA==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:26:16 +0100
Message-Id: <DF0K80GZ8QQZ.2HKNJGNJ4LYC9@bootlin.com>
Subject: Re: [PATCH v2 16/20] drm/bridge: tda998x: Remove component support
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
 <20251211-feature_tilcdc-v2-16-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-16-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Dec 11, 2025 at 5:39 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc driver no longer uses the component framework to bind the
> tda998x bridge driver. The component bind/unbind operations and the
> encoder initialization code are now dead code and can be safely removed.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

