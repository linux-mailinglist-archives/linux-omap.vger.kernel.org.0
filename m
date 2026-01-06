Return-Path: <linux-omap+bounces-5344-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D45CFA91D
	for <lists+linux-omap@lfdr.de>; Tue, 06 Jan 2026 20:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4DEE326D1D0
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jan 2026 18:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54680312814;
	Tue,  6 Jan 2026 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SjLtBEZT"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A463043CD
	for <linux-omap@vger.kernel.org>; Tue,  6 Jan 2026 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767721404; cv=none; b=nbNc9E3V71lBpNlO80Pa8KG4jxFGgqPEt7VnUrEt8WaCISu590LQAKeiuvipHMUsqZfOeEAMgVh7IPqa7y2oVyukWfRFNwDfvzZ887P6dGEWs3wjo15+1IZZCgo60nB6yyA+5b0zQa6c54BUND++5fRNCQLEnLNY3Y/I8rs6eKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767721404; c=relaxed/simple;
	bh=pkc/3FbnSRiYfLotqXlNBQMs9NKxwUN3haOJGCuzTu8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XFHiLFlmVjwEN6KavmKCkI6BLwfs6suH7L3qkgib6rqC6rNv2yHiRFhbzMkmPCKQGPGH0KqH43a1pI9IkvRze+gZdFbTH2Sdll4i8WJSw2jvOFhKzBLRKDcJHJJH6v1fLikSjR8iRLlecFupLvLDBHrC8I4BVZ87UeU2XWz31DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SjLtBEZT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D0D891A26A6;
	Tue,  6 Jan 2026 17:43:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CFC160739;
	Tue,  6 Jan 2026 17:43:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DD3A103C81A7;
	Tue,  6 Jan 2026 18:43:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721396; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=kLqSTVzvhTVRG4lWNvpKEN50rxP50IjnuD1ETy7eXSQ=;
	b=SjLtBEZTy4fTHk7397dU3Qzb6DSsjhjQXC8Tq89jUf+sjDL/aRLuTcioBrIXBei7HxG9EY
	ep8sNudYtfI+HYM33zkHt8KrvcsVwBWfe07ApP7aYtCnpzmFbrcJqgrxQVx0K1oUEG1Zdb
	I1YjFyBr0lKUY19QnnmpA/AMF8Rnv90iWeMfNo2jUvgpL/E4d2YVtevoZJBbqT1lLdoQgE
	wvHdKUgJmZcVrg6olUJPQxjRKU/5I3t6OF1il0Te70y8TU/XF2/rUfDyAXC+LJXgKvTju1
	kwI6yV3jjGDx3VbpcvWnv8ePyqwllEndfVolKT/xDslWmFeuqfz63ULJiJ9T1g==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Subject: [PATCH v3 00/22] Clean and update tilcdc driver to support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Tue, 06 Jan 2026 18:42:16 +0100
Message-Id: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHhJXWkC/2XMSwrCMBSF4a2UjI3kZWscuQ8RyePGBrSRJAald
 O+mdSDq8D9wvhEliB4S2jUjilB88mGowVcNMr0azoC9rY0YYRtKqMAOVL5HOGV/MdbgThorJLS
 ddhLV0y2C848FPBxr9z7lEJ+LX+i8vinK2l+qUEywkFqCY8CVInsdQr74YW3CFc1YYR+AUfoHs
 Ao4sdXKcGM5h29gmqYXiU9Ryu8AAAA=
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

A new tilcdc_panel_legacy driver replaces the old tilcdc_panel driver.
It modifies the devicetree at boot time to properly bind the tilcdc driver
with the standard panel-simple driver.

This series is based on the tilcdc fix sent to mainline:
https://lore.kernel.org/lkml/20251125090546.137193-1-kory.maincent@bootlin.com/

This series has been tested on:
- BeagleBone Black (tilcdc + tda998x bridge)
- BeagleBone Black with LCD cape (tilcdc + ti,tilcdc,panel binding)
- BeagleBone Green Eco with HDMI cape (tilcdc + it66121 bridge)

The following mainline devicetrees still use ti,tilcdc,panel binding.
I believe this series maintains compatibility, but I cannot test without
hardware:
- da850-evm.dts
- am335x-guardian.dts
- am335x-pdu001.dts
- am335x-pepper.dts
- am335x-sbc-t335.dts
- am335x-sl50.dts

Patches 1-2: Convert tilcdc binding to YAML and set the ti,tilcdc,panel
	     sub-binding as legacy.
Patches 3-6: Replace tilcdc_panel driver to the new tilcdc_panel_legacy
	     driver which is tweaking the devicetree at boot time.
Patches 7-17: Clean up tilcdc driver.
Patches 18-20: Clean up tda998x driver.
Patch 21: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support for tda998x driver.
Patch 22: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support for tilcdc driver.

Changes in v3:
- Split patch 13 and patch 14 into two for better readability and git
  history clarity.
- Update patch 5 to use OF changeset and __free() macro. Made also few
  small improvements as requested by Luca.
- Rename binding file to ti,am33xx-tilcdc.yaml, use generic node name and
  drop unused label.
- Link to v2: https://lore.kernel.org/r/20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com

Changes in v2:
- Remove patch 2 that add fifo-threshold property. Use FIFO threshold
  value from SoC id instead.
- Remove the part that breaks DTB compatibility.
- Add tilcdc_panel_legacy to modify the devicetree at boot time to properly
  bind the tilcdc driver with the standard panel-simple driver.
- Link to v1: https://lore.kernel.org/r/20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
Kory Maincent (TI.com) (22):
      dt-bindings: display: tilcdc: Convert to DT schema
      dt-bindings: display: tilcdc: Mark panel binding as deprecated
      drm/tilcdc: Remove simulate_vesa_sync flag
      drm/tilcdc: Add support for DRM bus flags and simplify panel config
      drm/tilcdc: Convert legacy panel binding via DT overlay at boot time
      drm/tilcdc: Remove tilcdc panel driver
      drm/tilcdc: Remove component framework support
      drm/tilcdc: Remove tilcdc_panel_info structure
      drm/tilcdc: Remove redundant #endif/#ifdef in debugfs code
      drm/tilcdc: Remove unused encoder and connector tracking arrays
      drm/tilcdc: Rename external_encoder and external_connector to encoder and connector
      drm/tilcdc: Rename tilcdc_external to tilcdc_encoder
      drm/tilcdc: Remove the useless module list support
      drm/tilcdc: Use drm_module_platform_driver() helper
      drm/tilcdc: Move tilcdc_init/fini closer to probe/remove
      drm/tilcdc: Modernize driver initialization and cleanup paths
      drm/tilcdc: Remove the use of drm_device private_data
      drm/bridge: tda998x: Remove component support
      drm/bridge: tda998x: Move tda998x_create/destroy into probe and remove
      drm/bridge: tda998x: Remove useless tda998x_connector_destroy wrapper
      drm/bridge: tda998x: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
      drm/tilcdc: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR

 .../devicetree/bindings/display/tilcdc/panel.txt   |   1 +
 .../bindings/display/tilcdc/ti,am33xx-tilcdc.yaml  | 100 +++++
 .../devicetree/bindings/display/tilcdc/tilcdc.txt  |  82 ----
 drivers/gpu/drm/bridge/tda998x_drv.c               | 251 +++++------
 drivers/gpu/drm/tilcdc/Kconfig                     |  16 +
 drivers/gpu/drm/tilcdc/Makefile                    |   5 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               | 117 ++---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                | 479 ++++++++-------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |  88 +---
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c            |  91 ++++
 .../tilcdc/{tilcdc_external.h => tilcdc_encoder.h} |   5 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c           | 179 --------
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              | 408 ------------------
 drivers/gpu/drm/tilcdc/tilcdc_panel.h              |  15 -
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c       | 185 ++++++++
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso    |  29 ++
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_regs.h               |   8 +-
 18 files changed, 768 insertions(+), 1293 deletions(-)
---
base-commit: 3617933603dd15db33ae9a0200734480682025b8
change-id: 20251014-feature_tilcdc-79cd49e67bf9

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


