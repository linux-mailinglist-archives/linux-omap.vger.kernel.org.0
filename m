Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC8F1AD70D
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 09:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728636AbgDQHJH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 03:09:07 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2391 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728375AbgDQHJH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Apr 2020 03:09:07 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id E77479351F233395DA81;
        Fri, 17 Apr 2020 15:09:03 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 15:08:57 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <t-kristo@ti.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] clk: ti: dra7: remove two unused symbols
Date:   Fri, 17 Apr 2020 15:35:23 +0800
Message-ID: <20200417073523.42520-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix the following gcc warning:

drivers/clk/ti/clk-7xx.c:320:43: warning: ‘dra7_gpu_sys_clk_data’
defined but not used [-Wunused-const-variable=]
 static const struct omap_clkctrl_div_data dra7_gpu_sys_clk_data
__initconst = {
                                           ^~~~~~~~~~~~~~~~~~~~~
drivers/clk/ti/clk-7xx.c:315:27: warning: ‘dra7_gpu_sys_clk_parents’
defined but not used [-Wunused-const-variable=]
 static const char * const dra7_gpu_sys_clk_parents[] __initconst = {
                           ^~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/clk/ti/clk-7xx.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
index 14b645093107..941a67dae22c 100644
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -312,15 +312,6 @@ static const char * const dra7_gpu_hyd_mux_parents[] __initconst = {
 	NULL,
 };
 
-static const char * const dra7_gpu_sys_clk_parents[] __initconst = {
-	"sys_clkin",
-	NULL,
-};
-
-static const struct omap_clkctrl_div_data dra7_gpu_sys_clk_data __initconst = {
-	.max_div = 2,
-};
-
 static const struct omap_clkctrl_bit_data dra7_gpu_core_bit_data[] __initconst = {
 	{ 24, TI_CLK_MUX, dra7_gpu_core_mux_parents, NULL, },
 	{ 26, TI_CLK_MUX, dra7_gpu_hyd_mux_parents, NULL, },
-- 
2.21.1

