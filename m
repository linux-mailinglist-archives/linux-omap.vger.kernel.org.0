Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD07C15541
	for <lists+linux-omap@lfdr.de>; Mon,  6 May 2019 23:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbfEFVJF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 May 2019 17:09:05 -0400
Received: from muru.com ([72.249.23.125]:48062 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726322AbfEFVJF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 6 May 2019 17:09:05 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D199280DB;
        Mon,  6 May 2019 21:09:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH] clk: ti: clkctrl: Fix clkdm_clk handling
Date:   Mon,  6 May 2019 14:08:54 -0700
Message-Id: <20190506210854.24300-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We need to always call clkdm_clk_enable() and clkdm_clk_disable() even
the clkctrl clock(s) enabled for the domain do not have any gate register
bits. Otherwise clockdomains may never get enabled except when devices get
probed with the legacy "ti,hwmods" devicetree property.

Fixes: 88a172526c32 ("clk: ti: add support for clkctrl clocks")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clkctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -137,9 +137,6 @@ static int _omap4_clkctrl_clk_enable(struct clk_hw *hw)
 	int ret;
 	union omap4_timeout timeout = { 0 };
 
-	if (!clk->enable_bit)
-		return 0;
-
 	if (clk->clkdm) {
 		ret = ti_clk_ll_ops->clkdm_clk_enable(clk->clkdm, hw->clk);
 		if (ret) {
@@ -151,6 +148,9 @@ static int _omap4_clkctrl_clk_enable(struct clk_hw *hw)
 		}
 	}
 
+	if (!clk->enable_bit)
+		return 0;
+
 	val = ti_clk_ll_ops->clk_readl(&clk->enable_reg);
 
 	val &= ~OMAP4_MODULEMODE_MASK;
@@ -179,7 +179,7 @@ static void _omap4_clkctrl_clk_disable(struct clk_hw *hw)
 	union omap4_timeout timeout = { 0 };
 
 	if (!clk->enable_bit)
-		return;
+		goto exit;
 
 	val = ti_clk_ll_ops->clk_readl(&clk->enable_reg);
 
-- 
2.21.0
