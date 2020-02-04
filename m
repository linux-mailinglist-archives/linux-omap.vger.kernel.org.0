Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0A8C151D5D
	for <lists+linux-omap@lfdr.de>; Tue,  4 Feb 2020 16:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbgBDPgK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Feb 2020 10:36:10 -0500
Received: from muru.com ([72.249.23.125]:52652 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727258AbgBDPgJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 4 Feb 2020 10:36:09 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9E0BA8107;
        Tue,  4 Feb 2020 15:36:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] phy: mapphone-mdm6600: Fix write timeouts with shorter GPIO toggle interval
Date:   Tue,  4 Feb 2020 07:36:02 -0800
Message-Id: <20200204153602.60507-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I've noticed that when writing data to the modem the writes can time out
at some point eventually. Looks like kicking the modem idle GPIO every
600 ms instead of once a second fixes the issue. Note that this rate is
different from our runtime PM autosuspend rate MDM6600_MODEM_IDLE_DELAY_MS
that we still want to keep at 1 second, so let's add a separate define for
PHY_MDM6600_IDLE_KICK_MS.

Fixes: f7f50b2a7b05 ("phy: mapphone-mdm6600: Add runtime PM support for n_gsm on USB suspend")
Cc: Marcel Partap <mpartap@gmx.net>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Michael Scott <hashcode0f@gmail.com>
Cc: NeKit <nekit1000@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/phy/motorola/phy-mapphone-mdm6600.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/motorola/phy-mapphone-mdm6600.c b/drivers/phy/motorola/phy-mapphone-mdm6600.c
--- a/drivers/phy/motorola/phy-mapphone-mdm6600.c
+++ b/drivers/phy/motorola/phy-mapphone-mdm6600.c
@@ -20,6 +20,7 @@
 
 #define PHY_MDM6600_PHY_DELAY_MS	4000	/* PHY enable 2.2s to 3.5s */
 #define PHY_MDM6600_ENABLED_DELAY_MS	8000	/* 8s more total for MDM6600 */
+#define PHY_MDM6600_WAKE_KICK_MS	600	/* time on after GPIO toggle */
 #define MDM6600_MODEM_IDLE_DELAY_MS	1000	/* modem after USB suspend */
 #define MDM6600_MODEM_WAKE_DELAY_MS	200	/* modem response after idle */
 
@@ -525,8 +526,14 @@ static void phy_mdm6600_modem_wake(struct work_struct *work)
 
 	ddata = container_of(work, struct phy_mdm6600, modem_wake_work.work);
 	phy_mdm6600_wake_modem(ddata);
+
+	/*
+	 * The modem does not always stay awake 1.2 seconds after toggling
+	 * the wake GPIO, and sometimes it idles after about some 600 ms
+	 * making writes time out.
+	 */
 	schedule_delayed_work(&ddata->modem_wake_work,
-			      msecs_to_jiffies(MDM6600_MODEM_IDLE_DELAY_MS));
+			      msecs_to_jiffies(PHY_MDM6600_WAKE_KICK_MS));
 }
 
 static int __maybe_unused phy_mdm6600_runtime_suspend(struct device *dev)
-- 
2.25.0
