Return-Path: <linux-omap+bounces-4869-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87755C3A61D
	for <lists+linux-omap@lfdr.de>; Thu, 06 Nov 2025 11:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BF92C4FCD09
	for <lists+linux-omap@lfdr.de>; Thu,  6 Nov 2025 10:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BF530101B;
	Thu,  6 Nov 2025 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p9qGzcI1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED74C2ED844;
	Thu,  6 Nov 2025 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426209; cv=none; b=JeyRZ9LI/hym+cdteebzzJC/nzKAuu2JvkOzC8J3jeQhjFT49HfXNIyhbwKcaDr5H1zwHwnbclG+zH7WxswCdI7CD/5N30I3Kt3ep8tcRPeZjy3Xluwb3DNEfnzkJZ/wvp/c30WDjU08QdphNucPESv1oGtvMBlIUQFFw894Ow4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426209; c=relaxed/simple;
	bh=bMpmDPexMnRmoRfbcwDB/V8xNbFX+SFweSneoAFWRbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJvbLWhqdmbNQPMoBTR1Tuhl2Xx4OHl/Fo4IHYfxKoAmx3kcj2sl5xtcgwVoR5Z7ECpzNis9E41MiYSILNWsWbPTyb8KQP7iYrUVwcRlA+or0BYHc7LYqCX0iqFBwMwisJoISLj/cl01uESGvqpUiRmpekLSw13r+1DUyVFWtKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p9qGzcI1; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1F4044E41569;
	Thu,  6 Nov 2025 10:50:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E99E76068C;
	Thu,  6 Nov 2025 10:50:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16ACD11850847;
	Thu,  6 Nov 2025 11:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762426204; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BCZNjXI9xyk576AAxj2NJhhOCZr9Ja0z36kOvr2HSIQ=;
	b=p9qGzcI1jdYIGUrbwEudYHO9LS2wAc6nDyHbBu7v8HJdWW4zEZeNvd5eKRwIppQCy0+/pq
	GfjAdqEMo+vpNKKzbw811p89r4/V5LEGOsSKWJMDoqLXDm1i0eFHNGkXpwEdt//VgstHq/
	V2tkgRrJKIeJgJooQeEu8VVmh8Uv50i4AzRLc2wStyUrGDFwD8YTYmdLcRks6DCfBfRUL9
	0FLwu+IRFK+VlCJ6MW0YEvk3W8shXJRpSCftSo26iXXtZJ7c61XOJyeeiGsKMP9wqtWjcT
	F124BY1wveBqpjLgmbOgZV52h3mNDMJ1i2fFeRsRuI03miOhvMBzFxCouid6Cw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 06 Nov 2025 11:49:02 +0100
Subject: [PATCH v2 1/2] mfd: tps65219: Implement LOCK register handling for
 TPS65214
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-fix_tps65219-v2-1-a7d608c4272f@bootlin.com>
References: <20251106-fix_tps65219-v2-0-a7d608c4272f@bootlin.com>
In-Reply-To: <20251106-fix_tps65219-v2-0-a7d608c4272f@bootlin.com>
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
nearly all registers.

Implement custom regmap operations that automatically unlock before writes
and re-lock afterwards for TPS65214, while leaving other chip variants
unaffected.

The implementation follows the regmap-i2c design pattern.

Cc: <stable@vger.kernel.org>
Fixes: 7947219ab1a2d ("mfd: tps65219: Add support for TI TPS65214 PMIC")
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Changes in v2:
- Setup a custom regmap_bus only for the TPS65214 instead of checking
  the chip_id every time reg_write is called.
---
 drivers/mfd/tps65219.c       | 51 +++++++++++++++++++++++++++++++++++++++++++-
 include/linux/mfd/tps65219.h |  2 ++
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 65a952555218d..7e916a9ce2335 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -473,6 +473,50 @@ static const struct tps65219_chip_data chip_info_table[] = {
 	},
 };
 
+static int tps65214_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct i2c_client *i2c = context;
+	struct tps65219 *tps;
+	int ret;
+
+	if (val > 0xff || reg > 0xff)
+		return -EINVAL;
+
+	tps = i2c_get_clientdata(i2c);
+	ret = i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK,
+					TPS65214_LOCK_ACCESS_CMD);
+	if (ret)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(i2c, reg, val);
+	if (ret)
+		return ret;
+
+	return i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK, 0);
+}
+
+static int tps65214_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct i2c_client *i2c = context;
+	int ret;
+
+	if (reg > 0xff)
+		return -EINVAL;
+
+	ret = i2c_smbus_read_byte_data(i2c, reg);
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
+
+	return 0;
+}
+
+static const struct regmap_bus tps65214_regmap_bus = {
+	.reg_write = tps65214_reg_write,
+	.reg_read = tps65214_reg_read,
+};
+
 static int tps65219_probe(struct i2c_client *client)
 {
 	struct tps65219 *tps;
@@ -491,7 +535,12 @@ static int tps65219_probe(struct i2c_client *client)
 	chip_id = (uintptr_t)i2c_get_match_data(client);
 	pmic = &chip_info_table[chip_id];
 
-	tps->regmap = devm_regmap_init_i2c(client, &tps65219_regmap_config);
+	if (chip_id == TPS65214)
+		tps->regmap = devm_regmap_init(&client->dev,
+					       &tps65214_regmap_bus, client,
+					       &tps65219_regmap_config);
+	else
+		tps->regmap = devm_regmap_init_i2c(client, &tps65219_regmap_config);
 	if (IS_ERR(tps->regmap)) {
 		ret = PTR_ERR(tps->regmap);
 		dev_err(tps->dev, "Failed to allocate register map: %d\n", ret);
diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 55234e771ba73..198ee319dd1db 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -149,6 +149,8 @@ enum pmic_id {
 #define TPS65215_ENABLE_LDO2_EN_MASK                    BIT(5)
 #define TPS65214_ENABLE_LDO1_EN_MASK			BIT(5)
 #define TPS65219_ENABLE_LDO4_EN_MASK			BIT(6)
+/* Register Lock */
+#define TPS65214_LOCK_ACCESS_CMD			0x5a
 /* power ON-OFF sequence slot */
 #define TPS65219_BUCKS_LDOS_SEQUENCE_OFF_SLOT_MASK	GENMASK(3, 0)
 #define TPS65219_BUCKS_LDOS_SEQUENCE_ON_SLOT_MASK	GENMASK(7, 4)

-- 
2.43.0


