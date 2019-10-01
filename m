Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87F7AC445F
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 01:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbfJAXjm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 19:39:42 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42841 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbfJAXjm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Oct 2019 19:39:42 -0400
Received: by mail-io1-f68.google.com with SMTP id n197so52561592iod.9;
        Tue, 01 Oct 2019 16:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=58jpN6kWHAdO3tEL+y4lY6rt76msdHq/bsZsGT7F90Q=;
        b=SvSuvufv+gb1Em1YZE/meNqsikAT0bmsrAYxIog97pFs618p0gqm7/afZrcd9pUc33
         5fxADY0uoB818dziQyLsbJ0PoaWJdBqXD007LX4kpdBh+rlYQpKTSkecUrFbmOuchmab
         YJfxmzd2FdhuDAzkRHimZ9xvpg9y/bY74MIQgq5d3uXDPtXfaIbb1QL9wQCz6n6hf6IT
         J9Ng1E8Cf8UWM2bxh8OQUP6yHpZXT9lIy1vdOts7yc52qHM8XB60aSg2jDoFvT+GfSdJ
         X2yJZWJoGLotuCHq0W8w0fAR4ORaz67fnzyRyEKKAfCVhnD4cyJ8TzuceQXvAqNbrj66
         xC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=58jpN6kWHAdO3tEL+y4lY6rt76msdHq/bsZsGT7F90Q=;
        b=MukdRL6FpIYoYypmNQtsC/n7Z7KddeLkMSnhqrBEaVbiI1gxvkH7lc1VprU+TCIMnz
         4bSDV5OMEAHmSC2TQV1C7xjU+rNgdH6OsB9ZpOF+hd56L8T4AUWM2SzbSCht4xy011rj
         Ho36Us2ilLptepGTlxXuE2ZG5gJLR8ax2TCefUTxyc6SKOWIBpyVqdrB6pRSsmDu27Ru
         TQF/nUssdYQVcyDUGdk16wNd+lhaLFrIvZuGUE14S9ipVfI1rzVggDs8WoxBtY075mMl
         OmEWpOE0Kqm8UhX0/Hcmg7vG9al6pTs7VPoQ0KU5PlBXMLn1k89awjLdN5r8FxQV0Lqi
         2fFg==
X-Gm-Message-State: APjAAAUnhLM4xS0UXptoGt//mwnJlQSXLQ94Odes2Ipi+T1w4ppNNtlz
        zclVRXkeGPRUtUlGHRJUCWw=
X-Google-Smtp-Source: APXvYqx/Io8WkCb0T45Vregl4/lp6Yar6RAnWh52hAyGEGPoMLqPDMbZySdWTSgeeIhBx7SWJOXZug==
X-Received: by 2002:a6b:b4c7:: with SMTP id d190mr774996iof.209.1569973181556;
        Tue, 01 Oct 2019 16:39:41 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id r22sm8659935ilb.85.2019.10.01.16.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 16:39:40 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com,
        Adam Ford <aford173@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V4 1/3] drm/panel: simple: Add Logic PD Type 28 display support
Date:   Tue,  1 Oct 2019 18:39:18 -0500
Message-Id: <20191001233923.16514-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Previously, there was an omap panel-dpi driver that would
read generic timings from the device tree and set the display
timing accordingly.  This driver was removed so the screen
no longer functions.  This patch modifies the panel-simple
file to setup the timings to the same values previously used.

Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
V4:  No Change
V3:  No Change
V2:  No Change

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 28fa6ba7b767..8abb31f83ffc 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2048,6 +2048,40 @@ static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
 	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 
+static const struct drm_display_mode logicpd_type_28_mode = {
+	.clock = 9000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 3,
+	.hsync_end = 480 + 3 + 42,
+	.htotal = 480 + 3 + 42 + 2,
+
+	.vdisplay = 272,
+	.vsync_start = 272 + 2,
+	.vsync_end = 272 + 2 + 11,
+	.vtotal = 272 + 2 + 11 + 3,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc logicpd_type_28 = {
+	.modes = &logicpd_type_28_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 105,
+		.height = 67,
+	},
+	.delay = {
+		.prepare = 200,
+		.enable = 200,
+		.unprepare = 200,
+		.disable = 200,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
+		     DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
+};
+
 static const struct panel_desc mitsubishi_aa070mc01 = {
 	.modes = &mitsubishi_aa070mc01_mode,
 	.num_modes = 1,
@@ -3264,6 +3298,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "lg,lp129qe",
 		.data = &lg_lp129qe,
+	}, {
+		.compatible = "logicpd,type28",
+		.data = &logicpd_type_28,
 	}, {
 		.compatible = "mitsubishi,aa070mc01-ca1",
 		.data = &mitsubishi_aa070mc01,
-- 
2.17.1

