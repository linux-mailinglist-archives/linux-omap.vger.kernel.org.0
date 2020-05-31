Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27FCE1E9A20
	for <lists+linux-omap@lfdr.de>; Sun, 31 May 2020 21:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgEaTkL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 31 May 2020 15:40:11 -0400
Received: from muru.com ([72.249.23.125]:56390 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725991AbgEaTkL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 31 May 2020 15:40:11 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 111738126;
        Sun, 31 May 2020 19:40:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 1/5] drm/omap: Fix suspend resume regression after platform data removal
Date:   Sun, 31 May 2020 12:39:37 -0700
Message-Id: <20200531193941.13179-2-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531193941.13179-1-tony@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When booting without legacy platform data, we no longer have omap_device
calling PM runtime suspend for us on suspend. This causes the driver
context not be saved as we have no suspend and resume functions defined.

Let's fix the issue by switching over to use UNIVERSAL_DEV_PM_OPS as it
will call the existing PM runtime suspend functions on suspend.

Fixes: cef766300353 ("drm/omap: Prepare DSS for probing without legacy platform data")
Reported-by: Faiz Abbas <faiz_abbas@ti.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c      | 6 ++----
 drivers/gpu/drm/omapdrm/dss/dsi.c        | 6 ++----
 drivers/gpu/drm/omapdrm/dss/dss.c        | 6 ++----
 drivers/gpu/drm/omapdrm/dss/venc.c       | 6 ++----
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 4 +---
 5 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -4933,10 +4933,8 @@ static int dispc_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops dispc_pm_ops = {
-	.runtime_suspend = dispc_runtime_suspend,
-	.runtime_resume = dispc_runtime_resume,
-};
+static UNIVERSAL_DEV_PM_OPS(dispc_pm_ops, dispc_runtime_suspend,
+			    dispc_runtime_resume, NULL);
 
 struct platform_driver omap_dispchw_driver = {
 	.probe		= dispc_probe,
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5464,10 +5464,8 @@ static int dsi_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops dsi_pm_ops = {
-	.runtime_suspend = dsi_runtime_suspend,
-	.runtime_resume = dsi_runtime_resume,
-};
+static UNIVERSAL_DEV_PM_OPS(dsi_pm_ops, dsi_runtime_suspend,
+			    dsi_runtime_resume, NULL);
 
 struct platform_driver omap_dsihw_driver = {
 	.probe		= dsi_probe,
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1611,10 +1611,8 @@ static int dss_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops dss_pm_ops = {
-	.runtime_suspend = dss_runtime_suspend,
-	.runtime_resume = dss_runtime_resume,
-};
+static UNIVERSAL_DEV_PM_OPS(dss_pm_ops, dss_runtime_suspend,
+			    dss_runtime_resume, NULL);
 
 struct platform_driver omap_dsshw_driver = {
 	.probe		= dss_probe,
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -942,10 +942,8 @@ static int venc_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops venc_pm_ops = {
-	.runtime_suspend = venc_runtime_suspend,
-	.runtime_resume = venc_runtime_resume,
-};
+static UNIVERSAL_DEV_PM_OPS(venc_pm_ops, venc_runtime_suspend,
+			    venc_runtime_resume, NULL);
 
 static const struct of_device_id venc_of_match[] = {
 	{ .compatible = "ti,omap2-venc", },
diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -1169,7 +1169,6 @@ int tiler_map_show(struct seq_file *s, void *arg)
 }
 #endif
 
-#ifdef CONFIG_PM_SLEEP
 static int omap_dmm_resume(struct device *dev)
 {
 	struct tcm_area area;
@@ -1193,9 +1192,8 @@ static int omap_dmm_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(omap_dmm_pm_ops, NULL, omap_dmm_resume);
+static UNIVERSAL_DEV_PM_OPS(omap_dmm_pm_ops, NULL, omap_dmm_resume, NULL);
 
 #if defined(CONFIG_OF)
 static const struct dmm_platform_data dmm_omap4_platform_data = {
-- 
2.26.2
