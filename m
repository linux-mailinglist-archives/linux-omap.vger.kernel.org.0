Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9F7225E60
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jul 2020 14:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbgGTMUf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jul 2020 08:20:35 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7796 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728532AbgGTMUe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 Jul 2020 08:20:34 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 4DA5AACBF07D6CFCE4AD;
        Mon, 20 Jul 2020 20:20:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Mon, 20 Jul 2020 20:20:22 +0800
From:   Jing Xiangfeng <jingxiangfeng@huawei.com>
To:     <t-kristo@ti.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <tony@atomide.com>, <robh@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <jingxiangfeng@huawei.com>
Subject: [PATCH] clk: ti: clkctrl: add the missed kfree() for _ti_omap4_clkctrl_setup()
Date:   Mon, 20 Jul 2020 20:23:43 +0800
Message-ID: <20200720122343.178203-1-jingxiangfeng@huawei.com>
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

_ti_omap4_clkctrl_setup() misses to call kfree() in an error path. Add
the missed function call to fix it.

Fixes: 6c3090520554 ("clk: ti: clkctrl: Fix hidden dependency to node name")
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 drivers/clk/ti/clkctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 864c484bde1b..868e50132c21 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -655,8 +655,10 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 		}
 
 		hw = kzalloc(sizeof(*hw), GFP_KERNEL);
-		if (!hw)
+		if (!hw) {
+			kfree(clkctrl_name);
 			return;
+		}
 
 		hw->enable_reg.ptr = provider->base + reg_data->offset;
 
-- 
2.17.1

