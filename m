Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77DFABB5A9
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2019 15:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730903AbfIWNpH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Sep 2019 09:45:07 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46023 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfIWNpG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 23 Sep 2019 09:45:06 -0400
Received: by mail-io1-f65.google.com with SMTP id c25so1312026iot.12;
        Mon, 23 Sep 2019 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8gJJO39rFvRPC27Eg6HXHKJTgns+bBIO2jkPaH1hgc4=;
        b=gYnxWxDzYUW5wn60fhXJrrdD/bHxTVKwpKATR5CRZEQcYGvXyNPjvq4hzHLvfaf5Qn
         HLcQUGjw/5+RhsF9F2VVpXwAiTSkvIWCGnJo+3s8xZjyaV9ZfeUxBFlwP7KzOZAiIPTC
         T6j7b4NdQ//XRSTLKNKUQrQtMi5hhBgDwKp0tt0msVN9MHViDBJTcaUFdlXxZR90ujcH
         4PYYFitroKR3Jc9v8E9sNobSwr3+LrMmKvS3jUjbM2Tt3xXNwVsdeb7M+QmK+83NBXfS
         LzBnzOTk9WrX+w3N0JyHc/MPaPt0Ej4YzZq5CAGpOPoSrTgEdQwTidx0M4upHPwcTPxH
         3IJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8gJJO39rFvRPC27Eg6HXHKJTgns+bBIO2jkPaH1hgc4=;
        b=Yj4ZTcj/kA+Tp7HziU4XFUU3RjxMw1ipehnjFdijpgvcy9d5VirFF9uKH5yStefzSN
         q8fj648/091mqtNYWcBjfqF2Pb4CA9SLT4wt4SyKWIPoG/MxFwB4A6mpahdPXC5+9Uh1
         PCkw8nMeZTckxIVsFuOk0yOpLZW1fOVf430pih7SyU9PU8a9pWir8FkocqtqjOUBiSgR
         DkcRCMEJHa2qy1bTKglERR11I10mi2P8DyKmCrq9sii8Ec0GsyOpzlzWp1T/QOLD4L4G
         u06adWW/Q5XPus5YwtVFSJDYPBanmDgf48WquLvndnmGSQn8QOII6eMs0Hunjcqx3ww1
         yGQw==
X-Gm-Message-State: APjAAAVvubTPzdtSKu5CxDDLE/4orwmNMtSOP7ljgjxNMx+3jG8x6ih+
        Q8IT57iuEMWdrCG3Ja03Cws=
X-Google-Smtp-Source: APXvYqzJ5o3V+xw8Vo6YavSbpE/G0mrA+1QvHonDZaHomPezsl9Rg4ZVusHEe89mStO7TrQUS+BgXA==
X-Received: by 2002:a6b:c895:: with SMTP id y143mr14632059iof.271.1569246305617;
        Mon, 23 Sep 2019 06:45:05 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id x2sm8844474iob.74.2019.09.23.06.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 06:44:59 -0700 (PDT)
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
Subject: [PATCH V2 1/3] drm/panel: simple: Add Logic PD Type 28 display support
Date:   Mon, 23 Sep 2019 08:44:47 -0500
Message-Id: <20190923134449.22326-1-aford173@gmail.com>
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
V2:  No change

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5a93c4edf1e4..c86c30f3a8a1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1900,6 +1900,40 @@ static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
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
@@ -2948,6 +2982,9 @@ static const struct of_device_id platform_of_match[] = {
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

