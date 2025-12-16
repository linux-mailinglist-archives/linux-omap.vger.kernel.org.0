Return-Path: <linux-omap+bounces-5195-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE00CC10CC
	for <lists+linux-omap@lfdr.de>; Tue, 16 Dec 2025 07:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C2EC304B96D
	for <lists+linux-omap@lfdr.de>; Tue, 16 Dec 2025 06:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A6432D7FC;
	Tue, 16 Dec 2025 06:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlHjHtgy"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E7B1D5CC9;
	Tue, 16 Dec 2025 06:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765864931; cv=none; b=C8TIi1k2eMvN1Wxq5zm/EJHeuC9oJ2tgSkXHQH9c/btqXU3WS7r6So3FTUl1L7O8w93bIdaksTg1RighokBf1cFgWOrPgoLUYhEClMOCGEbCikot9+mgAS1+ZuvnefnHbVxoQLKKaddI9PFW413xxZoOGZsy5fkg4vqEhPGqxJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765864931; c=relaxed/simple;
	bh=j71nItXmXIKCMM0R/7gVdAjrN/hym8eo9wF8FkHlOKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+AivnuhbTbHaG1nevZvCqMqTEbtNN34Og+Kwla72GcRl921s9tNnDmUcC/oTTiTWS6Mc837fpsGGbLk1TEsWzomVEkvoUkgYtL5I/Qyu8GfIDiDS2kZofbPMRznS0ubw4/bZt8XWaSq0rwLhDDe2kfEVkIk3ercPbVdpvOB/Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlHjHtgy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEEFC4CEF1;
	Tue, 16 Dec 2025 06:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765864929;
	bh=j71nItXmXIKCMM0R/7gVdAjrN/hym8eo9wF8FkHlOKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nlHjHtgynkgV7LwOiUcoq4tcA9aP4YrgO9FDJeRd+QaSWa4zpVEqAN56DLQO/fai0
	 bLfdD78xt/30clGZh4ZKqkpvRfHOKnVIrDGr8HlC/R/bHzvv/w5mOharibF4o4dvmU
	 KqMNnoOM1tMC7mw6i+rGRj0UAYB2imyNbdwvmzdrkOyMoYYMZpPf13Kenm1K/dGN3o
	 oDg6Qny37EApIATiSdGbHfrQ94TAPXOnCnANH2obidFYg5EkmS5EHEtXAVjoeHcGBu
	 uE13tagbHdDHKhbDPbQJBEMY3rR2edzZniy81p/3oqHJOe+/Rk9Ew42QdXjGOhjhea
	 jkTT76695s2PQ==
Date: Tue, 16 Dec 2025 07:02:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Miguel Gazquez <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 02/20] dt-bindings: display: tilcdc: Mark panel
 binding as deprecated
Message-ID: <20251216-outrageous-dark-bloodhound-0dccfc@quoll>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-2-f48bac3cd33e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251211-feature_tilcdc-v2-2-f48bac3cd33e@bootlin.com>

On Thu, Dec 11, 2025 at 05:38:46PM +0100, Kory Maincent (TI.com) wrote:
> Mark the ti,tilcdc,panel binding as deprecated in the documentation.
> This legacy binding should no longer be used for new designs. Users
> should migrate to the standard DRM panel bindings instead.
> 
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


