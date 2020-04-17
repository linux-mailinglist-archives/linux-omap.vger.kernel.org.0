Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD501AE29D
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 18:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgDQQzg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 12:55:36 -0400
Received: from muru.com ([72.249.23.125]:50012 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727840AbgDQQzf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Apr 2020 12:55:35 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2FF5A8160;
        Fri, 17 Apr 2020 16:56:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 01/14] clocksource/drivers/timer-ti-32k: Add support for initializing directly
Date:   Fri, 17 Apr 2020 09:55:06 -0700
Message-Id: <20200417165519.4979-2-tony@atomide.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200417165519.4979-1-tony@atomide.com>
References: <20200417165519.4979-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's allow probing the 32k counter directly based on devicetree data to
prepare for dropping the related legacy platform code. Let's only do this
if the parent node is compatible with ti-sysc to make sure we have the
related devicetree data available.

Let's also show the 32k counter information before registering the
clocksource, now we see it after the clocksource information which is a
bit confusing.

Cc: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clocksource/timer-ti-32k.c | 48 +++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ti-32k.c b/drivers/clocksource/timer-ti-32k.c
--- a/drivers/clocksource/timer-ti-32k.c
+++ b/drivers/clocksource/timer-ti-32k.c
@@ -24,6 +24,7 @@
  * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com
  */
 
+#include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/time.h>
 #include <linux/sched_clock.h>
@@ -76,6 +77,49 @@ static u64 notrace omap_32k_read_sched_clock(void)
 	return ti_32k_read_cycles(&ti_32k_timer.cs);
 }
 
+static void __init ti_32k_timer_enable_clock(struct device_node *np,
+					     const char *name)
+{
+	struct clk *clock;
+	int error;
+
+	clock = of_clk_get_by_name(np->parent, name);
+	if (IS_ERR(clock)) {
+		/* Only some SoCs have a separate interface clock */
+		if (PTR_ERR(clock) == -EINVAL && !strncmp("ick", name, 3))
+			return;
+
+		pr_warn("%s: could not get clock %s %li\n",
+			__func__, name, PTR_ERR(clock));
+		return;
+	}
+
+	error = clk_prepare_enable(clock);
+	if (error) {
+		pr_warn("%s: could not enable %s: %i\n",
+			__func__, name, error);
+		return;
+	}
+}
+
+static void __init ti_32k_timer_module_init(struct device_node *np,
+					    void __iomem *base)
+{
+	void __iomem *sysc = base + 4;
+
+	if (!of_device_is_compatible(np->parent, "ti,sysc"))
+		return;
+
+	ti_32k_timer_enable_clock(np, "fck");
+	ti_32k_timer_enable_clock(np, "ick");
+
+	/*
+	 * Force idle module as wkup domain is active with MPU.
+	 * No need to tag the module disabled for ti-sysc probe.
+	 */
+	writel_relaxed(0, sysc);
+}
+
 static int __init ti_32k_timer_init(struct device_node *np)
 {
 	int ret;
@@ -90,6 +134,7 @@ static int __init ti_32k_timer_init(struct device_node *np)
 		ti_32k_timer.cs.flags |= CLOCK_SOURCE_SUSPEND_NONSTOP;
 
 	ti_32k_timer.counter = ti_32k_timer.base;
+	ti_32k_timer_module_init(np, ti_32k_timer.base);
 
 	/*
 	 * 32k sync Counter IP register offsets vary between the highlander
@@ -104,6 +149,8 @@ static int __init ti_32k_timer_init(struct device_node *np)
 	else
 		ti_32k_timer.counter += OMAP2_32KSYNCNT_CR_OFF_LOW;
 
+	pr_info("OMAP clocksource: 32k_counter at 32768 Hz\n");
+
 	ret = clocksource_register_hz(&ti_32k_timer.cs, 32768);
 	if (ret) {
 		pr_err("32k_counter: can't register clocksource\n");
@@ -111,7 +158,6 @@ static int __init ti_32k_timer_init(struct device_node *np)
 	}
 
 	sched_clock_register(omap_32k_read_sched_clock, 32, 32768);
-	pr_info("OMAP clocksource: 32k_counter at 32768 Hz\n");
 
 	return 0;
 }
-- 
2.26.1
