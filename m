Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B6A33A6BA
	for <lists+linux-omap@lfdr.de>; Sun, 14 Mar 2021 17:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233977AbhCNQkm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 14 Mar 2021 12:40:42 -0400
Received: from muru.com ([72.249.23.125]:43104 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233369AbhCNQkP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 14 Mar 2021 12:40:15 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C927F80B4;
        Sun, 14 Mar 2021 16:40:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Carlos Leija <cileija@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Bryan Buckley <bryan.buckley@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Ivan Jelincic <parazyd@dyne.org>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH] ARM: OMAP4: PM: update ROM return address for OSWR and OFF
Date:   Sun, 14 Mar 2021 18:39:43 +0200
Message-Id: <20210314163943.6252-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Carlos Leija <cileija@ti.com>

We need to add a dummy smc call to the cpuidle wakeup path to force the
ROM code to save the return address after MMU is enabled again. This is
needed to prevent random hangs on secure devices like droid4.

Otherwise the system will eventually hang when entering deeper SoC idle
states with the core and mpu domains in open-switch retention (OSWR).
The hang happens as the ROM code tries to use the earlier physical return
address set by omap-headsmp.S with MMU off while waking up CPU1 again.

The hangs started happening in theory already with commit caf8c87d7ff2
("ARM: OMAP2+: Allow core oswr for omap4"), but in practise the issue went
unnoticed as various drivers were often blocking any deeper idle states
with hardware autoidle features.

This patch is based on an earlier TI Linux kernel tree commit 92f0b3028d9e
("OMAP4: PM: update ROM return address for OSWR and OFF") written by
Carlos Leija <cileija@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, and
Bryan Buckley <bryan.buckley@ti.com>. A later version of the patch was
updated to use CPU_PM notifiers by Tero Kristo <t-kristo@ti.com>.

Signed-off-by: Carlos Leija <cileija@ti.com>
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Bryan Buckley <bryan.buckley@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Fixes: caf8c87d7ff2 ("ARM: OMAP2+: Allow core oswr for omap4")
Reported-by: Carl Philipp Klemm <philipp@uvos.xyz>
Reported-by: Merlijn Wajer <merlijn@wizzup.org>
Cc: Ivan Jelincic <parazyd@dyne.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>
[tony@atomide.com: updated to apply, updated description]
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap-secure.c | 39 +++++++++++++++++++++++++++++++
 arch/arm/mach-omap2/omap-secure.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
--- a/arch/arm/mach-omap2/omap-secure.c
+++ b/arch/arm/mach-omap2/omap-secure.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/arm-smccc.h>
+#include <linux/cpu_pm.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -20,6 +21,7 @@
 
 #include "common.h"
 #include "omap-secure.h"
+#include "soc.h"
 
 static phys_addr_t omap_secure_memblock_base;
 
@@ -213,3 +215,40 @@ void __init omap_secure_init(void)
 {
 	omap_optee_init_check();
 }
+
+/*
+ * Dummy dispatcher call after core OSWR and MPU off. Updates the ROM return
+ * address after MMU has been re-enabled after CPU1 has been woken up again.
+ * Otherwise the ROM code will attempt to use the earlier physical return
+ * address that got set with MMU off when waking up CPU1. Only used on secure
+ * devices.
+ */
+static int cpu_notifier(struct notifier_block *nb, unsigned long cmd, void *v)
+{
+	switch (cmd) {
+	case CPU_CLUSTER_PM_EXIT:
+		omap_secure_dispatcher(OMAP4_PPA_SERVICE_0,
+				       FLAG_START_CRITICAL,
+				       0, 0, 0, 0, 0);
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block secure_notifier_block = {
+	.notifier_call = cpu_notifier,
+};
+
+static int __init secure_pm_init(void)
+{
+	if (omap_type() == OMAP2_DEVICE_TYPE_GP)
+		return 0;
+
+	cpu_pm_register_notifier(&secure_notifier_block);
+
+	return 0;
+}
+omap_arch_initcall(secure_pm_init);
diff --git a/arch/arm/mach-omap2/omap-secure.h b/arch/arm/mach-omap2/omap-secure.h
--- a/arch/arm/mach-omap2/omap-secure.h
+++ b/arch/arm/mach-omap2/omap-secure.h
@@ -50,6 +50,7 @@
 #define OMAP5_DRA7_MON_SET_ACR_INDEX	0x107
 
 /* Secure PPA(Primary Protected Application) APIs */
+#define OMAP4_PPA_SERVICE_0		0x21
 #define OMAP4_PPA_L2_POR_INDEX		0x23
 #define OMAP4_PPA_CPU_ACTRL_SMP_INDEX	0x25
 
-- 
2.30.2
