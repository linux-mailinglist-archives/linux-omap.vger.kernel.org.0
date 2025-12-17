Return-Path: <linux-omap+bounces-5213-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26706CC85E0
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 16:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E8B130AC253
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303AF34B19A;
	Wed, 17 Dec 2025 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aXZryHje"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741C334DB4D;
	Wed, 17 Dec 2025 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981574; cv=none; b=tQMZAF3juBexBX59JRzewl4/1+enZRn3W6wyTvmUs82IinEneP6dvO1S07TkVWyFM+Ld0sJpBMSOK8e+35CSWaI/wJa7UtdtYveN4/Rk+dBAjyKYcalJWEw202ReqEitzXblZHM+HZ5uvzGT8CPllO4KwX2T9kGrqFyXjWBpOUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981574; c=relaxed/simple;
	bh=Kx5AqxsQ5e1S1jySAz6WSVdqKpXXqGJgblqNldVpGOY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=AxQTa5ViS1W55XuQ8lP5VsRNkuKPP+/bZ3NdzvV08WwavIvQ38mAYaKR0vcrRZIib1CfA/dwg2cPO1xWlt1ANyWcsIPj3nsJGjBdo8N94RJfaE8fG4hywsBf80YboG0U5BX3MzaI9ftHHQTog1TF6PdtpNufj86nKGUKhZX2IYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aXZryHje; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 446BAC1A59F;
	Wed, 17 Dec 2025 14:25:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C95BD6072F;
	Wed, 17 Dec 2025 14:26:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 740D2102F0AD5;
	Wed, 17 Dec 2025 15:26:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kx5AqxsQ5e1S1jySAz6WSVdqKpXXqGJgblqNldVpGOY=;
	b=aXZryHjew7b+veFlQFeIc/4hujos/2S3u2jWCsouWWL35gfB3oO+vyOOG/wVK+g1LpACs/
	vDsIbmw/mfAQw20Y9CThqnBr8lbGBFwic0XojTPGqUPODuFwnu6TFNE9E2wGm4mOzx5SdT
	Y8aE8NeVZ1o+3Gg+nvGoYNp4YCUyZyvGP1fsBvnYcNvyG3oWo5TDKXAnZGt2IgVaWDgb1g
	cCVqEHnpmplysiDxg6RWeMnAEfx5ispwauQtntYK48cA89DBlS+FUKkxl7l4TW8jrxJ5cq
	k6gRzGy7ylLkwOh0oQNkaFscL08PKyIq63lOMxQkaQqjKraCYZ3yOXjgHRlpMQ==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:26:05 +0100
Message-Id: <DF0K7V50IFHF.2AD4ETTQ19CE0@bootlin.com>
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
Subject: Re: [PATCH v2 15/20] drm/tilcdc: Remove the use of drm_device
 private_data
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-15-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-15-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> The DRM core documentation recommends against using dev_private:
> "Instead of using this pointer it is recommended that drivers use
> embed the struct &drm_device in their larger per-device structure."
>
> This patch refactors the tilcdc driver to follow this recommendation
> by embedding struct drm_device within struct tilcdc_drm_private and
> replacing all dev->dev_private accesses with the ddev_to_tilcdc_priv()
> helper macro that uses container_of().
>
> This change aligns the driver with modern DRM best practices.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

