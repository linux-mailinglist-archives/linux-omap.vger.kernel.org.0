Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE4E3476B
	for <lists+linux-omap@lfdr.de>; Tue,  4 Jun 2019 14:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfFDM7x (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Jun 2019 08:59:53 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:33676 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfFDM7x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Jun 2019 08:59:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559653191;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=VdoUWsvZWV89sTtg0Ev9avLZKnfeDC7oajjC1QE6iiQ=;
        b=N+DfWz19hvsZEx4l8glOQTv0RficQxRKbtOrUeUTRfUw4TT0zBKsyyb0KnrId/Y8U+
        oFHT+p7+R9IUDNECLR1sIBWbCmxmnYPM4aTi4pfUG4e5f2pscXCfth4VTgwooxvNRX4+
        jijJ31lDdUPCm4Xqwqn4XJFJu99vm+hsL2oL1Wv4pX7cLE6+2Ib6aBLzByDm7vNdJVLS
        AQeQC9H1W4Z6NTmiZ0HABLu8Y7vpuadAR6n/PWuJQviLYzxetxrKc1sDvRTTtP5wYM6m
        heYJdNH8XFePhTowhpk2TY0/lJN676FigcYJrv5kVzXduTENZaODSj6+o29TTFKsbzj8
        QgAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzTh/eDM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
        with ESMTPSA id i01b98v54Cra7YB
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 4 Jun 2019 14:53:36 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
        marek.belisko@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 1/2] drm/panel: simple: Add Sharp LQ070Y3DG3B panel support
Date:   Tue,  4 Jun 2019 14:53:33 +0200
Message-Id: <9eb82ea247a8c3ab5198976d45c599375815c4c1.1559652814.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559652814.git.hns@goldelico.com>
References: <cover.1559652814.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The change adds support for the Sharp LQ070Y3DG3B 7.0" TFT LCD panel.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 569be4efd8d1..5b27829c5a78 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2204,6 +2204,33 @@ static const struct panel_desc samsung_ltn140at29_301 = {
 	},
 };
 
+static const struct drm_display_mode sharp_lq070y3dg3b_mode = {
+	.clock = 33260,
+	.hdisplay = 800,
+	.hsync_start = 800 + 64,
+	.hsync_end = 800 + 64 + 128,
+	.htotal = 800 + 64 + 128 + 64,
+	.vdisplay = 480,
+	.vsync_start = 480 + 8,
+	.vsync_end = 480 + 8 + 2,
+	.vtotal = 480 + 8 + 2 + 35,
+	.vrefresh = 60,
+	.flags = DISPLAY_FLAGS_PIXDATA_POSEDGE,
+};
+
+static const struct panel_desc sharp_lq070y3dg3b = {
+	.modes = &sharp_lq070y3dg3b_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 152,	/* 152.4mm */
+		.height = 91,	/* 91.4mm */
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE |
+		     DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
+};
+
 static const struct drm_display_mode sharp_lq035q7db03_mode = {
 	.clock = 5500,
 	.hdisplay = 240,
@@ -2786,6 +2813,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "sharp,lq035q7db03",
 		.data = &sharp_lq035q7db03,
+	}, {
+		.compatible = "sharp,lq070y3dg3b",
+		.data = &sharp_lq070y3dg3b,
 	}, {
 		.compatible = "sharp,lq101k1ly04",
 		.data = &sharp_lq101k1ly04,
-- 
2.19.1

