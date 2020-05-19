Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12B61D9BB5
	for <lists+linux-omap@lfdr.de>; Tue, 19 May 2020 17:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbgESPwB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 May 2020 11:52:01 -0400
Received: from muru.com ([72.249.23.125]:55034 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728633AbgESPwB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 May 2020 11:52:01 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 432F480FA;
        Tue, 19 May 2020 15:52:50 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] clocksource/drivers/timer-ti-dm: Fix warning for set but not used
Date:   Tue, 19 May 2020 08:51:57 -0700
Message-Id: <20200519155157.12804-1-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can get a warning for dmtimer_clocksource_init() with 'pa' set but
not used. This was used in the earlier revisions of the code but no
longer needed, so let's remove the unused pa and of_translate_address().
Let's also do it for dmtimer_clockevent_init() that has a similar issue.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clocksource/timer-ti-dm-systimer.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -514,7 +514,6 @@ static int __init dmtimer_clockevent_init(struct device_node *np)
 	struct clock_event_device *dev;
 	struct dmtimer_systimer *t;
 	int error;
-	u32 pa;
 
 	clkevt = kzalloc(sizeof(*clkevt), GFP_KERNEL);
 	if (!clkevt)
@@ -563,7 +562,6 @@ static int __init dmtimer_clockevent_init(struct device_node *np)
 	writel_relaxed(OMAP_TIMER_INT_OVERFLOW, t->base + t->irq_ena);
 	writel_relaxed(OMAP_TIMER_INT_OVERFLOW, t->base + t->wakeup);
 
-	pa = of_translate_address(np, of_get_address(np, 0, NULL, NULL));
 	pr_info("TI gptimer clockevent: %s%lu Hz at %pOF\n",
 		of_find_property(np, "ti,timer-alwon", NULL) ?
 		"always-on " : "", t->rate, np->parent);
@@ -637,7 +635,6 @@ static int __init dmtimer_clocksource_init(struct device_node *np)
 	struct dmtimer_systimer *t;
 	struct clocksource *dev;
 	int error;
-	u32 pa;
 
 	clksrc = kzalloc(sizeof(*clksrc), GFP_KERNEL);
 	if (!clksrc)
@@ -666,7 +663,6 @@ static int __init dmtimer_clocksource_init(struct device_node *np)
 	writel_relaxed(OMAP_TIMER_CTRL_ST | OMAP_TIMER_CTRL_AR,
 		       t->base + t->ctrl);
 
-	pa = of_translate_address(np, of_get_address(np, 0, NULL, NULL));
 	pr_info("TI gptimer clocksource: %s%pOF\n",
 		of_find_property(np, "ti,timer-alwon", NULL) ?
 		"always-on " : "", np->parent);
-- 
2.26.2
