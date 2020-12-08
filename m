Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B632D2AFC
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 13:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728889AbgLHMbq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 07:31:46 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45614 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgLHMbq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 07:31:46 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CUmPO067379;
        Tue, 8 Dec 2020 06:30:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607430648;
        bh=12n9uBbFRI+BhW6WA14CLvPp6Se4mcgzs8vGJ0TtU3g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Z3If12EyV2mitLZRl+zdoQEk/RB5SzRgk6+gNVrubPOI5RBSlMTwJdmwinDCawAnP
         PxBMfAgj3wSBzH8a/lV8+plK/FcptdYMlCeB61EH6LSlLXrF1mvCeX+9VM6CV8cAzS
         B9LR33Behz+HztSwQ4iD9HgDWT34dEEFTg7WPbE4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CUmcr039437
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 06:30:48 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:30:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:30:48 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcje095068;
        Tue, 8 Dec 2020 06:30:46 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-omap@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v5 26/29] drm/omap: dsi: fix and cleanup ddr_clk_always_on
Date:   Tue, 8 Dec 2020 14:28:52 +0200
Message-ID: <20201208122855.254819-27-tomi.valkeinen@ti.com>
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

The driver ignores MIPI_DSI_CLOCK_NON_CONTINUOUS, and always uses
non-continuous clock.

Fix this by using MIPI_DSI_CLOCK_NON_CONTINUOUS and at the same time,
drop ddr_clk_always_on field which seems pretty useless.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 12 +++++-------
 drivers/gpu/drm/omapdrm/dss/dsi.h |  2 --
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 71de6119d2de..cc8b169b2223 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -1734,11 +1734,10 @@ static int dsi_cio_init(struct dsi_data *dsi)
 
 	dsi_cio_timings(dsi);
 
-	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
-		/* DDR_CLK_ALWAYS_ON */
-		REG_FLD_MOD(dsi, DSI_CLK_CTRL,
-			dsi->vm_timings.ddr_clk_always_on, 13, 13);
-	}
+	/* DDR_CLK_ALWAYS_ON */
+	REG_FLD_MOD(dsi, DSI_CLK_CTRL,
+		    !(dsi->dsidev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS),
+		    13, 13);
 
 	dsi->ulps_enabled = false;
 
@@ -3646,7 +3645,7 @@ static void dsi_setup_dsi_vcs(struct dsi_data *dsi)
 	dsi_force_tx_stop_mode_io(dsi);
 
 	/* start the DDR clock by sending a NULL packet */
-	if (dsi->vm_timings.ddr_clk_always_on)
+	if (!(dsi->dsidev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
 		dsi_vc_send_null(dsi, VC_CMD, dsi->dsidev->channel);
 }
 
@@ -4155,7 +4154,6 @@ static bool dsi_vm_calc_blanking(struct dsi_clk_calc_ctx *ctx)
 	dsi_vm->hfp_blanking_mode = 1;
 	dsi_vm->hbp_blanking_mode = 1;
 
-	dsi_vm->ddr_clk_always_on = cfg->ddr_clk_always_on;
 	dsi_vm->window_sync = 4;
 
 	/* setup DISPC videomode */
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.h b/drivers/gpu/drm/omapdrm/dss/dsi.h
index 478fc10bd18d..476069fda082 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.h
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.h
@@ -212,7 +212,6 @@ struct omap_dss_dsi_videomode_timings {
 
 	enum omap_dss_dsi_trans_mode trans_mode;
 
-	bool ddr_clk_always_on;
 	int window_sync;
 };
 
@@ -224,7 +223,6 @@ struct omap_dss_dsi_config {
 	unsigned long hs_clk_min, hs_clk_max;
 	unsigned long lp_clk_min, lp_clk_max;
 
-	bool ddr_clk_always_on;
 	enum omap_dss_dsi_trans_mode trans_mode;
 };
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

