Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84161C97A0
	for <lists+linux-omap@lfdr.de>; Thu,  7 May 2020 19:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgEGRYZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 May 2020 13:24:25 -0400
Received: from muru.com ([72.249.23.125]:53414 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728276AbgEGRYS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 May 2020 13:24:18 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 49CAE81A1;
        Thu,  7 May 2020 17:25:03 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Rob Herring <robh@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 13/14] ARM: OMAP2+: Drop old timer code for dmtimer and 32k counter
Date:   Thu,  7 May 2020 10:23:29 -0700
Message-Id: <20200507172330.18679-14-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507172330.18679-1-tony@atomide.com>
References: <20200507172330.18679-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With dmtimer and 32k counter being initialized based on devicetree data,
we can just drop the old timer code.

This still leaves the omap5 and dra7 realtime_counter_init() that
depend on the smc calls and control module platform code for the dra7
quirk init.

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/Makefile |   4 +-
 arch/arm/mach-omap2/common.h |   7 +
 arch/arm/mach-omap2/timer.c  | 551 -----------------------------------
 3 files changed, 10 insertions(+), 552 deletions(-)

diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile
@@ -7,7 +7,7 @@ ccflags-y := -I$(srctree)/$(src)/include \
 	-I$(srctree)/arch/arm/plat-omap/include
 
 # Common support
-obj-y := id.o io.o control.o devices.o fb.o timer.o pm.o \
+obj-y := id.o io.o control.o devices.o fb.o pm.o \
 	 common.o dma.o wd_timer.o display.o i2c.o hdq1w.o omap_hwmod.o \
 	 omap_device.o omap-headsmp.o sram.o
 
@@ -16,6 +16,8 @@ hwmod-common				= omap_hwmod.o omap_hwmod_reset.o \
 clock-common				= clock.o
 secure-common				= omap-smc.o omap-secure.o
 
+obj-$(CONFIG_SOC_HAS_REALTIME_COUNTER)	+= timer.o
+
 obj-$(CONFIG_ARCH_OMAP2) += $(omap-2-3-common) $(hwmod-common)
 obj-$(CONFIG_ARCH_OMAP3) += $(omap-2-3-common) $(hwmod-common) $(secure-common)
 obj-$(CONFIG_ARCH_OMAP4) += $(hwmod-common) $(secure-common)
diff --git a/arch/arm/mach-omap2/common.h b/arch/arm/mach-omap2/common.h
--- a/arch/arm/mach-omap2/common.h
+++ b/arch/arm/mach-omap2/common.h
@@ -111,7 +111,14 @@ static inline int omap_l2_cache_init(void)
 #define OMAP_L2C_AUX_CTRL	0
 #define omap4_l2c310_write_sec	NULL
 #endif
+
+#ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
 extern void omap5_realtime_timer_init(void);
+#else
+static inline void omap5_realtime_timer_init(void)
+{
+}
+#endif
 
 void omap2420_init_early(void);
 void omap2430_init_early(void);
diff --git a/arch/arm/mach-omap2/timer.c b/arch/arm/mach-omap2/timer.c
--- a/arch/arm/mach-omap2/timer.c
+++ b/arch/arm/mach-omap2/timer.c
@@ -26,34 +26,12 @@
  * License. See the file "COPYING" in the main directory of this archive
  * for more details.
  */
-#include <linux/init.h>
-#include <linux/time.h>
-#include <linux/interrupt.h>
-#include <linux/err.h>
 #include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/irq.h>
 #include <linux/clocksource.h>
-#include <linux/clockchips.h>
-#include <linux/slab.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/platform_device.h>
-#include <linux/platform_data/dmtimer-omap.h>
-#include <linux/sched_clock.h>
-
-#include <asm/mach/time.h>
-
-#include "omap_hwmod.h"
-#include "omap_device.h"
-#include <plat/counter-32k.h>
-#include <clocksource/timer-ti-dm.h>
 
 #include "soc.h"
 #include "common.h"
 #include "control.h"
-#include "powerdomain.h"
 #include "omap-secure.h"
 
 #define REALTIME_COUNTER_BASE				0x48243200
@@ -61,294 +39,12 @@
 #define INCREMENTER_DENUMERATOR_RELOAD_OFFSET		0x14
 #define NUMERATOR_DENUMERATOR_MASK			0xfffff000
 
-/* Clockevent code */
-
-static struct omap_dm_timer clkev;
-static struct clock_event_device clockevent_gpt;
-
-/* Clockevent hwmod for am335x and am437x suspend */
-static struct omap_hwmod *clockevent_gpt_hwmod;
-
-/* Clockesource hwmod for am437x suspend */
-static struct omap_hwmod *clocksource_gpt_hwmod;
-
-#ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
 static unsigned long arch_timer_freq;
 
 void set_cntfreq(void)
 {
 	omap_smc1(OMAP5_DRA7_MON_SET_CNTFRQ_INDEX, arch_timer_freq);
 }
-#endif
-
-static irqreturn_t omap2_gp_timer_interrupt(int irq, void *dev_id)
-{
-	struct clock_event_device *evt = &clockevent_gpt;
-
-	__omap_dm_timer_write_status(&clkev, OMAP_TIMER_INT_OVERFLOW);
-
-	evt->event_handler(evt);
-	return IRQ_HANDLED;
-}
-
-static int omap2_gp_timer_set_next_event(unsigned long cycles,
-					 struct clock_event_device *evt)
-{
-	__omap_dm_timer_load_start(&clkev, OMAP_TIMER_CTRL_ST,
-				   0xffffffff - cycles, OMAP_TIMER_POSTED);
-
-	return 0;
-}
-
-static int omap2_gp_timer_shutdown(struct clock_event_device *evt)
-{
-	__omap_dm_timer_stop(&clkev, OMAP_TIMER_POSTED, clkev.rate);
-	return 0;
-}
-
-static int omap2_gp_timer_set_periodic(struct clock_event_device *evt)
-{
-	u32 period;
-
-	__omap_dm_timer_stop(&clkev, OMAP_TIMER_POSTED, clkev.rate);
-
-	period = clkev.rate / HZ;
-	period -= 1;
-	/* Looks like we need to first set the load value separately */
-	__omap_dm_timer_write(&clkev, OMAP_TIMER_LOAD_REG, 0xffffffff - period,
-			      OMAP_TIMER_POSTED);
-	__omap_dm_timer_load_start(&clkev,
-				   OMAP_TIMER_CTRL_AR | OMAP_TIMER_CTRL_ST,
-				   0xffffffff - period, OMAP_TIMER_POSTED);
-	return 0;
-}
-
-static void omap_clkevt_idle(struct clock_event_device *unused)
-{
-	if (!clockevent_gpt_hwmod)
-		return;
-
-	omap_hwmod_idle(clockevent_gpt_hwmod);
-}
-
-static void omap_clkevt_unidle(struct clock_event_device *unused)
-{
-	if (!clockevent_gpt_hwmod)
-		return;
-
-	omap_hwmod_enable(clockevent_gpt_hwmod);
-	__omap_dm_timer_int_enable(&clkev, OMAP_TIMER_INT_OVERFLOW);
-}
-
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
-static const struct of_device_id omap_timer_match[] __initconst = {
-	{ .compatible = "ti,omap2420-timer", },
-	{ .compatible = "ti,omap3430-timer", },
-	{ .compatible = "ti,omap4430-timer", },
-	{ .compatible = "ti,omap5430-timer", },
-	{ .compatible = "ti,dm814-timer", },
-	{ .compatible = "ti,dm816-timer", },
-	{ .compatible = "ti,am335x-timer", },
-	{ .compatible = "ti,am335x-timer-1ms", },
-	{ }
-};
-
-static int omap_timer_add_disabled_property(struct device_node *np)
-{
-	struct property *prop;
-
-	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
-	if (!prop)
-		return -ENOMEM;
-
-	prop->name = "status";
-	prop->value = "disabled";
-	prop->length = strlen(prop->value);
-
-	return of_add_property(np, prop);
-}
-
-static int omap_timer_update_dt(struct device_node *np)
-{
-	int error = 0;
-
-	if (!of_device_is_compatible(np, "ti,omap-counter32k")) {
-		error = omap_timer_add_disabled_property(np);
-		if (error)
-			return error;
-	}
-
-	/* No parent interconnect target module configured? */
-	if (of_get_property(np, "ti,hwmods", NULL))
-		return error;
-
-	/* Tag parent interconnect target module disabled */
-	error = omap_timer_add_disabled_property(np->parent);
-	if (error)
-		return error;
-
-	return 0;
-}
-
-/**
- * omap_get_timer_dt - get a timer using device-tree
- * @match	- device-tree match structure for matching a device type
- * @property	- optional timer property to match
- *
- * Helper function to get a timer during early boot using device-tree for use
- * as kernel system timer. Optionally, the property argument can be used to
- * select a timer with a specific property. Once a timer is found then mark
- * the timer node in device-tree as disabled, to prevent the kernel from
- * registering this timer as a platform device and so no one else can use it.
- */
-static struct device_node * __init omap_get_timer_dt(const struct of_device_id *match,
-						     const char *property)
-{
-	struct device_node *np;
-	int error;
-
-	for_each_matching_node(np, match) {
-		if (!of_device_is_available(np))
-			continue;
-
-		if (property && !of_get_property(np, property, NULL))
-			continue;
-
-		if (!property && (of_get_property(np, "ti,timer-alwon", NULL) ||
-				  of_get_property(np, "ti,timer-dsp", NULL) ||
-				  of_get_property(np, "ti,timer-pwm", NULL) ||
-				  of_get_property(np, "ti,timer-secure", NULL)))
-			continue;
-
-		error = omap_timer_update_dt(np);
-		WARN(error, "%s: Could not update dt: %i\n", __func__, error);
-
-		return np;
-	}
-
-	return NULL;
-}
-
-/**
- * omap_dmtimer_init - initialisation function when device tree is used
- *
- * For secure OMAP3/DRA7xx devices, timers with device type "timer-secure"
- * cannot be used by the kernel as they are reserved. Therefore, to prevent the
- * kernel registering these devices remove them dynamically from the device
- * tree on boot.
- */
-static void __init omap_dmtimer_init(void)
-{
-	struct device_node *np;
-
-	if (!cpu_is_omap34xx() && !soc_is_dra7xx())
-		return;
-
-	/* If we are a secure device, remove any secure timer nodes */
-	if ((omap_type() != OMAP2_DEVICE_TYPE_GP)) {
-		np = omap_get_timer_dt(omap_timer_match, "ti,timer-secure");
-		of_node_put(np);
-	}
-}
-
-/**
- * omap_dm_timer_get_errata - get errata flags for a timer
- *
- * Get the timer errata flags that are specific to the OMAP device being used.
- */
-static u32 __init omap_dm_timer_get_errata(void)
-{
-	if (cpu_is_omap24xx())
-		return 0;
-
-	return OMAP_TIMER_ERRATA_I103_I767;
-}
-
-static int __init omap_dm_timer_init_one(struct omap_dm_timer *timer,
-					 const char *fck_source,
-					 const char *property,
-					 const char **timer_name,
-					 int posted)
-{
-	const char *oh_name = NULL;
-	struct device_node *np;
-	struct omap_hwmod *oh;
-	struct clk *src;
-	int r = 0;
-
-	np = omap_get_timer_dt(omap_timer_match, property);
-	if (!np)
-		return -ENODEV;
-
-	of_property_read_string_index(np, "ti,hwmods", 0, &oh_name);
-	if (!oh_name) {
-		of_property_read_string_index(np->parent, "ti,hwmods", 0,
-					      &oh_name);
-		if (!oh_name)
-			return -ENODEV;
-	}
-
-	timer->irq = irq_of_parse_and_map(np, 0);
-	if (!timer->irq)
-		return -ENXIO;
-
-	timer->io_base = of_iomap(np, 0);
-
-	timer->fclk = of_clk_get_by_name(np, "fck");
-
-	of_node_put(np);
-
-	oh = omap_hwmod_lookup(oh_name);
-	if (!oh)
-		return -ENODEV;
-
-	*timer_name = oh->name;
-
-	if (!timer->io_base)
-		return -ENXIO;
-
-	omap_hwmod_setup_one(oh_name);
-
-	/* After the dmtimer is using hwmod these clocks won't be needed */
-	if (IS_ERR_OR_NULL(timer->fclk))
-		timer->fclk = clk_get(NULL, omap_hwmod_get_main_clk(oh));
-	if (IS_ERR(timer->fclk))
-		return PTR_ERR(timer->fclk);
-
-	src = clk_get(NULL, fck_source);
-	if (IS_ERR(src))
-		return PTR_ERR(src);
-
-	WARN(clk_set_parent(timer->fclk, src) < 0,
-	     "Cannot set timer parent clock, no PLL clock driver?");
-
-	clk_put(src);
-
-	omap_hwmod_enable(oh);
-	__omap_dm_timer_init_regs(timer);
-
-	if (posted)
-		__omap_dm_timer_enable_posted(timer);
-
-	/* Check that the intended posted configuration matches the actual */
-	if (posted != timer->posted)
-		return -EINVAL;
-
-	timer->rate = clk_get_rate(timer->fclk);
-	timer->reserved = 1;
-
-	return r;
-}
 
 #if !defined(CONFIG_SMP) && defined(CONFIG_GENERIC_CLOCKEVENTS_BROADCAST)
 void tick_broadcast(const struct cpumask *mask)
@@ -356,226 +52,6 @@ void tick_broadcast(const struct cpumask *mask)
 }
 #endif
 
-static void __init omap2_gp_clockevent_init(int gptimer_id,
-						const char *fck_source,
-						const char *property)
-{
-	int res;
-
-	clkev.id = gptimer_id;
-	clkev.errata = omap_dm_timer_get_errata();
-
-	/*
-	 * For clock-event timers we never read the timer counter and
-	 * so we are not impacted by errata i103 and i767. Therefore,
-	 * we can safely ignore this errata for clock-event timers.
-	 */
-	__omap_dm_timer_override_errata(&clkev, OMAP_TIMER_ERRATA_I103_I767);
-
-	res = omap_dm_timer_init_one(&clkev, fck_source, property,
-				     &clockevent_gpt.name, OMAP_TIMER_POSTED);
-	BUG_ON(res);
-
-	if (request_irq(clkev.irq, omap2_gp_timer_interrupt,
-			IRQF_TIMER | IRQF_IRQPOLL, "gp_timer", &clkev))
-		pr_err("Failed to request irq %d (gp_timer)\n", clkev.irq);
-
-	__omap_dm_timer_int_enable(&clkev, OMAP_TIMER_INT_OVERFLOW);
-
-	clockevent_gpt.cpumask = cpu_possible_mask;
-	clockevent_gpt.irq = omap_dm_timer_get_irq(&clkev);
-	clockevents_config_and_register(&clockevent_gpt, clkev.rate,
-					3, /* Timer internal resynch latency */
-					0xffffffff);
-
-	if (soc_is_am33xx() || soc_is_am43xx()) {
-		clockevent_gpt.suspend = omap_clkevt_idle;
-		clockevent_gpt.resume = omap_clkevt_unidle;
-
-		clockevent_gpt_hwmod =
-			omap_hwmod_lookup(clockevent_gpt.name);
-	}
-
-	pr_info("OMAP clockevent source: %s at %lu Hz\n", clockevent_gpt.name,
-		clkev.rate);
-}
-
-/* Clocksource code */
-static struct omap_dm_timer clksrc;
-static bool use_gptimer_clksrc __initdata;
-
-/*
- * clocksource
- */
-static u64 clocksource_read_cycles(struct clocksource *cs)
-{
-	return (u64)__omap_dm_timer_read_counter(&clksrc,
-						     OMAP_TIMER_NONPOSTED);
-}
-
-static struct clocksource clocksource_gpt = {
-	.rating		= 300,
-	.read		= clocksource_read_cycles,
-	.mask		= CLOCKSOURCE_MASK(32),
-	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
-};
-
-static u64 notrace dmtimer_read_sched_clock(void)
-{
-	if (clksrc.reserved)
-		return __omap_dm_timer_read_counter(&clksrc,
-						    OMAP_TIMER_NONPOSTED);
-
-	return 0;
-}
-
-static const struct of_device_id omap_counter_match[] __initconst = {
-	{ .compatible = "ti,omap-counter32k", },
-	{ }
-};
-
-/* Setup free-running counter for clocksource */
-static int __init __maybe_unused omap2_sync32k_clocksource_init(void)
-{
-	int ret;
-	struct device_node *np = NULL;
-	struct omap_hwmod *oh;
-	const char *oh_name = "counter_32k";
-
-	/*
-	 * See if the 32kHz counter is supported.
-	 */
-	np = omap_get_timer_dt(omap_counter_match, NULL);
-	if (!np)
-		return -ENODEV;
-
-	of_property_read_string_index(np->parent, "ti,hwmods", 0, &oh_name);
-	if (!oh_name) {
-		of_property_read_string_index(np, "ti,hwmods", 0, &oh_name);
-		if (!oh_name)
-			return -ENODEV;
-	}
-
-	/*
-	 * First check hwmod data is available for sync32k counter
-	 */
-	oh = omap_hwmod_lookup(oh_name);
-	if (!oh || oh->slaves_cnt == 0)
-		return -ENODEV;
-
-	omap_hwmod_setup_one(oh_name);
-
-	ret = omap_hwmod_enable(oh);
-	if (ret) {
-		pr_warn("%s: failed to enable counter_32k module (%d)\n",
-							__func__, ret);
-		return ret;
-	}
-
-	return ret;
-}
-
-static unsigned int omap2_gptimer_clksrc_load;
-
-static void omap2_gptimer_clksrc_suspend(struct clocksource *unused)
-{
-	omap2_gptimer_clksrc_load =
-		__omap_dm_timer_read_counter(&clksrc, OMAP_TIMER_NONPOSTED);
-
-	omap_hwmod_idle(clocksource_gpt_hwmod);
-}
-
-static void omap2_gptimer_clksrc_resume(struct clocksource *unused)
-{
-	omap_hwmod_enable(clocksource_gpt_hwmod);
-
-	__omap_dm_timer_load_start(&clksrc,
-				   OMAP_TIMER_CTRL_ST | OMAP_TIMER_CTRL_AR,
-				   omap2_gptimer_clksrc_load,
-				   OMAP_TIMER_NONPOSTED);
-}
-
-static void __init omap2_gptimer_clocksource_init(int gptimer_id,
-						  const char *fck_source,
-						  const char *property)
-{
-	int res;
-
-	clksrc.id = gptimer_id;
-	clksrc.errata = omap_dm_timer_get_errata();
-
-	res = omap_dm_timer_init_one(&clksrc, fck_source, property,
-				     &clocksource_gpt.name,
-				     OMAP_TIMER_NONPOSTED);
-
-	if (soc_is_am43xx()) {
-		clocksource_gpt.suspend = omap2_gptimer_clksrc_suspend;
-		clocksource_gpt.resume = omap2_gptimer_clksrc_resume;
-
-		clocksource_gpt_hwmod =
-			omap_hwmod_lookup(clocksource_gpt.name);
-	}
-
-	BUG_ON(res);
-
-	__omap_dm_timer_load_start(&clksrc,
-				   OMAP_TIMER_CTRL_ST | OMAP_TIMER_CTRL_AR, 0,
-				   OMAP_TIMER_NONPOSTED);
-	sched_clock_register(dmtimer_read_sched_clock, 32, clksrc.rate);
-
-	if (clocksource_register_hz(&clocksource_gpt, clksrc.rate))
-		pr_err("Could not register clocksource %s\n",
-			clocksource_gpt.name);
-	else
-		pr_info("OMAP clocksource: %s at %lu Hz\n",
-			clocksource_gpt.name, clksrc.rate);
-}
-
-static void __init __omap_sync32k_timer_init(int clkev_nr, const char *clkev_src,
-		const char *clkev_prop, int clksrc_nr, const char *clksrc_src,
-		const char *clksrc_prop, bool gptimer)
-{
-	omap_clk_init();
-	omap_dmtimer_init();
-	omap2_gp_clockevent_init(clkev_nr, clkev_src, clkev_prop);
-
-	/* Enable the use of clocksource="gp_timer" kernel parameter */
-	if (clksrc_nr && (use_gptimer_clksrc || gptimer))
-		omap2_gptimer_clocksource_init(clksrc_nr, clksrc_src,
-						clksrc_prop);
-	else
-		omap2_sync32k_clocksource_init();
-}
-
-void __init omap_init_time(void)
-{
-	__omap_sync32k_timer_init(1, "timer_32k_ck", "ti,timer-alwon",
-			2, "timer_sys_ck", NULL, false);
-
-	timer_probe();
-}
-
-#if defined(CONFIG_ARCH_OMAP3) || defined(CONFIG_SOC_AM43XX)
-void __init omap3_secure_sync32k_timer_init(void)
-{
-	__omap_sync32k_timer_init(12, "secure_32k_fck", "ti,timer-secure",
-			2, "timer_sys_ck", NULL, false);
-
-	timer_probe();
-}
-#endif /* CONFIG_ARCH_OMAP3 */
-
-#if defined(CONFIG_ARCH_OMAP3) || defined(CONFIG_SOC_AM33XX) || \
-	defined(CONFIG_SOC_AM43XX)
-void __init omap3_gptimer_timer_init(void)
-{
-	__omap_sync32k_timer_init(2, "timer_sys_ck", NULL,
-			1, "timer_sys_ck", "ti,timer-alwon", true);
-	if (of_have_populated_dt())
-		timer_probe();
-}
-#endif
-
 #if defined(CONFIG_SOC_OMAP5) || defined(CONFIG_SOC_DRA7XX)
 
 /*
@@ -589,7 +65,6 @@ void __init omap3_gptimer_timer_init(void)
  */
 static void __init realtime_counter_init(void)
 {
-#ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
 	void __iomem *base;
 	static struct clk *sys_clk;
 	unsigned long rate;
@@ -688,7 +163,6 @@ static void __init realtime_counter_init(void)
 	set_cntfreq();
 
 	iounmap(base);
-#endif
 }
 
 void __init omap5_realtime_timer_init(void)
@@ -699,28 +173,3 @@ void __init omap5_realtime_timer_init(void)
 	timer_probe();
 }
 #endif /* CONFIG_SOC_OMAP5 || CONFIG_SOC_DRA7XX */
-
-/**
- * omap2_override_clocksource - clocksource override with user configuration
- *
- * Allows user to override default clocksource, using kernel parameter
- *   clocksource="gp_timer"	(For all OMAP2PLUS architectures)
- *
- * Note that, here we are using same standard kernel parameter "clocksource=",
- * and not introducing any OMAP specific interface.
- */
-static int __init omap2_override_clocksource(char *str)
-{
-	if (!str)
-		return 0;
-	/*
-	 * For OMAP architecture, we only have two options
-	 *    - sync_32k (default)
-	 *    - gp_timer (sys_clk based)
-	 */
-	if (!strcmp(str, "gp_timer"))
-		use_gptimer_clksrc = true;
-
-	return 0;
-}
-early_param("clocksource", omap2_override_clocksource);
-- 
2.26.2
