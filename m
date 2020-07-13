Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 191BA21DBA5
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jul 2020 18:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbgGMQ0H (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jul 2020 12:26:07 -0400
Received: from muru.com ([72.249.23.125]:36640 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729027AbgGMQ0H (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Jul 2020 12:26:07 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B05BB8106;
        Mon, 13 Jul 2020 16:26:02 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Carlos Hernandez <ceh@ti.com>
Subject: [PATCH] clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 and am4
Date:   Mon, 13 Jul 2020 09:26:01 -0700
Message-Id: <20200713162601.6829-1-tony@atomide.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Carlos Hernandez <ceh@ti.com> reported that we now have a suspend and
resume regresssion on am3 and am4 compared to the earlier kernels. While
suspend and resume works with v5.8-rc3, we now get errors with rtcwake:

pm33xx pm33xx: PM: Could not transition all powerdomains to target state
...
rtcwake: write error

This is because we now fail to idle the system timer clocks that the
idle code checks and the error gets propagated to the rtcwake.

Turns out there are several issues that need to be fixed:

1. Ignore no-idle and no-reset configured timers for the ti-sysc
   interconnect target driver as otherwise it will keep the system timer
   clocks enabled

2. Toggle the system timer functional clock for suspend for am3 and am4
   (but not for clocksource on am3)

3. Only reconfigure type1 timers in dmtimer_systimer_disable()

4. Use of_machine_is_compatible() instead of of_device_is_compatible()
   for checking the SoC type

Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
Reported-by: Carlos Hernandez <ceh@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c                      | 22 +++++++++++
 drivers/clocksource/timer-ti-dm-systimer.c | 46 +++++++++++++++++-----
 2 files changed, 58 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -2877,6 +2877,24 @@ static int sysc_check_disabled_devices(struct sysc *ddata)
 	return error;
 }
 
+/*
+ * Ignore timers tagged with no-reset and no-idle. These are likely in use,
+ * for example by drivers/clocksource/timer-ti-dm-systimer.c. If more checks
+ * are needed, we could also look at the timer register configuration.
+ */
+static int sysc_check_active_timer(struct sysc *ddata)
+{
+	if (ddata->cap->type != TI_SYSC_OMAP2_TIMER &&
+	    ddata->cap->type != TI_SYSC_OMAP4_TIMER)
+		return 0;
+
+	if ((ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT) &&
+	    (ddata->cfg.quirks & SYSC_QUIRK_NO_IDLE))
+		return -EBUSY;
+
+	return 0;
+}
+
 static const struct of_device_id sysc_match_table[] = {
 	{ .compatible = "simple-bus", },
 	{ /* sentinel */ },
@@ -2933,6 +2951,10 @@ static int sysc_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	error = sysc_check_active_timer(ddata);
+	if (error)
+		return error;
+
 	error = sysc_get_clocks(ddata);
 	if (error)
 		return error;
diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -19,7 +19,7 @@
 /* For type1, set SYSC_OMAP2_CLOCKACTIVITY for fck off on idle, l4 clock on */
 #define DMTIMER_TYPE1_ENABLE	((1 << 9) | (SYSC_IDLE_SMART << 3) | \
 				 SYSC_OMAP2_ENAWAKEUP | SYSC_OMAP2_AUTOIDLE)
-
+#define DMTIMER_TYPE1_DISABLE	(SYSC_OMAP2_SOFTRESET | SYSC_OMAP2_AUTOIDLE)
 #define DMTIMER_TYPE2_ENABLE	(SYSC_IDLE_SMART_WKUP << 2)
 #define DMTIMER_RESET_WAIT	100000
 
@@ -44,6 +44,8 @@ struct dmtimer_systimer {
 	u8 ctrl;
 	u8 wakeup;
 	u8 ifctrl;
+	struct clk *fck;
+	struct clk *ick;
 	unsigned long rate;
 };
 
@@ -298,16 +300,20 @@ static void __init dmtimer_systimer_select_best(void)
 }
 
 /* Interface clocks are only available on some SoCs variants */
-static int __init dmtimer_systimer_init_clock(struct device_node *np,
+static int __init dmtimer_systimer_init_clock(struct dmtimer_systimer *t,
+					      struct device_node *np,
 					      const char *name,
 					      unsigned long *rate)
 {
 	struct clk *clock;
 	unsigned long r;
+	bool is_ick = false;
 	int error;
 
+	is_ick = !strncmp(name, "ick", 3);
+
 	clock = of_clk_get_by_name(np, name);
-	if ((PTR_ERR(clock) == -EINVAL) && !strncmp(name, "ick", 3))
+	if ((PTR_ERR(clock) == -EINVAL) && is_ick)
 		return 0;
 	else if (IS_ERR(clock))
 		return PTR_ERR(clock);
@@ -320,6 +326,11 @@ static int __init dmtimer_systimer_init_clock(struct device_node *np,
 	if (!r)
 		return -ENODEV;
 
+	if (is_ick)
+		t->ick = clock;
+	else
+		t->fck = clock;
+
 	*rate = r;
 
 	return 0;
@@ -339,7 +350,10 @@ static void dmtimer_systimer_enable(struct dmtimer_systimer *t)
 
 static void dmtimer_systimer_disable(struct dmtimer_systimer *t)
 {
-	writel_relaxed(0, t->base + t->sysc);
+	if (!dmtimer_systimer_revision1(t))
+		return;
+
+	writel_relaxed(DMTIMER_TYPE1_DISABLE, t->base + t->sysc);
 }
 
 static int __init dmtimer_systimer_setup(struct device_node *np,
@@ -366,13 +380,13 @@ static int __init dmtimer_systimer_setup(struct device_node *np,
 		pr_err("%s: clock source init failed: %i\n", __func__, error);
 
 	/* For ti-sysc, we have timer clocks at the parent module level */
-	error = dmtimer_systimer_init_clock(np->parent, "fck", &rate);
+	error = dmtimer_systimer_init_clock(t, np->parent, "fck", &rate);
 	if (error)
 		goto err_unmap;
 
 	t->rate = rate;
 
-	error = dmtimer_systimer_init_clock(np->parent, "ick", &rate);
+	error = dmtimer_systimer_init_clock(t, np->parent, "ick", &rate);
 	if (error)
 		goto err_unmap;
 
@@ -496,12 +510,18 @@ static void omap_clockevent_idle(struct clock_event_device *evt)
 	struct dmtimer_systimer *t = &clkevt->t;
 
 	dmtimer_systimer_disable(t);
+	clk_disable(t->fck);
 }
 
 static void omap_clockevent_unidle(struct clock_event_device *evt)
 {
 	struct dmtimer_clockevent *clkevt = to_dmtimer_clockevent(evt);
 	struct dmtimer_systimer *t = &clkevt->t;
+	int error;
+
+	error = clk_enable(t->fck);
+	if (error)
+		pr_err("could not enable timer fck on resume: %i\n", error);
 
 	dmtimer_systimer_enable(t);
 	writel_relaxed(OMAP_TIMER_INT_OVERFLOW, t->base + t->irq_ena);
@@ -570,8 +590,8 @@ static int __init dmtimer_clockevent_init(struct device_node *np)
 					3, /* Timer internal resynch latency */
 					0xffffffff);
 
-	if (of_device_is_compatible(np, "ti,am33xx") ||
-	    of_device_is_compatible(np, "ti,am43")) {
+	if (of_machine_is_compatible("ti,am33xx") ||
+	    of_machine_is_compatible("ti,am43")) {
 		dev->suspend = omap_clockevent_idle;
 		dev->resume = omap_clockevent_unidle;
 	}
@@ -616,12 +636,18 @@ static void dmtimer_clocksource_suspend(struct clocksource *cs)
 
 	clksrc->loadval = readl_relaxed(t->base + t->counter);
 	dmtimer_systimer_disable(t);
+	clk_disable(t->fck);
 }
 
 static void dmtimer_clocksource_resume(struct clocksource *cs)
 {
 	struct dmtimer_clocksource *clksrc = to_dmtimer_clocksource(cs);
 	struct dmtimer_systimer *t = &clksrc->t;
+	int error;
+
+	error = clk_enable(t->fck);
+	if (error)
+		pr_err("could not enable timer fck on resume: %i\n", error);
 
 	dmtimer_systimer_enable(t);
 	writel_relaxed(clksrc->loadval, t->base + t->counter);
@@ -653,8 +679,8 @@ static int __init dmtimer_clocksource_init(struct device_node *np)
 	dev->mask = CLOCKSOURCE_MASK(32);
 	dev->flags = CLOCK_SOURCE_IS_CONTINUOUS;
 
-	if (of_device_is_compatible(np, "ti,am33xx") ||
-	    of_device_is_compatible(np, "ti,am43")) {
+	/* Unlike for clockevent, legacy code sets suspend only for am4 */
+	if (of_machine_is_compatible("ti,am43")) {
 		dev->suspend = dmtimer_clocksource_suspend;
 		dev->resume = dmtimer_clocksource_resume;
 	}
-- 
2.27.0
