Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 194BE1253CB
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2019 21:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbfLRUtY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Dec 2019 15:49:24 -0500
Received: from mail.windriver.com ([147.11.1.11]:47858 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727608AbfLRUtX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Dec 2019 15:49:23 -0500
Received: from yow-cube1.wrs.com (yow-cube1.wrs.com [128.224.56.98])
        by mail.windriver.com (8.15.2/8.15.2) with ESMTP id xBIKn0ii000214;
        Wed, 18 Dec 2019 12:49:17 -0800 (PST)
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Tony Lindgren <tony@atomide.com>,
        Keshava Munegowda <keshava_mgowda@ti.com>,
        Roger Quadros <rogerq@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 16/18] mfd: omap-usb-host: Make it explicitly non-modular
Date:   Wed, 18 Dec 2019 15:48:55 -0500
Message-Id: <1576702137-25905-17-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
References: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/mfd/Kconfig:config MFD_OMAP_USB_HOST
drivers/mfd/Kconfig:    bool "TI OMAP USBHS core and TLL driver"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_init was not in use by this code, the init ordering
remains unchanged with this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Keshava Munegowda <keshava_mgowda@ti.com>
Cc: Roger Quadros <rogerq@ti.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/mfd/omap-usb-host.c | 47 +++++----------------------------------------
 1 file changed, 5 insertions(+), 42 deletions(-)

diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
index 4798d9f3f9d5..118756d7be19 100644
--- a/drivers/mfd/omap-usb-host.c
+++ b/drivers/mfd/omap-usb-host.c
@@ -7,7 +7,7 @@
  * Author: Roger Quadros <rogerq@ti.com>
  */
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
@@ -803,28 +803,6 @@ static int usbhs_omap_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int usbhs_omap_remove_child(struct device *dev, void *data)
-{
-	dev_info(dev, "unregistering\n");
-	platform_device_unregister(to_platform_device(dev));
-	return 0;
-}
-
-/**
- * usbhs_omap_remove - shutdown processing for UHH & TLL HCDs
- * @pdev: USB Host Controller being removed
- *
- * Reverses the effect of usbhs_omap_probe().
- */
-static int usbhs_omap_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
-
-	/* remove children */
-	device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);
-	return 0;
-}
-
 static const struct dev_pm_ops usbhsomap_dev_pm_ops = {
 	.runtime_suspend	= usbhs_runtime_suspend,
 	.runtime_resume		= usbhs_runtime_resume,
@@ -835,25 +813,16 @@ static const struct of_device_id usbhs_omap_dt_ids[] = {
 	{ }
 };
 
-MODULE_DEVICE_TABLE(of, usbhs_omap_dt_ids);
-
-
 static struct platform_driver usbhs_omap_driver = {
 	.driver = {
-		.name		= (char *)usbhs_driver_name,
-		.pm		= &usbhsomap_dev_pm_ops,
-		.of_match_table = usbhs_omap_dt_ids,
+		.name			= (char *)usbhs_driver_name,
+		.pm			= &usbhsomap_dev_pm_ops,
+		.of_match_table		= usbhs_omap_dt_ids,
+		.suppress_bind_attr	= true,
 	},
 	.probe		= usbhs_omap_probe,
-	.remove		= usbhs_omap_remove,
 };
 
-MODULE_AUTHOR("Keshava Munegowda <keshava_mgowda@ti.com>");
-MODULE_AUTHOR("Roger Quadros <rogerq@ti.com>");
-MODULE_ALIAS("platform:" USBHS_DRIVER_NAME);
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("usb host common core driver for omap EHCI and OHCI");
-
 static int omap_usbhs_drvinit(void)
 {
 	return platform_driver_register(&usbhs_omap_driver);
@@ -867,9 +836,3 @@ static int omap_usbhs_drvinit(void)
  * usb tll driver
  */
 fs_initcall_sync(omap_usbhs_drvinit);
-
-static void omap_usbhs_drvexit(void)
-{
-	platform_driver_unregister(&usbhs_omap_driver);
-}
-module_exit(omap_usbhs_drvexit);
-- 
2.7.4

