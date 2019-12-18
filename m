Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F77C1253D9
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2019 21:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727615AbfLRUtV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Dec 2019 15:49:21 -0500
Received: from mail.windriver.com ([147.11.1.11]:47846 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727608AbfLRUtU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Dec 2019 15:49:20 -0500
Received: from yow-cube1.wrs.com (yow-cube1.wrs.com [128.224.56.98])
        by mail.windriver.com (8.15.2/8.15.2) with ESMTP id xBIKn0if000214;
        Wed, 18 Dec 2019 12:49:15 -0800 (PST)
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: [PATCH 13/18] mfd: menelaus: Make it explicitly non-modular
Date:   Wed, 18 Dec 2019 15:48:52 -0500
Message-Id: <1576702137-25905-14-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
References: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/mfd/Kconfig:config MENELAUS
drivers/mfd/Kconfig:    bool "TI TWL92330/Menelaus PM chip"

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
Cc: linux-omap@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/mfd/menelaus.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
index b64d3315a5e1..65a268d11aaa 100644
--- a/drivers/mfd/menelaus.c
+++ b/drivers/mfd/menelaus.c
@@ -18,7 +18,7 @@
  * Copyright (C) 2005, 2006 Nokia Corporation
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/sched.h>
@@ -1222,33 +1222,17 @@ static int menelaus_probe(struct i2c_client *client,
 	return err;
 }
 
-static int menelaus_remove(struct i2c_client *client)
-{
-	struct menelaus_chip	*menelaus = i2c_get_clientdata(client);
-
-	free_irq(client->irq, menelaus);
-	flush_work(&menelaus->work);
-	the_menelaus = NULL;
-	return 0;
-}
-
 static const struct i2c_device_id menelaus_id[] = {
 	{ "menelaus", 0 },
 	{ }
 };
-MODULE_DEVICE_TABLE(i2c, menelaus_id);
 
 static struct i2c_driver menelaus_i2c_driver = {
 	.driver = {
-		.name		= DRIVER_NAME,
+		.name			= DRIVER_NAME,
+		.suppress_bind_attrs	= true,
 	},
 	.probe		= menelaus_probe,
-	.remove		= menelaus_remove,
 	.id_table	= menelaus_id,
 };
-
-module_i2c_driver(menelaus_i2c_driver);
-
-MODULE_AUTHOR("Texas Instruments, Inc. (and others)");
-MODULE_DESCRIPTION("I2C interface for Menelaus.");
-MODULE_LICENSE("GPL");
+builtin_i2c_driver(menelaus_i2c_driver);
-- 
2.7.4

