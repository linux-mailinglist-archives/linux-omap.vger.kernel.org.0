Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E54320070F
	for <lists+linux-omap@lfdr.de>; Fri, 19 Jun 2020 12:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732526AbgFSKoL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 Jun 2020 06:44:11 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6364 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732715AbgFSKoE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 19 Jun 2020 06:44:04 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 57BF814173BCF5B8416D;
        Fri, 19 Jun 2020 18:44:01 +0800 (CST)
Received: from huawei.com (10.67.174.156) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 19 Jun 2020
 18:43:52 +0800
From:   Chen Tao <chentao107@huawei.com>
To:     <paul@pwsan.com>, <tony@atomide.com>
CC:     <linux@armlinux.org.uk>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <chentao107@huawei.com>
Subject: [PATCH] ARM: OMAP2+: Fix possible memory leak in omap_hwmod_allocate_module
Date:   Fri, 19 Jun 2020 18:42:40 +0800
Message-ID: <20200619104240.55978-1-chentao107@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.174.156]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix memory leak in omap_hwmod_allocate_module not freeing in
handling error path.

Fixes: 8c87970543b17("ARM: OMAP2+: Add functions to allocate module data from device tree")
Signed-off-by: Chen Tao <chentao107@huawei.com>
---
 arch/arm/mach-omap2/omap_hwmod.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 82706af307de..d2667f28e68e 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -3435,7 +3435,7 @@ static int omap_hwmod_allocate_module(struct device *dev, struct omap_hwmod *oh,
 		regs = ioremap(data->module_pa,
 			       data->module_size);
 		if (!regs)
-			return -ENOMEM;
+			goto out_free_sysc;
 	}
 
 	/*
@@ -3445,13 +3445,13 @@ static int omap_hwmod_allocate_module(struct device *dev, struct omap_hwmod *oh,
 	if (oh->class->name && strcmp(oh->class->name, data->name)) {
 		class = kmemdup(oh->class, sizeof(*oh->class), GFP_KERNEL);
 		if (!class)
-			return -ENOMEM;
+			goto out_unmap;
 	}
 
 	if (list_empty(&oh->slave_ports)) {
 		oi = kcalloc(1, sizeof(*oi), GFP_KERNEL);
 		if (!oi)
-			return -ENOMEM;
+			goto out_free_class;
 
 		/*
 		 * Note that we assume interconnect interface clocks will be
@@ -3478,6 +3478,14 @@ static int omap_hwmod_allocate_module(struct device *dev, struct omap_hwmod *oh,
 	spin_unlock_irqrestore(&oh->_lock, flags);
 
 	return 0;
+
+out_free_class:
+	kfree(class);
+out_unmap:
+	iounmap();
+out_free_sysc:
+	kfree(sysc);
+	return -ENOMEM;
 }
 
 static const struct omap_hwmod_reset omap24xx_reset_quirks[] = {
-- 
2.22.0

