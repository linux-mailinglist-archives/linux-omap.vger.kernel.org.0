Return-Path: <linux-omap+bounces-3950-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F05AE2B39
	for <lists+linux-omap@lfdr.de>; Sat, 21 Jun 2025 20:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68F5E176CC4
	for <lists+linux-omap@lfdr.de>; Sat, 21 Jun 2025 18:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2ADC26FD95;
	Sat, 21 Jun 2025 18:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="haRN2mIw"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1521026FD90
	for <linux-omap@vger.kernel.org>; Sat, 21 Jun 2025 18:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750530741; cv=none; b=gq/3910jhUe16RtkdjMqJwurmr/iLXoo/ri5TYVIfUYp06zYYZicQ5ZXPqkt7sGxE70DSPyjHPXlLtH/JyO/gpDATnZnbKRsaVqRdbqJqaPZby2r/V+AZkJfyLB4CGviARb1cAJjYMpU9NGDImq9T/JKwycFx0mQvH0SYrW25Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750530741; c=relaxed/simple;
	bh=pxIFnLi+2QvkAVzG6VSki7aaHJzeVLNwWchNj2l0SF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KY2XIhAMSb2SqlMF6o6JTVSYgEcvnMf01lHPyp+ejCzzfImPdeqMfilWd+EdiI/W3yyT7YKWnWKKM/RxnpwlfeiUS99nB3+1XDb2/ESvI47XdPxl5fLqOzMGuJGiZP6HYSIPJixaVQMq6Dpi5UU3OghS3fv63oUFZnwQUjVnR5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=haRN2mIw; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id T2zVuhhN4FSdZT2zduu131; Sat, 21 Jun 2025 20:31:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1750530670;
	bh=MXg8XFR4o+m5lPwNZOqnSBM2DImrhVE91XYk6e748Qs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=haRN2mIwsaKDr5QpSNQL8wCLV4Px10VPlls+1bs24vPzpirbWTHDGdL2IQaDLa9pF
	 XlJX1OFaaR4ZYTc7wbbQ3OOsSsGgmz8bbcRgt7gBgn2CGCtCIOWMDhKnk5qcywUfm2
	 x9vLrjS/PSNtYSIPThKm7AmZw5q7NAUbl1uhtDbTmumQyZZZNcHS+1Hbc4sCHgzAs/
	 5wavAoU5WqRdosnY1/BbV0+2vtqiVKGJj7hHFK3hahCL4EB1FxdznJQ1sgIR7nq6ji
	 Uc8CHvi+rXPKVYWm62ibD8yg+QrXsdHvk7d2MLLoXcY48Q6G3L/kX47B9QY63cSsND
	 0hh2dkec6m4Xw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Jun 2025 20:31:10 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 3/3] mfd: tps65219: Remove another unused field from 'struct tps65219'
Date: Sat, 21 Jun 2025 20:30:52 +0200
Message-ID: <f20443e6e13b0b101648a41010a19ee56589fa0b.1750530460.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <117946696551de41b706ea9b973a7ccaacea5178.1750530460.git.christophe.jaillet@wanadoo.fr>
References: <117946696551de41b706ea9b973a7ccaacea5178.1750530460.git.christophe.jaillet@wanadoo.fr>
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

Changes in v2:
  - No change

v1: https://lore.kernel.org/all/410d08b7043f8c724d0dee29c06b7029fb933a47.1749998382.git.christophe.jaillet@wanadoo.fr/
---
 drivers/mfd/tps65219.c       | 5 +++--
 include/linux/mfd/tps65219.h | 2 --
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 83b8ab4707c2..65a952555218 100644
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


