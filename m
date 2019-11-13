Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78523FB681
	for <lists+linux-omap@lfdr.de>; Wed, 13 Nov 2019 18:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbfKMRhw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Nov 2019 12:37:52 -0500
Received: from muru.com ([72.249.23.125]:42050 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbfKMRhw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 13 Nov 2019 12:37:52 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DCE9480E2;
        Wed, 13 Nov 2019 17:38:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH] ARM: OMAP2+: Drop useless gptimer option for omap4
Date:   Wed, 13 Nov 2019 09:37:49 -0800
Message-Id: <20191113173749.57261-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We have local timers on Cortex-A9, so using the gptimer option makes no
sense. Let's just drop it for omap4 to simplify the timer options a bit.

If this is really needed, it can be still done by specifying dts properties
in the board specific file for assigned-clocks and assigned-clock-parents.

This gets us a bit closer to start dropping legacy platform data for
gptimers except for timer1 that is used for system clockevent.

Cc: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/timer.c b/arch/arm/mach-omap2/timer.c
--- a/arch/arm/mach-omap2/timer.c
+++ b/arch/arm/mach-omap2/timer.c
@@ -545,7 +545,7 @@ static void __init __omap_sync32k_timer_init(int clkev_nr, const char *clkev_src
 	omap2_gp_clockevent_init(clkev_nr, clkev_src, clkev_prop);
 
 	/* Enable the use of clocksource="gp_timer" kernel parameter */
-	if (use_gptimer_clksrc || gptimer)
+	if (clksrc_nr && (use_gptimer_clksrc || gptimer))
 		omap2_gptimer_clocksource_init(clksrc_nr, clksrc_src,
 						clksrc_prop);
 	else
@@ -586,7 +586,7 @@ void __init omap3_gptimer_timer_init(void)
 static void __init omap4_sync32k_timer_init(void)
 {
 	__omap_sync32k_timer_init(1, "timer_32k_ck", "ti,timer-alwon",
-			2, "sys_clkin_ck", NULL, false);
+				  0, NULL, NULL, false);
 }
 
 void __init omap4_local_timer_init(void)
-- 
2.23.0
