Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C27A3D7376
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 12:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236127AbhG0Kls (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 06:41:48 -0400
Received: from muru.com ([72.249.23.125]:55938 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236104AbhG0Klr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 06:41:47 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9548380F0;
        Tue, 27 Jul 2021 10:42:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] usb: musb: Fix suspend and resume issues for PHYs on I2C and SPI
Date:   Tue, 27 Jul 2021 13:41:34 +0300
Message-Id: <20210727104134.52800-1-tony@atomide.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

As the USB PHYs typically are on I2C or SPI bus for the 2430 glue layer,
we need configure the PHYs early for suspend.

The musb glue layer we need to suspend only after musb_suspend() in
suspend_late.

Fixes: 62d472d8ad88 ("usb: musb: Add missing PM suspend and resume functions for 2430 glue")
Reported-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/omap2430.c | 43 ++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -35,6 +35,7 @@ struct omap2430_glue {
 	struct device		*control_otghs;
 	unsigned int		is_runtime_suspended:1;
 	unsigned int		needs_resume:1;
+	unsigned int		phy_suspended:1;
 };
 #define glue_to_musb(g)		platform_get_drvdata(g->musb)
 
@@ -458,8 +459,10 @@ static int omap2430_runtime_suspend(struct device *dev)
 
 	omap2430_low_level_exit(musb);
 
-	phy_power_off(musb->phy);
-	phy_exit(musb->phy);
+	if (!glue->phy_suspended) {
+		phy_power_off(musb->phy);
+		phy_exit(musb->phy);
+	}
 
 	glue->is_runtime_suspended = 1;
 
@@ -474,8 +477,10 @@ static int omap2430_runtime_resume(struct device *dev)
 	if (!musb)
 		return 0;
 
-	phy_init(musb->phy);
-	phy_power_on(musb->phy);
+	if (!glue->phy_suspended) {
+		phy_init(musb->phy);
+		phy_power_on(musb->phy);
+	}
 
 	omap2430_low_level_init(musb);
 	musb_writel(musb->mregs, OTG_INTERFSEL,
@@ -489,7 +494,21 @@ static int omap2430_runtime_resume(struct device *dev)
 	return 0;
 }
 
+/* I2C and SPI PHYs need to be suspended before the glue layer */
 static int omap2430_suspend(struct device *dev)
+{
+	struct omap2430_glue *glue = dev_get_drvdata(dev);
+	struct musb *musb = glue_to_musb(glue);
+
+	phy_power_off(musb->phy);
+	phy_exit(musb->phy);
+	glue->phy_suspended = 1;
+
+	return 0;
+}
+
+/* Glue layer needs to be suspended after musb_suspend() */
+static int omap2430_suspend_late(struct device *dev)
 {
 	struct omap2430_glue *glue = dev_get_drvdata(dev);
 
@@ -501,7 +520,7 @@ static int omap2430_suspend(struct device *dev)
 	return omap2430_runtime_suspend(dev);
 }
 
-static int omap2430_resume(struct device *dev)
+static int omap2430_resume_early(struct device *dev)
 {
 	struct omap2430_glue *glue = dev_get_drvdata(dev);
 
@@ -513,10 +532,24 @@ static int omap2430_resume(struct device *dev)
 	return omap2430_runtime_resume(dev);
 }
 
+static int omap2430_resume(struct device *dev)
+{
+	struct omap2430_glue *glue = dev_get_drvdata(dev);
+	struct musb *musb = glue_to_musb(glue);
+
+	phy_init(musb->phy);
+	phy_power_on(musb->phy);
+	glue->phy_suspended = 0;
+
+	return 0;
+}
+
 static const struct dev_pm_ops omap2430_pm_ops = {
 	.runtime_suspend = omap2430_runtime_suspend,
 	.runtime_resume = omap2430_runtime_resume,
 	.suspend = omap2430_suspend,
+	.suspend_late = omap2430_suspend_late,
+	.resume_early = omap2430_resume_early,
 	.resume = omap2430_resume,
 };
 
-- 
2.32.0
