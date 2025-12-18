Return-Path: <linux-omap+bounces-5221-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E07CCCF1E
	for <lists+linux-omap@lfdr.de>; Thu, 18 Dec 2025 18:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF4C33013979
	for <lists+linux-omap@lfdr.de>; Thu, 18 Dec 2025 17:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E242F1FE7;
	Thu, 18 Dec 2025 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jiKTos7T"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEE02DAFC7;
	Thu, 18 Dec 2025 15:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070403; cv=none; b=k8ZFaTPNj5diaRPpJwTXodnEXTfpY8fSQhDKxhK+Wh96UxxREpk4bbY4lLjdPAnwQwl4XO4dH9YInZKMyAVDO6yeLeb7lCwSIbUsOBKRVj0RXEnD5jKt6p7nNI6zGuqaPfbIMByLIuyOGXkyjUbAJIgtskWBwOviUK0ZUix4cfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070403; c=relaxed/simple;
	bh=sgTSisfv8DUnh29tJVOHt3YNMJ+GeRYBpJQEIu9rFyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=od6Yzl7Mbj/JHa+RKYGXBLy8b49HS0UlYYLXCCEUK8SL9PzlnczynWOiTxVtEjq2NEG1v4txzBb2gUfUlyyoDLvz+Vux7JXVHYbb18s9p7oUdFjtEQcc49qYMg+jx/PVFwfoJvDWCC/q3NKRiQhcKCvTFqCpCcYwddveIORPdTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jiKTos7T; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E1A001A22D2;
	Thu, 18 Dec 2025 15:06:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5DE9606B6;
	Thu, 18 Dec 2025 15:06:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5AB9102F0B2B;
	Thu, 18 Dec 2025 16:06:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766070398; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uoYxhLVSSc04WNfQajT43rAD+zIsLXpdX+ZhTFAHmW0=;
	b=jiKTos7TAqio2zKYxOBqDVrnkBHPD+VIWi4DNKFk2MshBCs0aH2LROkBi9rCsnjmjyF0P7
	WeZGtD6vw+KXGhLeFPhvuKH8t9plEM7en5UnU3XiimUvAYK0K0mcyxuzyraRe3KAJkAHSP
	uKU8nTSBehwE7gmDUogOmxzxITH5C1iwfrDf9moAU424e4JM4/oo/EoqfsaZHW9hSe3xjo
	wFN19Ha38e9K9K4F2DXprxDXDjkoN113/XTTYKhOwC258hUPxOc6SoHVpCHzJQl1wF5VUR
	9ZYVXP/ZZu+TKFHDCYllrtkZakL5q4bdF3FhSj+4i76NyF44Gljh39VMS8skQQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 18 Dec 2025 16:06:28 +0100
Subject: [PATCH v5 1/2] mfd: tps65219: Implement LOCK register handling for
 TPS65214
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-fix_tps65219-v5-1-8bb511417f3a@bootlin.com>
References: <20251218-fix_tps65219-v5-0-8bb511417f3a@bootlin.com>
In-Reply-To: <20251218-fix_tps65219-v5-0-8bb511417f3a@bootlin.com>
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
Reviewed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
Changes in v5:
- Add error message.

Changes in v4:
- Move the registers unlock in the probe instead of a custom regmap write
  operation.

Changes in v3:
- Removed unused variable.

Changes in v2:
- Setup a custom regmap_bus only for the TPS65214 instead of checking
  the chip_id every time reg_write is called.
---
 drivers/mfd/tps65219.c       | 9 +++++++++
 include/linux/mfd/tps65219.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 65a952555218d..7275dcdb7c44f 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -498,6 +498,15 @@ static int tps65219_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	if (chip_id == TPS65214) {
+		ret = i2c_smbus_write_byte_data(client, TPS65214_REG_LOCK,
+						TPS65214_LOCK_ACCESS_CMD);
+		if (ret) {
+			dev_err(tps->dev, "Failed to unlock registers %d\n", ret);
+			return ret;
+		}
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


