Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C837258D6F
	for <lists+linux-omap@lfdr.de>; Tue,  1 Sep 2020 13:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgIAL3P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Sep 2020 07:29:15 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:35128 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726406AbgIAL3M (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Sep 2020 07:29:12 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id B2F8BB1E91330B448EB8;
        Tue,  1 Sep 2020 19:29:10 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Tue, 1 Sep 2020
 19:29:00 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <rogerq@ti.com>, <tony@atomide.com>, <krzk@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v3 -next] memory: omap-gpmc: Fix -Wunused-function warnings
Date:   Tue, 1 Sep 2020 19:28:32 +0800
Message-ID: <20200901112832.3084-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20200901035642.22772-1-yuehaibing@huawei.com>
References: <20200901035642.22772-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If CONFIG_OF is not set, make W=1 warns:

drivers/memory/omap-gpmc.c:987:12: warning: ‘gpmc_cs_remap’ defined but not used [-Wunused-function]
 static int gpmc_cs_remap(int cs, u32 base)
            ^~~~~~~~~~~~~
drivers/memory/omap-gpmc.c:926:20: warning: ‘gpmc_cs_get_name’ defined but not used [-Wunused-function]
 static const char *gpmc_cs_get_name(int cs)
                    ^~~~~~~~~~~~~~~~
drivers/memory/omap-gpmc.c:919:13: warning: ‘gpmc_cs_set_name’ defined but not used [-Wunused-function]
 static void gpmc_cs_set_name(int cs, const char *name)
             ^~~~~~~~~~~~~~~~
Move them to #ifdef CONFIG_OF block to fix this.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v3: move the functions to #ifdef block
v2: update commit log
---
 drivers/memory/omap-gpmc.c | 114 ++++++++++++++++++-------------------
 1 file changed, 57 insertions(+), 57 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index ac0f577a51a1..cfa730cfd145 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -916,20 +916,6 @@ static bool gpmc_cs_reserved(int cs)
 	return gpmc->flags & GPMC_CS_RESERVED;
 }
 
-static void gpmc_cs_set_name(int cs, const char *name)
-{
-	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
-
-	gpmc->name = name;
-}
-
-static const char *gpmc_cs_get_name(int cs)
-{
-	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
-
-	return gpmc->name;
-}
-
 static unsigned long gpmc_mem_align(unsigned long size)
 {
 	int order;
@@ -975,49 +961,6 @@ static int gpmc_cs_delete_mem(int cs)
 	return r;
 }
 
-/**
- * gpmc_cs_remap - remaps a chip-select physical base address
- * @cs:		chip-select to remap
- * @base:	physical base address to re-map chip-select to
- *
- * Re-maps a chip-select to a new physical base address specified by
- * "base". Returns 0 on success and appropriate negative error code
- * on failure.
- */
-static int gpmc_cs_remap(int cs, u32 base)
-{
-	int ret;
-	u32 old_base, size;
-
-	if (cs >= gpmc_cs_num) {
-		pr_err("%s: requested chip-select is disabled\n", __func__);
-		return -ENODEV;
-	}
-
-	/*
-	 * Make sure we ignore any device offsets from the GPMC partition
-	 * allocated for the chip select and that the new base confirms
-	 * to the GPMC 16MB minimum granularity.
-	 */
-	base &= ~(SZ_16M - 1);
-
-	gpmc_cs_get_memconf(cs, &old_base, &size);
-	if (base == old_base)
-		return 0;
-
-	ret = gpmc_cs_delete_mem(cs);
-	if (ret < 0)
-		return ret;
-
-	ret = gpmc_cs_insert_mem(cs, base, size);
-	if (ret < 0)
-		return ret;
-
-	ret = gpmc_cs_set_memconf(cs, base, size);
-
-	return ret;
-}
-
 int gpmc_cs_request(int cs, unsigned long size, unsigned long *base)
 {
 	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
@@ -1941,6 +1884,63 @@ static const struct of_device_id gpmc_dt_ids[] = {
 	{ }
 };
 
+static void gpmc_cs_set_name(int cs, const char *name)
+{
+	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
+
+	gpmc->name = name;
+}
+
+static const char *gpmc_cs_get_name(int cs)
+{
+	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
+
+	return gpmc->name;
+}
+
+/**
+ * gpmc_cs_remap - remaps a chip-select physical base address
+ * @cs:		chip-select to remap
+ * @base:	physical base address to re-map chip-select to
+ *
+ * Re-maps a chip-select to a new physical base address specified by
+ * "base". Returns 0 on success and appropriate negative error code
+ * on failure.
+ */
+static int gpmc_cs_remap(int cs, u32 base)
+{
+	int ret;
+	u32 old_base, size;
+
+	if (cs >= gpmc_cs_num) {
+		pr_err("%s: requested chip-select is disabled\n", __func__);
+		return -ENODEV;
+	}
+
+	/*
+	 * Make sure we ignore any device offsets from the GPMC partition
+	 * allocated for the chip select and that the new base confirms
+	 * to the GPMC 16MB minimum granularity.
+	 */
+	base &= ~(SZ_16M - 1);
+
+	gpmc_cs_get_memconf(cs, &old_base, &size);
+	if (base == old_base)
+		return 0;
+
+	ret = gpmc_cs_delete_mem(cs);
+	if (ret < 0)
+		return ret;
+
+	ret = gpmc_cs_insert_mem(cs, base, size);
+	if (ret < 0)
+		return ret;
+
+	ret = gpmc_cs_set_memconf(cs, base, size);
+
+	return ret;
+}
+
 /**
  * gpmc_read_settings_dt - read gpmc settings from device-tree
  * @np:		pointer to device-tree node for a gpmc child device
-- 
2.17.1


