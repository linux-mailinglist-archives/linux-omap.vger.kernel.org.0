Return-Path: <linux-omap+bounces-3949-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C1AE2B38
	for <lists+linux-omap@lfdr.de>; Sat, 21 Jun 2025 20:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 410B218992BC
	for <lists+linux-omap@lfdr.de>; Sat, 21 Jun 2025 18:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A12426FD88;
	Sat, 21 Jun 2025 18:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="SpQ+NVM8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763826A1DE
	for <linux-omap@vger.kernel.org>; Sat, 21 Jun 2025 18:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750530737; cv=none; b=ZozevzBJhqZLB1YF8C0NZumNrwGThCGE0Rt27peiQ/PIfX+RDLurrxW4NfajUXRo7M4tOAWirknmNC3eBd1zSKJEWhklRstMpgBMJkZhg3/jd5xGXgGgYiSE7JIEwAlDngAJOL0iVxoDV5UAPSeJM4C3xkJaI5WjpRSvnQuibAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750530737; c=relaxed/simple;
	bh=WVnYIFa63uiGOCx2VEQbSpu9pTWrHGmvrDMQ6LUov3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLBPtu3Un1zbF11hmvsC+bf/4PnpJzyIWh2fJA9g4aG2QZ19FMhQ73hfYu1J/PE8bJRULdsac+V7ZqxW23nkc/lj+d0FCSzuAcuSpd3s7tRslDYKHfQLTbwGDfES1G7rkW8NSXai1XiJQsj+nHkS7Pulncw4PSbBxSSpnL7mVS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=SpQ+NVM8; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id T2zVuhhN4FSdZT2zVuu0sv; Sat, 21 Jun 2025 20:31:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1750530662;
	bh=UXRtBefO6UIaMrLklwTYumn3o6AqhMnr9ggp+fc1rNA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SpQ+NVM8EQ5zPnZkDO5XdYE4ENwvLFXcyAaVbmZlyPwgJflClkvx0SEKBSR0TUP/r
	 kwkAw/s6WXmk+L50sJk3VpMfChAkhxFT//gWtB++riUKoPJWLCcN20QdhpanNwUzkt
	 tGj8zhJlGNkxjfm7KkL1OV2VBRneqgm4SL5LFehdDtYtDSbjtuhbpcaNrQ1sHL8sHJ
	 Vl1OpsCE1nTme63Mt2mRTJ884/iZo+oHf+t95qC+lYNukLqgXIX/+IynhX6MAOadfj
	 dOCRc86o7exUJSLfTN/cV/BaHSWhKeJW305OI2/3CVXV/tQQDE+j4sDyeJyketxOuw
	 D7d7wy22cWWsA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Jun 2025 20:31:02 +0200
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
Subject: [PATCH v2 2/3] mfd: tps65219: Remove an unused field from 'struct tps65219'
Date: Sat, 21 Jun 2025 20:30:51 +0200
Message-ID: <8a264c3a92b8e62c1dadd374f2685030e042eb08.1750530460.git.christophe.jaillet@wanadoo.fr>
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

Since commit 3df4c6367520 ("mfd: tps65219: Add support for soft shutdown
via sys-off API"), the 'nb' field from 'struct tps65219' is unused.
Remove it.

Also remove the now useless #include <linux/notifier.h> for the same
reason.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Changes in v2:
  - No change

v1: https://lore.kernel.org/all/1f5e2e582ad97e9863ed5885266ae271f2be32bc.1749998382.git.christophe.jaillet@wanadoo.fr/
---
 include/linux/mfd/tps65219.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 3e8d29189267..690002932377 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -10,7 +10,6 @@
 #define MFD_TPS65219_H
 
 #include <linux/bitops.h>
-#include <linux/notifier.h>
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 
@@ -440,7 +439,6 @@ enum tps65219_irqs {
  * @regmap: Regmap for accessing the device registers
  * @chip_id: Chip ID
  * @irq_data: Regmap irq data used for the irq chip
- * @nb: notifier block for the restart handler
  */
 struct tps65219 {
 	struct device *dev;
@@ -448,7 +446,6 @@ struct tps65219 {
 
 	unsigned int chip_id;
 	struct regmap_irq_chip_data *irq_data;
-	struct notifier_block nb;
 };
 
 #endif /* MFD_TPS65219_H */
-- 
2.49.0


