Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05B504A9454
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 08:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234948AbiBDHPA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 02:15:00 -0500
Received: from muru.com ([72.249.23.125]:46254 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236288AbiBDHO7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 02:14:59 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4BFC981A5;
        Fri,  4 Feb 2022 07:14:42 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 2/8] clk: ti: Preserve node in ti_dt_clocks_register()
Date:   Fri,  4 Feb 2022 09:14:43 +0200
Message-Id: <20220204071449.16762-3-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204071449.16762-1-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In preparation for making use of the clock-output-names, we want to
keep node around in ti_dt_clocks_register().

This change should not needed as a fix currently.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clk.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -131,7 +131,7 @@ int ti_clk_setup_ll_ops(struct ti_clk_ll_ops *ops)
 void __init ti_dt_clocks_register(struct ti_dt_clk oclks[])
 {
 	struct ti_dt_clk *c;
-	struct device_node *node, *parent;
+	struct device_node *node, *parent, *child;
 	struct clk *clk;
 	struct of_phandle_args clkspec;
 	char buf[64];
@@ -171,10 +171,13 @@ void __init ti_dt_clocks_register(struct ti_dt_clk oclks[])
 		node = of_find_node_by_name(NULL, buf);
 		if (num_args && compat_mode) {
 			parent = node;
-			node = of_get_child_by_name(parent, "clock");
-			if (!node)
-				node = of_get_child_by_name(parent, "clk");
-			of_node_put(parent);
+			child = of_get_child_by_name(parent, "clock");
+			if (!child)
+				child = of_get_child_by_name(parent, "clk");
+			if (child) {
+				of_node_put(parent);
+				node = child;
+			}
 		}
 
 		clkspec.np = node;
-- 
2.35.1
