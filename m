Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67135552E00
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jun 2022 11:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347543AbiFUJL0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jun 2022 05:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346528AbiFUJLZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jun 2022 05:11:25 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C16C45F52;
        Tue, 21 Jun 2022 02:11:24 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9CB90809F;
        Tue, 21 Jun 2022 09:06:25 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH] clk: ti: Fix missing of_node_get() ti_find_clock_provider()
Date:   Tue, 21 Jun 2022 12:11:18 +0300
Message-Id: <20220621091118.33930-1-tony@atomide.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For ti_find_clock_provider() we want to return the np with refcount
incremented. However we are missing of_node_get() for the
clock-output-names case that causes refcount warnings.

Fixes: 51f661ef9a10 ("clk: ti: Add ti_find_clock_provider() to use clock-output-names")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -135,6 +135,7 @@ static struct device_node *ti_find_clock_provider(struct device_node *from,
 			continue;
 
 		if (!strncmp(n, tmp, strlen(tmp))) {
+			of_node_get(np);
 			found = true;
 			break;
 		}
-- 
2.36.1
