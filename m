Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA36FF761
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 03:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfKQCly (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Nov 2019 21:41:54 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49414 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfKQClx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Nov 2019 21:41:53 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 377B228FA56
Received: by earth.universe (Postfix, from userid 1000)
        id 4A6173C0CAE; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
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
Subject: [RFCv1 34/42] drm/omap: dsi: implement check timings
Date:   Sun, 17 Nov 2019 03:40:20 +0100
Message-Id: <20191117024028.2233-35-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
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
index 754815068927..1b57f516618a 100644
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
2.24.0

