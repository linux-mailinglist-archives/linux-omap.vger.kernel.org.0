Return-Path: <linux-omap+bounces-2840-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A97C9F5803
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 21:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B23B16F068
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 20:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFFD1FA140;
	Tue, 17 Dec 2024 20:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GYwGZdw6"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81DB1DA10C;
	Tue, 17 Dec 2024 20:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734468356; cv=none; b=HF1IijLtYiZvFhje80/IYAKTFaeW1FpZoHXh1HhmxZaL/ZLuL8Z45/2nhhoWhoR5dq+L/uIOQTMXZcKIMRihQYorLMeu0GTOH+oBc7lnPRlpsd3f4hwwgQD7Ay+Ypv46uvSsuh3Sftk16aqwZJBYJmde41wvgv/ZUNZWG1Rwgwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734468356; c=relaxed/simple;
	bh=39goWSCO0jHhG0vKVa7QSDcQw1Ek8t2HscqiklNgNZk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RuyYD/4UpaznVxoxrgZ18VxDzeul69GEgPTfm4swDRfvXxbyEWgQQk4RIG2C+M+AAHi340wUj6e3sX9TcPqEXm7uSfDW9TsFX/NpQwaQ3V7AQ9E8X0/8Job6WgTMKErq1qlbliTlTFmz4BkEnN9flviv0k+vtYysF2tqb9Msx0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GYwGZdw6; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKjRLi4018757
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 17 Dec 2024 14:45:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734468327;
	bh=PzBGjI5W+yeQ2/F7RLmrj0KQUdxDjAno3EGhp3N+V9M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GYwGZdw6KFIUDA/KJDmRR5hVFvV7W5J8TC/4VkcGxgB4feCYTK35mc3CMjXn66dQW
	 UQhKSwMSe2yV5J+fWaUw5FWY2MD/c/9jB/hu2w5/jEJ359ifh5jhxgEm0OxdABzHMH
	 /nHoWVexAcfurgnz5AEhH5uK9fYBfHMjQFVNnqhA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKjRal011339;
	Tue, 17 Dec 2024 14:45:27 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 14:45:26 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 14:45:26 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.8])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKjQj4023682;
	Tue, 17 Dec 2024 14:45:26 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 4/4] regulator: tps65219: Remove debugging helper function
Date: Tue, 17 Dec 2024 14:45:26 -0600
Message-ID: <20241217204526.1010989-5-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217204526.1010989-1-s-ramamoorthy@ti.com>
References: <20241217204526.1010989-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This helper function is primarily used by developers for debugging & is
not a standard feature included in other PMIC drivers. The purpose of
debugging function is to check if rdev is determine if the regulator has
been registered prior to requesting a threaded irq. This case is already
handled with the ISERR(rdev) check because the error code is returned.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 28 --------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index f57a046f9dea..aa65077f9d41 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -287,21 +287,6 @@ static irqreturn_t tps65219_regulator_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int tps65219_get_rdev_by_name(const char *regulator_name,
-				     struct regulator_dev *rdevtbl[7],
-				     struct regulator_dev **dev)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
-		if (strcmp(regulator_name, regulators[i].name) == 0) {
-			*dev = rdevtbl[i];
-			return 0;
-		}
-	}
-	return -EINVAL;
-}
-
 static int tps65219_regulator_probe(struct platform_device *pdev)
 {
 	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
@@ -312,23 +297,18 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 	int irq;
 	struct tps65219_regulator_irq_data *irq_data;
 	struct tps65219_regulator_irq_type *irq_type;
-	struct regulator_dev *rdevtbl[7];
 
 	config.dev = tps->dev;
 	config.driver_data = tps;
 	config.regmap = tps->regmap;
 
 	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
-		dev_dbg(tps->dev, "%s regul i= %d START", __func__, i);
 		rdev = devm_regulator_register(&pdev->dev, &regulators[i],
 					       &config);
 		if (IS_ERR(rdev))
 			return dev_err_probe(tps->dev, PTR_ERR(rdev),
 					"Failed to register %s regulator\n",
 					regulators[i].name);
-
-		rdevtbl[i] = rdev;
-		dev_dbg(tps->dev, "%s regul i= %d COMPLETED", __func__, i);
 	}
 
 	irq_data = devm_kmalloc(tps->dev,
@@ -348,14 +328,6 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 		irq_data[i].dev = tps->dev;
 		irq_data[i].type = irq_type;
 
-		tps65219_get_rdev_by_name(irq_type->regulator_name, rdevtbl, &rdev);
-		if (IS_ERR(rdev)) {
-			dev_err(tps->dev, "Failed to get rdev for %s\n",
-				irq_type->regulator_name);
-			return -EINVAL;
-		}
-		irq_data[i].rdev = rdev;
-
 		error = devm_request_threaded_irq(tps->dev, irq, NULL,
 						  tps65219_regulator_irq_handler,
 						  IRQF_ONESHOT,
-- 
2.34.1


