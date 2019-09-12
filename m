Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF57EB0DFD
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 13:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731294AbfILLjj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 07:39:39 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:58742 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730268AbfILLjj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 07:39:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdVWb024466;
        Thu, 12 Sep 2019 06:39:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568288371;
        bh=Y7vuHmki0AitevIY4QTjUpFCGHBSgA345LWzYu3kdGg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JUHApH358MOEJyikt2JFci4OCHJ2KvKh0ljxWHTIgizurT7vSPy1BoJI/2KWqftXw
         et33QuUlNQX/ExgQfoVBzjo1ygi8zgTdvso6+FtdWgfo6PbAwK3WYPlY5vBJJ/HG5o
         7/h1a7Home9Mxe2ub07G1mF84Yk9tqQpblv/S24U=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdVFe074023;
        Thu, 12 Sep 2019 06:39:31 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 06:39:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 06:39:29 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdKcs120606;
        Thu, 12 Sep 2019 06:39:28 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>,
        <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <tony@atomide.com>,
        <s-anna@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv5 03/10] soc: ti: omap-prm: poll for reset complete during de-assert
Date:   Thu, 12 Sep 2019 14:39:09 +0300
Message-ID: <20190912113916.20093-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912113916.20093-1-t-kristo@ti.com>
References: <20190912113916.20093-1-t-kristo@ti.com>
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
