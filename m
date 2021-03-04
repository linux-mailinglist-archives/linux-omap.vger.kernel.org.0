Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4615432CD85
	for <lists+linux-omap@lfdr.de>; Thu,  4 Mar 2021 08:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236233AbhCDHWi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Mar 2021 02:22:38 -0500
Received: from muru.com ([72.249.23.125]:39300 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236210AbhCDHW3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 4 Mar 2021 02:22:29 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id F00F981BC;
        Thu,  4 Mar 2021 07:22:26 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] clocksource/drivers/timer-ti-dm: Add missing set_state_oneshot_stopped
Date:   Thu,  4 Mar 2021 09:21:35 +0200
Message-Id: <20210304072135.52712-4-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304072135.52712-1-tony@atomide.com>
References: <20210304072135.52712-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

To avoid spurious timer interrupts when KTIME_MAX is used, we need to
configure set_state_oneshot_stopped(). Although implementing this is
optional, it still affects things like power management for the extra
timer interrupt.

For more information, please see commit 8fff52fd5093 ("clockevents:
Introduce CLOCK_EVT_STATE_ONESHOT_STOPPED state") and commit cf8c5009ee37
("clockevents/drivers/arm_arch_timer: Implement
->set_state_oneshot_stopped()").

Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clocksource/timer-ti-dm-systimer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -552,6 +552,7 @@ static int __init dmtimer_clockevent_init(struct device_node *np)
 	dev->set_state_shutdown = dmtimer_clockevent_shutdown;
 	dev->set_state_periodic = dmtimer_set_periodic;
 	dev->set_state_oneshot = dmtimer_clockevent_shutdown;
+	dev->set_state_oneshot_stopped = dmtimer_clockevent_shutdown;
 	dev->tick_resume = dmtimer_clockevent_shutdown;
 	dev->cpumask = cpu_possible_mask;
 
-- 
2.30.1
