Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44F4F16B52D
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbgBXXVs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:48 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60134 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728530AbgBXXVm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:42 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 65872293E91
Received: by earth.universe (Postfix, from userid 1000)
        id 953893C0CAF; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 44/56] drm/panel: Move OMAP's DSI command mode panel driver
Date:   Tue, 25 Feb 2020 00:21:14 +0100
Message-Id: <20200224232126.3385250-45-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The panel driver is no longer using any OMAP specific APIs, so
let's move it into the generic panel directory.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/Kconfig                        |  1 -
 drivers/gpu/drm/omapdrm/Makefile                       |  1 -
 drivers/gpu/drm/omapdrm/displays/Kconfig               | 10 ----------
 drivers/gpu/drm/omapdrm/displays/Makefile              |  2 --
 drivers/gpu/drm/panel/Kconfig                          |  9 +++++++++
 drivers/gpu/drm/panel/Makefile                         |  1 +
 .../gpu/drm/{omapdrm/displays => panel}/panel-dsi-cm.c |  0
 7 files changed, 10 insertions(+), 14 deletions(-)
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/Kconfig
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/Makefile
 rename drivers/gpu/drm/{omapdrm/displays => panel}/panel-dsi-cm.c (100%)

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index 5417e7a47072..cea3f44ea6d4 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -12,6 +12,5 @@ config DRM_OMAP
 if DRM_OMAP
 
 source "drivers/gpu/drm/omapdrm/dss/Kconfig"
-source "drivers/gpu/drm/omapdrm/displays/Kconfig"
 
 endif
diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
index f115253115c5..66a73eae6f7c 100644
--- a/drivers/gpu/drm/omapdrm/Makefile
+++ b/drivers/gpu/drm/omapdrm/Makefile
@@ -5,7 +5,6 @@
 #
 
 obj-y += dss/
-obj-y += displays/
 
 omapdrm-y := omap_drv.o \
 	omap_irq.o \
diff --git a/drivers/gpu/drm/omapdrm/displays/Kconfig b/drivers/gpu/drm/omapdrm/displays/Kconfig
deleted file mode 100644
index f2be594c7eff..000000000000
--- a/drivers/gpu/drm/omapdrm/displays/Kconfig
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-menu "OMAPDRM External Display Device Drivers"
-
-config DRM_OMAP_PANEL_DSI_CM
-	tristate "Generic DSI Command Mode Panel"
-	depends on BACKLIGHT_CLASS_DEVICE
-	help
-	  Driver for generic DSI command mode panels.
-
-endmenu
diff --git a/drivers/gpu/drm/omapdrm/displays/Makefile b/drivers/gpu/drm/omapdrm/displays/Makefile
deleted file mode 100644
index 488ddf153613..000000000000
--- a/drivers/gpu/drm/omapdrm/displays/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_DRM_OMAP_PANEL_DSI_CM) += panel-dsi-cm.o
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index da3b84602cdd..07ab75a66607 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -38,6 +38,15 @@ config DRM_PANEL_BOE_TV101WUM_NL6
 	  Say Y here if you want to support for BOE TV101WUM and AUO KD101N80
 	  45NA WUXGA PANEL DSI Video Mode panel
 
+config DRM_PANEL_DSI_CM
+	tristate "Generic DSI command mode panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM panel driver for DSI command mode panels with support for
+	  embedded and external backlights.
+
 config DRM_PANEL_LVDS
 	tristate "Generic LVDS panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index af1e2a3cc5fc..bb19cda8a619 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_DRM_PANEL_ARM_VERSATILE) += panel-arm-versatile.o
 obj-$(CONFIG_DRM_PANEL_BOE_HIMAX8279D) += panel-boe-himax8279d.o
 obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
+obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
 obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
 obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
similarity index 100%
rename from drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
rename to drivers/gpu/drm/panel/panel-dsi-cm.c
-- 
2.25.0

