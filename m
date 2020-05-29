Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA9C1E8A96
	for <lists+linux-omap@lfdr.de>; Sat, 30 May 2020 00:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728472AbgE2WAt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 May 2020 18:00:49 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:35129 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbgE2WAs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 May 2020 18:00:48 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MGz9p-1jjW8K3C0R-00E3Zm; Sat, 30 May 2020 00:00:31 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Santosh Shilimkar <santosh.shilimkar@oracle.com>,
        Tero Kristo <t-kristo@ti.com>, Olof Johansson <olof@lixom.net>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] ARM: omap2: fix omap5_realtime_timer_init definition
Date:   Fri, 29 May 2020 23:59:58 +0200
Message-Id: <20200529220029.589078-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lB/mveK2Z0q3RmpTHxEumYnXuUSXL0E87ll3iIdtECNcFm+crs6
 cnhT+FbwSWCf55XMKsFwTenIExN83AoXvPzqYq/ftdi+ptNSQwC+eS4H/mHjqbDwFSLrY21
 I91b8vL5wXL7gfBTy/aAnlQDb77ZKJ6BVt/Uq3ar5AEQy72HbUF7B9dnw5Pyl1Oe/yZLt+I
 1D6zJHSLSJJP6FkA8LpFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D+Ikx8y7nsM=:m+wQjwckao2o7k2l+YAJ06
 21w2cwG0lIkQPAQx2V/H0WFNz7JIvl0kt1aVyeNE/G/ystwYUQ6QSm8kFbCWLjAZjsLfTHKgT
 0YXRvYkSZlg+dfmbPNLuNIUvsknbiyFj2zVquINBI63vmBDwm4uOkDlcd15Rt01jLXw5i4A80
 9Bm9XIUG3qGYoS88Gl6EYFzD8a6/7IA86hBwgld55ut5ONXZGrnTwIhFcWQnYFfLhvEwbrFQJ
 s/y+PSroEocG/l3SCPRWKMLYe2+cVK9GnIJtZjUfaAooJ0+zBS7WZvng5CTua0eEk+AC1874Q
 iZpbHntLV9iLkOaNRBtbN9vlEzjRy/7GASB5Ky/JztOfaUl8Pe6QQIHIMpPGa9CHP1MSD2D7e
 JdDGqSTV50+JXw5GZk2QLDr9EHDf9ZFUKkI99Pa8kh2SwQMvNKDJ2JTNZxDAHzaCcRwOd12vO
 r15e9+K2XCNhu1ArXSNQJyDO9KtWDyuzNPOvyJhEasas99YCL3Ms9OoHlf1HBTiNUsv8eGRPB
 SeulhTQRt62SuQUd05eku5++OSM0xWqkOxQfRSnAzH+do/an8w09UBT7Z5WoJfpXZR+F2UImB
 FqCfIKgLMGhv05PihXm2rTCZQCLuNrjeO5FJxSctQbfp15q1ftD+alFeTEqC/zjE+Zrj+T1hH
 OIM/7kcn+AanCfWhH8sr/JY9Cp6lm1F1bG5TJ8ifm1KukvHaQ83EoAKVjhI2754PVBQGzeesx
 YZG+8dCjl1cP0BA1i5VrJ6lY92PKx9XqoHeq9lwuogKMe9gs0dSPnGxDvdBaF9Gn3U7mLvRKt
 XAv1O2Ur7LzSmSsg53Hcw6T278byck46XavrbiHd7WwPgYnnTo=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There is one more regression introduced by the last build fix:

arch/arm/mach-omap2/timer.c:170:6: error: attribute declaration must precede definition [-Werror,-Wignored-attributes]
void __init omap5_realtime_timer_init(void)
     ^
arch/arm/mach-omap2/common.h:118:20: note: previous definition is here
static inline void omap5_realtime_timer_init(void)
                   ^
arch/arm/mach-omap2/timer.c:170:13: error: redefinition of 'omap5_realtime_timer_init'
void __init omap5_realtime_timer_init(void)
            ^
arch/arm/mach-omap2/common.h:118:20: note: previous definition is here
static inline void omap5_realtime_timer_init(void)

As it turns out, the CONFIG_SOC_HAS_REALTIME_COUNTER option
should never be disabled for OMAP5 as we realy on this to initialize
the clocks and the timer. Just remove it here and make it the default.

Removing the guard around the set_cntfreq() definition, I noticed that
this is not properly namespaced, so fix that as well.

Fixes: d86ad463d670 ("ARM: OMAP2+: Fix regression for using local timer on non-SMP SoCs")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I'll let this run randconfig builds overnight to be sure it doesn't
cause another regression.
---
 arch/arm/mach-omap2/Kconfig       |  5 -----
 arch/arm/mach-omap2/common.h      |  6 ------
 arch/arm/mach-omap2/omap-secure.h |  9 +--------
 arch/arm/mach-omap2/omap-smp.c    |  2 +-
 arch/arm/mach-omap2/timer.c       | 14 ++------------
 5 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index ca74473f01df..87fb4df4cf72 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -145,11 +145,6 @@ config ARCH_OMAP2PLUS_TYPICAL
 config SOC_HAS_OMAP2_SDRC
 	bool "OMAP2 SDRAM Controller support"
 
-config SOC_HAS_REALTIME_COUNTER
-	bool "Real time free running counter"
-	depends on SOC_OMAP5 || SOC_DRA7XX
-	default y
-
 config POWER_AVS_OMAP
 	bool "AVS(Adaptive Voltage Scaling) support for OMAP IP versions 1&2"
 	depends on POWER_AVS && (ARCH_OMAP3 || ARCH_OMAP4) && PM
diff --git a/arch/arm/mach-omap2/common.h b/arch/arm/mach-omap2/common.h
index 49926eced5f1..70e3d6df4cb6 100644
--- a/arch/arm/mach-omap2/common.h
+++ b/arch/arm/mach-omap2/common.h
@@ -112,13 +112,7 @@ static inline int omap_l2_cache_init(void)
 #define omap4_l2c310_write_sec	NULL
 #endif
 
-#ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
 extern void omap5_realtime_timer_init(void);
-#else
-static inline void omap5_realtime_timer_init(void)
-{
-}
-#endif
 
 void omap2420_init_early(void);
 void omap2430_init_early(void);
diff --git a/arch/arm/mach-omap2/omap-secure.h b/arch/arm/mach-omap2/omap-secure.h
index 4aaa95706d39..fbc02bb639c4 100644
--- a/arch/arm/mach-omap2/omap-secure.h
+++ b/arch/arm/mach-omap2/omap-secure.h
@@ -81,14 +81,7 @@ extern u32 rx51_secure_rng_call(u32 ptr, u32 count, u32 flag);
 
 extern bool optee_available;
 void omap_secure_init(void);
-
-#ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
-void set_cntfreq(void);
-#else
-static inline void set_cntfreq(void)
-{
-}
-#endif
+void omap5_set_cntfreq(void);
 
 #endif /* __ASSEMBLER__ */
 #endif /* OMAP_ARCH_OMAP_SECURE_H */
diff --git a/arch/arm/mach-omap2/omap-smp.c b/arch/arm/mach-omap2/omap-smp.c
index 570a987e6d1a..f35d5642122a 100644
--- a/arch/arm/mach-omap2/omap-smp.c
+++ b/arch/arm/mach-omap2/omap-smp.c
@@ -162,7 +162,7 @@ static void omap4_secondary_init(unsigned int cpu)
 		 * Configure the CNTFRQ register for the secondary cpu's which
 		 * indicates the frequency of the cpu local timers.
 		 */
-		set_cntfreq();
+		omap5_set_cntfreq();
 		/* Configure ACR to disable streaming WA for 801819 */
 		omap5_erratum_workaround_801819();
 		/* Enable ACR to allow for ICUALLU workaround */
diff --git a/arch/arm/mach-omap2/timer.c b/arch/arm/mach-omap2/timer.c
index c1737e737a94..9b7b1240de81 100644
--- a/arch/arm/mach-omap2/timer.c
+++ b/arch/arm/mach-omap2/timer.c
@@ -39,11 +39,9 @@
 #define INCREMENTER_DENUMERATOR_RELOAD_OFFSET		0x14
 #define NUMERATOR_DENUMERATOR_MASK			0xfffff000
 
-#ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
-
 static unsigned long arch_timer_freq;
 
-void set_cntfreq(void)
+void omap5_set_cntfreq(void)
 {
 	omap_smc1(OMAP5_DRA7_MON_SET_CNTFRQ_INDEX, arch_timer_freq);
 }
@@ -154,19 +152,11 @@ static void __init realtime_counter_init(void)
 	writel_relaxed(reg, base + INCREMENTER_DENUMERATOR_RELOAD_OFFSET);
 
 	arch_timer_freq = DIV_ROUND_UP_ULL(rate * num, den);
-	set_cntfreq();
+	omap5_set_cntfreq();
 
 	iounmap(base);
 }
 
-#else
-
-static inline void realtime_counter_init(void)
-{
-}
-
-#endif	/* CONFIG_SOC_HAS_REALTIME_COUNTER */
-
 void __init omap5_realtime_timer_init(void)
 {
 	omap_clk_init();
-- 
2.26.2

