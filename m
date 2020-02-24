Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 102E216B576
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728308AbgBXX2b (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:28:31 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60436 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727957AbgBXX2a (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:28:30 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id E9EDE2962FA
Received: by earth.universe (Postfix, from userid 1000)
        id 705AA3C0CA8; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
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
Subject: [PATCHv2 37/56] drm/omap: dsi: implement check timings
Date:   Tue, 25 Feb 2020 00:21:07 +0100
Message-Id: <20200224232126.3385250-38-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Implement check timings, which will check if its possible to
configure the clocks for the provided mode using the same code
as the set_config() hook.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 70 +++++++++++++++++++------------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index a399d6857c0d..acbfffe83b3e 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -283,6 +283,11 @@ struct dsi_isr_tables {
 	struct dsi_isr_data isr_table_cio[DSI_MAX_NR_ISRS];
 };
 
+struct dsi_lp_clock_info {
+	unsigned long lp_clk;
+	u16 lp_clk_div;
+};
+
 struct dsi_clk_calc_ctx {
 	struct dsi_data *dsi;
 	struct dss_pll *pll;
@@ -297,16 +302,12 @@ struct dsi_clk_calc_ctx {
 
 	struct dss_pll_clock_info dsi_cinfo;
 	struct dispc_clock_info dispc_cinfo;
+	struct dsi_lp_clock_info user_lp_cinfo;
 
 	struct videomode vm;
 	struct omap_dss_dsi_videomode_timings dsi_vm;
 };
 
-struct dsi_lp_clock_info {
-	unsigned long lp_clk;
-	u16 lp_clk_div;
-};
-
 struct dsi_module_id_data {
 	u32 address;
 	int id;
@@ -4794,44 +4795,55 @@ static bool dsi_is_video_mode(struct omap_dss_device *dssdev)
 	return (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE);
 }
 
-static int dsi_set_config(struct omap_dss_device *dssdev,
-		const struct drm_display_mode *mode)
+static int __dsi_calc_config(struct dsi_data *dsi,
+		const struct drm_display_mode *mode,
+		struct dsi_clk_calc_ctx *ctx)
 {
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-	struct dsi_clk_calc_ctx ctx;
-	struct videomode vm;
 	struct omap_dss_dsi_config cfg = dsi->config;
+	struct videomode vm;
 	bool ok;
 	int r;
 
 	drm_display_mode_to_videomode(mode, &vm);
-	cfg.vm = &vm;
-
-	mutex_lock(&dsi->lock);
 
+	cfg.vm = &vm;
 	cfg.mode = dsi->mode;
 	cfg.pixel_format = dsi->pix_fmt;
 
 	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE)
-		ok = dsi_vm_calc(dsi, &cfg, &ctx);
+		ok = dsi_vm_calc(dsi, &cfg, ctx);
 	else
-		ok = dsi_cm_calc(dsi, &cfg, &ctx);
+		ok = dsi_cm_calc(dsi, &cfg, ctx);
 
-	if (!ok) {
-		DSSERR("failed to find suitable DSI clock settings\n");
-		r = -EINVAL;
-		goto err;
-	}
+	if (!ok)
+		return -EINVAL;
+
+	dsi_pll_calc_dsi_fck(dsi, &ctx->dsi_cinfo);
 
-	dsi_pll_calc_dsi_fck(dsi, &ctx.dsi_cinfo);
+	r = dsi_lp_clock_calc(ctx->dsi_cinfo.clkout[HSDIV_DSI],
+		cfg.lp_clk_min, cfg.lp_clk_max, &ctx->user_lp_cinfo);
+	if (r)
+		return r;
+
+	return 0;
+}
 
-	r = dsi_lp_clock_calc(ctx.dsi_cinfo.clkout[HSDIV_DSI],
-		cfg.lp_clk_min, cfg.lp_clk_max, &dsi->user_lp_cinfo);
+static int dsi_set_config(struct omap_dss_device *dssdev,
+		const struct drm_display_mode *mode)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+	struct dsi_clk_calc_ctx ctx;
+	int r;
+
+	mutex_lock(&dsi->lock);
+
+	r = __dsi_calc_config(dsi, mode, &ctx);
 	if (r) {
-		DSSERR("failed to find suitable DSI LP clock settings\n");
+		DSSERR("failed to find suitable DSI clock settings\n");
 		goto err;
 	}
 
+	dsi->user_lp_cinfo = ctx.user_lp_cinfo;
 	dsi->user_dsi_cinfo = ctx.dsi_cinfo;
 	dsi->user_dispc_cinfo = ctx.dispc_cinfo;
 
@@ -5008,11 +5020,17 @@ static void dsi_set_timings(struct omap_dss_device *dssdev,
 static int dsi_check_timings(struct omap_dss_device *dssdev,
 			     struct drm_display_mode *mode)
 {
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+	struct dsi_clk_calc_ctx ctx;
+	int r;
+
 	DSSDBG("dsi_check_timings\n");
 
-	/* TODO */
+	mutex_lock(&dsi->lock);
+	r = __dsi_calc_config(dsi, mode, &ctx);
+	mutex_unlock(&dsi->lock);
 
-	return 0;
+	return r;
 }
 
 static int dsi_connect(struct omap_dss_device *src,
-- 
2.25.0

