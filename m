Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A633458FD
	for <lists+linux-omap@lfdr.de>; Tue, 23 Mar 2021 08:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCWHni (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Mar 2021 03:43:38 -0400
Received: from muru.com ([72.249.23.125]:45936 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229548AbhCWHnd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Mar 2021 03:43:33 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E00A580F7;
        Tue, 23 Mar 2021 07:44:27 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 1/2] clocksource/drivers/timer-ti-dm: Prepare to handle dra7 timer wrap issue
Date:   Tue, 23 Mar 2021 09:43:25 +0200
Message-Id: <20210323074326.28302-2-tony@atomide.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210323074326.28302-1-tony@atomide.com>
References: <20210323074326.28302-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There is a timer wrap issue on dra7 for the ARM architected timer.
In a typical clock configuration the timer fails to wrap after 388 days.

To work around the issue, we need to use timer-ti-dm timers instead.

Let's prepare for adding support for percpu timers by adding a common
dmtimer_clkevt_init_common() and call it from dmtimer_clockevent_init().
This patch makes no intentional functional changes.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clocksource/timer-ti-dm-systimer.c | 66 ++++++++++++++--------
 1 file changed, 43 insertions(+), 23 deletions(-)

diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -530,17 +530,17 @@ static void omap_clockevent_unidle(struct clock_event_device *evt)
 	writel_relaxed(OMAP_TIMER_INT_OVERFLOW, t->base + t->wakeup);
 }
 
-static int __init dmtimer_clockevent_init(struct device_node *np)
+static int __init dmtimer_clkevt_init_common(struct dmtimer_clockevent *clkevt,
+					     struct device_node *np,
+					     unsigned int features,
+					     const struct cpumask *cpumask,
+					     const char *name,
+					     int rating)
 {
-	struct dmtimer_clockevent *clkevt;
 	struct clock_event_device *dev;
 	struct dmtimer_systimer *t;
 	int error;
 
-	clkevt = kzalloc(sizeof(*clkevt), GFP_KERNEL);
-	if (!clkevt)
-		return -ENOMEM;
-
 	t = &clkevt->t;
 	dev = &clkevt->dev;
 
@@ -548,25 +548,23 @@ static int __init dmtimer_clockevent_init(struct device_node *np)
 	 * We mostly use cpuidle_coupled with ARM local timers for runtime,
 	 * so there's probably no use for CLOCK_EVT_FEAT_DYNIRQ here.
 	 */
-	dev->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
-	dev->rating = 300;
+	dev->features = features;
+	dev->rating = rating;
 	dev->set_next_event = dmtimer_set_next_event;
 	dev->set_state_shutdown = dmtimer_clockevent_shutdown;
 	dev->set_state_periodic = dmtimer_set_periodic;
 	dev->set_state_oneshot = dmtimer_clockevent_shutdown;
 	dev->set_state_oneshot_stopped = dmtimer_clockevent_shutdown;
 	dev->tick_resume = dmtimer_clockevent_shutdown;
-	dev->cpumask = cpu_possible_mask;
+	dev->cpumask = cpumask;
 
 	dev->irq = irq_of_parse_and_map(np, 0);
-	if (!dev->irq) {
-		error = -ENXIO;
-		goto err_out_free;
-	}
+	if (!dev->irq)
+		return -ENXIO;
 
 	error = dmtimer_systimer_setup(np, &clkevt->t);
 	if (error)
-		goto err_out_free;
+		return error;
 
 	clkevt->period = 0xffffffff - DIV_ROUND_CLOSEST(t->rate, HZ);
 
@@ -578,32 +576,54 @@ static int __init dmtimer_clockevent_init(struct device_node *np)
 	writel_relaxed(OMAP_TIMER_CTRL_POSTED, t->base + t->ifctrl);
 
 	error = request_irq(dev->irq, dmtimer_clockevent_interrupt,
-			    IRQF_TIMER, "clockevent", clkevt);
+			    IRQF_TIMER, name, clkevt);
 	if (error)
 		goto err_out_unmap;
 
 	writel_relaxed(OMAP_TIMER_INT_OVERFLOW, t->base + t->irq_ena);
 	writel_relaxed(OMAP_TIMER_INT_OVERFLOW, t->base + t->wakeup);
 
-	pr_info("TI gptimer clockevent: %s%lu Hz at %pOF\n",
-		of_find_property(np, "ti,timer-alwon", NULL) ?
+	pr_info("TI gptimer %s: %s%lu Hz at %pOF\n",
+		name, of_find_property(np, "ti,timer-alwon", NULL) ?
 		"always-on " : "", t->rate, np->parent);
 
-	clockevents_config_and_register(dev, t->rate,
+	return 0;
+
+err_out_unmap:
+	iounmap(t->base);
+
+	return error;
+}
+
+static int __init dmtimer_clockevent_init(struct device_node *np)
+{
+	struct dmtimer_clockevent *clkevt;
+	int error;
+
+	clkevt = kzalloc(sizeof(*clkevt), GFP_KERNEL);
+	if (!clkevt)
+		return -ENOMEM;
+
+	error = dmtimer_clkevt_init_common(clkevt, np,
+					   CLOCK_EVT_FEAT_PERIODIC |
+					   CLOCK_EVT_FEAT_ONESHOT,
+					   cpu_possible_mask, "clockevent",
+					   300);
+	if (error)
+		goto err_out_free;
+
+	clockevents_config_and_register(&clkevt->dev, clkevt->t.rate,
 					3, /* Timer internal resynch latency */
 					0xffffffff);
 
 	if (of_machine_is_compatible("ti,am33xx") ||
 	    of_machine_is_compatible("ti,am43")) {
-		dev->suspend = omap_clockevent_idle;
-		dev->resume = omap_clockevent_unidle;
+		clkevt->dev.suspend = omap_clockevent_idle;
+		clkevt->dev.resume = omap_clockevent_unidle;
 	}
 
 	return 0;
 
-err_out_unmap:
-	iounmap(t->base);
-
 err_out_free:
 	kfree(clkevt);
 
-- 
2.31.0
