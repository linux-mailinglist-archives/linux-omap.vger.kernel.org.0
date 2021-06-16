Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 211613A8F45
	for <lists+linux-omap@lfdr.de>; Wed, 16 Jun 2021 05:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhFPDSn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Jun 2021 23:18:43 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:10080 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhFPDSn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Jun 2021 23:18:43 -0400
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G4VdJ6M92zZfQY;
        Wed, 16 Jun 2021 11:13:40 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.62) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 16 Jun 2021 11:16:35 +0800
From:   Yu Jiahua <yujiahua1@huawei.com>
To:     <dri-devel@lists.freedesktop.org>
CC:     <linux-omap@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <yujiahua1@huawei.com>
Subject: [PATCH -next] apply: use DEFINE_SPINLOCK() instead of spin_lock_init().
Date:   Tue, 15 Jun 2021 19:17:13 -0800
Message-ID: <20210616031713.24959-1-yujiahua1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.62]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Jiahua Yu <yujiahua1@huawei.com>

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Signed-off-by: Jiahua Yu <yujiahua1@huawei.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/apply.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/apply.c b/drivers/video/fbdev/omap2/omapfb/dss/apply.c
index c71021091828..acca991c7540 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/apply.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/apply.c
@@ -108,7 +108,7 @@ static struct {
 } dss_data;
 
 /* protects dss_data */
-static spinlock_t data_lock;
+static DEFINE_SPINLOCK(data_lock);
 /* lock for blocking functions */
 static DEFINE_MUTEX(apply_lock);
 static DECLARE_COMPLETION(extra_updated_completion);
@@ -131,8 +131,6 @@ static void apply_init_priv(void)
 	struct mgr_priv_data *mp;
 	int i;
 
-	spin_lock_init(&data_lock);
-
 	for (i = 0; i < num_ovls; ++i) {
 		struct ovl_priv_data *op;
 
-- 
2.17.1

