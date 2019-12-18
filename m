Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 716AD1253CE
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2019 21:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfLRUt3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Dec 2019 15:49:29 -0500
Received: from mail.windriver.com ([147.11.1.11]:47864 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727664AbfLRUt2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Dec 2019 15:49:28 -0500
Received: from yow-cube1.wrs.com (yow-cube1.wrs.com [128.224.56.98])
        by mail.windriver.com (8.15.2/8.15.2) with ESMTP id xBIKn0ih000214;
        Wed, 18 Dec 2019 12:49:16 -0800 (PST)
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Tony Lindgren <tony@atomide.com>,
        Keshava Munegowda <keshava_mgowda@ti.com>,
        Roger Quadros <rogerq@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 15/18] mfd: omap-usb-tll: Make it explicitly non-modular
Date:   Wed, 18 Dec 2019 15:48:54 -0500
Message-Id: <1576702137-25905-16-git-send-email-paul.gortmaker@windriver.com>
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
 drivers/mfd/omap-usb-tll.c | 47 ++++------------------------------------------
 1 file changed, 4 insertions(+), 43 deletions(-)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index 265f5e350e1c..77c8d98a6731 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -7,7 +7,7 @@
  * Author: Roger Quadros <rogerq@ti.com>
  */
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -269,46 +269,18 @@ static int usbtll_omap_probe(struct platform_device *pdev)
 	return 0;
 }
 
-/**
- * usbtll_omap_remove - shutdown processing for UHH & TLL HCDs
- * @pdev: USB Host Controller being removed
- *
- * Reverses the effect of usbtll_omap_probe().
- */
-static int usbtll_omap_remove(struct platform_device *pdev)
-{
-	struct usbtll_omap *tll = platform_get_drvdata(pdev);
-	int i;
-
-	spin_lock(&tll_lock);
-	tll_dev = NULL;
-	spin_unlock(&tll_lock);
-
-	for (i = 0; i < tll->nch; i++) {
-		if (!IS_ERR(tll->ch_clk[i])) {
-			clk_unprepare(tll->ch_clk[i]);
-			clk_put(tll->ch_clk[i]);
-		}
-	}
-
-	pm_runtime_disable(&pdev->dev);
-	return 0;
-}
-
 static const struct of_device_id usbtll_omap_dt_ids[] = {
 	{ .compatible = "ti,usbhs-tll" },
 	{ }
 };
 
-MODULE_DEVICE_TABLE(of, usbtll_omap_dt_ids);
-
 static struct platform_driver usbtll_omap_driver = {
 	.driver = {
-		.name		= (char *)usbtll_driver_name,
-		.of_match_table = usbtll_omap_dt_ids,
+		.name			= (char *)usbtll_driver_name,
+		.of_match_table		= usbtll_omap_dt_ids,
+		.suppress_bind_attrs	= true,
 	},
 	.probe		= usbtll_omap_probe,
-	.remove		= usbtll_omap_remove,
 };
 
 int omap_tll_init(struct usbhs_omap_platform_data *pdata)
@@ -446,11 +418,6 @@ int omap_tll_disable(struct usbhs_omap_platform_data *pdata)
 }
 EXPORT_SYMBOL_GPL(omap_tll_disable);
 
-MODULE_AUTHOR("Keshava Munegowda <keshava_mgowda@ti.com>");
-MODULE_AUTHOR("Roger Quadros <rogerq@ti.com>");
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("usb tll driver for TI OMAP EHCI and OHCI controllers");
-
 static int __init omap_usbtll_drvinit(void)
 {
 	return platform_driver_register(&usbtll_omap_driver);
@@ -462,9 +429,3 @@ static int __init omap_usbtll_drvinit(void)
  * the usbhs core driver probe function is called.
  */
 fs_initcall(omap_usbtll_drvinit);
-
-static void __exit omap_usbtll_drvexit(void)
-{
-	platform_driver_unregister(&usbtll_omap_driver);
-}
-module_exit(omap_usbtll_drvexit);
-- 
2.7.4

