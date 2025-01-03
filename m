Return-Path: <linux-omap+bounces-2964-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C34A010A6
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 00:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0A4D164BF6
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 23:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022F81C5F24;
	Fri,  3 Jan 2025 23:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KYgDX70p"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C251C5498;
	Fri,  3 Jan 2025 23:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945505; cv=none; b=GMm5XOvXlCbOOkMWJ46xhfaXiyhJNiUfUCMkl+q9lDiU3rkFab4BQW/7xMvXmm0jHihTjNi1B9zaEBv787iJ9bsi53RNjquxOB2It/o7HxKhyIY26RxlnS+W51Px4Z/B4DzhPvsvsAfqb2L3wYPB9p7c5Vo5GgLz0L8VZ64uTXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945505; c=relaxed/simple;
	bh=fKglM1lGIST2Yy/b4W2+O6RKmVxMCm8B4hiU5R/uRNo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqmbUy8yUzz/0JC0MTq0KynI8tFhxjbTK/h56A79KTqR6I5Nej2r9oiAbwTokoobOwgYlpGridrZ+HbgeT+UpdTcjvodWNL//nUopezHXjVXwzcXGsEDVxYUjnam8D3v9YgsYXA87/HPIPTV/KTzAS+qt4un0Cb867awKpq9Q84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KYgDX70p; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 503N4kTc080772;
	Fri, 3 Jan 2025 17:04:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735945486;
	bh=L5XoQlnFaWOJMh2tSTz5T9Yv4gdxEW//9FpSLsJo0T4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KYgDX70pNU2d2+WNvBe7FXze9lffU7z3sGhEPuw5YNyRTDyBlZXiS1K5t65ukk7LQ
	 28tTXMeYdl6eqxlkBU24ea/FL6quu/Y35uPCe1gN+sIzEOHYXNXh4x4DXVyhjSKfxm
	 ZSa8Ucs+N5L+LbJxiSBIVcRPOdVHxf5xOBr0r1+E=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503N4kxY067457;
	Fri, 3 Jan 2025 17:04:46 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 17:04:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 17:04:46 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503N4k0O121736;
	Fri, 3 Jan 2025 17:04:46 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 6/7] regulator: tps65215: Define probe() helper functions
Date: Fri, 3 Jan 2025 17:04:45 -0600
Message-ID: <20250103230446.197597-7-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103230446.197597-1-s-ramamoorthy@ti.com>
References: <20250103230446.197597-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Factor register_regulators() and request_irqs() out into smaller functions.
These 2 helper functions are used in the next restructure probe() patch to
go through the common (overlapping) regulators and irqs first, then the
device-specific structs identifed in the chip_data struct.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 59 ++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 6dc0829cf29a..31d76706bfc0 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -347,6 +347,65 @@ static struct tps65219_chip_data chip_info_table[] = {
 	},
 };
 
+static int tps65219_register_regulators(const struct regulator_desc *regulators,
+					struct tps65219 *tps,
+					struct device *dev,
+					struct regulator_config config,
+					unsigned int arr_size)
+{
+	int i;
+	struct regulator_dev *rdev;
+
+	config.driver_data = tps;
+	config.dev = tps->dev;
+	config.regmap = tps->regmap;
+
+	for (i = 0; i < arr_size; i++) {
+		rdev = devm_regulator_register(dev, &regulators[i],
+						&config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(tps->dev, PTR_ERR(rdev),
+				"Failed to register %s regulator\n",
+				regulators[i].name);
+	}
+
+	return 0;
+}
+
+static int tps65219_request_irqs(struct tps65219_regulator_irq_type *irq_types,
+				 struct tps65219 *tps, struct platform_device *pdev,
+				 struct tps65219_regulator_irq_data *irq_data,
+				 unsigned int arr_size)
+{
+	int i;
+	int irq;
+	int error;
+	struct tps65219_regulator_irq_type *irq_type;
+
+	for (i = 0; i < arr_size; ++i) {
+		irq_type = &irq_types[i];
+
+		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
+		if (irq < 0)
+			return -EINVAL;
+
+		irq_data[i].dev = tps->dev;
+		irq_data[i].type = irq_type;
+
+		error = devm_request_threaded_irq(tps->dev, irq, NULL,
+						  tps65219_regulator_irq_handler,
+						  IRQF_ONESHOT,
+						  irq_type->irq_name,
+						  &irq_data[i]);
+		if (error)
+			return dev_err_probe(tps->dev, error,
+				"Failed to request %s IRQ %d\n",
+				irq_type->irq_name, irq);
+	}
+
+	return 0;
+}
+
 static int tps65219_regulator_probe(struct platform_device *pdev)
 {
 	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
-- 
2.34.1


