Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C19E3561F
	for <lists+linux-omap@lfdr.de>; Wed,  5 Jun 2019 07:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfFEFHP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Jun 2019 01:07:15 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:26065 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfFEFHP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Jun 2019 01:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559711232;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Vi8XPkzvs3rsYu99yfQYh/pogLXeP+Q04MJbkT2ESyM=;
        b=XR47Q+0+US67RLuEE55YWEx0PNlgMKTn7ifN6Wbe90e8qdDqU23RGZAJx8H+6x7+w1
        9Ll4AOZUqe/3fZd7+brkaHkG/bUE44UsGa5H37peA7uwiSnCrYv5qc3PYOgNhMOCrpHP
        AIlH+rjwE9oWXr2nM/0LVo+sKUnQBpNSqyPfY69yEDlaDKMmsZ0GPsdXkaWEGUYw0miL
        nOXKt4rUnwyZ6qi0OqH1ZJg7RmZJtaLsF+7sC1zRgQ2KALmg6FGAHpRdaQf/N/PGk2nK
        qzsux1vhr97Exj360ZsywlXsJnJQDYlpkjhng79d5JbzEzTODjr6lqD8uf9I0KuVsfpt
        f6zA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2MzN9Qq6uM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
        with ESMTPSA id i01b98v55575A1C
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 5 Jun 2019 07:07:05 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
        imirkin@alum.mit.edu, marek.belisko@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, letux-kernel@openphoenux.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 2/2] drm/panel: simple: Add Ortustech COM37H3M panel support
Date:   Wed,  5 Jun 2019 07:07:03 +0200
Message-Id: <43b47034b618cff26cea0484591c6deafb7f0685.1559711222.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559711222.git.hns@goldelico.com>
References: <cover.1559711222.git.hns@goldelico.com>
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

