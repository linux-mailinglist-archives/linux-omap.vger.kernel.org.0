Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 495D84A9458
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 08:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348793AbiBDHPD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 02:15:03 -0500
Received: from muru.com ([72.249.23.125]:46266 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236288AbiBDHPC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 02:15:02 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 315398196;
        Fri,  4 Feb 2022 07:14:45 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 4/8] clk: ti: Add ti_find_clock_provider() to use clock-output-names
Date:   Fri,  4 Feb 2022 09:14:45 +0200
Message-Id: <20220204071449.16762-5-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204071449.16762-1-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's add ti_find_clock_provider() so we can use clock-output-names
to name the clock provider instead of relying on non-standard devicetree
node names.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clk.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -119,12 +119,51 @@ int ti_clk_setup_ll_ops(struct ti_clk_ll_ops *ops)
 	return 0;
 }
 
+/*
+ * Eventually we could standardize to using '_' for clk-*.c files to follow the
+ * TRM naming and leave out the tmp name here.
+ */
+static struct device_node *ti_find_clock_provider(struct device_node *from,
+						  const char *name)
+{
+	struct device_node *np;
+	bool found = false;
+	const char *n;
+	char *tmp;
+
+	tmp = kstrdup(name, GFP_KERNEL);
+	if (!tmp)
+		return NULL;
+	strreplace(tmp, '-', '_');
+
+	/* Node named "clock" with "clock-output-names" */
+	for_each_of_allnodes_from(from, np) {
+		if (of_property_read_string_index(np, "clock-output-names",
+						  0, &n))
+			continue;
+
+		if (!strncmp(n, tmp, strlen(tmp))) {
+			found = true;
+			break;
+		}
+	}
+	of_node_put(from);
+	kfree(tmp);
+
+	if (found)
+		return np;
+
+	/* Fall back to using old node name base provider name */
+	return of_find_node_by_name(from, name);
+}
+
 /**
  * ti_dt_clocks_register - register DT alias clocks during boot
  * @oclks: list of clocks to register
  *
  * Register alias or non-standard DT clock entries during boot. By
- * default, DT clocks are found based on their node name. If any
+ * default, DT clocks are found based on their clock-output-names
+ * property, or the clock node name for legacy cases. If any
  * additional con-id / dev-id -> clock mapping is required, use this
  * function to list these.
  */
@@ -168,7 +207,7 @@ void __init ti_dt_clocks_register(struct ti_dt_clk oclks[])
 		if (num_args && clkctrl_nodes_missing)
 			continue;
 
-		node = of_find_node_by_name(NULL, buf);
+		node = ti_find_clock_provider(NULL, buf);
 		if (num_args && compat_mode) {
 			parent = node;
 			child = of_get_child_by_name(parent, "clock");
-- 
2.35.1
