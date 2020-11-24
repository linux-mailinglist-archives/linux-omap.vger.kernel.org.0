Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5952C2664
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387705AbgKXMsX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:48:23 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55502 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387701AbgKXMsW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:48:22 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmGW8123838;
        Tue, 24 Nov 2020 06:48:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222096;
        bh=vxNlZ32ATi/68uju3ad/13HBc2vkgkp0WqGOHNRK+18=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=VVCTY4L92Ps9LoXTSYh9rj0GNRNXsVshGX8gfaIkGT8rCgRjvA3HLYyCItWnsTRO0
         mWn5X9u6LmlrrxIUUSsotHNtDfvdyiSuh9sUMCHRKRDaqYOh+4DummnXAB7piCbuTo
         sG5vdm+2t63gJ50yUnX5xTtlBOlAsDKYTX5XSGYY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmGuM045383
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:48:16 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:16 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:16 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpm040922;
        Tue, 24 Nov 2020 06:48:14 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 59/80] drm/omap: dsi: set trans_mode according to client mode_flags
Date:   Tue, 24 Nov 2020 14:45:17 +0200
Message-ID: <20201124124538.660710-60-tomi.valkeinen@ti.com>
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

The DSI host driver currently ignores the video mode flags in
client->mode_flags. Add the code to take the transfer mode from client's
mode_flags.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
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

