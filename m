Return-Path: <linux-omap+bounces-2899-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AF09FCE36
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 22:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 402327A15C9
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 21:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1F61BBBD7;
	Thu, 26 Dec 2024 21:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UKQ1/G1Z"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402E41990CD;
	Thu, 26 Dec 2024 21:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735250075; cv=none; b=kKUPgOzGOwoD8sPA+2BvaBOdrOkdkM49tVQwo49cX5uWzh7YJxeZg7grxEkBHPspE2JeuJc2Bnc19WaF/4R/eLSTWUgcVwsqAWTyFl+hDUus3eaw+l22bYTRnYZE6ho2Cu3HWZClFlJgUM1zOAdOfnI+8PxtMruxrjZ4eCkArhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735250075; c=relaxed/simple;
	bh=3OoDpygR5JKahdqF1LRyXo3fP9p6TJLdFXUXlt5HCkE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ioeft881jtnO/pUlC6Wi6NLqdiA3317fybWaT2vMsmHVe9PSjAr7ZQ0B/xW0YuFXmdMoBE+mWShn82JP2pYvOA9XPe6ehTrLo9/gsYK3oQqQ2qUb/sOeZwX7qem5zPAdokRQnVieHzZs2nSgRUdoqkV72xhaizXb2+Xr/br05Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UKQ1/G1Z; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLsGYj1307644
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 15:54:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735250056;
	bh=HsObOSIBSYaYGV/nr2qyzczkccUqwHc+iZZ9FGaBX2s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UKQ1/G1Zm+NXtdaZfrF0fjDLzLMh620n18z4NhWIdKef/onAB3ThXdwAQT3kT2gtR
	 vyTJfyTQnp8FyesEqfAl2ZU9C0G8LUjD/os9HGmJPnF60Ht9DzOG9qCd876h+e0vMi
	 RQi1gsQ4lIrMrnlkl91oxiy4VjftQJlcRIShfTDc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLsGON074141
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 15:54:16 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 15:54:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 15:54:15 -0600
Received: from DMZ007XYY.dhcp.ti.com ([10.250.33.34])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQLsC9N052274;
	Thu, 26 Dec 2024 15:54:15 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 5/7] regulator: tps65215: Add chip_data struct for multi-PMIC support
Date: Thu, 26 Dec 2024 15:54:10 -0600
Message-ID: <20241226215412.395822-6-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226215412.395822-1-s-ramamoorthy@ti.com>
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

'chipid' will identify which PMIC to support, and the corresponding
chip_data struct element to use in probe(). The chip_data struct is helpful
for any new PMICs added to this driver. The goal is to add future PMIC info
to necessary structs and minimize probe() function edits.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 2c49613400e1..13f0e68d8e85 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -314,6 +314,39 @@ static irqreturn_t tps65219_regulator_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+struct chip_data {
+	size_t common_irq_size;
+	size_t common_rdesc_size;
+
+	size_t dev_irq_size
+	size_t rdesc_size;
+	struct tps65219_regulator_irq_type *common_irq_types;
+	struct tps65219_regulator_irq_type *irq_types;
+	const struct regulator_desc *common_rdesc;
+	const struct regulator_desc *rdesc;
+};
+
+static struct chip_data chip_info_table[] = {
+	[TPS65219] = {
+		.rdesc = tps65219_regs,
+		.rdesc_size = ARRAY_SIZE(tps65219_regs),
+		.common_rdesc = common_regs,
+		.common_rdesc_size = ARRAY_SIZE(common_regs),
+		.irq_types = tps65219_regulator_irq_types,
+		.dev_irq_size = ARRAY_SIZE(tps65219_regulator_irq_types),
+		.common_irq_types = common_regulator_irq_types,
+		.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
+	},
+	[TPS65215] = {
+		.rdesc = tps65215_regs,
+		.rdesc_size = ARRAY_SIZE(tps65215_regs),
+		.common_rdesc = common_regs,
+		.common_rdesc_size = ARRAY_SIZE(common_regs),
+		.common_irq_types = common_regulator_irq_types,
+		.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
+	},
+};
+
 static int tps65219_regulator_probe(struct platform_device *pdev)
 {
 	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
-- 
2.34.1


