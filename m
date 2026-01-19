Return-Path: <linux-omap+bounces-5564-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30551D3B054
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 17:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4739630119F9
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 16:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFB92DE702;
	Mon, 19 Jan 2026 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yPosepBr"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF9B2BE655;
	Mon, 19 Jan 2026 16:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839508; cv=none; b=XzkGJVeGDUVi2WJJFFc6D5Yr23AkHXLY+hItoGNDr1DT2gcOT7RulmXu9qDMjHiiWqtd0kU/ZQW4U7pPwxXJ+VUJluXTT4Rd9DvvZ8YUn6cC1kF6lfKRvnlXWwr+Pc79IJ4px6ek3bfYPlh5nV4MQEqvpDzTqi+mvgpT4VmTpZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839508; c=relaxed/simple;
	bh=eGRrOLSF8zzcut0I8GX0vJC50dPFuIcvEQChQK1moFY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=h/gIGMyIkQjnyixwatfrJEWQcoFe/HfNXTD1RAMjBurvyoJpSy7Av/otdUmF309WYgVDMao5HIFLVryhDICvYJ3m5TORwrPmd0jQJ6gGI8R5WUKUcGNXXB3xHg2i4QfF0PpRhdPvh2SXzEWMQSSJuMAdnla9nE19jxx1uxg1Ys8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yPosepBr; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1DC83C214D1;
	Mon, 19 Jan 2026 16:17:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 293B260731;
	Mon, 19 Jan 2026 16:18:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B81010B6B095;
	Mon, 19 Jan 2026 17:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768839504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eGRrOLSF8zzcut0I8GX0vJC50dPFuIcvEQChQK1moFY=;
	b=yPosepBr+0ut4fkNOHX/63o9U1Z4o7UWoGQVP6oCF0EmUKgZJMuofXfiL2VoGfy2GDBqZ5
	+2pWA24g+6aS0i6aNN4wTcoBfriG7gPRdnG+hwBsLZv/Foj6sxCUk2BshWzMJxnVYz5iLm
	XvYBT1luW6JspTK2YQ4aS+aij2qeQBpEC0fQha3UzghIGdD+wWpbFmNj17KRerTtUoPHtK
	jE2Qn+s0If0z18VOl9u8wLdh1JqXBYtZ5hnB1s+GVs/hrUbf5yt5hv5Lcn8HfMt6BUnJx7
	YJcRJ1VQeE/AOHrJHcLZAo9DWMsCkvOpTsRrDg3581FP//quU11/hJU6jF8wqw==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 17:18:19 +0100
Message-Id: <DFSP9S7UZ2N8.3AGP43OE5TX5C@bootlin.com>
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
Subject: Re: [PATCH v4 14/25] drm/tilcdc: Use drm_module_platform_driver()
 helper
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-14-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-14-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> Use the drm_module_platform_driver() helper macro to simplify driver
> registration. This macro handles both the platform driver registration
> and the drm_firmware_drivers_only() check, making the custom init/exit
> functions unnecessary.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

