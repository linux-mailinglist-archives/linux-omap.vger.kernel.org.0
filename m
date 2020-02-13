Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30A8115B915
	for <lists+linux-omap@lfdr.de>; Thu, 13 Feb 2020 06:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgBMFgE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Feb 2020 00:36:04 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56280 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgBMFgE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 13 Feb 2020 00:36:04 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01D5ZPhp070488;
        Wed, 12 Feb 2020 23:35:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581572125;
        bh=R8BtIqX9wdHmKDQa8Ygxjd+tmtMlRwRolDE5ahGByNw=;
        h=From:To:CC:Subject:Date;
        b=tELsaSdzuKv1Y+xcJah9+tLHyVKuleoxnmA6W8/OT68C+vcE9klFY8JCUcIJafRiT
         o9HfnT0HEMb8Y1BmwjuBIZ0PSPyH2e9Bh81WcPLcmOhV+TzZHB4UlH0dFmwBvqJKfB
         Ry7dWFU8mmXyGjaJer23bpXtEmQgOff0ZgIGVSAA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01D5ZPWT029583
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Feb 2020 23:35:25 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 12
 Feb 2020 23:35:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 12 Feb 2020 23:35:25 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01D5ZPGP029755;
        Wed, 12 Feb 2020 23:35:25 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 01D5ZO308765;
        Wed, 12 Feb 2020 23:35:24 -0600 (CST)
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] clocksource: timer-ti-dm: Drop bogus omap_dm_timer_of_set_source()
Date:   Wed, 12 Feb 2020 23:35:04 -0600
Message-ID: <20200213053504.22638-1-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The function omap_dm_timer_of_set_source() was originally added in
commit 31a7448f4fa8a ("ARM: OMAP: dmtimer: Add clock source from DT"),
and is designed to set a clock source from DT using the clocks property
of a timer node. This design choice is okay for clk provider nodes but
otherwise is a bad design as typically the clocks property is used to
specify the functional clocks for a device, and not its parents.

The timer nodes now all define a timer functional clock after the
conversion to ti-sysc and the new clkctrl layout, and this results
in an attempt to set the same functional clock as its parent when a
consumer driver attempts to acquire any of these timers in the
omap_dm_timer_prepare() function. This was masked and worked around
in commit 983a5a43ec25 ("clocksource: timer-ti-dm: Fix pwm dmtimer
usage of fck reparenting"). Fix all of this by simply dropping the
entire function.

Any DT configuration of clock sources should be achieved using
assigned-clocks and assigned-clock-parents properties provided
by the Common Clock Framework.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Ladislav Michl <ladis@linux-mips.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Suman Anna <s-anna@ti.com>
---
Hi Tony,

Do you have the history of why the 32 KHz source is set as parent during
prepare? One of the current side-affects of this patch is that now instead
of bailing out, the 32 KHz source is set, and consumers will still need
to select their appropriate parent. Dropping that call should actually
allow us to select the parents in the consumer nodes in dts files using
the assigned-clocks and assigned-clock-parents properties. I prefer to
drop it if you do not foresee any issues. For now, I do not anticipate
any issues with omap-pwm-dmtimer with this patch.

regards
Suman

 drivers/clocksource/timer-ti-dm.c | 33 +------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
index 269a994d6a99..d8637a60a7eb 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -138,35 +138,6 @@ static int omap_dm_timer_reset(struct omap_dm_timer *timer)
 	return 0;
 }
 
-static int omap_dm_timer_of_set_source(struct omap_dm_timer *timer)
-{
-	int ret;
-	struct clk *parent;
-
-	/*
-	 * FIXME: OMAP1 devices do not use the clock framework for dmtimers so
-	 * do not call clk_get() for these devices.
-	 */
-	if (!timer->fclk)
-		return -ENODEV;
-
-	parent = clk_get(&timer->pdev->dev, NULL);
-	if (IS_ERR(parent))
-		return -ENODEV;
-
-	/* Bail out if both clocks point to fck */
-	if (clk_is_match(parent, timer->fclk))
-		return 0;
-
-	ret = clk_set_parent(timer->fclk, parent);
-	if (ret < 0)
-		pr_err("%s: failed to set parent\n", __func__);
-
-	clk_put(parent);
-
-	return ret;
-}
-
 static int omap_dm_timer_set_source(struct omap_dm_timer *timer, int source)
 {
 	int ret;
@@ -276,9 +247,7 @@ static int omap_dm_timer_prepare(struct omap_dm_timer *timer)
 	__omap_dm_timer_enable_posted(timer);
 	omap_dm_timer_disable(timer);
 
-	rc = omap_dm_timer_of_set_source(timer);
-	if (rc == -ENODEV)
-		return omap_dm_timer_set_source(timer, OMAP_TIMER_SRC_32_KHZ);
+	rc = omap_dm_timer_set_source(timer, OMAP_TIMER_SRC_32_KHZ);
 
 	return rc;
 }
-- 
2.23.0

