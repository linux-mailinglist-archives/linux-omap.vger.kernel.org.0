Return-Path: <linux-omap+bounces-5175-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7765FCB6861
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 17:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 367D030567B5
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 16:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CF5313E1C;
	Thu, 11 Dec 2025 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pR3Suauc"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2BD2BE7AB;
	Thu, 11 Dec 2025 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471200; cv=none; b=BbJHjEYSL9vgcySDASNTyHKjjaXsBAffB2+hnvPOM2UaEWTwsgj+IKJYY9uCsU5LjLWIcDg+WH2Kjm7Dx8o5pHx4MTwRVrjgBpSasx5GqrXOKlQiQ33ea7bQ2tEvJ5ofeCmjfe3T9/iN2TkLeZ3uRIUEO/9Oa5lQoyQbDEfi1gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471200; c=relaxed/simple;
	bh=ANoDZkLAgeQfSfXk676VS25FfkGeGb9aDh1UICCyf2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKMmo3uRYTSq1WiImCODquK0snb1o3Z+4KRMgb3XvKr6kZLgHDzORDWhfudcHEVI2MFRWQkvu0q1bD7iPStgAnQ32FrgAtQ0UDf6F6+zSilCe6m5HJFZpO6DRTtM/HHH0HeeQ24p4CQWMhw4NNAeyktOIS6ebhLamoFsKK4FSOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pR3Suauc; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 43DFBC1934C;
	Thu, 11 Dec 2025 16:39:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 497916072F;
	Thu, 11 Dec 2025 16:39:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DEAE2103C8C93;
	Thu, 11 Dec 2025 17:39:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765471194; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EpGrFTtSsLmJVdPD5Xtq7OILvGAuYsgbVseo3Zc9270=;
	b=pR3SuaucMP3aotxua6C2eLaKyOxYTw3HqU9SKVlkiquogTsB2M9IafRDmNWLkJNeGPCfar
	4EIylH5G3J5YUPSZHeZ4xnkZU3e4TJUHYBqhAqIZG4fLz1maLE7k24ust2kU9sLEmb3G1b
	4UcrUVagFrnU9Bv2QU9oQD9WtPjtAllhQ3HoqqHDMX7rKsRthQ1bwKKr0FiRANUF3kEEdS
	wTbEtjVRIkcIJZefesC+nwD010JulfBVA9J3ypr2JPWTH37hPCHA/D/2o08CxfpWXEzWE0
	whSlfW44ziOtK1Ry2gqloYuQ/Y7G3p0YEnnxRPXtGsQWIqnZQaIKUEITWxEjEQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 11 Dec 2025 17:38:49 +0100
Subject: [PATCH v2 05/20] drm/tilcdc: Convert legacy panel binding via DT
 overlay at boot time
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-feature_tilcdc-v2-5-f48bac3cd33e@bootlin.com>
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

To maintain backward compatibility while removing the deprecated
tilcdc_panel driver, add a tilcdc_panel_legacy subdriver that converts
the legacy "ti,tilcdc,panel" devicetree binding to the standard
panel-dpi binding at early boot.

The conversion uses an embedded device tree overlay that is applied and
modified during subsys_initcall. The process:

- Apply embedded overlay to create a panel-dpi node with placeholder
  timing properties and port/endpoint connections to the LCDC
- Copy all properties from the legacy panel node to the new panel-dpi
- Copy display-timings from the legacy panel
- Convert legacy panel-info properties (invert-pxl-clk, sync-edge) to
  standard display timing properties (pixelclk-active, syncclk-active)
- Disable the legacy panel by removing its compatible property to
  prevent the deprecated driver from binding

The result is a standard panel-dpi node with proper endpoints and
timing properties, allowing the DRM panel infrastructure to work with
legacy devicetrees without modification.

Other legacy panel-info properties are not migrated as they consistently
use default values across all mainline devicetrees and can be hardcoded
in the tilcdc driver.

This feature is optional via CONFIG_DRM_TILCDC_PANEL_LEGACY and should
only be enabled for systems with legacy devicetrees containing
"ti,tilcdc,panel" nodes.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Using the approach of applying an overlay and then modifying the live
device tree is the solution I found that requires no modification of the
OF core. Dealing entirely with overlay changesets would bring additional
requirements such as phandle resolution management, which is internal to
the OF framework. I intend to avoid OF core change to support this legacy
binding.

Change in v2:
- New patch.
---
 drivers/gpu/drm/tilcdc/Kconfig                  |  14 +++
 drivers/gpu/drm/tilcdc/Makefile                 |   2 +
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c    | 159 ++++++++++++++++++++++++
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso |  44 +++++++
 4 files changed, 219 insertions(+)

diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/Kconfig
index 24f9a245ba593..4dcae0a06b819 100644
--- a/drivers/gpu/drm/tilcdc/Kconfig
+++ b/drivers/gpu/drm/tilcdc/Kconfig
@@ -14,3 +14,17 @@ config DRM_TILCDC
 	  controller, for example AM33xx in beagle-bone, DA8xx, or
 	  OMAP-L1xx.  This driver replaces the FB_DA8XX fbdev driver.
 
+config DRM_TILCDC_PANEL_LEGACY
+	bool "Support device tree blobs using TI LCDC Panel binding"
+	default n
+	depends on DRM_TILCDC
+        depends on OF
+        depends on BACKLIGHT_CLASS_DEVICE
+        depends on PM
+	select OF_OVERLAY
+	select DRM_PANEL_SIMPLE
+	help
+	  Choose this option if you need a kernel that is compatible
+	  with device tree blobs using the obsolete "ti,tilcdc,panel"
+	  binding. If you find "ti,tilcdc,panel"-string from your DTB,
+	  you probably need this. Otherwise you do not.
diff --git a/drivers/gpu/drm/tilcdc/Makefile b/drivers/gpu/drm/tilcdc/Makefile
index f5190477de721..6d6a08b5adf40 100644
--- a/drivers/gpu/drm/tilcdc/Makefile
+++ b/drivers/gpu/drm/tilcdc/Makefile
@@ -11,3 +11,5 @@ tilcdc-y := \
 	tilcdc_drv.o
 
 obj-$(CONFIG_DRM_TILCDC)	+= tilcdc.o
+obj-$(CONFIG_DRM_TILCDC_PANEL_LEGACY)	+= tilcdc_panel_legacy.o \
+					   tilcdc_panel_legacy.dtbo.o
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c
new file mode 100644
index 0000000000000..a9651dd9f9935
--- /dev/null
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Kory Maincent <kory.maincent@bootlin.com>
+ *
+ * To support the legacy "ti,tilcdc,panel" binding, the devicetree has to
+ * be transformed to the new panel-dpi binding with the endpoint associated.
+ */
+
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/slab.h>
+
+/* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
+extern char __dtbo_tilcdc_panel_legacy_begin[];
+extern char __dtbo_tilcdc_panel_legacy_end[];
+
+static void __init
+tilcdc_panel_update_prop(struct device_node *node, char *name,
+			 void *val, int length)
+{
+	struct property *prop;
+
+	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
+	if (!prop)
+		return;
+
+	prop->name = kstrdup(name, GFP_KERNEL);
+	prop->length = length;
+	prop->value = kmemdup(val, length, GFP_KERNEL);
+	of_update_property(node, prop);
+}
+
+static int __init tilcdc_panel_copy_props(struct device_node *old_panel,
+					  struct device_node *new_panel)
+{
+	struct device_node *child, *old_timing, *new_timing, *panel_info;
+	u32 invert_pxl_clk = 0, sync_edge = 0;
+	struct property *prop;
+
+	/* Copy all panel properties to the new panel node */
+	for_each_property_of_node(old_panel, prop) {
+		if (!strncmp(prop->name, "compatible", sizeof("compatible")))
+			continue;
+
+		tilcdc_panel_update_prop(new_panel, prop->name,
+					 prop->value, prop->length);
+	}
+
+	child = of_get_child_by_name(old_panel, "display-timings");
+	if (!child)
+		return -EINVAL;
+
+	/* The default display timing is the one specified as native-mode.
+	 * If no native-mode is specified then the first node is assumed
+	 * to be the native mode.
+	 */
+	old_timing = of_parse_phandle(child, "native-mode", 0);
+	if (!old_timing) {
+		old_timing = of_get_next_child(child, NULL);
+		if (!old_timing) {
+			of_node_put(child);
+			return -EINVAL;
+		}
+	}
+	of_node_put(child);
+
+	new_timing = of_get_child_by_name(new_panel, "panel-timing");
+	if (!new_timing)
+		return -EINVAL;
+
+	/* Copy all panel timing property to the new panel node */
+	for_each_property_of_node(old_timing, prop)
+		tilcdc_panel_update_prop(new_timing, prop->name,
+					 prop->value, prop->length);
+
+	panel_info = of_get_child_by_name(old_panel, "panel-info");
+	if (!panel_info)
+		return -EINVAL;
+
+	/* Looked only for these two parameter as all the other are always
+	 * set to default and not related to common DRM properties.
+	 */
+	of_property_read_u32(panel_info, "invert-pxl-clk", &invert_pxl_clk);
+	of_property_read_u32(panel_info, "sync-edge", &sync_edge);
+
+	if (!invert_pxl_clk)
+		tilcdc_panel_update_prop(new_timing, "pixelclk-active",
+					 &(int){1}, sizeof(int));
+
+	if (!sync_edge)
+		tilcdc_panel_update_prop(new_timing, "syncclk-active",
+					 &(int){1}, sizeof(int));
+
+	of_node_put(panel_info);
+	of_node_put(old_timing);
+	of_node_put(new_timing);
+	return 0;
+}
+
+static const struct of_device_id tilcdc_panel_of_match[] __initconst = {
+	{ .compatible = "ti,tilcdc,panel", },
+	{},
+};
+
+static const struct of_device_id tilcdc_of_match[] __initconst = {
+	{ .compatible = "ti,am33xx-tilcdc", },
+	{ .compatible = "ti,da850-tilcdc", },
+	{},
+};
+
+static int __init tilcdc_panel_legacy_init(void)
+{
+	struct device_node *panel, *lcdc, *new_panel;
+	void *dtbo_start;
+	u32 dtbo_size;
+	int ovcs_id;
+	int ret;
+
+	lcdc = of_find_matching_node(NULL, tilcdc_of_match);
+	panel = of_find_matching_node(NULL, tilcdc_panel_of_match);
+
+	if (!of_device_is_available(panel) ||
+	    !of_device_is_available(lcdc)) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	dtbo_start = __dtbo_tilcdc_panel_legacy_begin;
+	dtbo_size = __dtbo_tilcdc_panel_legacy_end -
+		    __dtbo_tilcdc_panel_legacy_begin;
+
+	ret = of_overlay_fdt_apply(dtbo_start, dtbo_size, &ovcs_id, NULL);
+	if (ret)
+		goto out;
+
+	new_panel = of_find_node_by_name(NULL, "panel-dpi");
+	if (!new_panel) {
+		ret = -ENODEV;
+		goto overlay_remove;
+	}
+
+	ret = tilcdc_panel_copy_props(panel, new_panel);
+	if (ret)
+		goto overlay_remove;
+
+	/* Remove compatible property to avoid any driver compatible match */
+	of_remove_property(panel, of_find_property(panel, "compatible",
+						   NULL));
+overlay_remove:
+	of_overlay_remove(&ovcs_id);
+out:
+	of_node_put(new_panel);
+	of_node_put(panel);
+	of_node_put(lcdc);
+	return ret;
+}
+
+subsys_initcall(tilcdc_panel_legacy_init);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso
new file mode 100644
index 0000000000000..77f3ec9391d55
--- /dev/null
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DTS overlay for converting ti,tilcdc,panel binding to new binding.
+ *
+ * Copyright (C) Kory Maincent <kory.maincent@bootlin.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	panel-dpi {
+		compatible = "panel-dpi";
+		port {
+			panel_in: endpoint@0 {
+				remote-endpoint = <&lcd_0>;
+			};
+		};
+		panel-timing {
+			clock-frequency = <0>;
+			hactive = <0>;
+			vactive = <0>;
+			hfront-porch = <0>;
+			hback-porch = <0>;
+			hsync-len = <0>;
+			vfront-porch = <0>;
+			vback-porch = <0>;
+			vsync-len = <0>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <0>;
+			pixelclk-active = <0>;
+			syncclk-active = <0>;
+		};
+	};
+};
+
+&lcdc {
+	port {
+		lcd_0: endpoint@0 {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};

-- 
2.43.0


