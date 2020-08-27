Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A3325456A
	for <lists+linux-omap@lfdr.de>; Thu, 27 Aug 2020 14:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbgH0MyM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Aug 2020 08:54:12 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:36498 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729089AbgH0MyD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 27 Aug 2020 08:54:03 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 48D11DC603F684ED7B2A;
        Thu, 27 Aug 2020 20:53:45 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 20:53:38 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <rogerq@ti.com>, <tony@atomide.com>, <krzk@kernel.org>,
        <ladis@linux-mips.org>, <bbrezillon@kernel.org>,
        <peter.ujfalusi@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v3] memory: omap-gpmc: Fix build error without CONFIG_OF
Date:   Thu, 27 Aug 2020 20:53:16 +0800
Message-ID: <20200827125316.20780-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20200826125919.22172-1-yuehaibing@huawei.com>
References: <20200826125919.22172-1-yuehaibing@huawei.com>
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

Add gpmc_read_settings_dt() helper function, which zero the gpmc_settings
so the caller doesn't proceed with random/invalid settings.

Fixes: a758f50f10cf ("mtd: onenand: omap2: Configure driver from DT")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v3: zero gpmc_settings
v2: add gpmc_read_settings_dt() stub
---
 drivers/memory/omap-gpmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index cd9e80748591..e026b4cd3612 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2310,6 +2310,10 @@ static void gpmc_probe_dt_children(struct platform_device *pdev)
 	}
 }
 #else
+void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
+{
+	memset(p, 0, sizeof(struct gpmc_settings));
+}
 static int gpmc_probe_dt(struct platform_device *pdev)
 {
 	return 0;
-- 
2.17.1


