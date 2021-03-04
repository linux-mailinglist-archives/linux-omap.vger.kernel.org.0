Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAA732CD83
	for <lists+linux-omap@lfdr.de>; Thu,  4 Mar 2021 08:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbhCDHWh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Mar 2021 02:22:37 -0500
Received: from muru.com ([72.249.23.125]:39278 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236204AbhCDHW0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 4 Mar 2021 02:22:26 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D012C810E;
        Thu,  4 Mar 2021 07:22:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] clocksource/drivers/timer-ti-dm: Fix posted mode status check order
Date:   Thu,  4 Mar 2021 09:21:33 +0200
Message-Id: <20210304072135.52712-2-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304072135.52712-1-tony@atomide.com>
References: <20210304072135.52712-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When the timer is configured in posted mode, we need to check the write-
posted status register (TWPS) before writing to the register.

We now check TWPS after the write starting with commit 52762fbd1c47
("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource
support").

For example, in the TRM for am571x the following is documented in chapter
"22.2.4.13.1.1 Write Posting Synchronization Mode":

"For each register, a status bit is provided in the timer write-posted
 status (TWPS) register. In this mode, it is mandatory that software check
 this status bit before any write access. If a write is attempted to a
 register with a previous access pending, the previous access is discarded
 without notice."

The regression happened when I updated the code to use standard read/write
accessors for the driver instead of using __omap_dm_timer_load_start().
We have__omap_dm_timer_load_start() check the TWPS status correctly using
__omap_dm_timer_write().

Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clocksource/timer-ti-dm-systimer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -449,13 +449,13 @@ static int dmtimer_set_next_event(unsigned long cycles,
 	struct dmtimer_systimer *t = &clkevt->t;
 	void __iomem *pend = t->base + t->pend;
 
-	writel_relaxed(0xffffffff - cycles, t->base + t->counter);
 	while (readl_relaxed(pend) & WP_TCRR)
 		cpu_relax();
+	writel_relaxed(0xffffffff - cycles, t->base + t->counter);
 
-	writel_relaxed(OMAP_TIMER_CTRL_ST, t->base + t->ctrl);
 	while (readl_relaxed(pend) & WP_TCLR)
 		cpu_relax();
+	writel_relaxed(OMAP_TIMER_CTRL_ST, t->base + t->ctrl);
 
 	return 0;
 }
@@ -490,18 +490,18 @@ static int dmtimer_set_periodic(struct clock_event_device *evt)
 	dmtimer_clockevent_shutdown(evt);
 
 	/* Looks like we need to first set the load value separately */
-	writel_relaxed(clkevt->period, t->base + t->load);
 	while (readl_relaxed(pend) & WP_TLDR)
 		cpu_relax();
+	writel_relaxed(clkevt->period, t->base + t->load);
 
-	writel_relaxed(clkevt->period, t->base + t->counter);
 	while (readl_relaxed(pend) & WP_TCRR)
 		cpu_relax();
+	writel_relaxed(clkevt->period, t->base + t->counter);
 
-	writel_relaxed(OMAP_TIMER_CTRL_AR | OMAP_TIMER_CTRL_ST,
-		       t->base + t->ctrl);
 	while (readl_relaxed(pend) & WP_TCLR)
 		cpu_relax();
+	writel_relaxed(OMAP_TIMER_CTRL_AR | OMAP_TIMER_CTRL_ST,
+		       t->base + t->ctrl);
 
 	return 0;
 }
-- 
2.30.1
