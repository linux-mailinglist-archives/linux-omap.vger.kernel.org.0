Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21915C2485
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 17:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732097AbfI3PkF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 11:40:05 -0400
Received: from muru.com ([72.249.23.125]:34922 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732092AbfI3PkE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Sep 2019 11:40:04 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5F09580FA;
        Mon, 30 Sep 2019 15:40:36 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Keerthy <j-keerthy@ti.com>
Subject: [PATCH] clk: ti: clkctrl: Fix failed to enable error with double udelay timeout
Date:   Mon, 30 Sep 2019 08:40:01 -0700
Message-Id: <20190930154001.46581-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 3d8598fb9c5a ("clk: ti: clkctrl: use fallback udelay approach if
timekeeping is suspended") added handling for cases when timekeeping is
suspended. But looks like we can still get occasional "failed to enable"
errors on the PM runtime resume path with udelay() returning faster than
expected.

With ti-sysc interconnect target module driver this leads into device
failure with PM runtime failing with "failed to enable" clkctrl error.

Let's fix the issue with a delay of two times the desired delay as in
often done for udelay() to account for the inaccuracy.

Fixes: 3d8598fb9c5a ("clk: ti: clkctrl: use fallback udelay approach if timekeeping is suspended")
Cc: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clkctrl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -100,11 +100,12 @@ static bool _omap4_is_timeout(union omap4_timeout *time, u32 timeout)
 	 * can be from a timer that requires pm_runtime access, which
 	 * will eventually bring us here with timekeeping_suspended,
 	 * during both suspend entry and resume paths. This happens
-	 * at least on am43xx platform.
+	 * at least on am43xx platform. Account for flakeyness
+	 * with udelay() by multiplying the timeout value by 2.
 	 */
 	if (unlikely(_early_timeout || timekeeping_suspended)) {
 		if (time->cycles++ < timeout) {
-			udelay(1);
+			udelay(1 * 2);
 			return false;
 		}
 	} else {
-- 
2.23.0
