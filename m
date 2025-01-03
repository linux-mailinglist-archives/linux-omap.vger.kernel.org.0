Return-Path: <linux-omap+bounces-2965-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D092A010AB
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 00:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 216961885683
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 23:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7CA1C68A6;
	Fri,  3 Jan 2025 23:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bwVUZbAz"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3C61C54AC;
	Fri,  3 Jan 2025 23:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945506; cv=none; b=tE/CHDMN5bd555eJ23DelKiA5L9kFdgiiFCkpWuAqnsFLwPdD9rpiSlmWvTLPXU1iCD5kGlsdzZ78uZ0rGxgUU2iobv86n8eWc812HX1F0Cf4C1bK+onj9nyOCTLb8z3sHFFe7pAPxKslU/5U71qYbj2+Wip+lSW9NKHhOHYOO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945506; c=relaxed/simple;
	bh=Zgk7IPts4iGuuf5KHw5Y+d5WwWbp0+8u3GSB7G/lAEY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p6+KskCyDuE5gMjDJjTMf75cAK+YA9HBVEEpHGsDaIoJTQSmiRo4tOIpZxT6eJPEQ6DCIpit+2UbnF6Leoek64z2ocSujNTlIcHCegWR95DGkGUpV9r5lNwW+TOkCsdJihxSPtxaba0zfbXF1ZxNipwphReDRKXSsovsi5nmbdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bwVUZbAz; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 503N4kdf080770;
	Fri, 3 Jan 2025 17:04:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735945486;
	bh=Sj97jdZ7RsVu7istTCBMbKxi3MsE+cncIJwbPofgYhs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bwVUZbAzbWCDzZntpf39I+LazFJQrzIIAWjEEEjqDeoWSEMkciT51iZ4kN3n9+KkU
	 aqZumdxJhfmQLqz7wDmL2F9peJyS3R2SKJY4G1TB8/tPy9PlGDdSo2jP55OuAmimRC
	 pgdZG4JBQ2rNi1pQ4R2u509enb8VtaPTGT5s8gBI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503N4kv2067454;
	Fri, 3 Jan 2025 17:04:46 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 17:04:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 17:04:46 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503N4k0M121736;
	Fri, 3 Jan 2025 17:04:46 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 4/7] regulator: tps65215: Add chip_data struct for multi-PMIC support
Date: Fri, 3 Jan 2025 17:04:43 -0600
Message-ID: <20250103230446.197597-5-s-ramamoorthy@ti.com>
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

'chipid' will identify which PMIC to support, and the corresponding
chip_data struct element to use in probe(). The chip_data struct is helpful
for any new PMICs added to this driver. The goal is to add future PMIC info
to necessary structs and minimize probe() function edits.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index eddb22d0758a..30928f1f216f 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+
 //
 // Regulator driver for TPS65215/TPS65219 PMIC
 //
@@ -314,6 +315,38 @@ static irqreturn_t tps65219_regulator_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+struct tps65219_chip_data {
+	size_t common_irq_size;
+	size_t rdesc_size;
+	size_t common_rdesc_size;
+	size_t dev_irq_size;
+	const struct regulator_desc *rdesc;
+	const struct regulator_desc *common_rdesc;
+	struct tps65219_regulator_irq_type *irq_types;
+	struct tps65219_regulator_irq_type *common_irq_types;
+};
+
+static struct tps65219_chip_data chip_info_table[] = {
+	[TPS65215] = {
+		.rdesc = tps65215_regs,
+		.rdesc_size = ARRAY_SIZE(tps65215_regs),
+		.common_rdesc = common_regs,
+		.common_rdesc_size = ARRAY_SIZE(common_regs),
+		.common_irq_types = common_regulator_irq_types,
+		.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
+	},
+	[TPS65219] = {
+		.rdesc = tps65219_regs,
+		.rdesc_size = ARRAY_SIZE(tps65219_regs),
+		.common_rdesc = common_regs,
+		.common_rdesc_size = ARRAY_SIZE(common_regs),
+		.common_irq_types = common_regulator_irq_types,
+		.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
+		.irq_types = tps65219_regulator_irq_types,
+		.dev_irq_size = ARRAY_SIZE(tps65219_regulator_irq_types),
+	},
+};
+
 static int tps65219_regulator_probe(struct platform_device *pdev)
 {
 	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
-- 
2.34.1


