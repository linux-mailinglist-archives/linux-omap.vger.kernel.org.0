Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAEF024856D
	for <lists+linux-omap@lfdr.de>; Tue, 18 Aug 2020 14:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgHRMyO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Aug 2020 08:54:14 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:51468 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726398AbgHRMyN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 Aug 2020 08:54:13 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A7AC5CAFD889A27B184B;
        Tue, 18 Aug 2020 20:54:07 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 18 Aug 2020
 20:53:58 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <rogerq@ti.com>, <tony@atomide.com>, <krzk@kernel.org>,
        <bbrezillon@kernel.org>, <ladis@linux-mips.org>,
        <peter.ujfalusi@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] memory: omap-gpmc: Fix build error without CONFIG_OF
Date:   Tue, 18 Aug 2020 20:53:38 +0800
Message-ID: <20200818125338.58148-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If CONFIG_OF is n, gcc fails:

drivers/memory/omap-gpmc.o: In function `gpmc_omap_onenand_set_timings':
omap-gpmc.c:(.text+0x2a88): undefined reference to `gpmc_read_settings_dt'

Add helper function to fix this.

Fixes: a758f50f10cf ("mtd: onenand: omap2: Configure driver from DT")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/memory/omap-gpmc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index ce0e7e2d7cff..332bb4580817 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -1176,6 +1176,7 @@ struct gpmc_nand_ops *gpmc_omap_get_nand_ops(struct gpmc_nand_regs *reg, int cs)
 }
 EXPORT_SYMBOL_GPL(gpmc_omap_get_nand_ops);
 
+#ifdef CONFIG_OF
 static void gpmc_omap_onenand_calc_sync_timings(struct gpmc_timings *t,
 						struct gpmc_settings *s,
 						int freq, int latency)
@@ -1280,6 +1281,14 @@ int gpmc_omap_onenand_set_timings(struct device *dev, int cs, int freq,
 
 	return gpmc_cs_set_timings(cs, &gpmc_t, &gpmc_s);
 }
+#else
+int gpmc_omap_onenand_set_timings(struct device *dev, int cs, int freq,
+				  int latency,
+				  struct gpmc_onenand_info *info)
+{
+	return -EINVAL;
+}
+#endif
 EXPORT_SYMBOL_GPL(gpmc_omap_onenand_set_timings);
 
 int gpmc_get_client_irq(unsigned int irq_config)
-- 
2.17.1


