Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9638D116F4F
	for <lists+linux-omap@lfdr.de>; Mon,  9 Dec 2019 15:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbfLIOmk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Dec 2019 09:42:40 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40374 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbfLIOmj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Dec 2019 09:42:39 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgRD8015017;
        Mon, 9 Dec 2019 08:42:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575902547;
        bh=B9OLsy3glNyhloOu8PeWPNPqAtRcQ04jS9dbdJ3Yb+g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=zTG6Zyk8kar0i15rq+dZVU0JJrO8rjoBMcVX/0sto2Cf+guoH3DSMcHJqOydV5kfF
         93YaKS+KK+iBUOEOoYfFjRHh5PddshJFZZkaJAODTFR3fEB1iWC0ppEYj2ogFvfvmr
         ZJLNKnRVysveD9PBFDjfL1CVx7fxHqtGxSr2ytF4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgRRG099057;
        Mon, 9 Dec 2019 08:42:27 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 08:42:27 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 08:42:27 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgGvh122297;
        Mon, 9 Dec 2019 08:42:24 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <tony@atomide.com>,
        <sam@ravnborg.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>
Subject: [PATCH v2 3/3] drm/tilcdc: panel: Add WARN() with a comment to tilcdc-panel probe
Date:   Mon, 9 Dec 2019 16:42:16 +0200
Message-ID: <54966ffd61ca46528bc55961c532001aa7463c30.1575901747.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575901747.git.jsarha@ti.com>
References: <cover.1575901747.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add WARN() to the beginnig of tilcdc-panel probe. The obsolete
tilcdc-panel driver should not be used anymore, since tilcdc is fully
capable of using generic drm panels like panel-simple and panel-common
binding.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_panel.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 5584e656b857..cf8e2462a524 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -309,6 +309,16 @@ static int panel_probe(struct platform_device *pdev)
 	struct pinctrl *pinctrl;
 	int ret;
 
+	/*
+	 * The obsolete tilcdc-panel driver should not be used
+         * anymore, since tilcdc is fully capable of using generic drm
+         * panels like panel-simple and panel-common binding.
+	 */
+
+	WARN(true,
+	     "tilcdc-panel is obsolte and should not be used. Please update your configuration!\n",
+	     dev_name(&pdev->dev));
+
 	/* bail out early if no DT data: */
 	if (!node) {
 		dev_err(&pdev->dev, "device-tree data is missing\n");
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

