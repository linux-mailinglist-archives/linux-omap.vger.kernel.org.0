Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1913B387372
	for <lists+linux-omap@lfdr.de>; Tue, 18 May 2021 09:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347250AbhERHqT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 May 2021 03:46:19 -0400
Received: from muru.com ([72.249.23.125]:57058 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347243AbhERHqP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 May 2021 03:46:15 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E811580F5;
        Tue, 18 May 2021 07:44:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH] usb: musb: Add missing PM suspend and resume functions for 2430 glue
Date:   Tue, 18 May 2021 10:44:49 +0300
Message-Id: <20210518074449.17070-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Looks like we are missing suspend and resume functions for pm_ops that
are needed to idle the hardware for system suspend for 2430 glue layer.

We can rely on the driver internal PM runtime state, and call driver
functions to idle the hardware on suspend if needed. There is no need
to add a dependency to PM runtime for system suspend here.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/omap2430.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -33,6 +33,8 @@ struct omap2430_glue {
 	enum musb_vbus_id_status status;
 	struct work_struct	omap_musb_mailbox_work;
 	struct device		*control_otghs;
+	unsigned int		is_runtime_suspended:1;
+	unsigned int		needs_resume:1;
 };
 #define glue_to_musb(g)		platform_get_drvdata(g->musb)
 
@@ -459,6 +461,8 @@ static int omap2430_runtime_suspend(struct device *dev)
 	phy_power_off(musb->phy);
 	phy_exit(musb->phy);
 
+	glue->is_runtime_suspended = 1;
+
 	return 0;
 }
 
@@ -480,12 +484,40 @@ static int omap2430_runtime_resume(struct device *dev)
 	/* Wait for musb to get oriented. Otherwise we can get babble */
 	usleep_range(200000, 250000);
 
+	glue->is_runtime_suspended = 0;
+
 	return 0;
 }
 
+static int omap2430_suspend(struct device *dev)
+{
+	struct omap2430_glue *glue = dev_get_drvdata(dev);
+
+	if (glue->is_runtime_suspended)
+		return 0;
+
+	glue->needs_resume = 1;
+
+	return omap2430_runtime_suspend(dev);
+}
+
+static int omap2430_resume(struct device *dev)
+{
+	struct omap2430_glue *glue = dev_get_drvdata(dev);
+
+	if (!glue->needs_resume)
+		return 0;
+
+	glue->needs_resume = 0;
+
+	return omap2430_runtime_resume(dev);
+}
+
 static const struct dev_pm_ops omap2430_pm_ops = {
 	.runtime_suspend = omap2430_runtime_suspend,
 	.runtime_resume = omap2430_runtime_resume,
+	.suspend = omap2430_suspend,
+	.resume = omap2430_resume,
 };
 
 #define DEV_PM_OPS	(&omap2430_pm_ops)
-- 
2.31.1
