Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 459A586C76
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403798AbfHHVca (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:32:30 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:59617 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730768AbfHHVca (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:32:30 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MHEPI-1i93Qp43sm-00DK8b; Thu, 08 Aug 2019 23:32:04 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 11/22] clocksource: ti-dmtimer: avoid using mach/hardware.h
Date:   Thu,  8 Aug 2019 23:22:20 +0200
Message-Id: <20190808212234.2213262-12-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808212234.2213262-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3tljNrXw83+F4Hazcc57iyTVuqcANP1caRyw1sEvbkwOygXkbr1
 2ASndSMUrdeHCNbt1U3/d4g6qDaH9k8V17XP2mqlGCEr/0WkuW4dpT0luK3Ib7tzCq3jePR
 BGIFP9qnN11wrBgaVcqYGbcuHh66bIzNhqhuwqjrw5DHew75jqoOoa8BFA3OkhD3Df5sApL
 8Rp7aRufJofird7OveVzg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c+WCVkEggaY=:c38mMZPYd8pl1vXQe/HjSA
 DBUWUCNFjnUJbBngyRKBRfKPQh7GsHAImDc+yv3V7nryPEmK/AmVc0yULOOpMsZRogR9HyphU
 IUkECTgE4tRvMXh9k64YOLT8YnXTq5QuxwoV9XwFj4F3GHhkrsJ6bFp30AnMG/D2f2ZsafdG4
 yTzGXMB2SLhbHRGbxywX4gIz7ERYYwsWlbvmjHxGnS1E5p1E0E88XsCZSGQz0MHCmQckQOkE+
 2YsOUR4fllQDmC1aTYZFqJjY+2amkjolTkB+F3G5vrDW3efKKAoga5h4ZujEjLAlahRw8zpK6
 lqrPBFihWNmjchEyQkPqsMIMAsrLCia9XhWzLfB6l7e/1hk4ZpBVHK5mKTv1MBj8T8n7dsEEh
 Y6WSDp9awK/eLo4MwI8Dw4VQSsIXA1AX76bqXMKoA6mmkEVaTW98dgPgPgNNu/6JtWg9WkjrH
 5VcOE42yVkZLddcgBxeBhxQ6DQ48Q1VbzXZTuQADwcme5dJZvMC4xgv9ocOHIdf5+4RF4J7Jt
 3lVUGDobZk45oXSv3t5vfWa+zh/oo1cRc8w05FzGCgRVvUXucWsIKMtnBI5JsYSvoesblkdiz
 sWZNvg6+WbPYA+hFDWF3Nc3jlTEm9ppDVyuk5gKxn5tRriaHB0xXHyVyVdYf3FvAiJoz/gBS5
 2JRVH49k0FFL7f+CUQC7jnAOzJ34LYZceQlNBkqIsEBjBhM39l9iSQButSSt9PowGTmOyEa8n
 bXNX4gD8IhG84AdyKAiVXFr1ylArol+ND1mdAA==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

As a preparation for future omap1 multiplatform support, stop
using mach/hardware.h and instead include the omap1-io.h
for low-level register access to MOD_CONF_CTRL_1.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clocksource/timer-ti-dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
index 5394d9dbdfbc..422f96384dc5 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -448,7 +448,7 @@ int omap_dm_timer_get_irq(struct omap_dm_timer *timer)
 }
 
 #if defined(CONFIG_ARCH_OMAP1)
-#include <mach/hardware.h>
+#include <linux/soc/ti/omap1-io.h>
 
 static struct clk *omap_dm_timer_get_fclk(struct omap_dm_timer *timer)
 {
-- 
2.20.0

