Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8252A7E31
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 13:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730139AbgKEMF7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 07:05:59 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46828 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgKEMF7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 07:05:59 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C5pVu070738;
        Thu, 5 Nov 2020 06:05:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604577951;
        bh=j59+MurC8E3RKqLDQPP1Tn8+Ymx2VCQTo9FFWJ87w80=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Y3TARxuLCSetvBNYUDIFmYRaFlDbVOgfOmY/P0bq5oAr67oOjbbzxAhPNpxdRBE54
         gpklBKt74hLCqjBlUuTeyVKwI8XkCP/jVCrb4G4FETHrx28PIbS5JJVHd/kKiCnp3d
         p2XQLW0U1cckTpaZRKh9yjd5x8QD46syTYQXhZ8g=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C5pia073997
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 06:05:51 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:05:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:05:50 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfj039111;
        Thu, 5 Nov 2020 06:05:48 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 47/56] drm/omap: drop DSS ops_flags
Date:   Thu, 5 Nov 2020 14:03:24 +0200
Message-ID: <20201105120333.947408-48-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105120333.947408-1-tomi.valkeinen@ti.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Sebastian Reichel <sebastian.reichel@collabora.com>

The omapdss device's ops_flags field is no longer
used and can be dropped.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 9 ---------
 drivers/gpu/drm/omapdrm/dss/venc.c    | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 1f02d3e406dc..916c55101629 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -279,14 +279,6 @@ struct omap_dss_device_ops {
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
 
@@ -315,7 +307,6 @@ struct omap_dss_device {
 	const char *name;
 
 	const struct omap_dss_device_ops *ops;
-	unsigned long ops_flags;
 	u32 bus_flags;
 
 	/* OMAP DSS output specific fields */
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 5c027c81760f..6e418a0f7572 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -732,7 +732,6 @@ static int venc_init_output(struct venc_device *venc)
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
 	out->owner = THIS_MODULE;
 	out->of_port = 0;
-	out->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
 
 	r = omapdss_device_init_output(out, &venc->bridge);
 	if (r < 0) {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

