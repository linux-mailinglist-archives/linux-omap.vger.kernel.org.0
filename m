Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998222C267C
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387724AbgKXMtN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:49:13 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55830 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732709AbgKXMtN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:49:13 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCn5MK124089;
        Tue, 24 Nov 2020 06:49:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222145;
        bh=lDXHzanxjxcn5NEEjBFLSPfycFKSFXzOB740p/zqUaM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=WcsCtJ39J6Uu+gc2PQiVYTfKW3IZOR4klR6e+Vlw+AP5RA39Z+REBXBsfBB44t7sK
         LRcR5PZ2j6UQwTLqz8Bxxc00ERtoZgv3t2SpYWPpVYjfu12NSeC3HOH1Nugm4bSB1G
         glhYxN+KWljk4MHglwuZ64onkYMMkVgHdSfHkTeI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCn5bx045864
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:49:05 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:49:04 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:49:04 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmq9040922;
        Tue, 24 Nov 2020 06:49:02 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 80/80] drm/omap: dsi: fix DCS_CMD_ENABLE
Date:   Tue, 24 Nov 2020 14:45:38 +0200
Message-ID: <20201124124538.660710-81-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
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
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index ffecacd7350a..d52bef0c7aa2 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3401,7 +3401,8 @@ static void dsi_setup_dsi_vcs(struct dsi_data *dsi)
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

