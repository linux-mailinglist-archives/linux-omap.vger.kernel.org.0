Return-Path: <linux-omap+bounces-5163-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE8CCB3C11
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 19:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35535301E5A1
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 18:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7027B32862D;
	Wed, 10 Dec 2025 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F9GR1MB4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D883246FD;
	Wed, 10 Dec 2025 18:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765390939; cv=none; b=WMHn6c7Yjcx/7KxnImNwVrg51BGhOb7kAeE51taCPUK+8D6H7BBeIiEaGf/1gYsNuldsXUSkJfwMkycNxL6//JMPFiEQqJhHWDOLZ4J/86TqWuZiBWcadNniKvQ7yXftCpiBkifqpYKRFFC/3sw26kODhWV9lSV9hEOSDVyDBW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765390939; c=relaxed/simple;
	bh=PUXR57mTieP5CBzCja98cqoyFj4aV18gefXhTgd/6qY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hPZdIu5JvEowJ3jbsJ9mlSn09giA/jN8AilB83V5JyAo84gFW5jgUJc5pA8Gh1X3u6k16k06yaJxNTmAVVtN0GLIoHTngHJyZZtkGGaCJG/jVGwY5U4YSOA75FvcDnmMhOBUCd/+T95E5Xf90n0kgAfnZ4eBRbIEZDCFmGB9BrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F9GR1MB4; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D2F24E41B4E;
	Wed, 10 Dec 2025 18:22:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DAD2660714;
	Wed, 10 Dec 2025 18:22:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 155F4103C8CB3;
	Wed, 10 Dec 2025 19:22:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765390931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PUXR57mTieP5CBzCja98cqoyFj4aV18gefXhTgd/6qY=;
	b=F9GR1MB4SM2KDodDE/TOQoAX42RWMhfc+j0VOF24Yt8l74MiY4JY+hGeX75GJOfYV52cxn
	vM6FWccI8aSSc3Mh1EoYSBAFojiJYIh1ZhicDXPhOpIisEg+MD3SQAZ1PlrsluQvmWWqGH
	49gPgtyAuTtMd6Cfk4h+Gxj6hSWhkxN3I4KWQ5oxVSJbq/72GZKg9fCT2EIbWaGMnqGk8W
	vOm4iKkiiB5G1jxQASH2opdWgJT3KT5+mxoooRHpJWsVEzB8wDoo9TCX2Cpo29caQ3E+lF
	Fnb7KWKuFMfx6GKNewg8DVJD/5i0vemI+FlKyrP/9Dg5/aIeLMIHVcY5mcvvIw==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 19:22:04 +0100
Message-Id: <DEUQUQS51C7K.FJD7W3YFJJU5@bootlin.com>
Subject: Re: [PATCH 10/21] drm/tilcdc: Remove redundant #endif/#ifdef in
 debugfs code
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
 <20251126-feature_tilcdc-v1-10-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-10-49b9ef2e3aa0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
> Remove the unnecessary #endif/#ifdef CONFIG_DEBUG_FS pair that splits
> the debugfs code section. This keeps all debugfs-related code within a
> single preprocessor conditional block, improving code readability.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

