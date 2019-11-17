Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7502FF839
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 08:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbfKQHLC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 17 Nov 2019 02:11:02 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50868 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbfKQHLC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 17 Nov 2019 02:11:02 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id F380128EE0E
Received: by earth.universe (Postfix, from userid 1000)
        id 7395E3C0CB6; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [RFCv1 42/42] drm/panel: Move OMAP's DSI command mode panel driver
Date:   Sun, 17 Nov 2019 03:40:28 +0100
Message-Id: <20191117024028.2233-43-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
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
 drivers/gpu/drm/omapdrm/displays/Kconfig                 | 6 ------
 drivers/gpu/drm/omapdrm/displays/Makefile                | 1 -
 drivers/gpu/drm/panel/Kconfig                            | 9 +++++++++
 drivers/gpu/drm/panel/Makefile                           | 1 +
 .../gpu/drm/{omapdrm/displays => panel}/panel-dsi-cm.c   | 0
 5 files changed, 10 insertions(+), 7 deletions(-)
 rename drivers/gpu/drm/{omapdrm/displays => panel}/panel-dsi-cm.c (100%)

diff --git a/drivers/gpu/drm/omapdrm/displays/Kconfig b/drivers/gpu/drm/omapdrm/displays/Kconfig
index 240dda102845..1175811a55ac 100644
--- a/drivers/gpu/drm/omapdrm/displays/Kconfig
+++ b/drivers/gpu/drm/omapdrm/displays/Kconfig
@@ -23,10 +23,4 @@ config DRM_OMAP_CONNECTOR_ANALOG_TV
 	help
 	  Driver for a generic analog TV connector.
 
-config DRM_OMAP_PANEL_DSI_CM
-	tristate "Generic DSI Command Mode Panel"
-	depends on BACKLIGHT_CLASS_DEVICE
-	help
-	  Driver for generic DSI command mode panels.
-
 endmenu
diff --git a/drivers/gpu/drm/omapdrm/displays/Makefile b/drivers/gpu/drm/omapdrm/displays/Makefile
index cb76859dc574..68ff8b1d051a 100644
--- a/drivers/gpu/drm/omapdrm/displays/Makefile
+++ b/drivers/gpu/drm/omapdrm/displays/Makefile
@@ -3,4 +3,3 @@ obj-$(CONFIG_DRM_OMAP_ENCODER_OPA362) += encoder-opa362.o
 obj-$(CONFIG_DRM_OMAP_ENCODER_TPD12S015) += encoder-tpd12s015.o
 obj-$(CONFIG_DRM_OMAP_CONNECTOR_HDMI) += connector-hdmi.o
 obj-$(CONFIG_DRM_OMAP_CONNECTOR_ANALOG_TV) += connector-analog-tv.o
-obj-$(CONFIG_DRM_OMAP_PANEL_DSI_CM) += panel-dsi-cm.o
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index f152bc4eeb53..91520907d3c6 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -39,6 +39,15 @@ config DRM_PANEL_SIMPLE
 	  that it can be automatically turned off when the panel goes into a
 	  low power state.
 
+config DRM_PANEL_DSI_CM
+	tristate "support for generic DSI command mode panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM panel driver for DSI command mode panels with support for
+	  embedded and external backlights.
+
 config DRM_PANEL_FEIYANG_FY07024DI26A30D
 	tristate "Feiyang FY07024DI26A30-D MIPI-DSI LCD panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index b6cd39fe0f20..2afed2ae171c 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_DRM_PANEL_ARM_VERSATILE) += panel-arm-versatile.o
 obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
+obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
similarity index 100%
rename from drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
rename to drivers/gpu/drm/panel/panel-dsi-cm.c
-- 
2.24.0

