Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1431616847D
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 18:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgBURKg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 12:10:36 -0500
Received: from muru.com ([72.249.23.125]:56722 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbgBURKf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 Feb 2020 12:10:35 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D6E03807E;
        Fri, 21 Feb 2020 17:11:19 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH] clk: ti: am43xx: Fix clock parent for RTC clock
Date:   Fri, 21 Feb 2020 09:10:30 -0800
Message-Id: <20200221171030.39326-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Currently enabling clkctrl clock on am4 can fail for RTC as the clock
parent is wrong for RTC.

Fixes: 76a1049b84dd ("clk: ti: am43xx: add new clkctrl data for am43xx")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

It is unclear if we can end up with RTC hung with the current mainline
kernel in some cases. Probing RTC with device tree data only seems to
trigger this every time.

---
 drivers/clk/ti/clk-43xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-43xx.c b/drivers/clk/ti/clk-43xx.c
--- a/drivers/clk/ti/clk-43xx.c
+++ b/drivers/clk/ti/clk-43xx.c
@@ -78,7 +78,7 @@ static const struct omap_clkctrl_reg_data am4_gfx_l3_clkctrl_regs[] __initconst
 };
 
 static const struct omap_clkctrl_reg_data am4_l4_rtc_clkctrl_regs[] __initconst = {
-	{ AM4_L4_RTC_RTC_CLKCTRL, NULL, CLKF_SW_SUP, "clk_32768_ck" },
+	{ AM4_L4_RTC_RTC_CLKCTRL, NULL, CLKF_SW_SUP, "clkdiv32k_ick" },
 	{ 0 },
 };
 
-- 
2.25.1
