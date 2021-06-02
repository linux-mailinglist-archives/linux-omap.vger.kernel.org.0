Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E665E3986D8
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jun 2021 12:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhFBKsm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 06:48:42 -0400
Received: from muru.com ([72.249.23.125]:35412 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230124AbhFBKsY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Jun 2021 06:48:24 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1F0168119;
        Wed,  2 Jun 2021 10:46:47 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     stable@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, Tero Kristo <kristo@kernel.org>
Subject: [Backport for linux-5.4.y PATCH 2/4] ARM: OMAP2+: Prepare timer code to backport dra7 timer wrap errata i940
Date:   Wed,  2 Jun 2021 13:46:23 +0300
Message-Id: <20210602104625.6079-2-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602104625.6079-1-tony@atomide.com>
References: <20210602104625.6079-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Prepare linux-5.4.y to backport upstream timer wrap errata commit
3efe7a878a11c13b5297057bfc1e5639ce1241ce and commit
25de4ce5ed02994aea8bc111d133308f6fd62566. Earlier kernels still use
mach-omap2/timer instead of drivers/clocksource as these kernels still
depend on legacy platform code for timers. Note that earlier stable
kernels need also additional patches and will be posted separately.

We need to prepare the timer code to allow using multiple timer instances
to handle the dra7 timer wrap errata. We do this by adding struct
dmtimer_clockevent that we initialize dynamically, and update the timer
functions to use it.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/timer.c | 105 +++++++++++++++++++++---------------
 1 file changed, 63 insertions(+), 42 deletions(-)

diff --git a/arch/arm/mach-omap2/timer.c b/arch/arm/mach-omap2/timer.c
--- a/arch/arm/mach-omap2/timer.c
+++ b/arch/arm/mach-omap2/timer.c
@@ -63,15 +63,28 @@
 
 /* Clockevent code */
 
-static struct omap_dm_timer clkev;
-static struct clock_event_device clockevent_gpt;
-
 /* Clockevent hwmod for am335x and am437x suspend */
 static struct omap_hwmod *clockevent_gpt_hwmod;
 
 /* Clockesource hwmod for am437x suspend */
 static struct omap_hwmod *clocksource_gpt_hwmod;
 
+struct dmtimer_clockevent {
+	struct clock_event_device dev;
+	struct omap_dm_timer timer;
+};
+
+static struct dmtimer_clockevent clockevent;
+
+static struct omap_dm_timer *to_dmtimer(struct clock_event_device *clockevent)
+{
+	struct dmtimer_clockevent *clkevt =
+		container_of(clockevent, struct dmtimer_clockevent, dev);
+	struct omap_dm_timer *timer = &clkevt->timer;
+
+	return timer;
+}
+
 #ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
 static unsigned long arch_timer_freq;
 
@@ -83,10 +96,11 @@ void set_cntfreq(void)
 
 static irqreturn_t omap2_gp_timer_interrupt(int irq, void *dev_id)
 {
-	struct clock_event_device *evt = &clockevent_gpt;
-
-	__omap_dm_timer_write_status(&clkev, OMAP_TIMER_INT_OVERFLOW);
+	struct dmtimer_clockevent *clkevt = dev_id;
+	struct clock_event_device *evt = &clkevt->dev;
+	struct omap_dm_timer *timer = &clkevt->timer;
 
+	__omap_dm_timer_write_status(timer, OMAP_TIMER_INT_OVERFLOW);
 	evt->event_handler(evt);
 	return IRQ_HANDLED;
 }
@@ -94,7 +108,9 @@ static irqreturn_t omap2_gp_timer_interrupt(int irq, void *dev_id)
 static int omap2_gp_timer_set_next_event(unsigned long cycles,
 					 struct clock_event_device *evt)
 {
-	__omap_dm_timer_load_start(&clkev, OMAP_TIMER_CTRL_ST,
+	struct omap_dm_timer *timer = to_dmtimer(evt);
+
+	__omap_dm_timer_load_start(timer, OMAP_TIMER_CTRL_ST,
 				   0xffffffff - cycles, OMAP_TIMER_POSTED);
 
 	return 0;
@@ -102,22 +118,26 @@ static int omap2_gp_timer_set_next_event(unsigned long cycles,
 
 static int omap2_gp_timer_shutdown(struct clock_event_device *evt)
 {
-	__omap_dm_timer_stop(&clkev, OMAP_TIMER_POSTED, clkev.rate);
+	struct omap_dm_timer *timer = to_dmtimer(evt);
+
+	__omap_dm_timer_stop(timer, OMAP_TIMER_POSTED, timer->rate);
+
 	return 0;
 }
 
 static int omap2_gp_timer_set_periodic(struct clock_event_device *evt)
 {
+	struct omap_dm_timer *timer = to_dmtimer(evt);
 	u32 period;
 
-	__omap_dm_timer_stop(&clkev, OMAP_TIMER_POSTED, clkev.rate);
+	__omap_dm_timer_stop(timer, OMAP_TIMER_POSTED, timer->rate);
 
-	period = clkev.rate / HZ;
+	period = timer->rate / HZ;
 	period -= 1;
 	/* Looks like we need to first set the load value separately */
-	__omap_dm_timer_write(&clkev, OMAP_TIMER_LOAD_REG, 0xffffffff - period,
+	__omap_dm_timer_write(timer, OMAP_TIMER_LOAD_REG, 0xffffffff - period,
 			      OMAP_TIMER_POSTED);
-	__omap_dm_timer_load_start(&clkev,
+	__omap_dm_timer_load_start(timer,
 				   OMAP_TIMER_CTRL_AR | OMAP_TIMER_CTRL_ST,
 				   0xffffffff - period, OMAP_TIMER_POSTED);
 	return 0;
@@ -131,26 +151,17 @@ static void omap_clkevt_idle(struct clock_event_device *unused)
 	omap_hwmod_idle(clockevent_gpt_hwmod);
 }
 
-static void omap_clkevt_unidle(struct clock_event_device *unused)
+static void omap_clkevt_unidle(struct clock_event_device *evt)
 {
+	struct omap_dm_timer *timer = to_dmtimer(evt);
+
 	if (!clockevent_gpt_hwmod)
 		return;
 
 	omap_hwmod_enable(clockevent_gpt_hwmod);
-	__omap_dm_timer_int_enable(&clkev, OMAP_TIMER_INT_OVERFLOW);
+	__omap_dm_timer_int_enable(timer, OMAP_TIMER_INT_OVERFLOW);
 }
 
-static struct clock_event_device clockevent_gpt = {
-	.features		= CLOCK_EVT_FEAT_PERIODIC |
-				  CLOCK_EVT_FEAT_ONESHOT,
-	.rating			= 300,
-	.set_next_event		= omap2_gp_timer_set_next_event,
-	.set_state_shutdown	= omap2_gp_timer_shutdown,
-	.set_state_periodic	= omap2_gp_timer_set_periodic,
-	.set_state_oneshot	= omap2_gp_timer_shutdown,
-	.tick_resume		= omap2_gp_timer_shutdown,
-};
-
 static const struct of_device_id omap_timer_match[] __initconst = {
 	{ .compatible = "ti,omap2420-timer", },
 	{ .compatible = "ti,omap3430-timer", },
@@ -360,44 +371,54 @@ static void __init omap2_gp_clockevent_init(int gptimer_id,
 						const char *fck_source,
 						const char *property)
 {
+	struct dmtimer_clockevent *clkevt = &clockevent;
+	struct omap_dm_timer *timer = &clkevt->timer;
 	int res;
 
-	clkev.id = gptimer_id;
-	clkev.errata = omap_dm_timer_get_errata();
+	timer->id = gptimer_id;
+	timer->errata = omap_dm_timer_get_errata();
+	clkevt->dev.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
+	clkevt->dev.rating = 300;
+	clkevt->dev.set_next_event = omap2_gp_timer_set_next_event;
+	clkevt->dev.set_state_shutdown = omap2_gp_timer_shutdown;
+	clkevt->dev.set_state_periodic = omap2_gp_timer_set_periodic;
+	clkevt->dev.set_state_oneshot = omap2_gp_timer_shutdown;
+	clkevt->dev.tick_resume = omap2_gp_timer_shutdown;
 
 	/*
 	 * For clock-event timers we never read the timer counter and
 	 * so we are not impacted by errata i103 and i767. Therefore,
 	 * we can safely ignore this errata for clock-event timers.
 	 */
-	__omap_dm_timer_override_errata(&clkev, OMAP_TIMER_ERRATA_I103_I767);
+	__omap_dm_timer_override_errata(timer, OMAP_TIMER_ERRATA_I103_I767);
 
-	res = omap_dm_timer_init_one(&clkev, fck_source, property,
-				     &clockevent_gpt.name, OMAP_TIMER_POSTED);
+	res = omap_dm_timer_init_one(timer, fck_source, property,
+				     &clkevt->dev.name, OMAP_TIMER_POSTED);
 	BUG_ON(res);
 
-	if (request_irq(clkev.irq, omap2_gp_timer_interrupt,
-			IRQF_TIMER | IRQF_IRQPOLL, "gp_timer", &clkev))
-		pr_err("Failed to request irq %d (gp_timer)\n", clkev.irq);
+	clkevt->dev.cpumask = cpu_possible_mask;
+	clkevt->dev.irq = omap_dm_timer_get_irq(timer);
+
+	if (request_irq(timer->irq, omap2_gp_timer_interrupt,
+			IRQF_TIMER | IRQF_IRQPOLL, "gp_timer", clkevt))
+		pr_err("Failed to request irq %d (gp_timer)\n", timer->irq);
 
-	__omap_dm_timer_int_enable(&clkev, OMAP_TIMER_INT_OVERFLOW);
+	__omap_dm_timer_int_enable(timer, OMAP_TIMER_INT_OVERFLOW);
 
-	clockevent_gpt.cpumask = cpu_possible_mask;
-	clockevent_gpt.irq = omap_dm_timer_get_irq(&clkev);
-	clockevents_config_and_register(&clockevent_gpt, clkev.rate,
+	clockevents_config_and_register(&clkevt->dev, timer->rate,
 					3, /* Timer internal resynch latency */
 					0xffffffff);
 
 	if (soc_is_am33xx() || soc_is_am43xx()) {
-		clockevent_gpt.suspend = omap_clkevt_idle;
-		clockevent_gpt.resume = omap_clkevt_unidle;
+		clkevt->dev.suspend = omap_clkevt_idle;
+		clkevt->dev.resume = omap_clkevt_unidle;
 
 		clockevent_gpt_hwmod =
-			omap_hwmod_lookup(clockevent_gpt.name);
+			omap_hwmod_lookup(clkevt->dev.name);
 	}
 
-	pr_info("OMAP clockevent source: %s at %lu Hz\n", clockevent_gpt.name,
-		clkev.rate);
+	pr_info("OMAP clockevent source: %s at %lu Hz\n", clkevt->dev.name,
+		timer->rate);
 }
 
 /* Clocksource code */
-- 
2.31.1
