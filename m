Return-Path: <linux-omap+bounces-5566-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B04D3B069
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 17:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB7133053292
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 16:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E902DE704;
	Mon, 19 Jan 2026 16:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pUPvqtSe"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED92E2C326D
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 16:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839535; cv=none; b=jMezKnfL1VoizQwcyUMS5ne2NlBOnsDa/zCRUa5e5D7Ix+jHACvSVNaNZCo87DApQyT2/xaeEUkJjqmllAsBghC1ZlUUvMxwCotjGWpDaXeS0adpbxNUWKcmts7c2z2SWkid6rHL9h9/226wvSzKE4FAUlT15iIG6Zl/UeQictg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839535; c=relaxed/simple;
	bh=jyMZSl/pz+/Y/5Zw2mKUdp5jMPp9YfQaPG4GQk8Hw00=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=GvwfUQcryQvb8zgESsjW09dgshUDB5Ur2EMnlxA1SmKIpzqqZamGFHUiN5mFQ4axCr2NaBLQ3rFQ0vcQIGSEAGOahG7eGzB8aZJRh5aX87n74fDIkequWG0I1K5yH7vZ3BQ9AmUXPjBj8KyuBZSrgct0eBw1JTU+hIo616YtTeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pUPvqtSe; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BE1D8C214D1;
	Mon, 19 Jan 2026 16:18:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C872B60731;
	Mon, 19 Jan 2026 16:18:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DE0810B6B16B;
	Mon, 19 Jan 2026 17:18:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768839515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6IzZqITfxZfsqLMD97cOvLx/oTz7z6A1f/3WBHICk0E=;
	b=pUPvqtSehbxN1xcBr3URpoIUzPLIdZF4ymZLMVtPVq6B+npB/nl1peqzjW3p39QZBEKAE2
	ZTWfkjRz630zT7QEuHuWw2cfvECsBSs9Pj/ZV2ugWXo+B6s+yGT7iPREPZsY2MnbKOgp53
	n2jtpnm8kiqsDutFGsV/2AGTFsIHYaDnCPmV0NIqYzWsJZ4JXmZgpaUEPPSnbnbLl04XXD
	MQlO0OsfnbeuYn5h4REjHALwDvQFmhBbnccS1LSclOWP2Wtiv0B/Mk9BU3+DdNc/SOVaDM
	ia8XbpAeNL3OQd4VA64W43PEkX+DE7zbyYinOHy4P4oJkFNgwmB+Y05Q1YW4Dw==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 17:18:31 +0100
Message-Id: <DFSP9XSQ9Q4F.3W0523ABWR97X@bootlin.com>
Subject: Re: [PATCH v4 16/25] drm/tilcdc: Modernize driver initialization
 and cleanup paths
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
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
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-16-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-16-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> Refactor the driver initialization to use modern DRM managed resource
> APIs, simplifying the code.
>
> The tilcdc_init and tilcdc_fini wrapper functions are removed since they
> served no purpose after the component framework was eliminated. Their
> logic is integrated directly into probe and remove.
>
> Key changes:
> - Use devm_drm_dev_alloc() instead of drm_dev_alloc().
> - Use drmm_mode_config_init() instead of drm_mode_config_init().
> - Align the remove path with the probe error path to ensure consistent
>   cleanup ordering in both success and failure cases.
> - Adjust platform_set_drvdata() to store the private structure instead
>   of the drm_device, matching the new allocation pattern.
>
> These changes reduce error-prone code while maintaining the same
> functional behavior.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

