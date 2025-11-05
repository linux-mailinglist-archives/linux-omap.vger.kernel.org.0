Return-Path: <linux-omap+bounces-4850-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5EEC37348
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 18:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E15BC4FB6E2
	for <lists+linux-omap@lfdr.de>; Wed,  5 Nov 2025 17:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156A033C52A;
	Wed,  5 Nov 2025 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Nn7r/Rl7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667E133A011;
	Wed,  5 Nov 2025 17:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762364865; cv=none; b=I4PofSuUj5lcMOCVChQnkFy8pULRaE14qLfG068nu7Nn9ekzoogz09FOTmU5uf4KShGVota0BZ1rSQ+BT2FYzbTONXOV1+Qy118Tiy69Vc4oh6iQJewYU72RJkwxahdm3ksCUat6blR3pC0FMm34U5bMRyQ5VFzIuCCqU0cocaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762364865; c=relaxed/simple;
	bh=0qDTDxiReRJjmiC49I5+yCR07e7nBosx9JrOYE1tLB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y+Vk/qaIH0GsqkeCClWIJ73RVA3/pYRsAlQEcPs2I+V673UAfpPuhSJMoGcHwR2rQtfmJQvpjHllphV6kH80lTTWZKoX9qRslQyCXScRmWaM5OpVK0iPuNDWfSq//x4/SYjkhG4d1cS5i2qWnUHxP8oY+KDygnBVN0w7O7SMv5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Nn7r/Rl7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 67EDF4E4153C;
	Wed,  5 Nov 2025 17:47:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D23960693;
	Wed,  5 Nov 2025 17:47:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3ABD10B50D1C;
	Wed,  5 Nov 2025 18:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762364860; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3vgPbvZXcs/6aBqDB06geK6slHRzEGCPLpjagAE799E=;
	b=Nn7r/Rl7Po9cByUla4la/0EYRsYXzvEWB8TUxa/MFenBqkV2qGMdJY+FtiipvroCdmcYHR
	u/VOKnpgpaZ4iBwGnEGOlm8PJKyKe1g9/gilnaLX0xLw6eoKvrYhxTXYG38oyBE9q0hZaf
	WcMCipN/8NHZwbl6ziuTLIL2Gj5yAPDPhiYe6CmfF5TNWojP4sMSvI0U3Ymp7ojpfDpoAP
	lorLrJLi3b2Q/Qe9hRTGNozr8G/E1biNRwig1bx/BuEe9of2lBdaVTGoPIBczbggXQy7kB
	hhSyxw6dorK8mZo6yfmxTFkHXjbAxOH2escupvpgHssU02ydE5uv6jp4tNUlzw==
From: Kory Maincent <kory.maincent@bootlin.com>
To: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bajjuri Praneeth <praneeth@ti.com>,
	Ramamoorthy Shree <s-ramamoorthy@ti.com>,
	"Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH] mfd: tps65219: Implement LOCK register handling for TPS65214
Date: Wed,  5 Nov 2025 18:47:34 +0100
Message-ID: <20251105174735.1465461-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>

The TPS65214 PMIC variant has a LOCK_REG register that prevents writes to
nearly all registers.

Implement custom regmap operations that automatically unlock before writes
and re-lock afterwards for TPS65214, while leaving other chip variants
unaffected.

The implementation follows the regmap-i2c design pattern.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/mfd/tps65219.c       | 53 +++++++++++++++++++++++++++++++++++-
 include/linux/mfd/tps65219.h |  3 ++
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 65a952555218d..1d8a06afb1048 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -473,6 +473,55 @@ static const struct tps65219_chip_data chip_info_table[] = {
 	},
 };
 
+static int tps65219_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct i2c_client *i2c = context;
+	struct tps65219 *tps;
+	int ret;
+
+	if (val > 0xff || reg > 0xff)
+		return -EINVAL;
+
+	tps = i2c_get_clientdata(i2c);
+	if (tps->chip_id == TPS65214) {
+		ret = i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK,
+						TPS65214_LOCK_ACCESS_CMD);
+		if (ret)
+			return ret;
+	}
+
+	ret = i2c_smbus_write_byte_data(i2c, reg, val);
+	if (ret)
+		return ret;
+
+	if (tps->chip_id == TPS65214)
+		return i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK, 0);
+
+	return 0;
+}
+
+static int tps65219_reg_read(void *context, unsigned int reg, unsigned int *val)
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
+static const struct regmap_bus tps65219_regmap_bus = {
+	.reg_write = tps65219_reg_write,
+	.reg_read = tps65219_reg_read,
+};
+
 static int tps65219_probe(struct i2c_client *client)
 {
 	struct tps65219 *tps;
@@ -490,8 +539,10 @@ static int tps65219_probe(struct i2c_client *client)
 	tps->dev = &client->dev;
 	chip_id = (uintptr_t)i2c_get_match_data(client);
 	pmic = &chip_info_table[chip_id];
+	tps->chip_id = chip_id;
 
-	tps->regmap = devm_regmap_init_i2c(client, &tps65219_regmap_config);
+	tps->regmap = devm_regmap_init(&client->dev, &tps65219_regmap_bus, client,
+				       &tps65219_regmap_config);
 	if (IS_ERR(tps->regmap)) {
 		ret = PTR_ERR(tps->regmap);
 		dev_err(tps->dev, "Failed to allocate register map: %d\n", ret);
diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 55234e771ba73..53e53cbc5c76f 100644
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
@@ -444,6 +446,7 @@ struct tps65219 {
 	struct regmap *regmap;
 
 	struct regmap_irq_chip_data *irq_data;
+	enum pmic_id chip_id;
 };
 
 #endif /* MFD_TPS65219_H */
-- 
2.43.0


