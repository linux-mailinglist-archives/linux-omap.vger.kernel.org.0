Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9013F2F7A0
	for <lists+linux-omap@lfdr.de>; Thu, 30 May 2019 08:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbfE3G4E (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 May 2019 02:56:04 -0400
Received: from muru.com ([72.249.23.125]:51854 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726743AbfE3G4E (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 May 2019 02:56:04 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E6E7A803A;
        Thu, 30 May 2019 06:56:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] clk: ti: clkctrl: Fix returning uninitialized data
Date:   Wed, 29 May 2019 23:55:57 -0700
Message-Id: <20190530065557.42741-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If we do a clk_get() for a clock that does not exists, we have
_ti_omap4_clkctrl_xlate() return uninitialized data if no match
is found. This can be seen in some cases with SLAB_DEBUG enabled:

Unable to handle kernel paging request at virtual address 5a5a5a5a
...
clk_hw_create_clk.part.33
sysc_notifier_call
notifier_call_chain
blocking_notifier_call_chain
device_add

Let's fix this by setting a found flag only when we find a match.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Fixes: 88a172526c32 ("clk: ti: add support for clkctrl clocks")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clkctrl.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -229,6 +229,7 @@ static struct clk_hw *_ti_omap4_clkctrl_xlate(struct of_phandle_args *clkspec,
 {
 	struct omap_clkctrl_provider *provider = data;
 	struct omap_clkctrl_clk *entry;
+	bool found = false;
 
 	if (clkspec->args_count != 2)
 		return ERR_PTR(-EINVAL);
@@ -238,11 +239,13 @@ static struct clk_hw *_ti_omap4_clkctrl_xlate(struct of_phandle_args *clkspec,
 
 	list_for_each_entry(entry, &provider->clocks, node) {
 		if (entry->reg_offset == clkspec->args[0] &&
-		    entry->bit_offset == clkspec->args[1])
+		    entry->bit_offset == clkspec->args[1]) {
+			found = true;
 			break;
+		}
 	}
 
-	if (!entry)
+	if (!found)
 		return ERR_PTR(-EINVAL);
 
 	return entry->clk;
-- 
2.21.0
