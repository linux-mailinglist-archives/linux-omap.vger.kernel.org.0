Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539CF3D7393
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 12:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236220AbhG0KpV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 06:45:21 -0400
Received: from muru.com ([72.249.23.125]:55958 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236403AbhG0KpV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 06:45:21 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EAE9080F0;
        Tue, 27 Jul 2021 10:45:37 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] phy: phy-twl4030-usb: Disable PHY for suspend
Date:   Tue, 27 Jul 2021 13:45:12 +0300
Message-Id: <20210727104512.52968-1-tony@atomide.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Since commit 88d26136a256 ("PM: Prevent runtime suspend during system
resume"), PM runtime will not let devices idle during system suspend.

This is because of the pm_runtime_get_noresume() call done in
device_prepare() that is not released until at device_complete() after
resume.

We must now disable the USB PHY in suspend if no USB cable is connected.

Cc: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/phy/ti/phy-twl4030-usb.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/phy/ti/phy-twl4030-usb.c b/drivers/phy/ti/phy-twl4030-usb.c
--- a/drivers/phy/ti/phy-twl4030-usb.c
+++ b/drivers/phy/ti/phy-twl4030-usb.c
@@ -162,6 +162,8 @@ struct twl4030_usb {
 	atomic_t		connected;
 	bool			vbus_supplied;
 	bool			musb_mailbox_pending;
+	unsigned long		runtime_suspended:1;
+	unsigned long		needs_resume:1;
 
 	struct delayed_work	id_workaround_work;
 };
@@ -384,6 +386,9 @@ static void __twl4030_phy_power(struct twl4030_usb *twl, int on)
 	WARN_ON(twl4030_usb_write_verify(twl, PHY_PWR_CTRL, pwr) < 0);
 }
 
+static int twl4030_usb_runtime_suspend(struct device *dev);
+static int twl4030_usb_runtime_resume(struct device *dev);
+
 static int __maybe_unused twl4030_usb_suspend(struct device *dev)
 {
 	struct twl4030_usb *twl = dev_get_drvdata(dev);
@@ -395,6 +400,10 @@ static int __maybe_unused twl4030_usb_suspend(struct device *dev)
 	 */
 	dev_dbg(twl->dev, "%s\n", __func__);
 	disable_irq(twl->irq);
+	if (!twl->runtime_suspended && !atomic_read(&twl->connected)) {
+		twl4030_usb_runtime_suspend(dev);
+		twl->needs_resume = 1;
+	}
 
 	return 0;
 }
@@ -405,9 +414,13 @@ static int __maybe_unused twl4030_usb_resume(struct device *dev)
 
 	dev_dbg(twl->dev, "%s\n", __func__);
 	enable_irq(twl->irq);
+	if (twl->needs_resume)
+		twl4030_usb_runtime_resume(dev);
 	/* check whether cable status changed */
 	twl4030_usb_irq(0, twl);
 
+	twl->runtime_suspended = 0;
+
 	return 0;
 }
 
@@ -422,6 +435,8 @@ static int __maybe_unused twl4030_usb_runtime_suspend(struct device *dev)
 	regulator_disable(twl->usb1v8);
 	regulator_disable(twl->usb3v1);
 
+	twl->runtime_suspended = 1;
+
 	return 0;
 }
 
-- 
2.32.0
