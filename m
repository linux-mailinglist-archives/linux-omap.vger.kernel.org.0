Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D0A2D2B03
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 13:32:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgLHMb4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 07:31:56 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45728 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgLHMb4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 07:31:56 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CUuYQ067414;
        Tue, 8 Dec 2020 06:30:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607430656;
        bh=9Q1t/5Jdu4RsuiwMbUADZq1GNwGUwMd/nTDALTi1oo4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=P+N90rhtiC5qf1veFIrCJjrb/chL9GZvZduOmFWs7bg0CE9xxKxqNOuhVnwcL5TNv
         D1nLKpnl9+GKzvJ7XS2XoyB/+xRUqAMoCLC8aSVof097V0zm+tMFv5V90B642imdJb
         hlbePXzjmKO32Qf1ojWIpT5i0d6PdvkpWe0qyVrY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CUuga105980
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 06:30:56 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:30:55 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:30:55 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjh095068;
        Tue, 8 Dec 2020 06:30:53 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-omap@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v5 29/29] drm/omap: dsi: allow DSI commands to be sent early
Date:   Tue, 8 Dec 2020 14:28:55 +0200
Message-ID: <20201208122855.254819-30-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208122855.254819-1-tomi.valkeinen@ti.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Panel drivers can send DSI commands in panel's prepare(), which happens
before the bridge's enable() is called. The OMAP DSI driver currently
only sets up the DSI interface at bridge's enable(), so prepare() cannot
be used to send DSI commands.

This patch fixes the issue by making it possible to enable the DSI
interface any time a command is about to be sent. Disabling the
interface is be done via delayed work.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 49 +++++++++++++++++++++++++++----
 drivers/gpu/drm/omapdrm/dss/dsi.h |  3 ++
 2 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 53a64bc91867..34f665aa9a59 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3503,6 +3503,9 @@ static void dsi_enable(struct dsi_data *dsi)
 
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
+	if (WARN_ON(dsi->iface_enabled))
+		return;
+
 	mutex_lock(&dsi->lock);
 
 	r = dsi_runtime_get(dsi);
@@ -3515,6 +3518,8 @@ static void dsi_enable(struct dsi_data *dsi)
 	if (r)
 		goto err_init_dsi;
 
+	dsi->iface_enabled = true;
+
 	mutex_unlock(&dsi->lock);
 
 	return;
@@ -3530,6 +3535,9 @@ static void dsi_disable(struct dsi_data *dsi)
 {
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
+	if (WARN_ON(!dsi->iface_enabled))
+		return;
+
 	mutex_lock(&dsi->lock);
 
 	dsi_sync_vc(dsi, 0);
@@ -3541,6 +3549,8 @@ static void dsi_disable(struct dsi_data *dsi)
 
 	dsi_runtime_put(dsi);
 
+	dsi->iface_enabled = false;
+
 	mutex_unlock(&dsi->lock);
 }
 
@@ -4229,10 +4239,12 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 
 	dsi_bus_lock(dsi);
 
-	if (dsi->video_enabled)
-		r = _omap_dsi_host_transfer(dsi, vc, msg);
-	else
-		r = -EIO;
+	if (!dsi->iface_enabled) {
+		dsi_enable(dsi);
+		schedule_delayed_work(&dsi->dsi_disable_work, msecs_to_jiffies(2000));
+	}
+
+	r = _omap_dsi_host_transfer(dsi, vc, msg);
 
 	dsi_bus_unlock(dsi);
 
@@ -4397,6 +4409,14 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
 	if (WARN_ON(dsi->dsidev != client))
 		return -EINVAL;
 
+	cancel_delayed_work_sync(&dsi->dsi_disable_work);
+
+	if (dsi->iface_enabled) {
+		dsi_bus_lock(dsi);
+		dsi_disable(dsi);
+		dsi_bus_unlock(dsi);
+	}
+
 	omap_dsi_unregister_te_irq(dsi);
 	dsi->dsidev = NULL;
 	return 0;
@@ -4632,9 +4652,12 @@ static void dsi_bridge_enable(struct drm_bridge *bridge)
 	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
 	struct omap_dss_device *dssdev = &dsi->output;
 
+	cancel_delayed_work_sync(&dsi->dsi_disable_work);
+
 	dsi_bus_lock(dsi);
 
-	dsi_enable(dsi);
+	if (!dsi->iface_enabled)
+		dsi_enable(dsi);
 
 	dsi_enable_video_output(dssdev, VC_VIDEO);
 
@@ -4648,6 +4671,8 @@ static void dsi_bridge_disable(struct drm_bridge *bridge)
 	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
 	struct omap_dss_device *dssdev = &dsi->output;
 
+	cancel_delayed_work_sync(&dsi->dsi_disable_work);
+
 	dsi_bus_lock(dsi);
 
 	dsi->video_enabled = false;
@@ -4840,6 +4865,18 @@ static const struct soc_device_attribute dsi_soc_devices[] = {
 	{ /* sentinel */ }
 };
 
+static void omap_dsi_disable_work_callback(struct work_struct *work)
+{
+	struct dsi_data *dsi = container_of(work, struct dsi_data, dsi_disable_work.work);
+
+	dsi_bus_lock(dsi);
+
+	if (dsi->iface_enabled && !dsi->video_enabled)
+		dsi_disable(dsi);
+
+	dsi_bus_unlock(dsi);
+}
+
 static int dsi_probe(struct platform_device *pdev)
 {
 	const struct soc_device_attribute *soc;
@@ -4873,6 +4910,8 @@ static int dsi_probe(struct platform_device *pdev)
 	INIT_DEFERRABLE_WORK(&dsi->framedone_timeout_work,
 			     dsi_framedone_timeout_work_callback);
 
+	INIT_DEFERRABLE_WORK(&dsi->dsi_disable_work, omap_dsi_disable_work_callback);
+
 #ifdef DSI_CATCH_MISSING_TE
 	timer_setup(&dsi->te_timer, dsi_te_timeout, 0);
 #endif
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.h b/drivers/gpu/drm/omapdrm/dss/dsi.h
index de9411067ba2..601707c0ecc4 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.h
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.h
@@ -394,6 +394,7 @@ struct dsi_data {
 	atomic_t do_ext_te_update;
 
 	bool te_enabled;
+	bool iface_enabled;
 	bool video_enabled;
 
 	struct delayed_work framedone_timeout_work;
@@ -443,6 +444,8 @@ struct dsi_data {
 
 	struct omap_dss_device output;
 	struct drm_bridge bridge;
+
+	struct delayed_work dsi_disable_work;
 };
 
 struct dsi_packet_sent_handler_data {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

