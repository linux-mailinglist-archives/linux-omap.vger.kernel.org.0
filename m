Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A15F2C265C
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387686AbgKXMsF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:48:05 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39972 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387695AbgKXMsE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:48:04 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOClvLV033088;
        Tue, 24 Nov 2020 06:47:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222077;
        bh=bABV30UtG+gulBA7fkEFmQDN5GyyLS5bzhgb3Tq1CzY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vtfK7g80RD6SuVfp/lWwC8hNSR3FjhCC/1VUbqlpFXYK5YnfNxdt9ySG82BqNIAqI
         i683j8N4G0Fc1dtppVKR+tACBtLdQoYIrwdD4undI2HokiX5LMND2KF4WGObl8CMjE
         ziIPQFiAxaoRNZfVOsKT5yEPUjhZ0w+NiyVUVpuY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOClvaY044906
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:47:57 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:47:57 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:47:57 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpe040922;
        Tue, 24 Nov 2020 06:47:55 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 51/80] drm/omap: remove unused display.c
Date:   Tue, 24 Nov 2020 14:45:09 +0200
Message-ID: <20201124124538.660710-52-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The functions in display.c are not used, so drop the file.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/Makefile      |  2 +-
 drivers/gpu/drm/omapdrm/dss/display.c | 58 ---------------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  4 --
 3 files changed, 1 insertion(+), 63 deletions(-)
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/display.c

diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
index 33fe7e937680..21e8277ff88f 100644
--- a/drivers/gpu/drm/omapdrm/Makefile
+++ b/drivers/gpu/drm/omapdrm/Makefile
@@ -18,7 +18,7 @@ omapdrm-y := omap_drv.o \
 
 omapdrm-$(CONFIG_DRM_FBDEV_EMULATION) += omap_fbdev.o
 
-omapdrm-y += dss/base.o dss/display.o dss/output.o dss/dss.o dss/dispc.o \
+omapdrm-y += dss/base.o dss/output.o dss/dss.o dss/dispc.o \
 		dss/dispc_coefs.o dss/pll.o dss/video-pll.o
 omapdrm-$(CONFIG_OMAP2_DSS_DPI) += dss/dpi.o
 omapdrm-$(CONFIG_OMAP2_DSS_VENC) += dss/venc.o
diff --git a/drivers/gpu/drm/omapdrm/dss/display.c b/drivers/gpu/drm/omapdrm/dss/display.c
deleted file mode 100644
index 7b7ee2019eae..000000000000
--- a/drivers/gpu/drm/omapdrm/dss/display.c
+++ /dev/null
@@ -1,58 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2009 Nokia Corporation
- * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
- *
- * Some code and ideas taken from drivers/video/omap/ driver
- * by Imre Deak.
- */
-
-#define DSS_SUBSYS_NAME "DISPLAY"
-
-#include <linux/kernel.h>
-#include <linux/of.h>
-
-#include <drm/drm_connector.h>
-#include <drm/drm_modes.h>
-
-#include "omapdss.h"
-
-static int disp_num_counter;
-
-void omapdss_display_init(struct omap_dss_device *dssdev)
-{
-	int id;
-
-	/*
-	 * Note: this presumes that all displays either have an DT alias, or
-	 * none has.
-	 */
-	id = of_alias_get_id(dssdev->dev->of_node, "display");
-	if (id < 0)
-		id = disp_num_counter++;
-
-	/* Use 'label' property for name, if it exists */
-	of_property_read_string(dssdev->dev->of_node, "label", &dssdev->name);
-
-	if (dssdev->name == NULL)
-		dssdev->name = devm_kasprintf(dssdev->dev, GFP_KERNEL,
-					      "display%u", id);
-}
-
-int omapdss_display_get_modes(struct drm_connector *connector,
-			      const struct videomode *vm)
-{
-	struct drm_display_mode *mode;
-
-	mode = drm_mode_create(connector->dev);
-	if (!mode)
-		return 0;
-
-	drm_display_mode_from_videomode(vm, mode);
-
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	drm_mode_set_name(mode);
-	drm_mode_probed_add(connector, mode);
-
-	return 1;
-}
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 4e7ae164de4f..90e41c635e45 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -300,10 +300,6 @@ struct dss_pdata {
 	struct dss_device *dss;
 };
 
-void omapdss_display_init(struct omap_dss_device *dssdev);
-int omapdss_display_get_modes(struct drm_connector *connector,
-			      const struct videomode *vm);
-
 void omapdss_device_register(struct omap_dss_device *dssdev);
 void omapdss_device_unregister(struct omap_dss_device *dssdev);
 struct omap_dss_device *omapdss_device_get(struct omap_dss_device *dssdev);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

