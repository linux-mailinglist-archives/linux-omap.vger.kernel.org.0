Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC5E62588BB
	for <lists+linux-omap@lfdr.de>; Tue,  1 Sep 2020 09:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgIAHIc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Sep 2020 03:08:32 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:10744 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726006AbgIAHIc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Sep 2020 03:08:32 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 20D41AA7CFA4EA010863;
        Tue,  1 Sep 2020 15:08:30 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Tue, 1 Sep 2020
 15:08:23 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <rogerq@ti.com>, <tony@atomide.com>, <krzk@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] memory: omap-gpmc: Fix -Wunused-function warnings
Date:   Tue, 1 Sep 2020 15:07:53 +0800
Message-ID: <20200901070753.24328-1-yuehaibing@huawei.com>
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

drivers/memory/omap-gpmc.c:987:12: warning: ‘gpmc_cs_remap’ defined but not used [-Wunused-function]
 static int gpmc_cs_remap(int cs, u32 base)
            ^~~~~~~~~~~~~
drivers/memory/omap-gpmc.c:926:20: warning: ‘gpmc_cs_get_name’ defined but not used [-Wunused-function]
 static const char *gpmc_cs_get_name(int cs)
                    ^~~~~~~~~~~~~~~~
drivers/memory/omap-gpmc.c:919:13: warning: ‘gpmc_cs_set_name’ defined but not used [-Wunused-function]
 static void gpmc_cs_set_name(int cs, const char *name)
             ^~~~~~~~~~~~~~~~
Make them as  __maybe_unused to fix this.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/memory/omap-gpmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index ac0f577a51a1..24372254986e 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -916,14 +916,14 @@ static bool gpmc_cs_reserved(int cs)
 	return gpmc->flags & GPMC_CS_RESERVED;
 }
 
-static void gpmc_cs_set_name(int cs, const char *name)
+static void __maybe_unused gpmc_cs_set_name(int cs, const char *name)
 {
 	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
 
 	gpmc->name = name;
 }
 
-static const char *gpmc_cs_get_name(int cs)
+static const __maybe_unused char *gpmc_cs_get_name(int cs)
 {
 	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
 
@@ -984,7 +984,7 @@ static int gpmc_cs_delete_mem(int cs)
  * "base". Returns 0 on success and appropriate negative error code
  * on failure.
  */
-static int gpmc_cs_remap(int cs, u32 base)
+static int __maybe_unused gpmc_cs_remap(int cs, u32 base)
 {
 	int ret;
 	u32 old_base, size;
-- 
2.17.1


