Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E192B427C
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbgKPLUG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:06 -0500
Received: from muru.com ([72.249.23.125]:48412 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727228AbgKPLUG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:06 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 612F9813D;
        Mon, 16 Nov 2020 11:20:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 01/17] clk: ti: am437x: Keep am4 l3 main clock always on for genpd
Date:   Mon, 16 Nov 2020 13:19:23 +0200
Message-Id: <20201116111939.21405-2-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116111939.21405-1-tony@atomide.com>
References: <20201116111939.21405-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In order for suspend and resume to work with genpd on am4, we must keep
l3 main clock always on. Otherwise prm_omap driver will shut down the l3
main clock on suspend when simple-pm-bus and GENPD_FLAG_PM_CLK are used.
Note that we already keep the l3 main clock always on with the legacy
platform code.

Later on we may want to start managing the l3 main clock with a dedicated
interconnect driver instead of using simple-pm-bus and GENPD_FLAG_PM_CLK.

Cc: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clk-43xx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/ti/clk-43xx.c b/drivers/clk/ti/clk-43xx.c
--- a/drivers/clk/ti/clk-43xx.c
+++ b/drivers/clk/ti/clk-43xx.c
@@ -272,6 +272,11 @@ static struct ti_dt_clk am43xx_clks[] = {
 	{ .node_name = NULL },
 };
 
+static const char *enable_init_clks[] = {
+	/* AM4_L3_L3_MAIN_CLKCTRL, needed during suspend */
+	"l3-clkctrl:0000:0",
+};
+
 int __init am43xx_dt_clk_init(void)
 {
 	struct clk *clk1, *clk2;
@@ -283,6 +288,9 @@ int __init am43xx_dt_clk_init(void)
 
 	omap2_clk_disable_autoidle_all();
 
+	omap2_clk_enable_init_clocks(enable_init_clks,
+				     ARRAY_SIZE(enable_init_clks));
+
 	ti_clk_add_aliases();
 
 	/*
-- 
2.29.2
