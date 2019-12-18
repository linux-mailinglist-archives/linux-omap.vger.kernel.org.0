Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77ABF1253C7
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2019 21:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbfLRUtR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Dec 2019 15:49:17 -0500
Received: from mail.windriver.com ([147.11.1.11]:47822 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbfLRUtR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Dec 2019 15:49:17 -0500
Received: from yow-cube1.wrs.com (yow-cube1.wrs.com [128.224.56.98])
        by mail.windriver.com (8.15.2/8.15.2) with ESMTP id xBIKn0ib000214;
        Wed, 18 Dec 2019 12:49:12 -0800 (PST)
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH 09/18] mfd: twl4030-power: Make it explicitly non-modular
Date:   Wed, 18 Dec 2019 15:48:48 -0500
Message-Id: <1576702137-25905-10-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
References: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/mfd/Kconfig:config TWL4030_POWER
drivers/mfd/Kconfig:    bool "TI TWL4030 power resources"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.  The remove function here was clearly a
no-op anyway, so no unbind functionality could possibly be impacted.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/mfd/twl4030-power.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/mfd/twl4030-power.c b/drivers/mfd/twl4030-power.c
index 6b36932263ba..5655218b2552 100644
--- a/drivers/mfd/twl4030-power.c
+++ b/drivers/mfd/twl4030-power.c
@@ -23,7 +23,7 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pm.h>
 #include <linux/mfd/twl.h>
 #include <linux/platform_device.h>
@@ -876,7 +876,6 @@ static const struct of_device_id twl4030_power_of_match[] = {
 	},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, twl4030_power_of_match);
 #endif	/* CONFIG_OF */
 
 static int twl4030_power_probe(struct platform_device *pdev)
@@ -953,24 +952,12 @@ static int twl4030_power_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int twl4030_power_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver twl4030_power_driver = {
 	.driver = {
 		.name	= "twl4030_power",
 		.of_match_table = of_match_ptr(twl4030_power_of_match),
+		.suppress_bind_attrs = true,
 	},
 	.probe		= twl4030_power_probe,
-	.remove		= twl4030_power_remove,
 };
-
-module_platform_driver(twl4030_power_driver);
-
-MODULE_AUTHOR("Nokia Corporation");
-MODULE_AUTHOR("Texas Instruments, Inc.");
-MODULE_DESCRIPTION("Power management for TWL4030");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:twl4030_power");
+builtin_platform_driver(twl4030_power_driver);
-- 
2.7.4

