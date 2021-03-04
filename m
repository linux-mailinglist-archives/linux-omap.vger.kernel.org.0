Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A334132CD88
	for <lists+linux-omap@lfdr.de>; Thu,  4 Mar 2021 08:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236231AbhCDHWh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Mar 2021 02:22:37 -0500
Received: from muru.com ([72.249.23.125]:39288 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236209AbhCDHW2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 4 Mar 2021 02:22:28 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5818181A7;
        Thu,  4 Mar 2021 07:22:25 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] clocksource/drivers/timer-ti-dm: Remove extra of_node_put()
Date:   Thu,  4 Mar 2021 09:21:34 +0200
Message-Id: <20210304072135.52712-3-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304072135.52712-1-tony@atomide.com>
References: <20210304072135.52712-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We have of_translate_address() already do of_node_put() as needed.
I probably looked at __of_translate_address() earlier by accident
that of_translate_address() uses.

Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clocksource/timer-ti-dm-systimer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -265,7 +265,6 @@ static void __init dmtimer_systimer_assign_alwon(void)
 				    pa == 0x48318000)
 					continue;
 
-				of_node_put(np);
 				break;
 			}
 		}
@@ -300,7 +299,6 @@ static u32 __init dmtimer_systimer_find_first_available(void)
 				continue;
 			}
 
-			of_node_put(np);
 			break;
 		}
 	}
-- 
2.30.1
