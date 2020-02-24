Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 102B1169D65
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 06:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgBXFJB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 00:09:01 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44670 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgBXFJA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 00:09:00 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01O58ndh043261;
        Sun, 23 Feb 2020 23:08:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582520930;
        bh=Rl9mP7346FmUgsFlfQHPHIgoAbb44S30T/NYsb34Dok=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Yjy7E5qmMS0MMSI82l1zW2oECvnlG8OX2jdiJVNMjHm+oTMcFneIbnZEjocN4ypC1
         lT+yvYAt2aUWeUL33vnkWp8b3Mb+FNRjiIBZbS3/oBtexSaF3lkqJcTokqoDHqf/f3
         eepRFrePOoO8Ixp2nZrMs//LRezqWvN3Ip8Gd65E=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01O58nrW096125;
        Sun, 23 Feb 2020 23:08:49 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 23
 Feb 2020 23:08:49 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 23 Feb 2020 23:08:49 -0600
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01O58g4o113272;
        Sun, 23 Feb 2020 23:08:46 -0600
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Tony Lindgren <tony@atomide.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <narmstrong@baylibre.com>,
        Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 1/2] clocksource: timer-ti-dm: Do not restore context on every timer enable
Date:   Mon, 24 Feb 2020 10:37:52 +0530
Message-ID: <20200224050753.17784-2-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200224050753.17784-1-lokeshvutla@ti.com>
References: <20200224050753.17784-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

omap_dm_timer_enable() restores the entire context(including counter)
based on 2 conditions:
- If get_context_loss_count is populated and context is lost.
- If get_context_loss_count is not populated update unconditionally.

Case2 has a side effect of updating the counter register even though
context is not lost. When timer is configured in pwm mode, this is
causing undesired behaviour in the pwm period. So restore context only
if get_context_loss_count is populated and context is actually lost.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 drivers/clocksource/timer-ti-dm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
index 269a994d6a99..40742715ed21 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -229,15 +229,12 @@ static void omap_dm_timer_enable(struct omap_dm_timer *timer)
 
 	pm_runtime_get_sync(&timer->pdev->dev);
 
-	if (!(timer->capability & OMAP_TIMER_ALWON)) {
-		if (timer->get_context_loss_count) {
-			c = timer->get_context_loss_count(&timer->pdev->dev);
-			if (c != timer->ctx_loss_count) {
-				omap_timer_restore_context(timer);
-				timer->ctx_loss_count = c;
-			}
-		} else {
+	if (!(timer->capability & OMAP_TIMER_ALWON) &&
+	    timer->get_context_loss_count) {
+		c = timer->get_context_loss_count(&timer->pdev->dev);
+		if (c != timer->ctx_loss_count) {
 			omap_timer_restore_context(timer);
+			timer->ctx_loss_count = c;
 		}
 	}
 }
-- 
2.23.0

