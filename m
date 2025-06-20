Return-Path: <linux-omap+bounces-3926-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6CEAE1030
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 02:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFC5B17F6B3
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 00:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF88625;
	Fri, 20 Jun 2025 00:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="shSP1Q0K"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E5A17E;
	Fri, 20 Jun 2025 00:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750378196; cv=none; b=GIaTLdAkzG2baSVDHZicdNcxLiZPKqgdk6dFzN8xA1WxihCyt3k4TfitK+TvahgYwtzGpwmNSuVw1n9wKeLo18T5Sg0CuSrnOGlKScuPRwivN06NDdFQUJ1XLBwwsbZcOnPqDHnJeSDRT7L9rdA2qxK5gXK994Cp+sIgjXNxBew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750378196; c=relaxed/simple;
	bh=HSWDTkiENb9QVCvsSKTOLA5Za4cXfjHuD1bhBwgQahI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JvMMxVA0d5Ei+gljI21FgFCWqC9O+8uZqG4DkgF/lNBKffiTSJClBO3F8mTNl5+OisrUIxLNhtldIy/G0pjRIjq5cnCTBEI8GhsFlJirbTh9EkZeKc26lu1NIWlfdeqWkRpWk2F+GVD9YwnufBUXA52bnmUAHb5a4Gcu+ldLOUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=shSP1Q0K; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55K09P8L522555;
	Thu, 19 Jun 2025 19:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750378165;
	bh=FtWQxf5tl4efAN+J0l3NXsSBKduvItD57zeS0fuHU2g=;
	h=From:To:CC:Subject:Date;
	b=shSP1Q0KSKIJmO9mZpJB2lNwoKF4hk04kGQ+bkSbJZ+om/+zhdlFxSpa4AgBq2T0/
	 2f9eSjlX2Uf3PCbtVlSXFoKVoJ4KcvIT0YElKathJ2zRZiBrnMUsWY2lxe3RfrMbQE
	 btnTn+q40Cx4swpUAIYCs8GkGpPyzSdjV6N+S48o=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55K09PUY158192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 19 Jun 2025 19:09:25 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 19
 Jun 2025 19:09:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 19 Jun 2025 19:09:24 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55K09OiF2244230;
	Thu, 19 Jun 2025 19:09:24 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <d-gole@ti.com>, <robertcnelson@gmail.com>, <jkridner@gmail.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <afd@ti.com>
Subject: [PATCH] regulator: tps65219: Fix devm_kmalloc size allocation
Date: Thu, 19 Jun 2025 19:09:24 -0500
Message-ID: <20250620000924.2636542-1-s-ramamoorthy@ti.com>
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

In probe(), devm_kmalloc uses pmic->common_irq_size to allocate an array of
2 bytes, but pmic->common_irq_size is being used like an array of structs.
The param sent should've been pmic->common_irq_size * sizeof(*irq_data).
This led to an issue with the kmalloc'd buffer being corrupted and EVM boot
issues. The common and device-specific structs are now allocated one at a
time within the loop.

Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
Reported-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 28 +++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index d80749cdae1d..d77ca486879f 100644
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
 			return dev_err_probe(tps->dev, error,
 					     "Failed to request %s IRQ %d\n",
 					     irq_type->irq_name, irq);
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
 			return dev_err_probe(tps->dev, error,
 					     "Failed to request %s IRQ %d\n",

base-commit: 5c8013ae2e86ec36b07500ba4cacb14ab4d6f728
prerequisite-patch-id: cd76c901948780de20e932cf620806959e2177b1
prerequisite-patch-id: e847098a38d07e5ff31e8c80d86d9702d132fdad
prerequisite-patch-id: e6a01f111e527c6da442f6756f8daa4e79d0fa3c
-- 
2.43.0


