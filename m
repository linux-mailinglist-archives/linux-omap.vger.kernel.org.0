Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 598628F6D2
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2019 00:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731464AbfHOWMv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Aug 2019 18:12:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:59442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726357AbfHOWMv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 15 Aug 2019 18:12:51 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61A6A20644;
        Thu, 15 Aug 2019 22:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565907170;
        bh=G/b2bcj6Snv17mmT0yDLb7pCowc74GtOlBXWNz/6aGA=;
        h=From:To:Cc:Subject:Date:From;
        b=Ehmx0dlYnGogaJaM5WZqce4bZUoxVsgGVsAiQFAGEiNR9KEoqKw/EzSIJFAhAJlvo
         HsMAOJ93DKqEe618RPA0l8QXFSBvI4olXgam3VpvTDFZ3YNCPaNUFNEcLHOGagas5f
         +ubsFh5u/jBdK+B6WBfPSJ82EQAsmAqHE+Zuj2dw=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH] clk: ti: Don't reference clk_init_data after registration
Date:   Thu, 15 Aug 2019 15:12:49 -0700
Message-Id: <20190815221249.53235-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A future patch is going to change semantics of clk_register() so that
clk_hw::init is guaranteed to be NULL after a clk is registered. Avoid
referencing this member here so that we don't run into NULL pointer
exceptions.

Cc: Tero Kristo <t-kristo@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---

This might be causing boot regressions in linux-next. Not sure.

 drivers/clk/ti/apll.c | 9 +++++----
 drivers/clk/ti/dpll.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/ti/apll.c b/drivers/clk/ti/apll.c
index 015a657d3382..ac5bc8857a51 100644
--- a/drivers/clk/ti/apll.c
+++ b/drivers/clk/ti/apll.c
@@ -140,6 +140,7 @@ static void __init omap_clk_register_apll(void *user,
 	struct clk_hw_omap *clk_hw = to_clk_hw_omap(hw);
 	struct dpll_data *ad = clk_hw->dpll_data;
 	struct clk *clk;
+	const struct clk_init_data *init = clk_hw->hw.init;
 
 	clk = of_clk_get(node, 0);
 	if (IS_ERR(clk)) {
@@ -168,15 +169,15 @@ static void __init omap_clk_register_apll(void *user,
 	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, node->name);
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
-		kfree(clk_hw->hw.init->parent_names);
-		kfree(clk_hw->hw.init);
+		kfree(init->parent_names);
+		kfree(init);
 		return;
 	}
 
 cleanup:
 	kfree(clk_hw->dpll_data);
-	kfree(clk_hw->hw.init->parent_names);
-	kfree(clk_hw->hw.init);
+	kfree(init->parent_names);
+	kfree(init);
 	kfree(clk_hw);
 }
 
diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
index 659dadb23279..f3f609c465a7 100644
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -165,6 +165,7 @@ static void __init _register_dpll(void *user,
 	struct clk_hw_omap *clk_hw = to_clk_hw_omap(hw);
 	struct dpll_data *dd = clk_hw->dpll_data;
 	struct clk *clk;
+	const struct clk_init_data *init = hw->init;
 
 	clk = of_clk_get(node, 0);
 	if (IS_ERR(clk)) {
@@ -196,15 +197,15 @@ static void __init _register_dpll(void *user,
 
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
-		kfree(clk_hw->hw.init->parent_names);
-		kfree(clk_hw->hw.init);
+		kfree(init->parent_names);
+		kfree(init);
 		return;
 	}
 
 cleanup:
 	kfree(clk_hw->dpll_data);
-	kfree(clk_hw->hw.init->parent_names);
-	kfree(clk_hw->hw.init);
+	kfree(init->parent_names);
+	kfree(init);
 	kfree(clk_hw);
 }
 
-- 
Sent by a computer through tubes

