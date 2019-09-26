Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47E01BEFF8
	for <lists+linux-omap@lfdr.de>; Thu, 26 Sep 2019 12:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbfIZKpS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 Sep 2019 06:45:18 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53208 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfIZKpS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 26 Sep 2019 06:45:18 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QAjG1t016292;
        Thu, 26 Sep 2019 05:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569494716;
        bh=8ZpbwIFfnIeJPCxkSU1C35jGPhlIYupajT7QsiKWxSU=;
        h=From:To:CC:Subject:Date;
        b=xZ/zoK6ue5oTJdGlpVg7JJ/D4vkqLVrXl2RpORjzXhGykJ5g7AmzoCOHCCT+1s9jA
         yuY7t6OFzkApKoLU0fNmd7G1LEALqibXjdZBrLQ1OkXY3vqus1JFuQDlpfco0TEe+B
         veetjHwCSHAs7vNb2ozT9yE1ryprxoCGaNKUUMf8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8QAjGLS037943
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 26 Sep 2019 05:45:16 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 26
 Sep 2019 05:45:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 26 Sep 2019 05:45:08 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QAjD4w034957;
        Thu, 26 Sep 2019 05:45:13 -0500
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <t-kristo@ti.com>, <mturquette@baylibre.com>
CC:     <sboyd@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: ti: dra7-atl-clock: Remove ti_clk_add_alias call
Date:   Thu, 26 Sep 2019 13:45:56 +0300
Message-ID: <20190926104556.28716-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

ti_clk_register() calls it already so the driver should not create
duplicated alias.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/clk/ti/clk-dra7-atl.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
index a01ca9395179..c0e0ee974151 100644
--- a/drivers/clk/ti/clk-dra7-atl.c
+++ b/drivers/clk/ti/clk-dra7-atl.c
@@ -207,11 +207,6 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
 	clk = ti_clk_register(NULL, &clk_hw->hw, node->name);
 
 	if (!IS_ERR(clk)) {
-		ret = ti_clk_add_alias(NULL, clk, node->name);
-		if (ret) {
-			clk_unregister(clk);
-			goto cleanup;
-		}
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		kfree(parent_names);
 		return;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

