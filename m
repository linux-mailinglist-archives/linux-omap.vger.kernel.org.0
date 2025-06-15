Return-Path: <linux-omap+bounces-3883-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4623AADA222
	for <lists+linux-omap@lfdr.de>; Sun, 15 Jun 2025 16:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF2DE188CFF0
	for <lists+linux-omap@lfdr.de>; Sun, 15 Jun 2025 14:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C4D19DF7A;
	Sun, 15 Jun 2025 14:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="AHaZoSLs"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-75.smtpout.orange.fr [80.12.242.75])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784DF1917E3
	for <linux-omap@vger.kernel.org>; Sun, 15 Jun 2025 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749998627; cv=none; b=sZ9py7HA8SQHHCQ63hHJI0BH/jO7j1zeddqRGiJ/RuS9jx6PXbCe6rDK4cJwNTTQxOq3xE5Dki4cxTR+zFw2BNPIZvc4BgslD0Bekk6vBgZa3GFrrO1KDR67Kf9pAyvOEiWZuogJKTquJR/DnltzPsC/GarZlHYCTj2XxZ7/paM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749998627; c=relaxed/simple;
	bh=XdId1Ksl8i8oMowatgaQaHL/wH3H03NmiVks0tax8fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KKtgD4E8kOoxW10iVzF53UhDpUmqbIXYqTBd9Z/Xz+icWU0hznWq6uSoDpKhe+7SaPlsyEi4HtGYNlZEj1mKCuvr7/5X/ftPYKacT7IpcFxYauavu8KBxDKMJL1cnr0PRK0aE6ubPUULNISHlpLlV53kAI7Hz1goa13FMHqpMgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=AHaZoSLs; arc=none smtp.client-ip=80.12.242.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id QoZ6uGCgjmPDOQoZFuOjAS; Sun, 15 Jun 2025 16:42:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1749998562;
	bh=esOjXohqvupssHw1wcuvrTlVeI2AopS0pXECcAzGJJg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=AHaZoSLs8p2VA9+5ZY3KCPMHTrmGDf7amDnCnAIW7wky/6kaYDPQ6baCQEm8sK+cL
	 dV9yAu9QPXcrrg0qUNqM+W28qP0348Jr7tJveRm7dtLiPSe/k8IWQmwK3Hz5mRR5AH
	 g37EP2+n/F72AymSE5QKhyIGIYKdHo2nu5BFhOMB+JWwWioNVUcuhAet2AjsnLX5Tr
	 qQh+FSdGc+IhwjT9K01ORyIOoGVjJe71kFeBNSdFJ2pUyKQL4TSGr0Oqw3q0sEJLTh
	 yJdQBfeZMgX3voXUGaVa9l/X6vNyvhTOOe+XNhKFyQ9WYdfRIZAg9MVjf1HOtNQkRY
	 ZKokaDblLK7NQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 15 Jun 2025 16:42:42 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	Lee Jones <lee@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 3/3] mfd: tps65219: Remove another unused field from 'struct tps65219'
Date: Sun, 15 Jun 2025 16:42:19 +0200
Message-ID: <410d08b7043f8c724d0dee29c06b7029fb933a47.1749998382.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <c4abceb95665e4363937a1f41588772f38c47411.1749998382.git.christophe.jaillet@wanadoo.fr>
References: <c4abceb95665e4363937a1f41588772f38c47411.1749998382.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'chip_id' field from 'struct tps65219' is unused.
Remove it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/mfd/tps65219.c       | 5 +++--
 include/linux/mfd/tps65219.h | 2 --
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 62669041e0d9..cc6121fd0ec3 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -477,6 +477,7 @@ static int tps65219_probe(struct i2c_client *client)
 {
 	struct tps65219 *tps;
 	const struct tps65219_chip_data *pmic;
+	unsigned int chip_id;
 	bool pwr_button;
 	int ret;
 
@@ -487,8 +488,8 @@ static int tps65219_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, tps);
 
 	tps->dev = &client->dev;
-	tps->chip_id = (uintptr_t)i2c_get_match_data(client);
-	pmic = &chip_info_table[tps->chip_id];
+	chip_id = (uintptr_t)i2c_get_match_data(client);
+	pmic = &chip_info_table[chip_id];
 
 	tps->regmap = devm_regmap_init_i2c(client, &tps65219_regmap_config);
 	if (IS_ERR(tps->regmap)) {
diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 690002932377..55234e771ba7 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -437,14 +437,12 @@ enum tps65219_irqs {
  *
  * @dev: MFD device
  * @regmap: Regmap for accessing the device registers
- * @chip_id: Chip ID
  * @irq_data: Regmap irq data used for the irq chip
  */
 struct tps65219 {
 	struct device *dev;
 	struct regmap *regmap;
 
-	unsigned int chip_id;
 	struct regmap_irq_chip_data *irq_data;
 };
 
-- 
2.49.0


