Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1C4B5299
	for <lists+linux-omap@lfdr.de>; Tue, 17 Sep 2019 18:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbfIQQMa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Sep 2019 12:12:30 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39517 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbfIQQM3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Sep 2019 12:12:29 -0400
Received: by mail-io1-f66.google.com with SMTP id a1so8960943ioc.6;
        Tue, 17 Sep 2019 09:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=MeCcoXMCEze80Bl3xggqeDeE3aKjlz0D7xrnRXvSz50=;
        b=tdxiAs3nS/HFbj/DnmJeqprShjlCUPDO/gKB3EjOJ0I68afG8KHwKw5RDFiCNDld2d
         1jxQ6jGrcC/yklXj6kEa70e85VPQoP4Kj/ndgRJEwUloLOz6XC7Qm325QBl2KlmUGB0U
         8A6myYwT0/IjL/2oiVzNLhBrZFN+xToynXQdAuo+m2MWqEVDjBQPSs596Mw+Noy+YeLT
         LpEJAPE8sPhh8IK9Jw4NEmeDyE07xhCLoqlur1cbNtqaQD2W7DCs5dtB63L7lTN6vxE1
         KzSjJ539vD+auBG3Ig5Jk/uTszD+oFbJ2tjG2e5/fax5mSQOzbK9QXmnRbVSumDiWZtU
         u5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MeCcoXMCEze80Bl3xggqeDeE3aKjlz0D7xrnRXvSz50=;
        b=j2bDK+RBu6A2nFuioQnxKzNCNyy1nmLKRqUB+DCdnvxolKYMe14crBf0zjIuqrzG/d
         727YQIfoVK+dR2xl3Vpu9hnV769IQXnaXz6kTCzeYIPbFQGccaN+N6DKgPcee32e/u89
         0Ax84e2c/Kp6aRCf8J2KzX3hT0xdfKwfOPzTTynEEwNsvyY9PJrpWEi08qKKjYyhPic/
         X3SaaUm+CGAAOEtvQCWDRcU4yOv7WoqQGSt1NCj/VZfl76c4M2xkM24OFcX9SmcccnYj
         aXu5zCYZoFaHNpgzmKp58yeHtEh/Bpew41s2sFYHAt4zkKxVI3HkqWgmQZEV58TdqFMf
         aNyQ==
X-Gm-Message-State: APjAAAWQZVVlBKkZFzeOhIY2bbSUCDNwKJZgQa1KRrR3Z1unGx3qxCx0
        lZW3qV14TtT02djQRemFXO0=
X-Google-Smtp-Source: APXvYqy18s+Gh6RSCdBqHLdIA20bXqdc0iO0ZL76QMlGSl93FwBpVFflu0PIfUb3+kuezZYYc95Iiw==
X-Received: by 2002:a5d:9956:: with SMTP id v22mr4304351ios.27.1568736748634;
        Tue, 17 Sep 2019 09:12:28 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id p25sm2090487ioo.35.2019.09.17.09.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 09:12:27 -0700 (PDT)
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
Subject: [PATCH 1/3] drm/panel: simple: Add Logic PD Type 28 display support
Date:   Tue, 17 Sep 2019 11:12:11 -0500
Message-Id: <20190917161214.2913-1-aford173@gmail.com>
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

