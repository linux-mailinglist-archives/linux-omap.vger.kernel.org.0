Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F74CD92FB
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 15:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392102AbfJPNwP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 09:52:15 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41104 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391962AbfJPNwO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Oct 2019 09:52:14 -0400
Received: by mail-io1-f66.google.com with SMTP id n26so53809895ioj.8;
        Wed, 16 Oct 2019 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=utCDVgVbZ5WjSdZrf9lDYLAzWEhwnZ24Zw+SLge2X/Q=;
        b=NTm6zlZ32eSZNxQ5TRo6LYWQC7jJJNF3MjYWWedy26p/7IPFYjdWNNasmcSOJho1Na
         YKmafUu8hzR21aTYGewjdH9rMvGXw5r0JNn5IjYFdDAnbJTjtnd9dIcF1Mde0aaFI69h
         g9CppfLaqK77qmlX7dQCL6yLpwD/ALftKjB8Y/r+qW9yt9rAiwDtWNPEiQPuPIUsUe+J
         uwE3NMuUIWY6Th0Qjwz21Ox6PIBy77jxAYJzwtRMGFI/vB+gOFeFnxrSk/cz4kjrjZ7P
         y8UWu+9w90IRhrPyTplF+jZQxB6c4pWNHyxu+vGMvcpUsFVlZVMop3/UPkphYRI49TOu
         Rltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=utCDVgVbZ5WjSdZrf9lDYLAzWEhwnZ24Zw+SLge2X/Q=;
        b=oV6qWoFNsLy41Y2EfgL3fQHTqDe2xpLgrK0LFUXrOpfg3Ed2nvMEARRaea7DQwf73n
         8vqWVZps7dqkNLK0bW/cVbFaAFjV53j/B9umzhVVuiCquSvGFz95seUB0aEc6BCB7wBg
         eGMZXmCASRL43J+GvUSaneyEA5U1OTZx4fowQIRg/lRMp8FyUY8WzkRgjvSoBGDxLgaX
         8GQFzqOjXX/gEpiiWSFtMTGifrCgfcLxvaoC/9hutFM3mVk6OpcErThmNCAE+pw7ojY7
         uDERdmCtGqqv7DEzd0j3JyteXH4Xf/Nm4IeLcD97VIGGjHVXxc/u3369hwNxRMV/oY2Q
         qUuQ==
X-Gm-Message-State: APjAAAW4wfIA0GGPL72zghAWNhCpJoy8OADn68KrzaU1Si4E07Ul0eJz
        ke/Uw99mS+pvbd16CyIecU4=
X-Google-Smtp-Source: APXvYqxKHHiKucNI0gkNKLs3b54iLE/Y1m78a8dY5DI5Q5i+Vkenqm2lDHbWmnE7zIvO4FHH3PtqIQ==
X-Received: by 2002:a5d:9c4b:: with SMTP id 11mr7571501iof.240.1571233933273;
        Wed, 16 Oct 2019 06:52:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id e139sm17227545iof.60.2019.10.16.06.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 06:52:12 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V5 1/3] drm/panel: simple: Add Logic PD Type 28 display support
Date:   Wed, 16 Oct 2019 08:51:45 -0500
Message-Id: <20191016135147.7743-1-aford173@gmail.com>
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
V5:  No Change
V4:  No Change
V3:  No Change
V2:  No Change

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5d487686d25c..72f69709f349 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2061,6 +2061,40 @@ static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
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
@@ -3287,6 +3321,9 @@ static const struct of_device_id platform_of_match[] = {
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

