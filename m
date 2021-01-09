Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D939A2EFC13
	for <lists+linux-omap@lfdr.de>; Sat,  9 Jan 2021 01:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbhAIAWC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Jan 2021 19:22:02 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49346 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbhAIAWC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Jan 2021 19:22:02 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1090KM8w103302;
        Fri, 8 Jan 2021 18:20:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1610151622;
        bh=ya3L1oU8SOcL+oeR6aikU6KuNsg6ZISybPwKIrhan0Y=;
        h=From:To:CC:Subject:Date;
        b=m1QHGLh+xoRVA9vCVslkBEaKC8MGEsUC2oJpTXd0Mfi12PcvbEnrJu5PWg0vwXeWU
         GX/mQaxF6EaU5t0d5Vv9hT/xLGQzNuBaPfGDdmmE+uBA0ugSa5Q7GFkE9Z33w8p8xv
         5zdYDrVlxfJ9fOgNEamphQeTbjriqPEe4v7Qo+7s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1090KMsS095029
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 8 Jan 2021 18:20:22 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 8 Jan
 2021 18:20:22 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 8 Jan 2021 18:20:22 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1090KLb4104629;
        Fri, 8 Jan 2021 18:20:22 -0600
Received: from localhost ([10.250.66.86])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 1090KLZw069437;
        Fri, 8 Jan 2021 18:20:21 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Santosh Shilimkar <ssantosh@kernel.org>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Subject: [PATCH] soc: ti: pruss: Correct the pruss_clk_init error trace text
Date:   Fri, 8 Jan 2021 18:20:17 -0600
Message-ID: <20210109002017.1185-1-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The pruss_clk_init() function can register more than one clock.
Correct the existing misleading error trace upon a failure within
this function.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/soc/ti/pruss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index 5d6e7132a5c4..1d6890134312 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -273,7 +273,7 @@ static int pruss_probe(struct platform_device *pdev)
 
 	ret = pruss_clk_init(pruss, child);
 	if (ret) {
-		dev_err(dev, "failed to setup coreclk-mux\n");
+		dev_err(dev, "pruss_clk_init failed, ret = %d\n", ret);
 		goto node_put;
 	}
 
-- 
2.29.2

