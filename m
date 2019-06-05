Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1271835620
	for <lists+linux-omap@lfdr.de>; Wed,  5 Jun 2019 07:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfFEFHW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Jun 2019 01:07:22 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:17788 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfFEFHV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Jun 2019 01:07:21 -0400
X-Greylist: delayed 58243 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Jun 2019 01:07:20 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559711238;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=7/qIHPW7YK3E/1WVa6JBhancuqJUkFLGU+ia6pFayDE=;
        b=PEL0/EtW16UwjOZruWGSON1tYF3wyesCAQ5P6r6GovitFSOfA4RtCWVQHmC5dQDE8G
        imBOCz5spDhARWpo1nZCkRvG/OykztHxLLwnr3Um9XNBS+Fjs+IMOLd7pDhZKpbt3D0j
        Skl7PozcwyAAM8KR4E6iHbBi8+adI4QNrj4HqEHmPAswHG3Mc94VLn24COF9r8C1VFHe
        6lwGqvon7srUzzNuXG67ZPndN4o9CLT8IW18nV9sRVw1KH5s9jXrcXhjx6wUKfhbuXwY
        qOu4jR6Ihyac3BuDrnU+eQGZqTLhJCdn++VKQ2GHe68INrq3icmkDyhDOubZamkNhibz
        ycOA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2MzN9Qq6uM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
        with ESMTPSA id i01b98v55574A1B
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 5 Jun 2019 07:07:04 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
        imirkin@alum.mit.edu, marek.belisko@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, letux-kernel@openphoenux.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 1/2] drm/panel: simple: Add Sharp LQ070Y3DG3B panel support
Date:   Wed,  5 Jun 2019 07:07:02 +0200
Message-Id: <d16aaa1ac93e4f15c13cd7d621de95836257676a.1559711222.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559711222.git.hns@goldelico.com>
References: <cover.1559711222.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The change adds support for the Sharp LQ070Y3DG3B 7.0" TFT LCD panel.

Tested on Letux7004.

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

