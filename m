Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 374782A7E1C
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 13:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730770AbgKEMFe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 07:05:34 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42808 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbgKEMFe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 07:05:34 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C5QRT057077;
        Thu, 5 Nov 2020 06:05:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604577926;
        bh=izrUdZl8o40ZVh7OCGNQpXZPhZUSz2IMAsxzc17Y63M=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vLxYQY4FCcynhBKAkYBl3aWB5GAB8SERv1aetT2enXUV3v33j7dmfXdsbevxFtb/w
         RiQaCxLfJCe1guknlMRpwbStnIBmaErde8yqq2Owg1RO69lvLeXY6gqVqTY/169Xv0
         qk1uIN7a+cZGX5l2IRD4yrL1vyeXKhkHVF0yM6ZA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C5QLX043681
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 06:05:26 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:05:26 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:05:26 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfZ039111;
        Thu, 5 Nov 2020 06:05:24 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 37/56] drm/omap: panel-dsi-cm: support unbinding
Date:   Thu, 5 Nov 2020 14:03:14 +0200
Message-ID: <20201105120333.947408-38-tomi.valkeinen@ti.com>
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

Now, that the driver implements the common DRM panel API
the unbind no longer needs to be suppressed.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 5159dd51a353..086c7d71fe17 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -607,7 +607,7 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	return r;
 }
 
-static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
+static int dsicm_remove(struct mipi_dsi_device *dsi)
 {
 	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
 
@@ -637,11 +637,10 @@ MODULE_DEVICE_TABLE(of, dsicm_of_match);
 
 static struct mipi_dsi_driver dsicm_driver = {
 	.probe = dsicm_probe,
-	.remove = __exit_p(dsicm_remove),
+	.remove = dsicm_remove,
 	.driver = {
 		.name = "panel-dsi-cm",
 		.of_match_table = dsicm_of_match,
-		.suppress_bind_attrs = true,
 	},
 };
 module_mipi_dsi_driver(dsicm_driver);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

