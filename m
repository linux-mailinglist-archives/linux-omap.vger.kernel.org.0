Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39EC35259B
	for <lists+linux-omap@lfdr.de>; Fri,  2 Apr 2021 05:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbhDBDNn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 23:13:43 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:16323 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233665AbhDBDNm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Apr 2021 23:13:42 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FBQ7S18gSz9sN1;
        Fri,  2 Apr 2021 11:11:32 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.62) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Fri, 2 Apr 2021 11:13:32 +0800
From:   Yu Jiahua <yujiahua1@huawei.com>
To:     <linux-omap@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <zhengzucheng@huawei.com>, <hucool.lihua@huawei.com>
CC:     Jiahua Yu <yujiahua1@huawei.com>
Subject: [PATCH] apply: use DEFINE_SPINLOCK() instead of spin_lock_init().
Date:   Thu, 1 Apr 2021 19:13:31 -0800
Message-ID: <20210402031331.232848-1-yujiahua1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.62]
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

