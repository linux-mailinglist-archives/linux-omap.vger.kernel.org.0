Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF892C2622
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387671AbgKXMrK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:47:10 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55186 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387656AbgKXMrJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:47:09 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCl18o123578;
        Tue, 24 Nov 2020 06:47:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222021;
        bh=uR883z6A4dTNkzMvbvDe7F2OzEHKUR54P9yp2pTjbfc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Ep1xEyFic6dDlfRp/LEpMl9ti7+A60jy4H8uZQ+ykSuFxmQgsEH+VWlImRxTCiRKN
         DGnzRo9RaQlb6JYFbMobN9k5XbfNdUDul9g3pfYWZru+Bi+r/KlOnwy0ojfJOlnxNA
         NkHaEtxl9UJzpuDwbxUtcr5sediX+z+PgRAPFnH0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCl1cD106685
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:47:01 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:47:00 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:47:00 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpH040922;
        Tue, 24 Nov 2020 06:46:58 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 28/80] drm/omap: dsi: do ULPS in host driver
Date:   Tue, 24 Nov 2020 14:44:46 +0200
Message-ID: <20201124124538.660710-29-tomi.valkeinen@ti.com>
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

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Move ULPS handling into the DSI host controller, so that we
no longer need a custom API for the DSI client.

Note that for now ULPS is always disabled.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 266 +-----------------
 drivers/gpu/drm/omapdrm/dss/dsi.c             |  71 +++--
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |   2 -
 3 files changed, 60 insertions(+), 279 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index c6c237d15939..bd115d601f04 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -16,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/sched/signal.h>
 #include <linux/slab.h>
-#include <linux/workqueue.h>
 #include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
 
@@ -66,22 +65,12 @@ struct panel_drv_data {
 	bool enabled;
 
 	bool intro_printed;
-
-	struct workqueue_struct *workqueue;
-
-	bool ulps_enabled;
-	unsigned int ulps_timeout;
-	struct delayed_work ulps_work;
 };
 
 #define to_panel_data(p) container_of(p, struct panel_drv_data, dssdev)
 
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable);
 
-static int dsicm_panel_reset(struct panel_drv_data *ddata);
-
-static void dsicm_ulps_work(struct work_struct *work);
-
 static void dsicm_bl_power(struct panel_drv_data *ddata, bool enable)
 {
 	struct backlight_device *backlight;
@@ -205,94 +194,6 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata,
 	return 0;
 }
 
-static void dsicm_queue_ulps_work(struct panel_drv_data *ddata)
-{
-	if (ddata->ulps_timeout > 0)
-		queue_delayed_work(ddata->workqueue, &ddata->ulps_work,
-				msecs_to_jiffies(ddata->ulps_timeout));
-}
-
-static void dsicm_cancel_ulps_work(struct panel_drv_data *ddata)
-{
-	cancel_delayed_work(&ddata->ulps_work);
-}
-
-static int dsicm_enter_ulps(struct panel_drv_data *ddata)
-{
-	struct omap_dss_device *src = ddata->src;
-	int r;
-
-	if (ddata->ulps_enabled)
-		return 0;
-
-	dsicm_cancel_ulps_work(ddata);
-
-	r = _dsicm_enable_te(ddata, false);
-	if (r)
-		goto err;
-
-	src->ops->dsi.ulps(src, true);
-
-	ddata->ulps_enabled = true;
-
-	return 0;
-
-err:
-	dev_err(&ddata->dsi->dev, "enter ULPS failed");
-	dsicm_panel_reset(ddata);
-
-	ddata->ulps_enabled = false;
-
-	dsicm_queue_ulps_work(ddata);
-
-	return r;
-}
-
-static int dsicm_exit_ulps(struct panel_drv_data *ddata)
-{
-	struct omap_dss_device *src = ddata->src;
-	int r;
-
-	if (!ddata->ulps_enabled)
-		return 0;
-
-	src->ops->dsi.ulps(src, false);
-	ddata->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-
-	r = _dsicm_enable_te(ddata, true);
-	if (r) {
-		dev_err(&ddata->dsi->dev, "failed to re-enable TE");
-		goto err2;
-	}
-
-	dsicm_queue_ulps_work(ddata);
-
-	ddata->ulps_enabled = false;
-
-	return 0;
-
-err2:
-	dev_err(&ddata->dsi->dev, "failed to exit ULPS");
-
-	r = dsicm_panel_reset(ddata);
-	if (!r)
-		ddata->ulps_enabled = false;
-
-	dsicm_queue_ulps_work(ddata);
-
-	return r;
-}
-
-static int dsicm_wake_up(struct panel_drv_data *ddata)
-{
-	if (ddata->ulps_enabled)
-		return dsicm_exit_ulps(ddata);
-
-	dsicm_cancel_ulps_work(ddata);
-	dsicm_queue_ulps_work(ddata);
-	return 0;
-}
-
 static int dsicm_bl_update_status(struct backlight_device *dev)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
@@ -310,7 +211,6 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 	mutex_lock(&ddata->lock);
 
 	if (ddata->enabled) {
-		r = dsicm_wake_up(ddata);
 		if (!r)
 			r = dsicm_dcs_write_1(
 				ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
@@ -340,18 +240,12 @@ static ssize_t dsicm_num_errors_show(struct device *dev,
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 	u8 errors = 0;
-	int r;
+	int r = -ENODEV;
 
 	mutex_lock(&ddata->lock);
 
-	if (ddata->enabled) {
-		r = dsicm_wake_up(ddata);
-		if (!r)
-			r = dsicm_dcs_read_1(ddata, DCS_READ_NUM_ERRORS,
-					&errors);
-	} else {
-		r = -ENODEV;
-	}
+	if (ddata->enabled)
+		r = dsicm_dcs_read_1(ddata, DCS_READ_NUM_ERRORS, &errors);
 
 	mutex_unlock(&ddata->lock);
 
@@ -366,17 +260,12 @@ static ssize_t dsicm_hw_revision_show(struct device *dev,
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 	u8 id1, id2, id3;
-	int r;
+	int r = -ENODEV;
 
 	mutex_lock(&ddata->lock);
 
-	if (ddata->enabled) {
-		r = dsicm_wake_up(ddata);
-		if (!r)
-			r = dsicm_get_id(ddata, &id1, &id2, &id3);
-	} else {
-		r = -ENODEV;
-	}
+	if (ddata->enabled)
+		r = dsicm_get_id(ddata, &id1, &id2, &id3);
 
 	mutex_unlock(&ddata->lock);
 
@@ -386,103 +275,12 @@ static ssize_t dsicm_hw_revision_show(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x\n", id1, id2, id3);
 }
 
-static ssize_t dsicm_store_ulps(struct device *dev,
-		struct device_attribute *attr,
-		const char *buf, size_t count)
-{
-	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	unsigned long t;
-	int r;
-
-	r = kstrtoul(buf, 0, &t);
-	if (r)
-		return r;
-
-	mutex_lock(&ddata->lock);
-
-	if (ddata->enabled) {
-		if (t)
-			r = dsicm_enter_ulps(ddata);
-		else
-			r = dsicm_wake_up(ddata);
-	}
-
-	mutex_unlock(&ddata->lock);
-
-	if (r)
-		return r;
-
-	return count;
-}
-
-static ssize_t dsicm_show_ulps(struct device *dev,
-		struct device_attribute *attr,
-		char *buf)
-{
-	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	unsigned int t;
-
-	mutex_lock(&ddata->lock);
-	t = ddata->ulps_enabled;
-	mutex_unlock(&ddata->lock);
-
-	return snprintf(buf, PAGE_SIZE, "%u\n", t);
-}
-
-static ssize_t dsicm_store_ulps_timeout(struct device *dev,
-		struct device_attribute *attr,
-		const char *buf, size_t count)
-{
-	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	unsigned long t;
-	int r;
-
-	r = kstrtoul(buf, 0, &t);
-	if (r)
-		return r;
-
-	mutex_lock(&ddata->lock);
-	ddata->ulps_timeout = t;
-
-	if (ddata->enabled) {
-		/* dsicm_wake_up will restart the timer */
-		r = dsicm_wake_up(ddata);
-	}
-
-	mutex_unlock(&ddata->lock);
-
-	if (r)
-		return r;
-
-	return count;
-}
-
-static ssize_t dsicm_show_ulps_timeout(struct device *dev,
-		struct device_attribute *attr,
-		char *buf)
-{
-	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	unsigned int t;
-
-	mutex_lock(&ddata->lock);
-	t = ddata->ulps_timeout;
-	mutex_unlock(&ddata->lock);
-
-	return snprintf(buf, PAGE_SIZE, "%u\n", t);
-}
-
 static DEVICE_ATTR(num_dsi_errors, S_IRUGO, dsicm_num_errors_show, NULL);
 static DEVICE_ATTR(hw_revision, S_IRUGO, dsicm_hw_revision_show, NULL);
-static DEVICE_ATTR(ulps, S_IRUGO | S_IWUSR,
-		dsicm_show_ulps, dsicm_store_ulps);
-static DEVICE_ATTR(ulps_timeout, S_IRUGO | S_IWUSR,
-		dsicm_show_ulps_timeout, dsicm_store_ulps_timeout);
 
 static struct attribute *dsicm_attrs[] = {
 	&dev_attr_num_dsi_errors.attr,
 	&dev_attr_hw_revision.attr,
-	&dev_attr_ulps.attr,
-	&dev_attr_ulps_timeout.attr,
 	NULL,
 };
 
@@ -618,15 +416,6 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 	ddata->enabled = false;
 }
 
-static int dsicm_panel_reset(struct panel_drv_data *ddata)
-{
-	dev_err(&ddata->dsi->dev, "performing LCD reset\n");
-
-	dsicm_power_off(ddata);
-	dsicm_hw_reset(ddata);
-	return dsicm_power_on(ddata);
-}
-
 static int dsicm_connect(struct omap_dss_device *src,
 			 struct omap_dss_device *dst)
 {
@@ -668,17 +457,12 @@ static void dsicm_enable(struct omap_dss_device *dssdev)
 static void dsicm_disable(struct omap_dss_device *dssdev)
 {
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	int r;
 
 	dsicm_bl_power(ddata, false);
 
 	mutex_lock(&ddata->lock);
 
-	dsicm_cancel_ulps_work(ddata);
-
-	r = dsicm_wake_up(ddata);
-	if (!r)
-		dsicm_power_off(ddata);
+	dsicm_power_off(ddata);
 
 	mutex_unlock(&ddata->lock);
 }
@@ -701,10 +485,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 
 	mutex_lock(&ddata->lock);
 
-	r = dsicm_wake_up(ddata);
-	if (r)
-		goto err;
-
 	if (!ddata->enabled) {
 		r = 0;
 		goto err;
@@ -745,24 +525,6 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 	return r;
 }
 
-static void dsicm_ulps_work(struct work_struct *work)
-{
-	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
-			ulps_work.work);
-	struct omap_dss_device *dssdev = &ddata->dssdev;
-
-	mutex_lock(&ddata->lock);
-
-	if (dssdev->state != OMAP_DSS_DISPLAY_ACTIVE || !ddata->enabled) {
-		mutex_unlock(&ddata->lock);
-		return;
-	}
-
-	dsicm_enter_ulps(ddata);
-
-	mutex_unlock(&ddata->lock);
-}
-
 static int dsicm_get_modes(struct omap_dss_device *dssdev,
 			   struct drm_connector *connector)
 {
@@ -860,8 +622,6 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 	else
 		ddata->use_dsi_backlight = true;
 
-	/* TODO: ulps */
-
 	return 0;
 }
 
@@ -908,13 +668,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 
 	mutex_init(&ddata->lock);
 
-	ddata->workqueue = create_singlethread_workqueue("dsicm_wq");
-	if (!ddata->workqueue) {
-		r = -ENOMEM;
-		goto err_reg;
-	}
-	INIT_DELAYED_WORK(&ddata->ulps_work, dsicm_ulps_work);
-
 	dsicm_hw_reset(ddata);
 
 	if (ddata->use_dsi_backlight) {
@@ -954,8 +707,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 err_dsi_attach:
 	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
 err_bl:
-	destroy_workqueue(ddata->workqueue);
-err_reg:
 	if (ddata->extbldev)
 		put_device(&ddata->extbldev->dev);
 
@@ -982,9 +733,6 @@ static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
 	if (ddata->extbldev)
 		put_device(&ddata->extbldev->dev);
 
-	dsicm_cancel_ulps_work(ddata);
-	destroy_workqueue(ddata->workqueue);
-
 	/* reset, to be sure that the panel is in a valid state */
 	dsicm_hw_reset(ddata);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index fdbc849c8944..5f120cf0fe4e 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -207,6 +207,8 @@ struct dsi_reg { u16 module; u16 idx; };
 typedef void (*omap_dsi_isr_t) (void *arg, u32 mask);
 struct dsi_data;
 
+static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable);
+
 static int dsi_display_init_dispc(struct dsi_data *dsi);
 static void dsi_display_uninit_dispc(struct dsi_data *dsi);
 
@@ -378,6 +380,9 @@ struct dsi_data {
 
 	bool te_enabled;
 	bool ulps_enabled;
+	bool ulps_auto_idle;
+
+	struct delayed_work ulps_work;
 
 	void (*framedone_callback)(int, void *);
 	void *framedone_data;
@@ -3794,6 +3799,7 @@ static void dsi_handle_framedone(struct dsi_data *dsi, int error)
 		REG_FLD_MOD(dsi, DSI_TIMING2, 1, 15, 15); /* LP_RX_TO */
 	}
 
+	dsi_set_ulps_auto(dsi, true);
 	dsi_bus_unlock(dsi);
 
 	dsi->framedone_callback(error, dsi->framedone_data);
@@ -3856,6 +3862,7 @@ static int dsi_update(struct omap_dss_device *dssdev, int channel,
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 
 	dsi_bus_lock(dsi);
+	dsi_set_ulps_auto(dsi, false);
 
 	dsi->update_channel = channel;
 	dsi->framedone_callback = callback;
@@ -4124,22 +4131,6 @@ static void dsi_display_disable(struct omap_dss_device *dssdev)
 	dsi_bus_unlock(dsi);
 }
 
-static void dsi_ulps(struct omap_dss_device *dssdev, bool enable)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	DSSDBG("dsi_ulps %d\n", enable);
-
-	dsi_bus_lock(dsi);
-
-	if (enable)
-		_dsi_display_disable(dsi, false, true);
-	else
-		_dsi_display_enable(dsi);
-
-	dsi_bus_unlock(dsi);
-}
-
 static int dsi_enable_te(struct dsi_data *dsi, bool enable)
 {
 	dsi->te_enabled = enable;
@@ -4154,6 +4145,42 @@ static int dsi_enable_te(struct dsi_data *dsi, bool enable)
 	return 0;
 }
 
+static void omap_dsi_ulps_work_callback(struct work_struct *work)
+{
+	struct dsi_data *dsi = container_of(work, struct dsi_data,
+					    ulps_work.work);
+
+	dsi_bus_lock(dsi);
+
+	dsi_enable_te(dsi, false);
+
+	_dsi_display_disable(dsi, false, true);
+
+	dsi_bus_unlock(dsi);
+}
+
+static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable)
+{
+	WARN_ON(!dsi_bus_is_locked(dsi));
+
+	if (!dsi->ulps_auto_idle)
+		return;
+
+	if (enable) {
+		schedule_delayed_work(&dsi->ulps_work, msecs_to_jiffies(250));
+	} else {
+		cancel_delayed_work_sync(&dsi->ulps_work);
+
+		if (!dsi->ulps_enabled)
+			return;
+
+		dsi_bus_lock(dsi);
+		_dsi_display_enable(dsi);
+		dsi_enable_te(dsi, true);
+		dsi_bus_unlock(dsi);
+	}
+}
+
 #ifdef PRINT_VERBOSE_VM_TIMINGS
 static void print_dsi_vm(const char *str,
 		const struct omap_dss_dsi_videomode_timings *t)
@@ -4804,7 +4831,9 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 	int r;
 
 	dsi_bus_lock(dsi);
+	dsi_set_ulps_auto(dsi, false);
 	r = _omap_dsi_host_transfer(dsi, msg);
+	dsi_set_ulps_auto(dsi, true);
 	dsi_bus_unlock(dsi);
 
 	return r;
@@ -4844,8 +4873,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 	.disable = dsi_display_disable,
 
 	.dsi = {
-		.ulps = dsi_ulps,
-
 		.set_config = dsi_set_config,
 
 		.enable_video_output = dsi_enable_video_output,
@@ -4974,6 +5001,14 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->vc[channel].dest = client;
 	dsi->pix_fmt = client->format;
 
+	INIT_DEFERRABLE_WORK(&dsi->ulps_work,
+			     omap_dsi_ulps_work_callback);
+
+	dsi_bus_lock(dsi);
+	dsi->ulps_auto_idle = false;
+	dsi_set_ulps_auto(dsi, true);
+	dsi_bus_unlock(dsi);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 0d82ba34ca89..524cb87cd9ea 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -282,8 +282,6 @@ struct omap_dss_writeback_info {
 
 struct omapdss_dsi_ops {
 	/* bus configuration */
-	void (*ulps)(struct omap_dss_device *dssdev, bool enable);
-
 	int (*set_config)(struct omap_dss_device *dssdev,
 			const struct omap_dss_dsi_config *cfg);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

