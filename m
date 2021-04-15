Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433C5360508
	for <lists+linux-omap@lfdr.de>; Thu, 15 Apr 2021 10:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhDOIzf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Apr 2021 04:55:35 -0400
Received: from muru.com ([72.249.23.125]:54704 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231326AbhDOIze (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 15 Apr 2021 04:55:34 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7CD6F80CF;
        Thu, 15 Apr 2021 08:56:27 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: [PATCH] clocksource/drivers/timer-ti-dm: Save and restore timer TIOCP_CFG
Date:   Thu, 15 Apr 2021 11:55:06 +0300
Message-Id: <20210415085506.56828-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

As we are using cpu_pm to save and restore context, we must also save and
restore the timer sysconfig register TIOCP_CFG. This is needed because
we are not calling PM runtime functions at all with cpu_pm.

Fixes: b34677b0999a ("clocksource/drivers/timer-ti-dm: Implement cpu_pm notifier for context save and restore")
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Adam Ford <aford173@gmail.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clocksource/timer-ti-dm.c | 6 ++++++
 include/clocksource/timer-ti-dm.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -78,6 +78,9 @@ static void omap_dm_timer_write_reg(struct omap_dm_timer *timer, u32 reg,
 
 static void omap_timer_restore_context(struct omap_dm_timer *timer)
 {
+	__omap_dm_timer_write(timer, OMAP_TIMER_OCP_CFG_OFFSET,
+			      timer->context.ocp_cfg, 0);
+
 	omap_dm_timer_write_reg(timer, OMAP_TIMER_WAKEUP_EN_REG,
 				timer->context.twer);
 	omap_dm_timer_write_reg(timer, OMAP_TIMER_COUNTER_REG,
@@ -95,6 +98,9 @@ static void omap_timer_restore_context(struct omap_dm_timer *timer)
 
 static void omap_timer_save_context(struct omap_dm_timer *timer)
 {
+	timer->context.ocp_cfg =
+		__omap_dm_timer_read(timer, OMAP_TIMER_OCP_CFG_OFFSET, 0);
+
 	timer->context.tclr =
 			omap_dm_timer_read_reg(timer, OMAP_TIMER_CTRL_REG);
 	timer->context.twer =
diff --git a/include/clocksource/timer-ti-dm.h b/include/clocksource/timer-ti-dm.h
--- a/include/clocksource/timer-ti-dm.h
+++ b/include/clocksource/timer-ti-dm.h
@@ -74,6 +74,7 @@
 #define OMAP_TIMER_ERRATA_I103_I767			0x80000000
 
 struct timer_regs {
+	u32 ocp_cfg;
 	u32 tidr;
 	u32 tier;
 	u32 twer;
-- 
2.31.1
