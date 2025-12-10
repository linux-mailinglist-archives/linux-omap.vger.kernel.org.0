Return-Path: <linux-omap+bounces-5162-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E676FCB3BB0
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 19:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 524DF30CB00C
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 18:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4E63246EB;
	Wed, 10 Dec 2025 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fJ+jfCzl"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3572329378;
	Wed, 10 Dec 2025 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765390442; cv=none; b=mD7eDYlrkjlp75f/Fo8wwevQ2IjbcaVAjgggxZayda7K4hHjQi91mRBr/Qq8+swrmTSE3sM7qdq5z/VuI84JsejJG4kMeSXjXtMGBY28TNArTEHMIL/cZ9ROF7kYjSKGP5RSuJlba+6RaTZUbWDACXNdnQt08Ad8eObrKUrit7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765390442; c=relaxed/simple;
	bh=l98qOu+0/tY6Orese0IPL2xdfoJODXFr8iaKgobrYT0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ejto5cpeFfbbdMJfJ8l4oEDuAEVYeXWVrBJBQ+T4gPn/Hrxee9RSLIsHxSHgcvWBPX5Hhe9N8MpbTJLg04KrFxSka3d3NwMnLappJfjHxWWffXSJkLLdS+zn8nCrEnRCTX3rkEhXZ7V1/YhI9e5f/mD3KFmegmsvaFJx3MXTIbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fJ+jfCzl; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D8557C180F6;
	Wed, 10 Dec 2025 18:13:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D6E760714;
	Wed, 10 Dec 2025 18:13:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3317103C8CB3;
	Wed, 10 Dec 2025 19:13:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765390437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=l98qOu+0/tY6Orese0IPL2xdfoJODXFr8iaKgobrYT0=;
	b=fJ+jfCzl8+4tV/5a2fjeAI0hqo1ETpxNTPbTLeRkcWl+3hg9ddajcJlzgT3RjWWIkjbsTa
	T4tqLnnKAatCmuruKQGjuXAVE9e0LrCIxjrm8mXAd1/SuYg832ffC6HxVGAtXPRDd/1+Dq
	VQTVso6cfbjeA/+6fsZnkkjz3tkYOQmzYjF5t3T3fh8hmXnv7MjXuyAIsTFOWOQMQIB5ku
	H2CsRwiLKpWqq3oESdJoguxhOAmEondgANQOWNl573uWipCPUJSaPR3+WO/WniA9KT9Npo
	Kns/EKpwKZTEk9u5sMtXBkRNXC2t7+mtM73poDyR4SIxWIc8b1XHx0jiYdExuA==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 19:13:53 +0100
Message-Id: <DEUQOGYVBYFL.39NLEZ2GBI2WT@bootlin.com>
Subject: Re: [PATCH 04/21] drm/tilcdc: Add support for DRM bus flags and
 simplify panel config
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
 <20251126-feature_tilcdc-v1-4-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-4-49b9ef2e3aa0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
> Migrate CRTC mode configuration to use standard DRM bus flags in
> preparation for removing the tilcdc_panel driver and its custom
> tilcdc_panel_info structure.
>
> Add support for DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE and
> DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE flags to control pixel clock and sync
> signal edge polarity, while maintaining backward compatibility with the
> existing tilcdc panel info structure.
>
> Simplify several hardware parameters by setting them to fixed defaults
> based on common usage across existing device trees:
> - DMA burst size: 16 (previously configurable via switch statement)
> - AC bias frequency: 255 (previously panel-specific)
> - FIFO DMA request delay: 128 (previously panel-specific)
>
> These parameters show no variation in real-world usage, so hardcoding
> them simplifies the driver without losing functionality.
>
> Preserve FIFO threshold configurability by adding a new "fifo-threshold"
> device tree property at the display controller level, as this parameter
> varies across different display configurations in existing device trees.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Apart from the "fifo-threshold" property, which as discussed should instead
be inferred from the compatible, the patch looks good. I checked the values
which are being removed and they have all the same value in the code
defaults and all in-tree dts files.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

