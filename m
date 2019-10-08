Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20931CF381
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 09:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbfJHHTg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 03:19:36 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34656 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730156AbfJHHTg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 03:19:36 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x987JSWs025151;
        Tue, 8 Oct 2019 02:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570519168;
        bh=Y7vuHmki0AitevIY4QTjUpFCGHBSgA345LWzYu3kdGg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=XxJVogC+ICfus+EQEnqmy4M/NgIF7sViXfL32XYZacWn9Xa0O2q8HGiaNCMhlMPLf
         ouaNimPomNW63vaSpcr9WxCBJrXvwVmCt/Hzx18a4yv7cqHZGfyvjw/QjyRilrLzO4
         Lq2TdKLXy4Orr8R6ahaFDOiucPQoAopIJSJiIC/s=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x987JSIw073220
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Oct 2019 02:19:28 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 02:19:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 02:19:25 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x987JJj6027770;
        Tue, 8 Oct 2019 02:19:26 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <p.zabel@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv7 3/9] soc: ti: omap-prm: poll for reset complete during de-assert
Date:   Tue, 8 Oct 2019 10:19:07 +0300
Message-ID: <20191008071913.28740-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191008071913.28740-1-t-kristo@ti.com>
References: <20191008071913.28740-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Poll for reset completion status during de-assertion of reset, otherwise
the IP in question might be accessed before it has left reset properly.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/soc/ti/omap_prm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
index ab0b66ad715d..96fa2aad9b93 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -153,6 +153,18 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
 	spin_unlock_irqrestore(&reset->lock, flags);
 
+	if (!has_rstst)
+		return 0;
+
+	/* wait for the status to be set */
+	ret = readl_relaxed_poll_timeout(reset->prm->base +
+					 reset->prm->data->rstst,
+					 v, v & BIT(st_bit), 1,
+					 OMAP_RESET_MAX_WAIT);
+	if (ret)
+		pr_err("%s: timedout waiting for %s:%lu\n", __func__,
+		       reset->prm->data->name, id);
+
 	return 0;
 }
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
