Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163B7324FC2
	for <lists+linux-omap@lfdr.de>; Thu, 25 Feb 2021 13:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhBYMQ7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Feb 2021 07:16:59 -0500
Received: from muru.com ([72.249.23.125]:37172 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231248AbhBYMQ6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Feb 2021 07:16:58 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3E663807A;
        Thu, 25 Feb 2021 12:16:48 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Ivan Jelincic <parazyd@dyne.org>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] ARM: OMAP4: Fix cpu_pm handling for HS/EMU interrupt save
Date:   Thu, 25 Feb 2021 14:16:12 +0200
Message-Id: <20210225121612.18818-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Since commit 55be2f50336f ("ARM: OMAP2+: Handle errors for cpu_pm") we
allow the drivers to block deeper idle states with cpu_pm notifiers.
Turns out this change causes random hangs on a mostly idle droid4.

The hang seems to be caused by reconfiguring the MPUSS domain registers
after we have already called irq_save_secure_context(). This happens
on the cpu_pm notifier error path if a driver is busy and returns
NOTIFY_BAD in CPU_CLUSTER_PM_ENTER handling to block the deeper idle
states. Note that this issue does not exist for the GP SoCs, for them
we just save and restore the context in the cpu_pm notifier.

Let's fix the issue by calling omap4_irq_save_secure_context() later on
after the cpu_pm notifiers are done. And since we have omap-secure.c,
let's move omap4_irq_save_secure_context() there.

Fixes: 55be2f50336f ("ARM: OMAP2+: Handle errors for cpu_pm")
Reported-by: Carl Philipp Klemm <philipp@uvos.xyz>
Reported-by: Merlijn Wajer <merlijn@wizzup.org>
Cc: Ivan Jelincic <parazyd@dyne.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap-mpuss-lowpower.c | 17 ++++++++++++-----
 arch/arm/mach-omap2/omap-secure.c         | 16 ++++++++++++++++
 arch/arm/mach-omap2/omap-secure.h         |  1 +
 arch/arm/mach-omap2/omap-wakeupgen.c      | 20 ++++----------------
 4 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-omap2/omap-mpuss-lowpower.c b/arch/arm/mach-omap2/omap-mpuss-lowpower.c
--- a/arch/arm/mach-omap2/omap-mpuss-lowpower.c
+++ b/arch/arm/mach-omap2/omap-mpuss-lowpower.c
@@ -48,6 +48,7 @@
 
 #include "soc.h"
 #include "common.h"
+#include "omap-secure.h"
 #include "omap44xx.h"
 #include "omap4-sar-layout.h"
 #include "pm.h"
@@ -256,15 +257,21 @@ int omap4_enter_lowpower(unsigned int cpu, unsigned int power_state)
 
 	pwrdm_pre_transition(NULL);
 
-	/*
-	 * Check MPUSS next state and save interrupt controller if needed.
-	 * In MPUSS OSWR or device OFF, interrupt controller  contest is lost.
-	 */
+	/* Check MPUSS next state to see if context is lost */
 	mpuss_clear_prev_logic_pwrst();
 	if ((pwrdm_read_next_pwrst(mpuss_pd) == PWRDM_POWER_RET) &&
-		(pwrdm_read_logic_retst(mpuss_pd) == PWRDM_POWER_OFF))
+	    (pwrdm_read_logic_retst(mpuss_pd) == PWRDM_POWER_OFF)) {
 		save_state = 2;
 
+		/*
+		 * Save interrupt controller for HS/EMU if needed. In MPUSS OSWR
+		 * and device OFF, interrupt controller context is lost. For GP
+		 * SoCs, see the cpu_pm notifiers and cpu_pm irq_notifier().
+		 */
+		if (!cpu && omap_type() != OMAP2_DEVICE_TYPE_GP)
+			omap4_irq_save_secure_context();
+	}
+
 	cpu_clear_prev_logic_pwrst(cpu);
 	pwrdm_set_next_pwrst(pm_info->pwrdm, power_state);
 	pwrdm_set_logic_retst(pm_info->pwrdm, cpu_logic_state);
diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
--- a/arch/arm/mach-omap2/omap-secure.c
+++ b/arch/arm/mach-omap2/omap-secure.c
@@ -135,6 +135,22 @@ u32 omap3_save_secure_ram(void __iomem *addr, int size)
 }
 #endif
 
+/*
+ * Save GIC and Wakeupgen interrupt context using secure API for HS/EMU devices.
+ * Must be called after cpu_pm notifiers to avoid reconfiguring MPUSS on the
+ * cpu_pm notifier error path.
+ */
+void __maybe_unused omap4_irq_save_secure_context(void)
+{
+	u32 ret;
+
+	ret = omap_secure_dispatcher(OMAP4_HAL_SAVEGIC_INDEX,
+				     FLAG_START_CRITICAL,
+				     0, 0, 0, 0, 0);
+	if (ret != API_HAL_RET_VALUE_OK)
+		pr_err("GIC and Wakeupgen context save failed\n");
+}
+
 /**
  * rx51_secure_dispatcher: Routine to dispatch secure PPA API calls
  * @idx: The PPA API index
diff --git a/arch/arm/mach-omap2/omap-secure.h b/arch/arm/mach-omap2/omap-secure.h
--- a/arch/arm/mach-omap2/omap-secure.h
+++ b/arch/arm/mach-omap2/omap-secure.h
@@ -73,6 +73,7 @@ extern phys_addr_t omap_secure_ram_mempool_base(void);
 extern int omap_secure_ram_reserve_memblock(void);
 extern u32 save_secure_ram_context(u32 args_pa);
 extern u32 omap3_save_secure_ram(void __iomem *save_regs, int size);
+extern void omap4_irq_save_secure_context(void);
 
 extern u32 rx51_secure_dispatcher(u32 idx, u32 process, u32 flag, u32 nargs,
 				  u32 arg1, u32 arg2, u32 arg3, u32 arg4);
diff --git a/arch/arm/mach-omap2/omap-wakeupgen.c b/arch/arm/mach-omap2/omap-wakeupgen.c
--- a/arch/arm/mach-omap2/omap-wakeupgen.c
+++ b/arch/arm/mach-omap2/omap-wakeupgen.c
@@ -367,20 +367,6 @@ static void irq_restore_context(void)
 		wakeupgen_ops->restore_context();
 }
 
-/*
- * Save GIC and Wakeupgen interrupt context using secure API
- * for HS/EMU devices.
- */
-static void irq_save_secure_context(void)
-{
-	u32 ret;
-	ret = omap_secure_dispatcher(OMAP4_HAL_SAVEGIC_INDEX,
-				FLAG_START_CRITICAL,
-				0, 0, 0, 0, 0);
-	if (ret != API_HAL_RET_VALUE_OK)
-		pr_err("GIC and Wakeupgen context save failed\n");
-}
-
 /* Define ops for context save and restore for each SoC */
 static struct omap_wakeupgen_ops omap4_wakeupgen_ops = {
 	.save_context = omap4_irq_save_context,
@@ -429,14 +415,16 @@ static void __init irq_hotplug_init(void)
 #endif
 
 #ifdef CONFIG_CPU_PM
+/*
+ * Note that gic context save for HS/EMU devices must be done after the cpu_pm
+ * notifiers, see omap4_irq_save_secure_context().
+ */
 static int irq_notifier(struct notifier_block *self, unsigned long cmd,	void *v)
 {
 	switch (cmd) {
 	case CPU_CLUSTER_PM_ENTER:
 		if (omap_type() == OMAP2_DEVICE_TYPE_GP || soc_is_am43xx())
 			irq_save_context();
-		else
-			irq_save_secure_context();
 		break;
 	case CPU_CLUSTER_PM_EXIT:
 		if (omap_type() == OMAP2_DEVICE_TYPE_GP || soc_is_am43xx())
-- 
2.30.1
