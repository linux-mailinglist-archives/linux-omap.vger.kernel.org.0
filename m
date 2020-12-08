Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A242D2AF1
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 13:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbgLHMa7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 07:30:59 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33404 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbgLHMa7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 07:30:59 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTsRQ064024;
        Tue, 8 Dec 2020 06:29:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607430594;
        bh=JpHA/w1FiegOmLYTvyhahyGj8gRh7jLTeSQfmEeloCI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JNezfKgmxr6xNeSNkJG5a7lzqq7eWzJR9KbGIaZ0bHeMujU6kIkq01JuSoCvKOOmS
         eByFph3s/eT8uP4ENhfEJXr7OVijLdPbZM3jSf+TC50n2kVU0ebk7Zbbkha2AdMuIo
         bMGm2rUJh3zR30KYevjTFbtaPg0NJ2F56Ga+vm5M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CTsUM103314
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 06:29:54 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:29:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:29:53 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjJ095068;
        Tue, 8 Dec 2020 06:29:51 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-omap@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v5 05/29] drm/panel: panel-dsi-cm: set column & page at setup
Date:   Tue, 8 Dec 2020 14:28:31 +0200
Message-ID: <20201208122855.254819-6-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208122855.254819-1-tomi.valkeinen@ti.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Set the column & page address once during setup, instead of relying the
DSI host driver to set those.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index 38f79dca1fd0..556f9a2c5c0c 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -170,6 +170,22 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
 	return 0;
 }
 
+static int dsicm_set_update_window(struct panel_drv_data *ddata)
+{
+	struct mipi_dsi_device *dsi = ddata->dsi;
+	int r;
+
+	r = mipi_dsi_dcs_set_column_address(dsi, 0, ddata->mode.hdisplay - 1);
+	if (r < 0)
+		return r;
+
+	r = mipi_dsi_dcs_set_page_address(dsi, 0, ddata->mode.vdisplay - 1);
+	if (r < 0)
+		return r;
+
+	return 0;
+}
+
 static int dsicm_bl_update_status(struct backlight_device *dev)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
@@ -307,6 +323,10 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
+	r = dsicm_set_update_window(ddata);
+	if (r)
+		goto err;
+
 	r = mipi_dsi_dcs_set_display_on(ddata->dsi);
 	if (r)
 		goto err;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

