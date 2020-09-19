Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEC0270A6E
	for <lists+linux-omap@lfdr.de>; Sat, 19 Sep 2020 05:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgISDnV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Sep 2020 23:43:21 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:39734 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726097AbgISDnU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Sep 2020 23:43:20 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 7ADD01F4EDB0DDC48CFB;
        Sat, 19 Sep 2020 11:43:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Sat, 19 Sep 2020 11:43:07 +0800
From:   Jing Xiangfeng <jingxiangfeng@huawei.com>
To:     <tony@atomide.com>, <linux@armlinux.org.uk>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jingxiangfeng@huawei.com>
Subject: [PATCH] ARM: OMAP2+: Remove redundant assignment to variable ret
Date:   Sat, 19 Sep 2020 11:43:31 +0800
Message-ID: <20200919034331.161271-1-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The variable ret has been initialized with '-ENOMEM'. The assignment
in the if branch is redundant. So remove it.

Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 arch/arm/mach-omap2/omap_device.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
index fc7bb2ca1672..f3191704cab9 100644
--- a/arch/arm/mach-omap2/omap_device.c
+++ b/arch/arm/mach-omap2/omap_device.c
@@ -334,10 +334,9 @@ struct omap_device *omap_device_alloc(struct platform_device *pdev,
 	struct omap_hwmod **hwmods;
 
 	od = kzalloc(sizeof(struct omap_device), GFP_KERNEL);
-	if (!od) {
-		ret = -ENOMEM;
+	if (!od)
 		goto oda_exit1;
-	}
+
 	od->hwmods_cnt = oh_cnt;
 
 	hwmods = kmemdup(ohs, sizeof(struct omap_hwmod *) * oh_cnt, GFP_KERNEL);
-- 
2.17.1

