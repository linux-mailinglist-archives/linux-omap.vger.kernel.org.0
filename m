Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896F02D2B09
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 13:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbgLHMb7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 07:31:59 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33584 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgLHMb7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 07:31:59 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CUFrG064458;
        Tue, 8 Dec 2020 06:30:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607430615;
        bh=gNibhHmhmm280Exi6fNzOhQxjRTtq8Z/CO4VNiJdAQA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=I336aHrPbUYHd4Yt3SLSz+VVCUeM8AcQwbk8GuPCGqxKzP4Svv5Gv8KyXjP2aZXyh
         ZSroKlfIIhGcvstn60m3Nj75IM0i14a1e9J6FJqjCBdX8ImoSx6mHYijXm808s97Hk
         6yGmYZSPu4VLyj9WOQ9sFaMcv1Akv+Jv+IQERnHs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CUFbn087951
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 06:30:15 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:30:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:30:14 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjR095068;
        Tue, 8 Dec 2020 06:30:12 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-omap@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v5 13/29] drm/omap: dsi: skip dsi_vc_enable_hs when already in correct mode
Date:   Tue, 8 Dec 2020 14:28:39 +0200
Message-ID: <20201208122855.254819-14-tomi.valkeinen@ti.com>
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

Simplify and optimize dsi_vc_enable_hs() so that it can be called
without checking the current HS/LP mode. Make dsi_vc_enable_hs() return
if the VC is already in the correct mode.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index a1f3623f45b1..544f5f1eed91 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -341,7 +341,6 @@ struct dsi_data {
 	int irq;
 
 	bool is_enabled;
-	bool in_lp_mode;
 
 	struct clk *dss_clk;
 	struct regmap *syscon;
@@ -2441,6 +2440,9 @@ static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
 
 	DSSDBG("dsi_vc_enable_hs(%d, %d)\n", vc, enable);
 
+	if (REG_GET(dsi, DSI_VC_CTRL(vc), 9, 9) == enable)
+		return;
+
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
 	dsi_vc_enable(dsi, vc, 0);
@@ -2456,8 +2458,6 @@ static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
 	/* start the DDR clock by sending a NULL packet */
 	if (dsi->vm_timings.ddr_clk_always_on && enable)
 		dsi_vc_send_null(dsi, vc, dsi->dsidev->channel);
-
-	dsi->in_lp_mode = !enable;
 }
 
 static void dsi_vc_flush_long_data(struct dsi_data *dsi, int vc)
@@ -4891,9 +4891,7 @@ static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
 	struct omap_dss_device *dssdev = &dsi->output;
 	int r;
 
-	if (!!(msg->flags & MIPI_DSI_MSG_USE_LPM) != dsi->in_lp_mode)
-		dsi_vc_enable_hs(dssdev, vc,
-				 !(msg->flags & MIPI_DSI_MSG_USE_LPM));
+	dsi_vc_enable_hs(dssdev, vc, !(msg->flags & MIPI_DSI_MSG_USE_LPM));
 
 	switch (msg->type) {
 	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

