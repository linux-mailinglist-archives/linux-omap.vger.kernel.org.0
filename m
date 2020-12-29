Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D352E7116
	for <lists+linux-omap@lfdr.de>; Tue, 29 Dec 2020 14:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgL2NwE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Dec 2020 08:52:04 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9657 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbgL2NwE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 29 Dec 2020 08:52:04 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D4wm14fzQz15km9;
        Tue, 29 Dec 2020 21:50:25 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Tue, 29 Dec 2020 21:51:08 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] bus: ti-sysc: Use kzalloc for allocating only one thing
Date:   Tue, 29 Dec 2020 21:51:47 +0800
Message-ID: <20201229135147.23593-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use kzalloc rather than kcalloc(1,...)

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
@@

- kcalloc(1,
+ kzalloc(
          ...)
// </smpl>

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/bus/ti-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 92ecf1a78ec7..e39b6da64c6d 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -288,7 +288,7 @@ static int sysc_add_named_clock_from_child(struct sysc *ddata,
 	 * limit for clk_get(). If cl ever needs to be freed, it should be done
 	 * with clkdev_drop().
 	 */
-	cl = kcalloc(1, sizeof(*cl), GFP_KERNEL);
+	cl = kzalloc(sizeof(*cl), GFP_KERNEL);
 	if (!cl)
 		return -ENOMEM;
 
-- 
2.22.0

