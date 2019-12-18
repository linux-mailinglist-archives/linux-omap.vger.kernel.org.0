Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637A61253DB
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2019 21:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727276AbfLRUt4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Dec 2019 15:49:56 -0500
Received: from mail.windriver.com ([147.11.1.11]:47848 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727395AbfLRUtV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Dec 2019 15:49:21 -0500
Received: from yow-cube1.wrs.com (yow-cube1.wrs.com [128.224.56.98])
        by mail.windriver.com (8.15.2/8.15.2) with ESMTP id xBIKn0ic000214;
        Wed, 18 Dec 2019 12:49:13 -0800 (PST)
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Tony Lindgren <tony@atomide.com>,
        Misael Lopez Cruz <misael.lopez@ti.com>,
        Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH 10/18] mfd: twl6040: Make it explicitly non-modular
Date:   Wed, 18 Dec 2019 15:48:49 -0500
Message-Id: <1576702137-25905-11-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
References: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Kconfig/Makefile controlling compilation of this code is:

drivers/mfd/Kconfig:config TWL6040_CORE
drivers/mfd/Kconfig:    bool "TI TWL6040 audio codec"

drivers/mfd/Makefile: obj-$(CONFIG_TWL6040_CORE)      += twl6040.o

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_i2c_driver() uses the same init level priority as
builtin_i2c_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Misael Lopez Cruz <misael.lopez@ti.com>
Cc: Jorge Eduardo Candelaria <jorge.candelaria@ti.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/mfd/twl6040.c | 29 +++--------------------------
 1 file changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
index b9c6d94b4002..531eefb2fab5 100644
--- a/drivers/mfd/twl6040.c
+++ b/drivers/mfd/twl6040.c
@@ -9,7 +9,7 @@
  * Copyright:	(C) 2011 Texas Instruments, Inc.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/kernel.h>
@@ -808,41 +808,18 @@ static int twl6040_probe(struct i2c_client *client,
 	return ret;
 }
 
-static int twl6040_remove(struct i2c_client *client)
-{
-	struct twl6040 *twl6040 = i2c_get_clientdata(client);
-
-	if (twl6040->power_count)
-		twl6040_power(twl6040, 0);
-
-	regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
-
-	mfd_remove_devices(&client->dev);
-
-	regulator_bulk_disable(TWL6040_NUM_SUPPLIES, twl6040->supplies);
-
-	return 0;
-}
-
 static const struct i2c_device_id twl6040_i2c_id[] = {
 	{ "twl6040", 0, },
 	{ "twl6041", 0, },
 	{ },
 };
-MODULE_DEVICE_TABLE(i2c, twl6040_i2c_id);
 
 static struct i2c_driver twl6040_driver = {
 	.driver = {
 		.name = "twl6040",
+		.suppress_bind_attrs = true,
 	},
 	.probe		= twl6040_probe,
-	.remove		= twl6040_remove,
 	.id_table	= twl6040_i2c_id,
 };
-
-module_i2c_driver(twl6040_driver);
-
-MODULE_DESCRIPTION("TWL6040 MFD");
-MODULE_AUTHOR("Misael Lopez Cruz <misael.lopez@ti.com>");
-MODULE_AUTHOR("Jorge Eduardo Candelaria <jorge.candelaria@ti.com>");
-MODULE_LICENSE("GPL");
+builtin_i2c_driver(twl6040_driver);
-- 
2.7.4

