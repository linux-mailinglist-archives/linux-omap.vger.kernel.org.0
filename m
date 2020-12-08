Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C836C2D2AFD
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 13:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgLHMbl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 07:31:41 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33220 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbgLHMbl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 07:31:41 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTpoQ064018;
        Tue, 8 Dec 2020 06:29:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607430591;
        bh=A2yh5uoIc5rpq5mohJlKCQRU71EKsWsAa9cuN6BcACw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=pbQDHckAcpPOIPpP/odtmfPsKIMhM+jDIFaaAa9pj5z+Jje0DvsLp4Zev11TjOO12
         vNDJlZXU47ruyKsFkdXmnyD7TMlKOTsIgYKZEAZfjuTLv8BrVU55+4YMAkk5CASY6/
         HDq5fcdGbfWpLeUIJQGwDT0GOmyHpWSrmkel1yHc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CTp6T103300
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 06:29:51 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:29:51 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:29:51 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjI095068;
        Tue, 8 Dec 2020 06:29:49 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-omap@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v5 04/29] drm/omap: dsi: set trans_mode according to client mode_flags
Date:   Tue, 8 Dec 2020 14:28:30 +0200
Message-ID: <20201208122855.254819-5-tomi.valkeinen@ti.com>
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

The DSI host driver currently ignores the video mode flags in
client->mode_flags. Add the code to take the transfer mode from client's
mode_flags.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index c3592c6db977..7fee9cf8782d 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5140,6 +5140,13 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->config.lp_clk_min = 7000000; // TODO: get from client?
 	dsi->config.lp_clk_max = client->lp_rate;
 
+	if (client->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
+		dsi->config.trans_mode = OMAP_DSS_DSI_BURST_MODE;
+	else if (client->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+		dsi->config.trans_mode = OMAP_DSS_DSI_PULSE_MODE;
+	else
+		dsi->config.trans_mode = OMAP_DSS_DSI_EVENT_MODE;
+
 	dsi->ulps_auto_idle = false;
 
 	return 0;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

