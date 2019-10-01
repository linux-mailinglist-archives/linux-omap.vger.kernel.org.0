Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B819FC4462
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 01:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729186AbfJAXjs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 19:39:48 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35099 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbfJAXjr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Oct 2019 19:39:47 -0400
Received: by mail-io1-f68.google.com with SMTP id q10so52717260iop.2;
        Tue, 01 Oct 2019 16:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=58jpN6kWHAdO3tEL+y4lY6rt76msdHq/bsZsGT7F90Q=;
        b=njXpQi34vfhyh7iwO6rahe62QnSo0M1oAxex8bd0k/1t+S4y9tOwc3nDjlyR41jcQY
         XzCzCe/pzboMuQb2mFg8LIaxjTt1CAFPq5KOLE90T0Gh1sl8u1ZWKDMPRoF/YW/G2zgg
         HN48O/ipUd8sMGNByVAya2gQD6BUimRlQA6GS/SkfvVblhb0ZtXcJXwqJRC+eDihxl6p
         hEjXbBwUAyDUUT/tB+0w83+6pPf1wi+6BhSm0rX0rmZX4VwHUZLUFC/G+yxWOubF4tUz
         XKV2SIjUukvOW1nhyg13TZEwFIYxtJKze32lmlXDmURTXGLCA0O7+SN1GH37yk09PQMc
         SJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=58jpN6kWHAdO3tEL+y4lY6rt76msdHq/bsZsGT7F90Q=;
        b=RCYw7MmM9ZaAu3CnpqKzSNedq3PrwpN9f1TMsaS3agK+DjVBV0UgW66uZPP9fwzVNc
         uLfo0hqwvIzjkBNWH1cFZPqHcctFV5HAuPkbKTH0TdBr2ow9762Ps827v6NSWvmrB/20
         POnb3BM08c23XKzh2MHTWnBTOQYi+rTIACkpUqFxPcA1nxtaSAN8zxq53vPGor6JzUD5
         zlzGNGjvXjv1+eSw+5ssjumREwUwByCYCvJbI+9H9IC+dbvgw/WI6RsXpSqN+pGWb+vt
         d2SJBEi+rkCPFFUtuTZAlbE2Tutf8prnfrNyYpGVbibYBX8ozYIKwW7nHNrJ066rz2Yd
         HTMQ==
X-Gm-Message-State: APjAAAXlEcBwZHo2xHa2e3IrMnt+5n9f2IBF5MXkwpAjgmjRdEzYIFor
        hmy/cufIKLyvXWJ9oEwWhQE=
X-Google-Smtp-Source: APXvYqyd4i/jvyuu09AoKqKS7BZSL5Lx2vlwLs47lwfq1WhHNEnVsaDlccU3YOT9PlOvIEsQs+40Fw==
X-Received: by 2002:a92:451:: with SMTP id 78mr783955ile.69.1569973186352;
        Tue, 01 Oct 2019 16:39:46 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id r22sm8659935ilb.85.2019.10.01.16.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 16:39:45 -0700 (PDT)
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
Date:   Tue,  1 Oct 2019 18:39:21 -0500
Message-Id: <20191001233923.16514-4-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001233923.16514-1-aford173@gmail.com>
References: <20191001233923.16514-1-aford173@gmail.com>
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

