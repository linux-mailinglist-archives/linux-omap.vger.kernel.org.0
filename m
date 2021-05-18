Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7BB4387392
	for <lists+linux-omap@lfdr.de>; Tue, 18 May 2021 09:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241636AbhERHy2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 May 2021 03:54:28 -0400
Received: from muru.com ([72.249.23.125]:57076 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347311AbhERHy1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 May 2021 03:54:27 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9D5A480F5;
        Tue, 18 May 2021 07:53:13 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH] clocksource/drivers/timer-ti-dm: Drop unnecessary restore
Date:   Tue, 18 May 2021 10:53:06 +0300
Message-Id: <20210518075306.35532-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The device is not losing context on CPU_CLUSTER_PM_ERROR. As we are only
saving and restoring context with cpu_pm, there is no need to restore the
context in case of an error.

Note that the unnecessary restoring of context does not cause issues, it's
just not needed.

Cc: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clocksource/timer-ti-dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -122,7 +122,8 @@ static int omap_timer_context_notifier(struct notifier_block *nb,
 			break;
 		omap_timer_save_context(timer);
 		break;
-	case CPU_CLUSTER_PM_ENTER_FAILED:
+	case CPU_CLUSTER_PM_ENTER_FAILED:	/* No need to restore context */
+		break;
 	case CPU_CLUSTER_PM_EXIT:
 		if ((timer->capability & OMAP_TIMER_ALWON) ||
 		    !atomic_read(&timer->enabled))
-- 
2.31.1
