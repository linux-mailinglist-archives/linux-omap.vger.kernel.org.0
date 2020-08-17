Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE3124633C
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 11:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgHQJYg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 05:24:36 -0400
Received: from muru.com ([72.249.23.125]:40478 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726381AbgHQJYf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 Aug 2020 05:24:35 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 57A5680A3;
        Mon, 17 Aug 2020 09:24:34 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clocksource/drivers/timer-ti-dm: Do reset before enable
Date:   Mon, 17 Aug 2020 12:24:28 +0300
Message-Id: <20200817092428.6176-1-tony@atomide.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix suspend and
resume for am3 and am4") exposed a new issue for type2 dual mode timers
on at least omap5 where the clockevent will stop when the SoC starts
entering idle states during the boot.

Turns out we are wrongly first enabling the system timer and then
resetting it, while we must also re-enable it after reset. The current
sequence leaves the timer module in a partially initialized state. This
issue went unnoticed earlier with ti-sysc driver reconfiguring the timer
module until we fixed the issue of ti-sysc reconfiguring system timers.

Let's fix the issue by calling dmtimer_systimer_enable() from reset for
both type1 and type2 timers, and switch the order of reset and enable in
dmtimer_systimer_setup(). Let's also move dmtimer_systimer_enable() and
dmtimer_systimer_disable() to do this without adding forward declarations.

Fixes: 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 and am4")
Reported-by: H. Nikolaus Schaller" <hns@goldelico.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clocksource/timer-ti-dm-systimer.c | 44 +++++++++++-----------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -69,12 +69,33 @@ static bool dmtimer_systimer_revision1(struct dmtimer_systimer *t)
 	return !(tidr >> 16);
 }
 
+static void dmtimer_systimer_enable(struct dmtimer_systimer *t)
+{
+	u32 val;
+
+	if (dmtimer_systimer_revision1(t))
+		val = DMTIMER_TYPE1_ENABLE;
+	else
+		val = DMTIMER_TYPE2_ENABLE;
+
+	writel_relaxed(val, t->base + t->sysc);
+}
+
+static void dmtimer_systimer_disable(struct dmtimer_systimer *t)
+{
+	if (!dmtimer_systimer_revision1(t))
+		return;
+
+	writel_relaxed(DMTIMER_TYPE1_DISABLE, t->base + t->sysc);
+}
+
 static int __init dmtimer_systimer_type1_reset(struct dmtimer_systimer *t)
 {
 	void __iomem *syss = t->base + OMAP_TIMER_V1_SYS_STAT_OFFSET;
 	int ret;
 	u32 l;
 
+	dmtimer_systimer_enable(t);
 	writel_relaxed(BIT(1) | BIT(2), t->base + t->ifctrl);
 	ret = readl_poll_timeout_atomic(syss, l, l & BIT(0), 100,
 					DMTIMER_RESET_WAIT);
@@ -88,6 +109,7 @@ static int __init dmtimer_systimer_type2_reset(struct dmtimer_systimer *t)
 	void __iomem *sysc = t->base + t->sysc;
 	u32 l;
 
+	dmtimer_systimer_enable(t);
 	l = readl_relaxed(sysc);
 	l |= BIT(0);
 	writel_relaxed(l, sysc);
@@ -336,26 +358,6 @@ static int __init dmtimer_systimer_init_clock(struct dmtimer_systimer *t,
 	return 0;
 }
 
-static void dmtimer_systimer_enable(struct dmtimer_systimer *t)
-{
-	u32 val;
-
-	if (dmtimer_systimer_revision1(t))
-		val = DMTIMER_TYPE1_ENABLE;
-	else
-		val = DMTIMER_TYPE2_ENABLE;
-
-	writel_relaxed(val, t->base + t->sysc);
-}
-
-static void dmtimer_systimer_disable(struct dmtimer_systimer *t)
-{
-	if (!dmtimer_systimer_revision1(t))
-		return;
-
-	writel_relaxed(DMTIMER_TYPE1_DISABLE, t->base + t->sysc);
-}
-
 static int __init dmtimer_systimer_setup(struct device_node *np,
 					 struct dmtimer_systimer *t)
 {
@@ -409,8 +411,8 @@ static int __init dmtimer_systimer_setup(struct device_node *np,
 	t->wakeup = regbase + _OMAP_TIMER_WAKEUP_EN_OFFSET;
 	t->ifctrl = regbase + _OMAP_TIMER_IF_CTRL_OFFSET;
 
-	dmtimer_systimer_enable(t);
 	dmtimer_systimer_reset(t);
+	dmtimer_systimer_enable(t);
 	pr_debug("dmtimer rev %08x sysc %08x\n", readl_relaxed(t->base),
 		 readl_relaxed(t->base + t->sysc));
 
-- 
2.28.0
