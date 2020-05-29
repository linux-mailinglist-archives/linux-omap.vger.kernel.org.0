Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08E81E88C1
	for <lists+linux-omap@lfdr.de>; Fri, 29 May 2020 22:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbgE2URO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 May 2020 16:17:14 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:40363 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgE2URN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 May 2020 16:17:13 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MW9zm-1jUDqv0gJu-00XYHs; Fri, 29 May 2020 22:17:03 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     soc@kernel.org, Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Olof Johansson <olof@lixom.net>, Stefan Agner <stefan@agner.ch>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap2: fix omap5_realtime_timer_init definition
Date:   Fri, 29 May 2020 22:16:45 +0200
Message-Id: <20200529201701.521933-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ut68jkWxMSIDqAasDiMgUP+u+uDANBHpvLSMe6e4VwoMh+BBJ1H
 6Kxz2dmuXAjOQIIkVylBW6gkceAiNHOa1Q/0HTxAtd0fF/P6JL5BotRHd7vQUzfsgcuQq0a
 jBiMg7G0mw9wVJT+vTVsJOhCEmr9XTWf9ZBe1jzmtR5A6AHrD9w5zhB+g/KISb7ZVB8nvP8
 XcGA37J8aG+/Xfk6TpDfw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RV+VlsD9mj0=:39W2qi7gLz+rPUcP8FiYu0
 dIY5zhEyc2SD7tgBgRTvqfUCkKQ1CnYi8w2pstLLUg5NTxb7tmZBiKid4hqudW2MFUmlccFAt
 NwAz00C7oPqiAr6n3CGsHG0oLlRE5xfNmG5nZUwZekAk+pWVeMFxbmEX7fPVf5aDyY/eQAQNG
 z2V9lgwCHGJq5ZCbcJSjjjtZdxxn26ToRMu1GLJYEOLBMhyHmF9XNsHRwYQTasTuDtyo+E3py
 1CVFY6ka3gZH/munkTb2gCVViIXFAil09LfbYpo0IfDCCG+zfyHUZkwUzU8bDC4h+hBfszw3q
 2r+HndlWYOc+1M06N8hEbTDi6D1ESWqak18RxsTh81k2te507wbGg9UOtPm/Zo/vwR2vTG4Qv
 ohrgOjS/pcX/DkyIgkOZM+WnAqfJI8AKnQhXSnn6g3yq9XfEjnGjX0MiJCtKhwIA1ECiJuW73
 riXterVEddNJrM7B03jtoqVxsJLk/lbGlm3bk3mYXSqpzFyw/drBksv4OJpoxfAoHNXmfYAT0
 0ocv1S8mkJTkcdyvqcmo8+IzTZzFo8rVFIkAOnKrxXX9L7SHusVrZIlhiUc5sNbhIGywnj9Xf
 RxTqqfIaZ1oKH/raHd9pdAIgs4S0aNJFBXOgSoFfOWyTsm1zUeia9+mcWBhIt8PanyLnSZDt/
 DyME012+dNBR5w1Kz8HIkcCRo+jxI8FMfO7s4nPez3Ssz5Fjkfjw812TkgTYdojcubf7PDasF
 HQAT9VZychqXF6poAMAzms3Gmq5my/P+/OpS6ibTh8AF0iAU/SYs3+6yNnT09UiY9tjaBAuFt
 WCguLiMJT77gtQUt/uc0WpEDfRAahJ8u57UWcU49SaoVkUvfmQ=
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

Address this by removing the now obsolete #ifdefs in that file and
just building the entire file based on the flag that controls the
omap5_realtime_timer_init function declaration.

Fixes: d86ad463d670 ("ARM: OMAP2+: Fix regression for using local timer on non-SMP SoCs")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
If this looks ok, I'd apply it directly on top again for the merge window.
---
 arch/arm/mach-omap2/Makefile |  6 +++---
 arch/arm/mach-omap2/timer.c  | 10 ----------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
index 40898b1fd7da..732e614c56b2 100644
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile
@@ -46,9 +46,9 @@ obj-$(CONFIG_SOC_OMAP5)			+= $(omap-4-5-common) $(smp-y) sleep44xx.o
 obj-$(CONFIG_SOC_AM43XX)		+= $(omap-4-5-common)
 obj-$(CONFIG_SOC_DRA7XX)		+= $(omap-4-5-common) $(smp-y) sleep44xx.o
 
-omap5-dra7-common			=  timer.o
-obj-$(CONFIG_SOC_OMAP5)			+= $(omap5-dra7-common)
-obj-$(CONFIG_SOC_DRA7XX)		+= $(omap5-dra7-common)
+omap5-dra7-common-$(CONFIG_SOC_HAS_REALTIME_COUNTER) =  timer.o
+obj-$(CONFIG_SOC_OMAP5)			+= $(omap5-dra7-common-y)
+obj-$(CONFIG_SOC_DRA7XX)		+= $(omap5-dra7-common-y)
 
 # Functions loaded to SRAM
 obj-$(CONFIG_SOC_OMAP2420)		+= sram242x.o
diff --git a/arch/arm/mach-omap2/timer.c b/arch/arm/mach-omap2/timer.c
index c1737e737a94..620ba69c8f11 100644
--- a/arch/arm/mach-omap2/timer.c
+++ b/arch/arm/mach-omap2/timer.c
@@ -39,8 +39,6 @@
 #define INCREMENTER_DENUMERATOR_RELOAD_OFFSET		0x14
 #define NUMERATOR_DENUMERATOR_MASK			0xfffff000
 
-#ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
-
 static unsigned long arch_timer_freq;
 
 void set_cntfreq(void)
@@ -159,14 +157,6 @@ static void __init realtime_counter_init(void)
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

