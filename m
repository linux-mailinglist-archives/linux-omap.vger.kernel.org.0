Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEB47B31ED
	for <lists+linux-omap@lfdr.de>; Sun, 15 Sep 2019 22:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfIOUP7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Sep 2019 16:15:59 -0400
Received: from muru.com ([72.249.23.125]:33024 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725270AbfIOUP7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 15 Sep 2019 16:15:59 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5585380BB;
        Sun, 15 Sep 2019 20:16:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] phy: mapphone-mdm6600: Fix timeouts by adding wake-up handling
Date:   Sun, 15 Sep 2019 13:15:52 -0700
Message-Id: <20190915201552.10867-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We have an interrupt handler for the wake-up GPIO pin, but we're missing
the code to wake-up the system. This can cause timeouts receiving data
for the UART that shares the wake-up GPIO pin with the USB PHY.

All we need to do is just wake the system and kick the autosuspend
timeout to fix the issue.

Fixes: 5d1ebbda0318 ("phy: mapphone-mdm6600: Add USB PHY driver for MDM6600 on Droid 4")
Cc: Marcel Partap <mpartap@gmx.net>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Michael Scott <hashcode0f@gmail.com>
Cc: NeKit <nekit1000@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/phy/motorola/phy-mapphone-mdm6600.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/motorola/phy-mapphone-mdm6600.c b/drivers/phy/motorola/phy-mapphone-mdm6600.c
--- a/drivers/phy/motorola/phy-mapphone-mdm6600.c
+++ b/drivers/phy/motorola/phy-mapphone-mdm6600.c
@@ -243,10 +243,24 @@ static irqreturn_t phy_mdm6600_wakeirq_thread(int irq, void *data)
 {
 	struct phy_mdm6600 *ddata = data;
 	struct gpio_desc *mode_gpio1;
+	int error, wakeup;
 
 	mode_gpio1 = ddata->mode_gpios->desc[PHY_MDM6600_MODE1];
-	dev_dbg(ddata->dev, "OOB wake on mode_gpio1: %i\n",
-		gpiod_get_value(mode_gpio1));
+	wakeup = gpiod_get_value(mode_gpio1);
+	if (!wakeup)
+		return IRQ_NONE;
+
+	dev_dbg(ddata->dev, "OOB wake on mode_gpio1: %i\n", wakeup);
+	error = pm_runtime_get_sync(ddata->dev);
+	if (error < 0) {
+		pm_runtime_put_noidle(ddata->dev);
+
+		return IRQ_NONE;
+	}
+
+	/* Just wake-up and kick the autosuspend timer */
+	pm_runtime_mark_last_busy(ddata->dev);
+	pm_runtime_put_autosuspend(ddata->dev);
 
 	return IRQ_HANDLED;
 }
-- 
2.23.0
