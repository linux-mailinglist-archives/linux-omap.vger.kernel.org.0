Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864582D2B11
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 13:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729401AbgLHMcj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 07:32:39 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45720 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgLHMci (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 07:32:38 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CUr0R067407;
        Tue, 8 Dec 2020 06:30:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607430653;
        bh=lyJ3QuZEzp7JC5nCpXEsZ2KLlu/wPJjNal4Vd/CMnpc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MaVZEYIteWiS5ERB7yTGRFqsxUdpUBzbeoSNwmvxBYwdWsoxW+//vJiosSBl5JEnt
         MSKfuWZPQeXiaa4dE6LZ9z5Ukb7Kg0lt3oMMbRtnXRqrPccPxc72BXCxmXHstGRWHs
         dgbK6ieRwiL2DYdm9PuR4YY+YETT517AwiyeC18s=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CUrqX088987
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 06:30:53 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:30:53 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:30:53 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjg095068;
        Tue, 8 Dec 2020 06:30:51 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-omap@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v5 28/29] drm/omap: dsi: fix DCS_CMD_ENABLE
Date:   Tue, 8 Dec 2020 14:28:54 +0200
Message-ID: <20201208122855.254819-29-tomi.valkeinen@ti.com>
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

We only need to set VC_CTRL:DCS_CMD_ENABLE for command mode panels when
the HW has DSI_QUIRK_DCS_CMD_CONFIG_VC quirk. The old code did this
right by accident, but now we set DCS_CMD_ENABLE for video mode panels
too.

Fix this by skipping the set for video mode.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index b2aa07a09dcd..53a64bc91867 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3406,7 +3406,8 @@ static void dsi_setup_dsi_vcs(struct dsi_data *dsi)
 	REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 1, 1); /* SOURCE_VP */
 	dsi->vc[VC_VIDEO].source = DSI_VC_SOURCE_VP;
 
-	if (dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC)
+	if ((dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC) &&
+	    !(dsi->dsidev->mode_flags & MIPI_DSI_MODE_VIDEO))
 		REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 30, 30); /* DCS_CMD_ENABLE */
 
 	dsi_vc_enable(dsi, VC_CMD, 1);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

