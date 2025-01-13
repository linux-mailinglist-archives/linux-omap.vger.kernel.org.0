Return-Path: <linux-omap+bounces-3107-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B70A0C529
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 00:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEDF016579D
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 23:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F571F9EDC;
	Mon, 13 Jan 2025 23:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LJ084epJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7631CDFA9;
	Mon, 13 Jan 2025 23:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736809696; cv=none; b=agb5lBsxbEK8Thf44KH6FfPFm/tD3kWCmmks++n1GiCqJgqs4/1fOMOTYTEwlH6lKh8jz+B4mpB/HIQXk177XyDOCo+ZYMvCJPKz4cPt/y2tUTRCEMCd3lUQnX+NKEVH+oIPGXDGUgzPa/JUinVl2ZbVbcZJincQtGu53q3Xagw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736809696; c=relaxed/simple;
	bh=nD2BthuuynVqYFVUgxABBK9iFqARzyFAhilIZThtI5U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SGo2OM0f1FqPov/vh7GUCqKgfqjSo7KfIlyFxMv1N3vIGKsToQrrklCNCMmKvtik7wyzYWHK3rHIiWdMx5EiWFJdwDWRRd19dT2lLUytjWg1ft5GGj7w9f4KlG1Kchh5pxlOBXWm+U05gQ+1DUr6ZZkHEzXGF9oRsI/Qsr1mUQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LJ084epJ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50DN7pP43587276
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 17:07:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736809671;
	bh=/1bXoT/N5yFqSTd3Ik3Uih3QqoI6uGmCAF2dZaUpWmE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LJ084epJTuu9RPvwT6yFvVDcydkAlINXMxPy9i+ErlAjh9MQLS0O32y2BPw4IZApw
	 DjpvG8gLzl4vVTa7LMKP6aH3A9UqJGJpbJllyXuweBYGAKX83g95ePK8nLcA6dZ45L
	 DfhgB4zHbp7Ya3FnP5uiTD8FpHs8eUnCjtLl4IU4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50DN7pWE045582
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 17:07:51 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 17:07:50 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 17:07:50 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50DN7oZQ061254;
	Mon, 13 Jan 2025 17:07:50 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v3 1/2] mfd: tps65215: Remove regmap_read check
Date: Mon, 13 Jan 2025 17:07:49 -0600
Message-ID: <20250113230750.124843-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113230750.124843-1-s-ramamoorthy@ti.com>
References: <20250113230750.124843-1-s-ramamoorthy@ti.com>
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
 include/linux/mfd/tps65219.h | 7 +++++--
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 081c5a30b04a..15b874ee59e5 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -246,12 +246,6 @@ static int tps65219_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ret = regmap_read(tps->regmap, TPS65219_REG_TI_DEV_ID, &chipid);
-	if (ret) {
-		dev_err(tps->dev, "Failed to read device ID: %d\n", ret);
-		return ret;
-	}
-
 	ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO,
 				   tps65219_cells, ARRAY_SIZE(tps65219_cells),
 				   NULL, 0, regmap_irq_get_domain(tps->irq_data));
diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 546bceec7173..0d88e92ff8f2 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -13,8 +13,11 @@
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 
-/* TPS chip id list */
-#define TPS65219					0xF0
+/* Chip id list*/
+enum pmic_id {
+	TPS65215,
+	TPS65219,
+};
 
 /* I2C ID for TPS65219 part */
 #define TPS65219_I2C_ID					0x24
-- 
2.43.0


