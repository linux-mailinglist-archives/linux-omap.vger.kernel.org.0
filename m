Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44FF230279
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jul 2020 08:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgG1GPz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jul 2020 02:15:55 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:8836 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726746AbgG1GPz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 Jul 2020 02:15:55 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 27F7CD4DF071FA9B929B;
        Tue, 28 Jul 2020 14:15:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Jul 2020 14:15:39 +0800
From:   Jing Xiangfeng <jingxiangfeng@huawei.com>
To:     <t-kristo@ti.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <tony@atomide.com>, <robh@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <jingxiangfeng@huawei.com>
Subject: [PATCH v2] clk: ti: clkctrl: fix the missed kfree() for _ti_omap4_clkctrl_setup()
Date:   Tue, 28 Jul 2020 14:18:46 +0800
Message-ID: <20200728061846.68281-1-jingxiangfeng@huawei.com>
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

_ti_omap4_clkctrl_setup() misses to call kfree() in an error path. Jump
to cleanup to fix it.

Fixes: 6c3090520554 ("clk: ti: clkctrl: Fix hidden dependency to node name")
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 drivers/clk/ti/clkctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 864c484bde1b..a562261eb061 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -656,7 +656,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 
 		hw = kzalloc(sizeof(*hw), GFP_KERNEL);
 		if (!hw)
-			return;
+			goto cleanup;
 
 		hw->enable_reg.ptr = provider->base + reg_data->offset;
 
-- 
2.17.1

