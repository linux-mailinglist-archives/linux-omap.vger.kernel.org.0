Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9694A945C
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 08:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348657AbiBDHPG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 02:15:06 -0500
Received: from muru.com ([72.249.23.125]:46280 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236288AbiBDHPF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 02:15:05 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 180F6818C;
        Fri,  4 Feb 2022 07:14:47 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 6/8] clk: ti: Add ti_dt_clk_name() helper to use clock-output-names
Date:   Fri,  4 Feb 2022 09:14:47 +0200
Message-Id: <20220204071449.16762-7-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204071449.16762-1-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's create the clock alias based on the clock-output-names property if
available. Also the component clock drivers can use ti_dt_clk_name() in
the following patches.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clk.c   | 20 +++++++++++++++++++-
 drivers/clk/ti/clock.h |  1 +
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -447,6 +447,24 @@ static const struct of_device_id simple_clk_match_table[] __initconst = {
 	{ }
 };
 
+/**
+ * ti_dt_clk_name - init clock name from first output name or node name
+ * @np: device node
+ *
+ * Use the first clock-output-name for the clock name if found. Fall back
+ * to legacy naming based on node name.
+ */
+const char *ti_dt_clk_name(struct device_node *np)
+{
+	const char *name;
+
+	if (!of_property_read_string_index(np, "clock-output-names", 0,
+					   &name))
+		return name;
+
+	return np->name;
+}
+
 /**
  * ti_clk_add_aliases - setup clock aliases
  *
@@ -463,7 +481,7 @@ void __init ti_clk_add_aliases(void)
 		clkspec.np = np;
 		clk = of_clk_get_from_provider(&clkspec);
 
-		ti_clk_add_alias(NULL, clk, np->name);
+		ti_clk_add_alias(NULL, clk, ti_dt_clk_name(np));
 	}
 }
 
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -211,6 +211,7 @@ struct clk *ti_clk_register(struct device *dev, struct clk_hw *hw,
 			    const char *con);
 struct clk *ti_clk_register_omap_hw(struct device *dev, struct clk_hw *hw,
 				    const char *con);
+const char *ti_dt_clk_name(struct device_node *np);
 int ti_clk_add_alias(struct device *dev, struct clk *clk, const char *con);
 void ti_clk_add_aliases(void);
 
-- 
2.35.1
