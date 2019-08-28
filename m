Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 653AB9FB5D
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfH1HUL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:20:11 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59428 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfH1HUL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:20:11 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7K4O5116190;
        Wed, 28 Aug 2019 02:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566976804;
        bh=haaNeLbrXohBveS7uejJKhMKitMSpHxT1HJ3TV94XO8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=CQcK8JDZ6gfr2c/MsWlW0toLXL7U/02zMv/yE2ceznAc9siz99nvKNv2Fcgx13/KJ
         IWBW2T4ZbqMGXoi1FoZQdglad/a3JfpYt59GBb9ri0Ipao9txqjd0WTnkHyEc5MZ+O
         9qfgN33QDGOYISMn9WZcWsV4OZhAXfW7ULA43//A=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7K4VK083176
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:20:04 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:20:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:20:03 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7JmfI052201;
        Wed, 28 Aug 2019 02:20:02 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>,
        <p.zabel@pengutronix.de>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
Subject: [PATCHv2 06/11] soc: ti: omap-prm: support resets with no associated clockdomain
Date:   Wed, 28 Aug 2019 10:19:36 +0300
Message-ID: <20190828071941.32378-7-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828071941.32378-1-t-kristo@ti.com>
References: <20190828071941.32378-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Typically hardware resets on TI SoCs are associated with a clockdomain
which must be forced to be active while the reset is being de-asserted.
Otherwise the reset may not de-assert properly leaving the IP in some
weird metastate. However, some hardware reset lines don't have this
association in place, so add support for a new PRM flag for this
purpose.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/soc/ti/omap_prm.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
index e876bad8f8d5..d7a29e282788 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -56,6 +56,7 @@ struct omap_reset_data {
 
 #define OMAP_PRM_HAS_RSTCTRL	BIT(0)
 #define OMAP_PRM_HAS_RSTST	BIT(1)
+#define OMAP_PRM_HAS_NO_CLKDM	BIT(2)
 
 #define OMAP_PRM_HAS_RESETS	(OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_RSTST)
 
@@ -162,7 +163,8 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 		writel_relaxed(v, reset->prm->base + reset->prm->data->rstst);
 	}
 
-	pdata->clkdm_deny_idle(reset->clkdm);
+	if (reset->clkdm)
+		pdata->clkdm_deny_idle(reset->clkdm);
 
 	/* de-assert the reset control line */
 	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctrl);
@@ -200,7 +202,8 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 	}
 
 exit:
-	pdata->clkdm_allow_idle(reset->clkdm);
+	if (reset->clkdm)
+		pdata->clkdm_allow_idle(reset->clkdm);
 
 	return ret;
 }
@@ -229,7 +232,7 @@ static int omap_prm_reset_init(struct platform_device *pdev,
 		return 0;
 
 	/* Check if we have the pdata callbacks in place */
-	if (!pdata->clkdm_lookup || !pdata->clkdm_deny_idle ||
+	if (!pdata || !pdata->clkdm_lookup || !pdata->clkdm_deny_idle ||
 	    !pdata->clkdm_allow_idle)
 		return -EINVAL;
 
@@ -256,9 +259,11 @@ static int omap_prm_reset_init(struct platform_device *pdev,
 	sprintf(buf, "%s_clkdm", prm->data->clkdm_name ? prm->data->clkdm_name :
 		prm->data->name);
 
-	reset->clkdm = pdata->clkdm_lookup(buf);
-	if (!reset->clkdm)
-		return -EINVAL;
+	if (!(prm->data->flags & OMAP_PRM_HAS_NO_CLKDM)) {
+		reset->clkdm = pdata->clkdm_lookup(buf);
+		if (!reset->clkdm)
+			return -EINVAL;
+	}
 
 	while (map->rst >= 0) {
 		reset->mask |= BIT(map->rst);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
