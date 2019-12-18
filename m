Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB001253D0
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2019 21:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfLRUtc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Dec 2019 15:49:32 -0500
Received: from mail.windriver.com ([147.11.1.11]:47879 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727608AbfLRUta (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Dec 2019 15:49:30 -0500
Received: from yow-cube1.wrs.com (yow-cube1.wrs.com [128.224.56.98])
        by mail.windriver.com (8.15.2/8.15.2) with ESMTP id xBIKn0ij000214;
        Wed, 18 Dec 2019 12:49:18 -0800 (PST)
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Tony Lindgren <tony@atomide.com>,
        Graeme Gregory <gg@slimlogic.co.uk>, linux-omap@vger.kernel.org
Subject: [PATCH 17/18] mfd: palmas: Make it explicitly non-modular
Date:   Wed, 18 Dec 2019 15:48:56 -0500
Message-Id: <1576702137-25905-18-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
References: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/mfd/Kconfig:config MFD_PALMAS
drivers/mfd/Kconfig:    bool "TI Palmas series chips"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_init was not in use by this code, the init ordering
remains unchanged with this commit.

We delete the include of module.h as well as an unused instance of
moduleparam.h include as well.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Graeme Gregory <gg@slimlogic.co.uk>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/mfd/palmas.c | 36 +-----------------------------------
 1 file changed, 1 insertion(+), 35 deletions(-)

diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
index f5b3fa973b13..0e96c5cd02c6 100644
--- a/drivers/mfd/palmas.c
+++ b/drivers/mfd/palmas.c
@@ -7,8 +7,6 @@
  * Author: Graeme Gregory <gg@slimlogic.co.uk>
  */
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/i2c.h>
@@ -500,7 +498,6 @@ static const struct of_device_id of_palmas_match_tbl[] = {
 	},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, of_palmas_match_tbl);
 
 static int palmas_i2c_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
@@ -700,26 +697,6 @@ static int palmas_i2c_probe(struct i2c_client *i2c,
 	return ret;
 }
 
-static int palmas_i2c_remove(struct i2c_client *i2c)
-{
-	struct palmas *palmas = i2c_get_clientdata(i2c);
-	int i;
-
-	regmap_del_irq_chip(palmas->irq, palmas->irq_data);
-
-	for (i = 1; i < PALMAS_NUM_CLIENTS; i++) {
-		if (palmas->i2c_clients[i])
-			i2c_unregister_device(palmas->i2c_clients[i]);
-	}
-
-	if (palmas == palmas_dev) {
-		pm_power_off = NULL;
-		palmas_dev = NULL;
-	}
-
-	return 0;
-}
-
 static const struct i2c_device_id palmas_i2c_id[] = {
 	{ "palmas", },
 	{ "twl6035", },
@@ -727,15 +704,14 @@ static const struct i2c_device_id palmas_i2c_id[] = {
 	{ "tps65913", },
 	{ /* end */ }
 };
-MODULE_DEVICE_TABLE(i2c, palmas_i2c_id);
 
 static struct i2c_driver palmas_i2c_driver = {
 	.driver = {
 		   .name = "palmas",
 		   .of_match_table = of_palmas_match_tbl,
+		   .suppress_bind_attrs = true,
 	},
 	.probe = palmas_i2c_probe,
-	.remove = palmas_i2c_remove,
 	.id_table = palmas_i2c_id,
 };
 
@@ -745,13 +721,3 @@ static int __init palmas_i2c_init(void)
 }
 /* init early so consumer devices can complete system boot */
 subsys_initcall(palmas_i2c_init);
-
-static void __exit palmas_i2c_exit(void)
-{
-	i2c_del_driver(&palmas_i2c_driver);
-}
-module_exit(palmas_i2c_exit);
-
-MODULE_AUTHOR("Graeme Gregory <gg@slimlogic.co.uk>");
-MODULE_DESCRIPTION("Palmas chip family multi-function driver");
-MODULE_LICENSE("GPL");
-- 
2.7.4

