Return-Path: <linux-omap+bounces-5039-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F489C8B3FB
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 18:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F41D4E515A
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 17:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B9E340A6D;
	Wed, 26 Nov 2025 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PhkSyYww"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C9F30FF34
	for <linux-omap@vger.kernel.org>; Wed, 26 Nov 2025 17:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178616; cv=none; b=koLTZM8DysOt4NAfCB6LiMVHFID703mNwMUgV7fv0LWcmLVmeeq9acWOAsTwnOfMUCapOeuL/oplIw/fgZlN1bQlOeXsLdhzf+JRgnavLlE+cILiF0JUV2CDMnKS4hdhDnJYT5SuNPnGEETbQBhOmv08vM3pcS7smYRN6XL/OEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178616; c=relaxed/simple;
	bh=SuNb1a5ivmk/dAWtFvpshxiAAt73xG4KpXye/Z5LdFo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KS3LxoolESCJZ7WOetbH4RAkMrLEo7T9KP+zKD9NT4UgYIzmp7XQ/NlxeEjOY6bH22u/lC+1pD2SMEeWWjDrm9INkDK54HsR21wQYMBz7pyQZgCmmJFPtYTKlgjQwsXo853k9hKVm28W4EkDraj6ut5Ik8IakCZm821h99FE2Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PhkSyYww; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D5B094E418DB;
	Wed, 26 Nov 2025 17:36:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A50D560721;
	Wed, 26 Nov 2025 17:36:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B67A102F1D8D;
	Wed, 26 Nov 2025 18:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764178605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=zFZ6kGeHeLZM9HVH30FgdiT3F0hPdtYLxyJtGV/89KA=;
	b=PhkSyYwwwVzNX9HFnIrE0j0EJKkw4WvjPWIzre6oNKlUCAH9A3ZzgjI1eDMMIb4RmqBmxE
	SHnXV504VW4nzNTy95G6yA9LKWJO93g8ERbr1KBrrzKx5ctLr8VCG3HGnXut/cj3mmZ96i
	RwCz6wIMQX10e4A2Zv5l6CC7sXh31vT5qTuv06VfGmG/yFsf+JdAAUoraoOTjrzoBsDYQj
	LMhhj00xVPInK1SF2AAAJiCn6KJhnfzjbrWGc2I8g5PJpJ3tCrWAjL0MWcTRziW/9Bh3WP
	LnJpo/Cx/SSOAJHIRGCXTTSEX9OZQfMdKSGK57thek7lPcTNlLuTaPMZy0cmFA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Subject: [PATCH 00/21] Clean and update tilcdc driver to support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Wed, 26 Nov 2025 18:35:42 +0100
Message-Id: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG46J2kC/x3MQQqAIBBA0avErBNUrLCrRETpWANRoRaBePek5
 Vv8nyCgJwzQVwk8PhToPApEXYHZ5mNFRrYYJJeN4EIxh3O8PU6RdmMN67SxSmPbLU5DiS6Pjt5
 /OIw5f92TcylgAAAA
X-Change-ID: 20251014-feature_tilcdc-79cd49e67bf9
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

The starting point for this work was adding support for the HDMI cape:
https://www.seeedstudio.com/Seeed-Studio-BeagleBone-Green-HDMI-Cape.html
This will be sent in a later series.

Initially, Miguel proposed modifying the ite-it66121 bridge to support
the legacy behavior without the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag:
https://lore.kernel.org/lkml/20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com/
This patch was NAK'd as we don't want to add more legacy code. Maxime
requested that the tilcdc driver be updated to use
DRM_BRIDGE_ATTACH_NO_CONNECTOR instead.

While working on this update, I discovered that the tilcdc driver
contained significant amounts of legacy code that needed cleaning.
Since this driver was developed alongside the tda998x driver for
several AM335x boards, the tda998x driver also required cleanup and
support for the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

This series is based on the tilcdc fix sent to mainline:
https://lore.kernel.org/lkml/20251125090546.137193-1-kory.maincent@bootlin.com/

Patch 1-7: Convert tilcdc binding to YAML and remove the ti,tilcdc,panel
	   sub-binding and driver
Patch 8-16: Clean up tilcdc driver
Patch 17-19: Clean up tda998x driver
Patch 20: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support to tda998x
Patch 21: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support to tilcdc

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
Kory Maincent (TI.com) (21):
      dt-bindings: display: tilcdc: Convert to DT schema
      dt-bindings: display: tilcdc: Add fifo-threshold property
      drm/tilcdc: Remove simulate_vesa_sync flag
      drm/tilcdc: Add support for DRM bus flags and simplify panel config
      ARM: dts: omap: Bind panel to panel-dpi instead of ti,tilcdc,panel driver
      dt-bindings: display: tilcdc: Remove panel binding
      drm/tilcdc: Remove tilcdc panel driver
      drm/tilcdc: Remove component framework support
      drm/tilcdc: Remove tilcdc_panel_info structure
      drm/tilcdc: Remove redundant #endif/#ifdef in debugfs code
      drm/tilcdc: Remove unused encoder and connector tracking arrays
      drm/tilcdc: Rename external_encoder and external_connector to encoder and connector
      drm/tilcdc: Rename tilcdc_external to tilcdc_encoder
      drm/tilcdc: Remove the useless module list support
      drm/tilcdc: Modernize driver initialization and cleanup paths
      drm/tilcdc: Remove the use of drm_device private_data
      drm/bridge: tda998x: Remove component support
      drm/bridge: tda998x: Move tda998x_create/destroy into probe and remove
      drm/bridge: tda998x: Remove useless tda998x_connector_destroy wrapper
      drm/bridge: tda998x: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
      drm/tilcdc: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR

 .../devicetree/bindings/display/tilcdc/panel.txt   |  66 ---
 .../devicetree/bindings/display/tilcdc/tilcdc.txt  |  82 ----
 .../devicetree/bindings/display/tilcdc/tilcdc.yaml | 103 +++++
 arch/arm/boot/dts/ti/davinci/da850-evm.dts         |  26 +-
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts      |  25 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |  21 +-
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts        |  22 +-
 arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts      |  25 +-
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts          |  25 +-
 drivers/gpu/drm/bridge/tda998x_drv.c               | 251 ++++++------
 drivers/gpu/drm/tilcdc/Makefile                    |   3 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               | 117 ++----
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                | 456 +++++++--------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |  88 +---
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c            |  93 +++++
 .../tilcdc/{tilcdc_external.h => tilcdc_encoder.h} |   5 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c           | 179 --------
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              | 408 ------------------
 drivers/gpu/drm/tilcdc/tilcdc_panel.h              |  15 -
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_regs.h               |   8 +-
 21 files changed, 589 insertions(+), 1431 deletions(-)
---
base-commit: 670bacfc7579bdd79a3069cfb5ab60a6a7923003
change-id: 20251014-feature_tilcdc-79cd49e67bf9

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


