Return-Path: <linux-omap+bounces-4909-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD132C5334F
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 16:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D10305060AC
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 15:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B83B340295;
	Wed, 12 Nov 2025 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1R5jmhn0"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533C62C029D;
	Wed, 12 Nov 2025 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960478; cv=none; b=MMlO7+IkZ5IKOxu/BDGY8DT9l00pCNE429Fq2Ho99asCcYxgCa0AbkXbBk4H9CTcwq9EQwNSXUYTFRI0mKjnuSsyZcCBPjPDq/P9Ls/ZrKJcgrN59MAx5vlW8zmITWTlpRqc3bISscL9AfC1+X3BIdqLXXol+OWBHHIiY9UVmNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960478; c=relaxed/simple;
	bh=Lr8R7aXFYbmoGF//QddzR38UzaejFGtwDhCgL5UqziU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UMC2s1nQrXn94wFzZ++MfgHAXJXhcfVl/6N8eH6R9OO9ns9975jjL670IzbquOtD7pUxtMb+DPSAeQtVtwSxxXoRdy/FmwkmMnVuliK4ki6q72HJy2ketR0RNKk8ClBs5hrS8ii/scJ2+tMiuAPLDu7FnNeeKQYzZBLhUM7gkk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1R5jmhn0; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8E8ED1A1A33;
	Wed, 12 Nov 2025 15:14:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63D8C6070B;
	Wed, 12 Nov 2025 15:14:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C672102F1973;
	Wed, 12 Nov 2025 16:14:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762960473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Uh+2n9sRKzemxl0qpoJ4RyEt1okO5dZPU6Yl7d9Jp5U=;
	b=1R5jmhn0gHwnUDzfOtxc0D2n0upCBDDNX0Q+w9gDssLbUxXMDx2pIlwiLekmIwyDaZ1yeP
	QFuSZteDdt0nptr2PhXCtcS4s6nfgLlQTAhaaU7sUbwWTZ+HdOoxwSZYzgEdn+Bs92a2+N
	SkUIiGMFbZSh4gHsqVc0uvzMSkGoNJ01If1b8Yh8ouHqEt/DyhsmnauDhkttwxJVxnX9a+
	lhx4uTDo/uJx352SJ55RFDtndZ8jxdWMuzT/BpPtIrNQmYoNhIDvqWMEbEIfUqwR5mS33g
	QjsW0zXiyHIwLRYocTYoOPIrTlRytbuyJrMWGFvIomavqHnxyYZFB4bQD1kr/g==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 12 Nov 2025 16:14:20 +0100
Subject: [PATCH v4 1/2] mfd: tps65219: Implement LOCK register handling for
 TPS65214
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-fix_tps65219-v4-1-696a0f55d5d8@bootlin.com>
References: <20251112-fix_tps65219-v4-0-696a0f55d5d8@bootlin.com>
In-Reply-To: <20251112-fix_tps65219-v4-0-696a0f55d5d8@bootlin.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The TPS65214 PMIC variant has a LOCK_REG register that prevents writes to
nearly all registers when locked. Unlock the registers at probe time and
leave them unlocked permanently.

This approach is justified because:
- Register locking is very uncommon in typical system operation
- No code path is expected to lock the registers during runtime
- Adding a custom regmap write function would add overhead to every
  register write, including voltage changes triggered by CPU OPP
  transitions from the cpufreq governor which could happen quite
  frequently

Cc: stable@vger.kernel.org
Fixes: 7947219ab1a2d ("mfd: tps65219: Add support for TI TPS65214 PMIC")
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
Changes in v4:
- Move the registers unlock in the probe instead of a custom regmap write
  operation.

Changes in v3:
- Removed unused variable.

Changes in v2:
- Setup a custom regmap_bus only for the TPS65214 instead of checking
  the chip_id every time reg_write is called.
---
 drivers/mfd/tps65219.c       | 7 +++++++
 include/linux/mfd/tps65219.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 65a952555218d..f1115c5585545 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -498,6 +498,13 @@ static int tps65219_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	if (chip_id == TPS65214) {
+		ret = i2c_smbus_write_byte_data(client, TPS65214_REG_LOCK,
+						TPS65214_LOCK_ACCESS_CMD);
+		if (ret)
+			return ret;
+	}
+
 	ret = devm_regmap_add_irq_chip(tps->dev, tps->regmap, client->irq,
 				       IRQF_ONESHOT, 0, pmic->irq_chip,
 				       &tps->irq_data);
diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 55234e771ba73..3abf937191d0c 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -149,6 +149,8 @@ enum pmic_id {
 #define TPS65215_ENABLE_LDO2_EN_MASK                    BIT(5)
 #define TPS65214_ENABLE_LDO1_EN_MASK			BIT(5)
 #define TPS65219_ENABLE_LDO4_EN_MASK			BIT(6)
+/* Register Unlock */
+#define TPS65214_LOCK_ACCESS_CMD			0x5a
 /* power ON-OFF sequence slot */
 #define TPS65219_BUCKS_LDOS_SEQUENCE_OFF_SLOT_MASK	GENMASK(3, 0)
 #define TPS65219_BUCKS_LDOS_SEQUENCE_ON_SLOT_MASK	GENMASK(7, 4)

-- 
2.43.0


