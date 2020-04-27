Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFD91BAB3A
	for <lists+linux-omap@lfdr.de>; Mon, 27 Apr 2020 19:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgD0R2m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Apr 2020 13:28:42 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45276 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgD0R2l (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Apr 2020 13:28:41 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03RHSbqk104244;
        Mon, 27 Apr 2020 12:28:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588008517;
        bh=dkYDQiJXfdVnI5Ul/GYJhp6hlCqYVf4gO6nywH0oUXY=;
        h=From:To:CC:Subject:Date;
        b=jigExJEwCtkyqdDLTJ/ja+ULmNFZJ141jGUs0qpPlD8gZWdvmADXP/m4VYX6mIfG2
         64ULOwqokCPOLpwbDeDcN21fbp4xAhNZz6XG0MZ7Y1apZuYrZ67p2IEnyEwEDA2wMQ
         nQ1iT7YAYLxPPN5mPlyEglOv9mP67zE5C/W1zSfs=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RHSbnS067353;
        Mon, 27 Apr 2020 12:28:37 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 27
 Apr 2020 12:28:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 27 Apr 2020 12:28:36 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RHSX69017392;
        Mon, 27 Apr 2020 12:28:34 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     <daniel.lezcano@linaro.org>, Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Suman Anna <s-anna@ti.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] clocksource/drivers/timer-ti-dm: Do one override clock parent in prepare()
Date:   Mon, 27 Apr 2020 22:58:31 +0530
Message-ID: <20200427172831.16546-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

omap_dm_timer_prepare() is setting up the parent 32KHz clock. This
prepare() gets called by request_timer in the client's driver. Because of
this, the timer clock parent that is set with assigned-clock-parent is being
overwritten. So drop this default setting of parent in prepare().

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
- As per the discussion happened here[0], dropping the default setting.
[0] https://patchwork.kernel.org/patch/11379875/#23309493

 drivers/clocksource/timer-ti-dm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
index 2531eab3d6d7..60aff087947a 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -258,9 +258,7 @@ static int omap_dm_timer_prepare(struct omap_dm_timer *timer)
 	__omap_dm_timer_enable_posted(timer);
 	omap_dm_timer_disable(timer);
 
-	rc = omap_dm_timer_set_source(timer, OMAP_TIMER_SRC_32_KHZ);
-
-	return rc;
+	return 0;
 }
 
 static inline u32 omap_dm_timer_reserved_systimer(int id)
-- 
2.23.0

