Return-Path: <linux-omap+bounces-3948-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B18DAE2B33
	for <lists+linux-omap@lfdr.de>; Sat, 21 Jun 2025 20:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C263176B47
	for <lists+linux-omap@lfdr.de>; Sat, 21 Jun 2025 18:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E20A26A0D0;
	Sat, 21 Jun 2025 18:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="BVD8tvKI"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED38146D65;
	Sat, 21 Jun 2025 18:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750530529; cv=none; b=ko693yBI4+sXYpowLKtXWdz+fGp9fUpL753Sj4ojJ2vEkb4AD8uluGge4Yu/apVmwmrPL0HFBrSStEdH6+2Rkrbs9HGeOeq7MLZl8xlhUoxR9P+OE2WcXZ2LxV2Ctg6U+9+vmDk2pt7F/Bkg6SFwscVyDvHO6xvdAchP/Um1AOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750530529; c=relaxed/simple;
	bh=aPhV273jQXDI6VclobpxvyNuZGHOqAP3ytIxvWcNfuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h+9IU7YL1wCAz9Eorcf/vrRUoFjTaIycS/7WJFJXjGOzLwYaIpYkbMLO+jAMrW0wGCc2MS2WFqMhj5rWIPyOceJrXRoVTCrpU/HJ3P8/taz3E7hOCnIxXA1L8EFTr3sjxiYc7jJyQUAlYbNUnd7S+RWrTZOUDz4ythSM32Wy2ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=BVD8tvKI; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id T2x9uOVJEqzgPT2x9uUjmN; Sat, 21 Jun 2025 20:28:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1750530517;
	bh=xRHV9Cb4AbfXmbtF7OmSOXe+Z8POfrjA3kJdmCN5cVw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=BVD8tvKI0U2cY8wygGWMJHAlpsQ4oNHALpiK8eTQDcrhU1CF0j2M04/ugCFu1UDCH
	 7vv8R2XW5X1ZOowjHiXCerU4bXxYJQ7GSqkZs8Mi2nbs6jNwY7EOTMwQpRhdogJhvP
	 4kfj6XB7QameZ+EA/dZCqMbQ7jT+YewdqH29/OPJ8RfEowN9P2eQx7Timo2xlD/tEt
	 rEaiU6gEYyVX7IoNgOdIrLOH02QYwuVaNIFqsICg6W9mMs10dO0GZId3QoHOCDecRX
	 DuyqIIkelej/l+RZRQQ2VuN0H8Kp9JeqypQX4lkLLa/aodMNt0+/WIDvOyivuAzjer
	 jg+hdOxjdDZKg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Jun 2025 20:28:37 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 1/3] mfd: tps65219: Constify struct regmap_irq_sub_irq_map and tps65219_chip_data
Date: Sat, 21 Jun 2025 20:28:20 +0200
Message-ID: <117946696551de41b706ea9b973a7ccaacea5178.1750530460.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct regmap_irq_sub_irq_map' and 'struct tps65219_chip_data' are not
modified in this driver.

Constifying these structures moves some data to a read-only section, so
increases overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  27804	  10016	    256	  38076	   94bc	drivers/mfd/tps65219.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  27893	   9792	    256	  37941	   9435	drivers/mfd/tps65219.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only

Changes in v2:
  - Rebase with latest -next because part of this patch was already
    submitted by someone else, and applied
  - Update the numbers accordingly

v1: https://lore.kernel.org/all/c4abceb95665e4363937a1f41588772f38c47411.1749998382.git.christophe.jaillet@wanadoo.fr/
---
 drivers/mfd/tps65219.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index f6387345457e..83b8ab4707c2 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -260,7 +260,7 @@ static const struct regmap_irq_sub_irq_map tps65215_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit7_offsets),
 };
 
-static struct regmap_irq_sub_irq_map tps65214_sub_irq_offsets[] = {
+static const struct regmap_irq_sub_irq_map tps65214_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit0_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit1_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit2_offsets),
@@ -455,7 +455,7 @@ struct tps65219_chip_data {
 	int n_cells;
 };
 
-static struct tps65219_chip_data chip_info_table[] = {
+static const struct tps65219_chip_data chip_info_table[] = {
 	[TPS65214] = {
 		.irq_chip = &tps65214_irq_chip,
 		.cells = tps65214_cells,
@@ -476,7 +476,7 @@ static struct tps65219_chip_data chip_info_table[] = {
 static int tps65219_probe(struct i2c_client *client)
 {
 	struct tps65219 *tps;
-	struct tps65219_chip_data *pmic;
+	const struct tps65219_chip_data *pmic;
 	bool pwr_button;
 	int ret;
 
-- 
2.49.0


