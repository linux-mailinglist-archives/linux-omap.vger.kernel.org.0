Return-Path: <linux-omap+bounces-5172-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBA0CB67C8
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 17:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B55AF300F72A
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 16:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC5C3128D8;
	Thu, 11 Dec 2025 16:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cHNvQEJx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1807431355E;
	Thu, 11 Dec 2025 16:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471191; cv=none; b=HBMvR7k0G5h1waCC1BwGE78plPjK7oCZykdYXGBbXfWWf2kLITR/W1Co0AZlSyZWK8Uo9sQWXMclUj7Q1UmZ/qyMCWsoX6pE34pMVDean/E+wkGMCVGOCbTadSZ84qonVcd26aJhelB0LcBeCMCqS86MHbDLuSAPDfok9Q2BPIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471191; c=relaxed/simple;
	bh=OSfnIaxJro7Md058f5pbrJFb5ajNbmguAqRFL7wAJmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/1vEyv+mAQVcwRJvljVrDj/8nhX9EH86YFsMoznNi1310gSZpNxW3w1oGIe6KWyrVhjKhOnxYQibUc0Y41j4WrqH44F1tBGeld3tYJUznbGN/Pj1DxKBFa8SJGA0f8otyZ4x0yw5Tyc8MbYfYtLVA6Pfyhx2NA//Fk7qAdvMIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cHNvQEJx; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 15DC3C1934E;
	Thu, 11 Dec 2025 16:39:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A9966072F;
	Thu, 11 Dec 2025 16:39:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52560103C8C7B;
	Thu, 11 Dec 2025 17:39:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765471185; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sVcTUwOCRH5tnQZK1SD7eSjVIvUKNCHhAOFhXPDQ2uA=;
	b=cHNvQEJxuvuPsT39IuUKHb36IrNHyBSryBir25sEu70JFNA18i6VTtebbBVbtwIOLy6Tn9
	2lFVUZzZ7Z5cUy6m9qMX2TDwaMdWW/+VUiKA2RKbG/pnBaG8A0yxzqtSIH5C16NRZTusYh
	kssZoSJVT5KZwolD9I1MMu1mwNf5kej8nmnVHfraI+MfKq38Ct50lRjm7z/elItW4RUzMX
	iZMsMjgBniz1bIcr3RnPC3YbaSPLX2PUyX0XM65851mTSh0VdM9CZvEmLi89XoKuqrPyjw
	hqwQmSS7uDqDazxhL0AASbrClk2Hj+KGz4b7sXG7Z8CJXtmwKTdEalymfzJ7kg==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 11 Dec 2025 17:38:46 +0100
Subject: [PATCH v2 02/20] dt-bindings: display: tilcdc: Mark panel binding
 as deprecated
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-feature_tilcdc-v2-2-f48bac3cd33e@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
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
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Mark the ti,tilcdc,panel binding as deprecated in the documentation.
This legacy binding should no longer be used for new designs. Users
should migrate to the standard DRM panel bindings instead.

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


