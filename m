Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7418D1EA48E
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jun 2020 15:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgFANLu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 1 Jun 2020 09:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727808AbgFANLt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 1 Jun 2020 09:11:49 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E570C08C5C0;
        Mon,  1 Jun 2020 06:11:49 -0700 (PDT)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1jfkEC-00075N-E2; Mon, 01 Jun 2020 15:11:44 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 044DC1C0481;
        Mon,  1 Jun 2020 15:11:44 +0200 (CEST)
Date:   Mon, 01 Jun 2020 13:11:43 -0000
From:   "tip-bot2 for Tony Lindgren" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] clocksource/drivers/timer-ti-32k: Add support for
 initializing directly
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Rob Herring <robh@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>, x86 <x86@kernel.org>
In-Reply-To: <20200507172330.18679-2-tony@atomide.com>
References: <20200507172330.18679-2-tony@atomide.com>
MIME-Version: 1.0
Message-ID: <159101710385.17951.6835121820784885612.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     46b30515f97ece3da661b251e4a0ad9ac7a338d3
Gitweb:        https://git.kernel.org/tip/46b30515f97ece3da661b251e4a0ad9ac7a338d3
Author:        Tony Lindgren <tony@atomide.com>
AuthorDate:    Thu, 07 May 2020 10:23:17 -07:00
Committer:     Daniel Lezcano <daniel.lezcano@linaro.org>
CommitterDate: Sat, 23 May 2020 00:01:04 +02:00

clocksource/drivers/timer-ti-32k: Add support for initializing directly

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
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20200507172330.18679-2-tony@atomide.com
---
 drivers/clocksource/timer-ti-32k.c | 48 ++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ti-32k.c b/drivers/clocksource/timer-ti-32k.c
index abd5f15..ae12bbf 100644
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
