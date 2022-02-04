Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F123F4A9456
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 08:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348820AbiBDHPC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 02:15:02 -0500
Received: from muru.com ([72.249.23.125]:46258 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236288AbiBDHPB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 02:15:01 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B8A91818C;
        Fri,  4 Feb 2022 07:14:43 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 3/8] clk: ti: Optionally parse IO address from parent clock node
Date:   Fri,  4 Feb 2022 09:14:44 +0200
Message-Id: <20220204071449.16762-4-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204071449.16762-1-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If no reg property is specified for a TI clock, let's try to use the
parent clock node IO address. This way we can avoid duplicate devicetree
reg properties that cause warnings for unique_unit_address.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clk.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -274,6 +274,8 @@ int ti_clk_get_reg_addr(struct device_node *node, int index,
 	for (i = 0; i < CLK_MAX_MEMMAPS; i++) {
 		if (clocks_node_ptr[i] == node->parent)
 			break;
+		if (clocks_node_ptr[i] == node->parent->parent)
+			break;
 	}
 
 	if (i == CLK_MAX_MEMMAPS) {
@@ -284,8 +286,12 @@ int ti_clk_get_reg_addr(struct device_node *node, int index,
 	reg->index = i;
 
 	if (of_property_read_u32_index(node, "reg", index, &val)) {
-		pr_err("%pOFn must have reg[%d]!\n", node, index);
-		return -EINVAL;
+		if (of_property_read_u32_index(node->parent, "reg",
+					       index, &val)) {
+			pr_err("%pOFn or parent must have reg[%d]!\n",
+			       node, index);
+			return -EINVAL;
+		}
 	}
 
 	reg->offset = val;
-- 
2.35.1
