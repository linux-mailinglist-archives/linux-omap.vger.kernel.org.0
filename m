Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9107C16B527
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgBXXVq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:46 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59858 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728534AbgBXXVo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:44 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 5CDEA293F3F
Received: by earth.universe (Postfix, from userid 1000)
        id BB14A3C0CB6; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 51/56] drm/omap: drop DSS ops_flags
Date:   Tue, 25 Feb 2020 00:21:21 +0100
Message-Id: <20200224232126.3385250-52-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The omapdss device's ops_flags field is no longer
used and can be dropped.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 9 ---------
 drivers/gpu/drm/omapdrm/dss/venc.c    | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 03498f0ed6c2..0ee042228c96 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -278,14 +278,6 @@ struct omap_dss_device_ops {
 	const struct omapdss_dsi_ops dsi;
 };
 
-/**
- * enum omap_dss_device_ops_flag - Indicates which device ops are supported
- * @OMAP_DSS_DEVICE_OP_MODES: The device supports reading modes
- */
-enum omap_dss_device_ops_flag {
-	OMAP_DSS_DEVICE_OP_MODES = BIT(3),
-};
-
 struct omap_dss_device {
 	struct device *dev;
 
@@ -314,7 +306,6 @@ struct omap_dss_device {
 	const char *name;
 
 	const struct omap_dss_device_ops *ops;
-	unsigned long ops_flags;
 	u32 bus_flags;
 
 	/* OMAP DSS output specific fields */
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 766553bb2f87..96e5d2944452 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -774,7 +774,6 @@ static int venc_init_output(struct venc_device *venc)
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
 	out->owner = THIS_MODULE;
 	out->of_port = 0;
-	out->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
 
 	r = omapdss_device_init_output(out, &venc->bridge);
 	if (r < 0) {
-- 
2.25.0

