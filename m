Return-Path: <linux-omap+bounces-3947-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D79EAE1F74
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 17:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 442833BB840
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 15:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28A82EBDF6;
	Fri, 20 Jun 2025 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KEA4cHs8"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662A92EBDF0;
	Fri, 20 Jun 2025 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434373; cv=none; b=MwfBvpP249xZJIHG4kVrUliI5CRnwxBOMYTeoiDYPg7VIV4DGuLM42woF+FrOt3k0EbW5OIb7A46/MvKoYSs4+SKv8DpJlYMmP+UtnJ7QC0uk42tzULOQ0Yv5bz2qOiNdc6VCZxTG6vpItLc/U9jmAX8xiA5vf2T4OpHScJR3CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434373; c=relaxed/simple;
	bh=z3+EbKKsksPaYGeqv0T8bAxEan67c93CBJV5WVPnYFM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vb2qBDltJHa7jjVLtqMQPeFPUEuqZfRvsW85zZSKAZuqqodsPguNO6ow8OdswIgBO1yXgwhIV4ZVw3/Watovasny7Bgb6UAxIdfFGJziAZISB3Zz6QhLHmEr6Zd04DGxwqDcZMZAkSGh9UqS/eUjQFPWdDtlWIxjAPY0FBNiojI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KEA4cHs8; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55KFjgaL698508;
	Fri, 20 Jun 2025 10:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750434342;
	bh=K3hFN5dq7YOejTLa+4FEAejSPJ7VJDkEOvGoTt+ZXJE=;
	h=From:To:CC:Subject:Date;
	b=KEA4cHs8IikWdiuHge2SXGf5/hQt08Bs4BpAB4KwkW6udTevgEHiYwRY9rlcJ+kGH
	 97raLTPQ1Vj5U4ED3eSb0uQo5QR4ervrPfYVaqvsjcq5lWG18SRZXvF5or7FQx7oSi
	 ZS+4BxTxgko7hm5wYVB/ip7E8MATqpy2LEI0NeT8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55KFjfZs806765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 20 Jun 2025 10:45:42 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 20
 Jun 2025 10:45:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 20 Jun 2025 10:45:41 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55KFjfPZ3189272;
	Fri, 20 Jun 2025 10:45:41 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <d-gole@ti.com>, <robertcnelson@gmail.com>, <jkridner@gmail.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <afd@ti.com>
Subject: [PATCH v2] regulator: tps65219: Fix devm_kmalloc size allocation
Date: Fri, 20 Jun 2025 10:45:41 -0500
Message-ID: <20250620154541.2713036-1-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

In probe(), two arrays of structs are allocated with the devm_kmalloc()
function, but the memory size of the allocations were given as the arrays'
length (pmic->common_irq_size for the first call and pmic->dev_irq_size for
the second devm_kmalloc call). The memory size should have been the total
memory needed.

This led to a heap overflow when the struct array was used. The issue was
first discovered with the PocketBeagle2 and BeaglePlay. The common and
device-specific structs are now allocated one at a time within the loop.

Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
Reported-by: Dhruva Gole <d-gole@ti.com>
Closes: https://lore.kernel.org/all/20250619153526.297398-1-d-gole@ti.com/
Tested-by: Robert Nelson <robertcnelson@gmail.com>
Acked-by: Andrew Davis <afd@ti.com>
Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
v2: Update commit message explanation & tags.
---
 drivers/regulator/tps65219-regulator.c | 28 +++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index b16b300d7f45..5e67fdc88f49 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -436,46 +436,46 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 					     pmic->rdesc[i].name);
 	}
 
-	irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size, GFP_KERNEL);
-	if (!irq_data)
-		return -ENOMEM;
-
 	for (i = 0; i < pmic->common_irq_size; ++i) {
 		irq_type = &pmic->common_irq_types[i];
 		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
 		if (irq < 0)
 			return -EINVAL;
 
-		irq_data[i].dev = tps->dev;
-		irq_data[i].type = irq_type;
+		irq_data = devm_kmalloc(tps->dev, sizeof(*irq_data), GFP_KERNEL);
+		if (!irq_data)
+			return -ENOMEM;
+
+		irq_data->dev = tps->dev;
+		irq_data->type = irq_type;
 		error = devm_request_threaded_irq(tps->dev, irq, NULL,
 						  tps65219_regulator_irq_handler,
 						  IRQF_ONESHOT,
 						  irq_type->irq_name,
-						  &irq_data[i]);
+						  irq_data);
 		if (error)
 			return dev_err_probe(tps->dev, PTR_ERR(rdev),
 					     "Failed to request %s IRQ %d: %d\n",
 					     irq_type->irq_name, irq, error);
 	}
 
-	irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);
-	if (!irq_data)
-		return -ENOMEM;
-
 	for (i = 0; i < pmic->dev_irq_size; ++i) {
 		irq_type = &pmic->irq_types[i];
 		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
 		if (irq < 0)
 			return -EINVAL;
 
-		irq_data[i].dev = tps->dev;
-		irq_data[i].type = irq_type;
+		irq_data = devm_kmalloc(tps->dev, sizeof(*irq_data), GFP_KERNEL);
+		if (!irq_data)
+			return -ENOMEM;
+
+		irq_data->dev = tps->dev;
+		irq_data->type = irq_type;
 		error = devm_request_threaded_irq(tps->dev, irq, NULL,
 						  tps65219_regulator_irq_handler,
 						  IRQF_ONESHOT,
 						  irq_type->irq_name,
-						  &irq_data[i]);
+						  irq_data);
 		if (error)
 			return dev_err_probe(tps->dev, PTR_ERR(rdev),
 					     "Failed to request %s IRQ %d: %d\n",

base-commit: 75f5f23f8787c5e184fcb2fbcd02d8e9317dc5e7
-- 
2.43.0


