Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752C338FDEC
	for <lists+linux-omap@lfdr.de>; Tue, 25 May 2021 11:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232617AbhEYJex (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 May 2021 05:34:53 -0400
Received: from muru.com ([72.249.23.125]:60144 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231921AbhEYJes (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 25 May 2021 05:34:48 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9734080A7;
        Tue, 25 May 2021 09:33:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Dave Gerlach <d-gerlach@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH] ARM: OMAP2+: Block suspend for am3 and am4 if PM is not configured
Date:   Tue, 25 May 2021 12:33:11 +0300
Message-Id: <20210525093311.15510-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If the PM related modules are not loaded and PM firmware not configured,
the system suspend fails to resume. Let's fix this by adding initial
platform_suspend_ops to block suspend and warn about missing modules.

When pm33xx and wkup_m3_ipc have been loaded and m3 coprocessor booted
with it's firmware, pm33xx sets up working platform_suspend_ops. Note
that we need to configure at least PM_SUSPEND_STANDBY to have
suspend_set_ops().

Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Dave, this prevents system suspend if pm33xx or IPC or firmware is not
configured as otherwise resume will hang. Do you have any better ideas?

---
 arch/arm/mach-omap2/pm33xx-core.c | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/mach-omap2/pm33xx-core.c b/arch/arm/mach-omap2/pm33xx-core.c
--- a/arch/arm/mach-omap2/pm33xx-core.c
+++ b/arch/arm/mach-omap2/pm33xx-core.c
@@ -8,6 +8,7 @@
 
 #include <linux/cpuidle.h>
 #include <linux/platform_data/pm33xx.h>
+#include <linux/suspend.h>
 #include <asm/cpuidle.h>
 #include <asm/smp_scu.h>
 #include <asm/suspend.h>
@@ -324,6 +325,44 @@ static struct am33xx_pm_platform_data *am33xx_pm_get_pdata(void)
 		return NULL;
 }
 
+#ifdef CONFIG_SUSPEND
+/*
+ * Block system suspend initially. Later on pm33xx sets up it's own
+ * platform_suspend_ops after probe. That depends also on loaded
+ * wkup_m3_ipc and booted am335x-pm-firmware.elf.
+ */
+static int amx3_suspend_block(suspend_state_t state)
+{
+	pr_warn("PM not initialized for pm33xx, wkup_m3_ipc, or am335x-pm-firmware.elf\n");
+
+	return -EINVAL;
+}
+
+static int amx3_pm_valid(suspend_state_t state)
+{
+	switch (state) {
+	case PM_SUSPEND_STANDBY:
+		return 1;
+	default:
+		return 0;
+	}
+}
+
+static const struct platform_suspend_ops amx3_blocked_pm_ops = {
+	.begin = amx3_suspend_block,
+	.valid = amx3_pm_valid,
+};
+
+static void __init amx3_block_suspend(void)
+{
+	suspend_set_ops(&amx3_blocked_pm_ops);
+}
+#else
+static inline void amx3_block_suspend(void)
+{
+}
+#endif	/* CONFIG_SUSPEND */
+
 int __init amx3_common_pm_init(void)
 {
 	struct am33xx_pm_platform_data *pdata;
@@ -337,6 +376,7 @@ int __init amx3_common_pm_init(void)
 	devinfo.size_data = sizeof(*pdata);
 	devinfo.id = -1;
 	platform_device_register_full(&devinfo);
+	amx3_block_suspend();
 
 	return 0;
 }
-- 
2.31.1
