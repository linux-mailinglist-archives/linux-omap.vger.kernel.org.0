Return-Path: <linux-omap+bounces-20-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA917F89A1
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 10:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50CEB1C20C14
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 09:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC33C2DF;
	Sat, 25 Nov 2023 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE5810D7;
	Sat, 25 Nov 2023 01:29:53 -0800 (PST)
Received: from p200301077700a9001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:a900:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1r6oyu-006fom-LM; Sat, 25 Nov 2023 10:29:44 +0100
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1r6oyu-0004JG-1I;
	Sat, 25 Nov 2023 10:29:44 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: lee@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	bcousson@baylibre.com,
	tony@atomide.com,
	andreas@kemnade.info,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 2/6] twl-core: add power off implementation for twl603x
Date: Sat, 25 Nov 2023 10:29:34 +0100
Message-Id: <20231125092938.16535-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231125092938.16535-1-andreas@kemnade.info>
References: <20231125092938.16535-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the system-power-controller property is there, enable power off.
Implementation is based on a Linux v3.0 vendor kernel.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/mfd/twl-core.c  | 34 ++++++++++++++++++++++++++++++++++
 include/linux/mfd/twl.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index 6e384a79e3418..3eef285eac535 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -687,6 +687,31 @@ static void twl_remove(struct i2c_client *client)
 	twl_priv->ready = false;
 }
 
+void twl6030_power_off(void)
+{
+#define APP_DEVOFF      (1<<0)
+#define CON_DEVOFF      (1<<1)
+#define MOD_DEVOFF      (1<<2)
+
+	int err;
+	u8 val;
+
+	err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &val,
+			      TWL6030_PHOENIX_DEV_ON);
+	if (err) {
+		pr_err("I2C error %d reading PHOENIX_DEV_ON\n", err);
+		return;
+	}
+
+	val |= APP_DEVOFF | CON_DEVOFF | MOD_DEVOFF;
+
+	err = twl_i2c_write_u8(TWL_MODULE_PM_MASTER, val,
+			       TWL6030_PHOENIX_DEV_ON);
+	if (err)
+		pr_err("TWL6030 Unable to power off\n");
+}
+
+
 static struct of_dev_auxdata twl_auxdata_lookup[] = {
 	OF_DEV_AUXDATA("ti,twl4030-gpio", 0, "twl4030-gpio", NULL),
 	{ /* sentinel */ },
@@ -852,6 +877,15 @@ twl_probe(struct i2c_client *client)
 			goto free;
 	}
 
+	if (twl_class_is_6030()) {
+		if (of_device_is_system_power_controller(client->dev.of_node)) {
+			if (!pm_power_off)
+				pm_power_off = twl6030_power_off;
+			else
+				dev_warn(&client->dev, "Poweroff callback already assigned\n");
+		}
+	}
+
 	status = of_platform_populate(node, NULL, twl_auxdata_lookup,
 				      &client->dev);
 
diff --git a/include/linux/mfd/twl.h b/include/linux/mfd/twl.h
index c062d91a67d92..85dc406173dba 100644
--- a/include/linux/mfd/twl.h
+++ b/include/linux/mfd/twl.h
@@ -461,6 +461,7 @@ static inline int twl6030_mmc_card_detect(struct device *dev, int slot)
 
 #define TWL4030_PM_MASTER_GLOBAL_TST		0xb6
 
+#define TWL6030_PHOENIX_DEV_ON                  0x06
 /*----------------------------------------------------------------------*/
 
 /* Power bus message definitions */
-- 
2.39.2


