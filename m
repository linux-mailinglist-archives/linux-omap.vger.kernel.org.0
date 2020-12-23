Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E6C2E1D29
	for <lists+linux-omap@lfdr.de>; Wed, 23 Dec 2020 15:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbgLWOOV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Dec 2020 09:14:21 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:9917 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728691AbgLWOOV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Dec 2020 09:14:21 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D1FXc6Jz9z7Dn5;
        Wed, 23 Dec 2020 22:12:48 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 23 Dec 2020 22:13:21 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <b.zolnierkie@samsung.com>, <linux-omap@vger.kernel.org>,
        <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] video: fbdev: omap2: Use DEFINE_SPINLOCK() for spinlock
Date:   Wed, 23 Dec 2020 22:13:57 +0800
Message-ID: <20201223141357.780-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
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
2.22.0

