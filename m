Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 847F9388A7
	for <lists+linux-omap@lfdr.de>; Fri,  7 Jun 2019 13:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbfFGLL0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 Jun 2019 07:11:26 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:22244 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbfFGLL0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 7 Jun 2019 07:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559905882;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Vi8XPkzvs3rsYu99yfQYh/pogLXeP+Q04MJbkT2ESyM=;
        b=NK5F3ZKTAC39u8aPycwpBa9wTX/PLkPtIYeX1z8RLEj4cNg6YVVjz2bDQNPOSHYoXu
        x+q0prwdyK3fmOxDkChTuDvARDWeUhjV4jZ+yl6i0EjdGVR+NENcKFE5hP4dAz0LB60S
        jem5ua/4tkDW8z32rJHB+6iAFX18woeESJp8KuVGkb9M66Lh+r7KnJCMwIIJmMATjNzs
        S2l1DaO5+bioro8pi5OEAQKLTXj39m5BteslAPRriGQF1I5xEdGyJABh3msSQqhEctf7
        xxf1CWUcZKPUasbsjtGZizUT7njbjaTecAuYSkM6gwJEzPsjydqdE0GcB7yFtGozJFTf
        ureQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAwkq13LM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
        with ESMTPSA id i01b98v57BBDPaP
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 7 Jun 2019 13:11:13 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
        imirkin@alum.mit.edu, marek.belisko@gmail.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, letux-kernel@openphoenux.org,
        devicetree@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v3 2/5] drm/panel: simple: Add Ortustech COM37H3M panel support
Date:   Fri,  7 Jun 2019 13:11:08 +0200
Message-Id: <43b47034b618cff26cea0484591c6deafb7f0685.1559905870.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559905870.git.hns@goldelico.com>
References: <cover.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The change adds support for the Ortustech COM37H3M05DTC/99DTC 3.7" TFT LCD panel.

Tested on Letux3704.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5b27829c5a78..1fb74908a269 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2007,6 +2007,33 @@ static const struct panel_desc ontat_yx700wv03 = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
+static const struct drm_display_mode ortustech_com37h3m_mode  = {
+	.clock = 22153,
+	.hdisplay = 480,
+	.hsync_start = 480 + 8,
+	.hsync_end = 480 + 8 + 10,
+	.htotal = 480 + 8 + 10 + 10,
+	.vdisplay = 640,
+	.vsync_start = 640 + 4,
+	.vsync_end = 640 + 4 + 3,
+	.vtotal = 640 + 4 + 3 + 4,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc ortustech_com37h3m = {
+	.modes = &ortustech_com37h3m_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 56,	/* 56.16mm */
+		.height = 75,	/* 74.88mm */
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE |
+		     DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
+};
+
 static const struct drm_display_mode ortustech_com43h4m85ulc_mode  = {
 	.clock = 25000,
 	.hdisplay = 480,
@@ -2786,6 +2813,12 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "ontat,yx700wv03",
 		.data = &ontat_yx700wv03,
+	}, {
+		.compatible = "ortustech,com37h3m05dtc",
+		.data = &ortustech_com37h3m,
+	}, {
+		.compatible = "ortustech,com37h3m99dtc",
+		.data = &ortustech_com37h3m,
 	}, {
 		.compatible = "ortustech,com43h4m85ulc",
 		.data = &ortustech_com43h4m85ulc,
-- 
2.19.1

