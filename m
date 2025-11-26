Return-Path: <linux-omap+bounces-5044-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9866C8B473
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 18:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EB2A3BC370
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 17:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58B0342513;
	Wed, 26 Nov 2025 17:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="urmWOWiO"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9F7342158;
	Wed, 26 Nov 2025 17:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178627; cv=none; b=O/CsMwen95QLfMcYjZ3Cpa7KShnPgoJBl8GeyTKXRCo3tquOWArple+SRmHutppaqoveTfsM2glPxX40roXMMuCzMReH8k6tjaftpum68VzX+hDgMe2AJceWDWsoADrJa+QRnZaF507oeTlGekMyBXQTNGToQGrNPqe2jKyvtt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178627; c=relaxed/simple;
	bh=tTPxi5k58wJEimRCt2b6ST0sVU5ySJOAcdUcqnJr1Fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NBmexmr3zrac1BIft53Pfws/nb5N+2ZhtBYDsCyO9knplA9qFZ7N4ydDj5obP5qowXLCgZUy1rj2ec1VPZUKgfCOG+p801y65TXcJ6CksAGYDd05fS0rg2PNR08B9AXatbihgqmnGSQVCFUPoKcPkYJ4oX+Q4zUTIZJuuGRugyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=urmWOWiO; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5867AC16A0B;
	Wed, 26 Nov 2025 17:36:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E8B060721;
	Wed, 26 Nov 2025 17:37:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E28F4102F22D9;
	Wed, 26 Nov 2025 18:36:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764178622; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EWslL5MJAu1ktwPaDyDYlweDV4/0Xu50P9NpGLLvPzI=;
	b=urmWOWiOCRBQAaoKMUKHRNe7j5UlKQhDEabtHMlCvM1TGAhlLuB+6X45QYYWZNSKGwwm69
	l3PZTZjW3W6qIfDfh/qnPs3VW+hLmQ+MfuadSI3knL03/q0LZ1eM5N8kx7JkuyjppmOTc8
	b9GVdtvZ6b20OoB/85QkDEDzmcDujK+oYN24M5A/fLSuGuVdh4NdEhYkUc5WnuO2mqggJa
	3vEk7KOmZQGFpmcX15aegIJY2/WRrOq6pQDQMhlUyw8G5TttJqc7qvbarJ9o2r7csdbJ/H
	Jy8lJW2nADY63oCd7wPItAFFyEpdjeh5fWz6eH8nur/0b2LUpJAJZv24W/wh8Q==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:48 +0100
Subject: [PATCH 06/21] dt-bindings: display: tilcdc: Remove panel binding
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-6-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
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

Remove the deprecated ti,tilcdc,panel binding which violates devicetree
design principles by placing display controller configuration
(DMA burst size, FIFO thresholds, AC bias, etc.) inside the panel node
instead of the controller node where it belongs.

This non-standard binding has several critical issues:
- Mixes controller-specific hardware parameters with panel properties
- Lacks the standard port/endpoint graph for panel connections
- Cannot work with the standard DRM panel infrastructure
- Forces vendor-specific binding instead of reusable panel-dpi binding

The tilcdc driver has been updated to work with standard DRM panels and
bridges, and all in-tree users have been migrated to use the generic
panel-dpi binding with proper port/endpoint connections. Controller
parameters like fifo-threshold are now correctly specified in the
tilcdc node itself.

While removing bindings is exceptional, keeping this binding would:
- Perpetuate incorrect devicetree design patterns
- Require maintaining a non-standard panel driver solely for tilcdc
- Block proper integration with the DRM panel subsystem
- Prevent devicetree reusability across different display controllers

This removal completes the migration to standard DRM panel bindings.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 .../devicetree/bindings/display/tilcdc/panel.txt   | 66 ----------------------
 1 file changed, 66 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/panel.txt b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
deleted file mode 100644
index 808216310ea27..0000000000000
--- a/Documentation/devicetree/bindings/display/tilcdc/panel.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-Device-Tree bindings for tilcdc DRM generic panel output driver
-
-Required properties:
- - compatible: value should be "ti,tilcdc,panel".
- - panel-info: configuration info to configure LCDC correctly for the panel
-   - ac-bias: AC Bias Pin Frequency
-   - ac-bias-intrpt: AC Bias Pin Transitions per Interrupt
-   - dma-burst-sz: DMA burst size
-   - bpp: Bits per pixel
-   - fdd: FIFO DMA Request Delay
-   - sync-edge: Horizontal and Vertical Sync Edge: 0=rising 1=falling
-   - sync-ctrl: Horizontal and Vertical Sync: Control: 0=ignore
-   - raster-order: Raster Data Order Select: 1=Most-to-least 0=Least-to-most
-   - fifo-th: DMA FIFO threshold
- - display-timings: typical videomode of lcd panel.  Multiple video modes
-   can be listed if the panel supports multiple timings, but the 'native-mode'
-   should be the preferred/default resolution.  Refer to
-   Documentation/devicetree/bindings/display/panel/display-timing.txt for display
-   timing binding details.
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-- enable-gpios: GPIO pin to enable or disable the panel
-
-Recommended properties:
- - pinctrl-names, pinctrl-0: the pincontrol settings to configure
-   muxing properly for pins that connect to TFP410 device
-
-Example:
-
-	/* Settings for CDTech_S035Q01 / LCD3 cape: */
-	lcd3 {
-		compatible = "ti,tilcdc,panel";
-		pinctrl-names = "default";
-		pinctrl-0 = <&bone_lcd3_cape_lcd_pins>;
-		backlight = <&backlight>;
-		enable-gpios = <&gpio3 19 0>;
-
-		panel-info {
-			ac-bias           = <255>;
-			ac-bias-intrpt    = <0>;
-			dma-burst-sz      = <16>;
-			bpp               = <16>;
-			fdd               = <0x80>;
-			sync-edge         = <0>;
-			sync-ctrl         = <1>;
-			raster-order      = <0>;
-			fifo-th           = <0>;
-		};
-		display-timings {
-			native-mode = <&timing0>;
-			timing0: 320x240 {
-				hactive         = <320>;
-				vactive         = <240>;
-				hback-porch     = <21>;
-				hfront-porch    = <58>;
-				hsync-len       = <47>;
-				vback-porch     = <11>;
-				vfront-porch    = <23>;
-				vsync-len       = <2>;
-				clock-frequency = <8000000>;
-				hsync-active    = <0>;
-				vsync-active    = <0>;
-			};
-		};
-	};

-- 
2.43.0


