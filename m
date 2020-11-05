Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0162A7E3F
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 13:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730797AbgKEMGL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 07:06:11 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42980 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730466AbgKEMGL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 07:06:11 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C65AH057275;
        Thu, 5 Nov 2020 06:06:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604577965;
        bh=6byjIuTnTFKnRgyuzB9kDvPNHkUXy83QhIMtKXj3iZU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vlRpnUY5dP3t0z6scs14czgolqMMCeuVKhcCyKPDReKxOiXiJjuZ+mEjo6tPH+aX9
         C516Lw6gtEe6wAS00p9fxoAaAjRyHxtD6LYy1XQseQOlrXybI1g6XxkLJMEXm0jB6m
         fWN++j5gHjj5AD8rcGsWE7xY01E/yJoyZPfbmjAE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C64RL074443
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 06:06:05 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:06:05 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:06:05 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfp039111;
        Thu, 5 Nov 2020 06:06:03 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 53/56] drm/omap: remove unused display.c
Date:   Thu, 5 Nov 2020 14:03:30 +0200
Message-ID: <20201105120333.947408-54-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105120333.947408-1-tomi.valkeinen@ti.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The functions in display.c are not used, so drop the file.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
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

