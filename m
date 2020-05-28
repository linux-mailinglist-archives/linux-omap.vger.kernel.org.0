Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB0B1E66DF
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 17:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404629AbgE1Py7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 11:54:59 -0400
Received: from muru.com ([72.249.23.125]:56036 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404654AbgE1Py6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 28 May 2020 11:54:58 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 68BF380BF;
        Thu, 28 May 2020 15:55:47 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: OMAP2+: Fix regression for using local timer on non-SMP SoCs
Date:   Thu, 28 May 2020 08:54:53 -0700
Message-Id: <20200528155453.8585-1-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On am437x we use also an ARM timer in addition to the dmtimer. As am437x
is not an SMP SoC, we need tick_broadcast() implemented. With the recent
dmtimer changes, Arnd started to see link failures for non-SMP am437x
configuration:

kernel/time/tick-broadcast.o: in function `tick_device_uses_broadcast':
tick-broadcast.c:(.text+0x130): undefined reference to `tick_broadcast'

Let's fix the issue by reverting dmtimer related changes that started
building timer.c only for CONFIG_SOC_HAS_REALTIME_COUNTER. We still
always need timer.c built-in for omap5 and dra7 for timer_probe().

And let's also move am437x tick_broadcast() to board-generic.c as
that's where we now call timer_probe() for am437x. This way we avoid
adding back more ifdefs to timer.c.

Fixes: 2ee04b88547a ("ARM: OMAP2+: Drop old timer code for dmtimer and 32k counter")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/Makefile        |  6 ++++--
 arch/arm/mach-omap2/board-generic.c |  7 +++++++
 arch/arm/mach-omap2/timer.c         | 19 ++++++++++---------
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile
@@ -16,8 +16,6 @@ hwmod-common				= omap_hwmod.o omap_hwmod_reset.o \
 clock-common				= clock.o
 secure-common				= omap-smc.o omap-secure.o
 
-obj-$(CONFIG_SOC_HAS_REALTIME_COUNTER)	+= timer.o
-
 obj-$(CONFIG_ARCH_OMAP2) += $(omap-2-3-common) $(hwmod-common)
 obj-$(CONFIG_ARCH_OMAP3) += $(omap-2-3-common) $(hwmod-common) $(secure-common)
 obj-$(CONFIG_ARCH_OMAP4) += $(hwmod-common) $(secure-common)
@@ -48,6 +46,10 @@ obj-$(CONFIG_SOC_OMAP5)			+= $(omap-4-5-common) $(smp-y) sleep44xx.o
 obj-$(CONFIG_SOC_AM43XX)		+= $(omap-4-5-common)
 obj-$(CONFIG_SOC_DRA7XX)		+= $(omap-4-5-common) $(smp-y) sleep44xx.o
 
+omap5-dra7-common			=  timer.o
+obj-$(CONFIG_SOC_OMAP5)			+= $(omap5-dra7-common)
+obj-$(CONFIG_SOC_DRA7XX)		+= $(omap5-dra7-common)
+
 # Functions loaded to SRAM
 obj-$(CONFIG_SOC_OMAP2420)		+= sram242x.o
 obj-$(CONFIG_SOC_OMAP2430)		+= sram243x.o
diff --git a/arch/arm/mach-omap2/board-generic.c b/arch/arm/mach-omap2/board-generic.c
--- a/arch/arm/mach-omap2/board-generic.c
+++ b/arch/arm/mach-omap2/board-generic.c
@@ -39,6 +39,13 @@ void __init __maybe_unused omap_init_time_of(void)
 	timer_probe();
 }
 
+/* Used by am437x for ARM timer in non-SMP configurations */
+#if !defined(CONFIG_SMP) && defined(CONFIG_GENERIC_CLOCKEVENTS_BROADCAST)
+void tick_broadcast(const struct cpumask *mask)
+{
+}
+#endif
+
 #ifdef CONFIG_SOC_OMAP2420
 static const char *const omap242x_boards_compat[] __initconst = {
 	"ti,omap2420",
diff --git a/arch/arm/mach-omap2/timer.c b/arch/arm/mach-omap2/timer.c
--- a/arch/arm/mach-omap2/timer.c
+++ b/arch/arm/mach-omap2/timer.c
@@ -39,6 +39,8 @@
 #define INCREMENTER_DENUMERATOR_RELOAD_OFFSET		0x14
 #define NUMERATOR_DENUMERATOR_MASK			0xfffff000
 
+#ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
+
 static unsigned long arch_timer_freq;
 
 void set_cntfreq(void)
@@ -46,14 +48,6 @@ void set_cntfreq(void)
 	omap_smc1(OMAP5_DRA7_MON_SET_CNTFRQ_INDEX, arch_timer_freq);
 }
 
-#if !defined(CONFIG_SMP) && defined(CONFIG_GENERIC_CLOCKEVENTS_BROADCAST)
-void tick_broadcast(const struct cpumask *mask)
-{
-}
-#endif
-
-#if defined(CONFIG_SOC_OMAP5) || defined(CONFIG_SOC_DRA7XX)
-
 /*
  * The realtime counter also called master counter, is a free-running
  * counter, which is related to real time. It produces the count used
@@ -165,6 +159,14 @@ static void __init realtime_counter_init(void)
 	iounmap(base);
 }
 
+#else
+
+static inline void realtime_counter_init(void)
+{
+}
+
+#endif	/* CONFIG_SOC_HAS_REALTIME_COUNTER */
+
 void __init omap5_realtime_timer_init(void)
 {
 	omap_clk_init();
@@ -172,4 +174,3 @@ void __init omap5_realtime_timer_init(void)
 
 	timer_probe();
 }
-#endif /* CONFIG_SOC_OMAP5 || CONFIG_SOC_DRA7XX */
-- 
2.26.2
