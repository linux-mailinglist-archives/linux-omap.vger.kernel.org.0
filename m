Return-Path: <linux-omap+bounces-5170-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0918ECB67D8
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 17:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C70D3019895
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 16:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28D9306491;
	Thu, 11 Dec 2025 16:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GovHg0aq"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6711990C7;
	Thu, 11 Dec 2025 16:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471187; cv=none; b=AvCNkJnqFgvMSBYSem+Hge2f+pkDUStqwPBEDyJU8fUsE96TyHR9CFR9u6sa3RyPTMZZXilxYKnO11D15eJ9Be09ZAhWdrR1XMrtBM5eLZL+R/IHVjV+4bzNYFm2sQmDQE/yYLqz5QrW/iJD1d2uf05jkcKRHrXPx06f4E5q4rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471187; c=relaxed/simple;
	bh=0yCfwLV5UpgPtd28xcnRDDxyl9qoaBhBL+UHovJzaRY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O1ru3/LPXU3Yx1IXBbItSJ7MybU+ZzTyCfg/mHSqPHiLiT74fQ+r8qu470URinnQCst9oUUvWrXL9Paob4ux2Uc+UP3pKmnT2lonhUCfpCobDhfqrNof5WHhFrQ6Lvummbbi63LpondTcUobRwa7RH9rJ6zy1SM9eSl3bTbUzMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GovHg0aq; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B3FF34E41B7C;
	Thu, 11 Dec 2025 16:39:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6770E6072F;
	Thu, 11 Dec 2025 16:39:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 825B8103C8C1B;
	Thu, 11 Dec 2025 17:39:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765471179; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ANru55hW6VGmAl3nSsG6XTVN/Mh95jyNGuL5wdp0OOQ=;
	b=GovHg0aqtPp92DsA1+k1LAaM84842wXpN3KS6jQtpPatmME4Xdt4EeGSnXMBI6lr3Sv9X2
	q2enLRGWpPmkQp9/N74x8FP9F+zb7PdQx2lj7vsq55pawMeKJ+grMlqwz0n2Phw+zjNJTu
	oxMOu3j2Oc8TcqDC8C25GyZ8xpAZrOjUICySCGdo94ESvKp4al36AM7ZaOrMG2ZKbyzQ5I
	0HZv69pUk5ZxPIgz+zTzWusEFtZUKwYQRK13hF/sdVqh1sw2Fzf0A91lCMMksD1VrRiFGW
	gnO7PALZglh9GkSs7Qot1raM64tX7TJXKAZDPjq/MuTbLFWUUHW3KjvTsVW42A==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Subject: [PATCH v2 00/20] Clean and update tilcdc driver to support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Thu, 11 Dec 2025 17:38:44 +0100
Message-Id: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJTzOmkC/13MQQ7CIBCF4as0sxYDiG1w5T1MY4AOdpJaDGCja
 bi7WHcu/5e8b4WEkTDBqVkh4kKJwlxD7hpwo5lvyGioDZLLo+BCMY8mPyNeM01ucKzTblAa285
 6DfX0iOjptYGXvvZIKYf43vxFfNcfJWT7Ty2Ccaa01eglHozhZxtCnmjeu3CHvpTyAT60FEquA
 AAA
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
Patches 7-15: Clean up tilcdc driver.
Patches 16-18: Clean up tda998x driver.
Patch 19: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support for tda998x driver.
Patch 20: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support for tilcdc driver.

Changes in v2:
- Remove patch 2 that add fifo-threshold property. Use FIFO threshold
  value from SoC id instead.
- Remove the part that breaks DTB compatibility.
- Add tilcdc_panel_legacy to modify the devicetree at boot time to properly
  bind the tilcdc driver with the standard panel-simple driver.
- Link to v1: https://lore.kernel.org/r/20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
Kory Maincent (TI.com) (20):
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
      drm/tilcdc: Modernize driver initialization and cleanup paths
      drm/tilcdc: Remove the use of drm_device private_data
      drm/bridge: tda998x: Remove component support
      drm/bridge: tda998x: Move tda998x_create/destroy into probe and remove
      drm/bridge: tda998x: Remove useless tda998x_connector_destroy wrapper
      drm/bridge: tda998x: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
      drm/tilcdc: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR

 .../devicetree/bindings/display/tilcdc/panel.txt   |   1 +
 .../devicetree/bindings/display/tilcdc/tilcdc.txt  |  82 ----
 .../devicetree/bindings/display/tilcdc/tilcdc.yaml |  96 +++++
 drivers/gpu/drm/bridge/tda998x_drv.c               | 251 +++++------
 drivers/gpu/drm/tilcdc/Kconfig                     |  14 +
 drivers/gpu/drm/tilcdc/Makefile                    |   5 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               | 117 ++---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                | 479 ++++++++-------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |  88 +---
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c            |  93 ++++
 .../tilcdc/{tilcdc_external.h => tilcdc_encoder.h} |   5 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c           | 179 --------
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              | 408 ------------------
 drivers/gpu/drm/tilcdc/tilcdc_panel.h              |  15 -
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c       | 159 +++++++
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso    |  44 ++
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_regs.h               |   8 +-
 18 files changed, 752 insertions(+), 1294 deletions(-)
---
base-commit: f1c12d4576a46c82d3fdace1343e040daa0561f2
change-id: 20251014-feature_tilcdc-79cd49e67bf9

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


