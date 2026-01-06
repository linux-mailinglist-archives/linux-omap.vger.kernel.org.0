Return-Path: <linux-omap+bounces-5346-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B13CFAC6E
	for <lists+linux-omap@lfdr.de>; Tue, 06 Jan 2026 20:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C539A319F68B
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jan 2026 19:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE48345724;
	Tue,  6 Jan 2026 17:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KTHcErS8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A2E335557;
	Tue,  6 Jan 2026 17:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767721411; cv=none; b=uaKcpnEJlhM9wLPYxAIC155j2ym7hTcHfPIdxt+c40yOwolaHyryQafz0dnQ4Iw2CE5MUJ/Zajucz3sAdej3j34jEAZUXN7j3vmVpvpWfkET4O3U6CC4f4TFPr1iVUCdj8f9E3HlKMpyKpmH+MlCBhg8Q7o5F44Op+zlj4wHN7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767721411; c=relaxed/simple;
	bh=yGejKaZh5ByrBfXLcr2NmrBBEetDse4CwlTbHeXyB7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CP1Au+pG3Fd69LcVNOqHzLeYlVdmw32L5KkKiim+Ssw1Xk+jhM2yxylgigbu0qsb9pWgMMjdrMo/onQObrCGt18Lobg/pC0fwkq0AFFItH1ZoWa+MyrAG99o1uEufliqPtoQcLk0P4XeTGN9TvQ2RjDM3OyVp5/szXautz/31nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KTHcErS8; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ED2E04E41FB5;
	Tue,  6 Jan 2026 17:43:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2B4760739;
	Tue,  6 Jan 2026 17:43:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82B5B103C81A7;
	Tue,  6 Jan 2026 18:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721404; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9pRdDo0hFTS055NfI0T4ilJaSpXgnD1Q6tcrd1hCPuE=;
	b=KTHcErS8R07Xjr4q8SgyZe2RC3+pN3SHAYbaUsuWaye2mjwkcknuzhWZtKj3B6qYY08dzT
	DKBd2ysp0dP2wiODeN6I2EB4DIamW6Ii2F52pEtm1hTs8gLKjDjmE1ynMW4t0xGhrP65nw
	xPU/ImWaQyMrYy3LT3Xh6i7iY7237Zclri1X08eOcAXakpokrczurekZsTlzi8mBi9OtgH
	zCNTUVHftDncq2eeCkge48kBqXbc/tNksYg+JzuOfYi9yxXMwUWgsbbwosC4vAei8IVmF4
	kEIvK77qCODVGScYxe78TSNb3chDYwdMm8cSlK6PSUkG4HOVXIwBPZ9zjpomDg==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Tue, 06 Jan 2026 18:42:18 +0100
Subject: [PATCH v3 02/22] dt-bindings: display: tilcdc: Mark panel binding
 as deprecated
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-feature_tilcdc-v3-2-9bad0f742164@bootlin.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
In-Reply-To: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Mark the ti,tilcdc,panel binding as deprecated in the documentation.
This legacy binding should no longer be used for new designs. Users
should migrate to the standard DRM panel bindings instead.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v2:
- New patch
---
 Documentation/devicetree/bindings/display/tilcdc/panel.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/panel.txt b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
index 808216310ea27..b973174d704ed 100644
--- a/Documentation/devicetree/bindings/display/tilcdc/panel.txt
+++ b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
@@ -1,4 +1,5 @@
 Device-Tree bindings for tilcdc DRM generic panel output driver
+This binding is deprecated and should not be used.
 
 Required properties:
  - compatible: value should be "ti,tilcdc,panel".

-- 
2.43.0


