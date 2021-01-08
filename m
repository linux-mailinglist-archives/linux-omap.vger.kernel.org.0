Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1680A2EF343
	for <lists+linux-omap@lfdr.de>; Fri,  8 Jan 2021 14:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbhAHNlw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Jan 2021 08:41:52 -0500
Received: from muru.com ([72.249.23.125]:41232 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726059AbhAHNlw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 8 Jan 2021 08:41:52 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 74DA980B4;
        Fri,  8 Jan 2021 13:41:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH] ARM: OMAP2+: Fix suspcious RCU usage splats for omap_enter_idle_coupled
Date:   Fri,  8 Jan 2021 15:41:05 +0200
Message-Id: <20210108134105.58543-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We get suspcious RCU usage splats with cpuidle in several places in
omap_enter_idle_coupled() with the kernel debug options enabled:

RCU used illegally from extended quiescent state!
...
(_raw_spin_lock_irqsave)
(omap_enter_idle_coupled+0x17c/0x2d8)
(omap_enter_idle_coupled)
(cpuidle_enter_state)
(cpuidle_enter_state_coupled)
(cpuidle_enter)

Let's use RCU_NONIDLE to suppress these splats. Things got changed around
with commit 1098582a0f6c ("sched,idle,rcu: Push rcu_idle deeper into the
idle path") that started triggering these warnings.

For the tick_broadcast related calls, ideally we'd just switch over to
using CPUIDLE_FLAG_TIMER_STOP for omap_enter_idle_coupled() to have the
generic cpuidle code handle the tick_broadcast related calls for us and
then just drop the tick_broadcast calls here.

But we're currently missing the call in the common cpuidle code for
tick_broadcast_enable() that CPU1 hotplug needs as described in earlier
commit 50d6b3cf9403 ("ARM: OMAP2+: fix lack of timer interrupts on CPU1
after hotplug").

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Paul E. McKenney <paulmck@kernel.org>
Cc: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/cpuidle44xx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-omap2/cpuidle44xx.c b/arch/arm/mach-omap2/cpuidle44xx.c
--- a/arch/arm/mach-omap2/cpuidle44xx.c
+++ b/arch/arm/mach-omap2/cpuidle44xx.c
@@ -151,10 +151,10 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
 				 (cx->mpu_logic_state == PWRDM_POWER_OFF);
 
 	/* Enter broadcast mode for periodic timers */
-	tick_broadcast_enable();
+	RCU_NONIDLE(tick_broadcast_enable());
 
 	/* Enter broadcast mode for one-shot timers */
-	tick_broadcast_enter();
+	RCU_NONIDLE(tick_broadcast_enter());
 
 	/*
 	 * Call idle CPU PM enter notifier chain so that
@@ -166,7 +166,7 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
 
 	if (dev->cpu == 0) {
 		pwrdm_set_logic_retst(mpu_pd, cx->mpu_logic_state);
-		omap_set_pwrdm_state(mpu_pd, cx->mpu_state);
+		RCU_NONIDLE(omap_set_pwrdm_state(mpu_pd, cx->mpu_state));
 
 		/*
 		 * Call idle CPU cluster PM enter notifier chain
@@ -179,7 +179,7 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
 				index = 1;
 				cx = state_ptr + index;
 				pwrdm_set_logic_retst(mpu_pd, cx->mpu_logic_state);
-				omap_set_pwrdm_state(mpu_pd, cx->mpu_state);
+				RCU_NONIDLE(omap_set_pwrdm_state(mpu_pd, cx->mpu_state));
 				mpuss_can_lose_context = 0;
 			}
 		}
@@ -195,9 +195,9 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
 		    mpuss_can_lose_context)
 			gic_dist_disable();
 
-		clkdm_deny_idle(cpu_clkdm[1]);
-		omap_set_pwrdm_state(cpu_pd[1], PWRDM_POWER_ON);
-		clkdm_allow_idle(cpu_clkdm[1]);
+		RCU_NONIDLE(clkdm_deny_idle(cpu_clkdm[1]));
+		RCU_NONIDLE(omap_set_pwrdm_state(cpu_pd[1], PWRDM_POWER_ON));
+		RCU_NONIDLE(clkdm_allow_idle(cpu_clkdm[1]));
 
 		if (IS_PM44XX_ERRATUM(PM_OMAP4_ROM_SMP_BOOT_ERRATUM_GICD) &&
 		    mpuss_can_lose_context) {
@@ -225,7 +225,7 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
 	cpu_pm_exit();
 
 cpu_pm_out:
-	tick_broadcast_exit();
+	RCU_NONIDLE(tick_broadcast_exit());
 
 fail:
 	cpuidle_coupled_parallel_barrier(dev, &abort_barrier);
-- 
2.30.0
