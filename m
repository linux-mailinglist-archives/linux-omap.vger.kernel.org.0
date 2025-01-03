Return-Path: <linux-omap+bounces-2958-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E76B9A0106C
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 23:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FC8D163847
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 22:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A764C1B6CE4;
	Fri,  3 Jan 2025 22:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AUJ6nBx4"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A061C07CD;
	Fri,  3 Jan 2025 22:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945072; cv=none; b=oLcSS8NZ/hkWDdR1zcK6j1c13/xTeNnjLIaZEfOhTMQ9DbI/RNLDK+25vH+e8RR9ZeJonABUsZ/NO2mQ7eknlv5KvoagXwpHpdOEPiDnIQQJM1sm5CEf/GEBzoLfbaBNkLILI0svk1/3ypA8liEjdTLTpXXPbDU5NclekmjIu2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945072; c=relaxed/simple;
	bh=Rr5rikCyhA3bsKsr3IL+7zgElWTngiFasAthiESCXdg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H9sskV70Fok9lvIVDWfYBRDgQxFKKPkSJyG0l5B+X7mO2Rn36lBqrHaeL5FCuvRuvbrGWmwv1mq4r/QY94YJ8YM2FeN49hRpfknmpq5A6gjBh6Fd/Vv4IG6it+1mvAbtPxfnPTyl4EJuAIkbw2VSoZOWSJ0SAZ956TQA0lLUIiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AUJ6nBx4; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503MvW9M2150941
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 3 Jan 2025 16:57:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735945052;
	bh=hkz6LkvQYxERJtKlp2HXsEUfrpZ8vIzd+V+R5BFrdow=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AUJ6nBx4TFhHr99HsiAYiAj3Y3uPJ+RurHBPI8OwB7ldkAaJCjvR+JARWZ5PfXPnr
	 AXYcHrcfmrRPq74mnNwwGPtxRD8Odx+SFeGcIkLNpbRItI2bUqdNpsMht8nvyBSqWQ
	 5MOW8rftEAt0TbEU4u6vMqMZtz3/VZZKSNBq19ZE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503MvW11063180;
	Fri, 3 Jan 2025 16:57:32 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 16:57:32 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 16:57:32 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503MvWaQ101967;
	Fri, 3 Jan 2025 16:57:32 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 2/2] mfd: tps65215: Remove regmap_read check
Date: Fri, 3 Jan 2025 16:57:32 -0600
Message-ID: <20250103225732.196636-3-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103225732.196636-1-s-ramamoorthy@ti.com>
References: <20250103225732.196636-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The chipid macro/variable and regmap_read function call is not needed
because the TPS65219_REG_TI_DEV_ID register value is not a consistent value
across TPS65219 PMIC config versions. Reading from the DEV_ID register
without a consistent value to compare it to isn't useful. There isn't a
way to verify the match data ID is the same ID read from the DEV_ID device
register. 0xF0 isn't a DEV_ID value consistent across TPS65219 NVM
configurations.

For TPS65215, there is a consistent value in bits 5-0 of the DEV_ID
register. However, there are other error checks in place within probe()
that apply to both PMICs rather than keeping this isolated check for one
PMIC.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/mfd/tps65219.c       | 6 ------
 include/linux/mfd/tps65219.h | 2 --
 2 files changed, 8 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 816b271990a2..d3267bf7cd77 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -382,12 +382,6 @@ static int tps65219_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ret = regmap_read(tps->regmap, TPS65219_REG_TI_DEV_ID, &tps->chip_id);
-	if (ret) {
-		dev_err(tps->dev, "Failed to read device ID: %d\n", ret);
-		return ret;
-	}
-
 	ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO,
 				   pmic->cells, pmic->n_cells,
 				   NULL, 0, regmap_irq_get_domain(tps->irq_data));
diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 9892b6e4c85c..535115bfa4a4 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -15,8 +15,6 @@
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 
-/* TPS chip id list */
-#define TPS65219					0xF0
 /* Chip id list*/
 enum pmic_id {
 	TPS65215,
-- 
2.34.1


