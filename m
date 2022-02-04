Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25474A945A
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 08:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349039AbiBDHPF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 02:15:05 -0500
Received: from muru.com ([72.249.23.125]:46274 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236288AbiBDHPE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 02:15:04 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9F16881A5;
        Fri,  4 Feb 2022 07:14:46 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 5/8] clk: ti: Use clock-output-names for clkctrl
Date:   Fri,  4 Feb 2022 09:14:46 +0200
Message-Id: <20220204071449.16762-6-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204071449.16762-1-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use clock-output-names devicetree property for clkctrl clocks if
available.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clkctrl.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -469,14 +469,32 @@ static void __init _clkctrl_add_provider(void *data,
 	of_clk_add_hw_provider(np, _ti_omap4_clkctrl_xlate, data);
 }
 
-/* Get clock name based on compatible string for clkctrl */
-static char * __init clkctrl_get_name(struct device_node *np)
+/*
+ * Get clock name based on "clock-output-names" property or the
+ * compatible property for clkctrl.
+ */
+static const char * __init clkctrl_get_name(struct device_node *np)
 {
 	struct property *prop;
 	const int prefix_len = 11;
 	const char *compat;
+	const char *output;
 	char *name;
 
+	if (!of_property_read_string_index(np, "clock-output-names", 0,
+					   &output)) {
+		const char *end;
+		int len;
+
+		len = strlen(output);
+		end = strstr(output, "_clkctrl");
+		if (end)
+			len -= strlen(end);
+		name = kstrndup(output, len, GFP_KERNEL);
+
+		return name;
+	}
+
 	of_property_for_each_string(np, "compatible", prop, compat) {
 		if (!strncmp("ti,clkctrl-", compat, prefix_len)) {
 			/* Two letter minimum name length for l3, l4 etc */
-- 
2.35.1
