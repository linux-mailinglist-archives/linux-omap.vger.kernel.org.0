Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E987894BE
	for <lists+linux-omap@lfdr.de>; Sat, 26 Aug 2023 10:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjHZIWt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 26 Aug 2023 04:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjHZIWa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 26 Aug 2023 04:22:30 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2A4511BE6;
        Sat, 26 Aug 2023 01:22:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,203,1688396400"; 
   d="scan'208";a="177735137"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2023 17:22:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 70AF440029B4;
        Sat, 26 Aug 2023 17:22:25 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-omap@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] mfd: palmas: Make similar OF and ID table
Date:   Sat, 26 Aug 2023 09:22:17 +0100
Message-Id: <20230826082217.41967-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230826082217.41967-1-biju.das.jz@bp.renesas.com>
References: <20230826082217.41967-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Make similar OF and ID table to extend support for ID match using
i2c_match_data(). Currently it works only for OF match tables as the
driver_data is wrong for ID match.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mfd/palmas.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
index 71df70e1bd33..9f614bbca007 100644
--- a/drivers/mfd/palmas.c
+++ b/drivers/mfd/palmas.c
@@ -489,6 +489,15 @@ static const struct of_device_id of_palmas_match_tbl[] = {
 };
 MODULE_DEVICE_TABLE(of, of_palmas_match_tbl);
 
+static const struct i2c_device_id palmas_i2c_id[] = {
+	{ "palmas", (kernel_ulong_t)&palmas_data },
+	{ "twl6035", (kernel_ulong_t)&palmas_data },
+	{ "twl6037", (kernel_ulong_t)&palmas_data },
+	{ "tps65913", (kernel_ulong_t)&palmas_data },
+	{ /* end */ }
+};
+MODULE_DEVICE_TABLE(i2c, palmas_i2c_id);
+
 static int palmas_i2c_probe(struct i2c_client *i2c)
 {
 	struct palmas *palmas;
@@ -521,7 +530,7 @@ static int palmas_i2c_probe(struct i2c_client *i2c)
 	palmas->dev = &i2c->dev;
 	palmas->irq = i2c->irq;
 
-	driver_data = device_get_match_data(&i2c->dev);
+	driver_data = i2c_get_match_data(i2c);
 	palmas->features = driver_data->features;
 
 	for (i = 0; i < PALMAS_NUM_CLIENTS; i++) {
@@ -698,15 +707,6 @@ static void palmas_i2c_remove(struct i2c_client *i2c)
 	}
 }
 
-static const struct i2c_device_id palmas_i2c_id[] = {
-	{ "palmas", },
-	{ "twl6035", },
-	{ "twl6037", },
-	{ "tps65913", },
-	{ /* end */ }
-};
-MODULE_DEVICE_TABLE(i2c, palmas_i2c_id);
-
 static struct i2c_driver palmas_i2c_driver = {
 	.driver = {
 		   .name = "palmas",
-- 
2.25.1

