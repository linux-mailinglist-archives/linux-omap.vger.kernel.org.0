Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C5F22BC9B
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 05:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgGXDvQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 23:51:16 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42728 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726381AbgGXDvP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Jul 2020 23:51:15 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id E0971258DA4B892C6263;
        Fri, 24 Jul 2020 11:51:11 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Fri, 24 Jul 2020 11:51:05 +0800
From:   Jing Xiangfeng <jingxiangfeng@huawei.com>
To:     <tony@atomide.com>, <linux@armlinux.org.uk>, <t-kristo@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jingxiangfeng@huawei.com>
Subject: [PATCH] ARM: OMAP2+: Fix an IS_ERR() vs NULL check in _get_pwrdm()
Date:   Fri, 24 Jul 2020 11:54:30 +0800
Message-ID: <20200724035430.96287-1-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The of_clk_get() function returns error pointers, it never returns NULL.

Fixes: 4ea3711aece4 ("ARM: OMAP2+: omap-iommu.c conversion to ti-sysc")
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 arch/arm/mach-omap2/omap-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap-iommu.c b/arch/arm/mach-omap2/omap-iommu.c
index 54aff33e55e6..bfa5e1b8dba7 100644
--- a/arch/arm/mach-omap2/omap-iommu.c
+++ b/arch/arm/mach-omap2/omap-iommu.c
@@ -74,7 +74,7 @@ static struct powerdomain *_get_pwrdm(struct device *dev)
 		return pwrdm;
 
 	clk = of_clk_get(dev->of_node->parent, 0);
-	if (!clk) {
+	if (IS_ERR(clk)) {
 		dev_err(dev, "no fck found\n");
 		return NULL;
 	}
-- 
2.17.1

