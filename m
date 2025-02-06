Return-Path: <linux-omap+bounces-3275-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC6EA2AF08
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 18:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDDA8188ACF3
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 17:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F018A197A87;
	Thu,  6 Feb 2025 17:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sYgcCeah"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23264194C61;
	Thu,  6 Feb 2025 17:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863469; cv=none; b=K2LNlvEu8fCdoYOgi0xFFFyXtrMmGQN96TzGfhRqGAeu1zvdSDb5MQvFsAhu/sWUZovRRQUI/IAx2iinknU0Hx1UyBt3NZOwNedJwObPYsrUl18fQaZhZ2hIYb2eqB2y56V9SdslhnnNhdsvX8vawiJsAb2HyqN7Soe3aicjBD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863469; c=relaxed/simple;
	bh=zt/mnfcWoNqNLuBEU24kRzrEBrIJBtEPoY2gFPHU8vw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQvJuFUiotcJ4IbWhobB+yUvldjIzQh3LjlCZ6jVjsxZWXiyRpMkSkIGU7FQeDjGdkfV3C/mEa6Pr7+35+dHvrsuYKTAxXciIq3FODuOYjnz9A9GaHHxvhKpJtja35MVuGupLX4qodbL57XOp6KIwbIO/7wieN4f3PfuManMlAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sYgcCeah; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516HbQgx2845859
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 11:37:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738863446;
	bh=hXw56Z5YLLIPIW8dezxA4mbWZsRhgIge+67UFRGbaQE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sYgcCeahriRpdYemlJjsEn14nra6EtOOtkArrUF09PXX8UstfBsuccSgU+nZV/WT0
	 K2ATtwt+bZbpM4u4rj/V282w0PkN60KIbudERq1YPyiF3aGMvcPl5bbpEoMmEghD1h
	 g/RX+b3pWkjBFrfP/iHVGFTZRvxLT/z0lMlXgSIQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516HbQco026311
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 11:37:26 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 11:37:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 11:37:25 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516HbPCG015728;
	Thu, 6 Feb 2025 11:37:25 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v5 3/5] mfd: tps65219: Remove regmap_read check
Date: Thu, 6 Feb 2025 11:37:23 -0600
Message-ID: <20250206173725.386720-4-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206173725.386720-1-s-ramamoorthy@ti.com>
References: <20250206173725.386720-1-s-ramamoorthy@ti.com>
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
 drivers/mfd/tps65219.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 081c5a30b04a..4aca922658e3 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -221,7 +221,6 @@ static const struct regmap_irq_chip tps65219_irq_chip = {
 static int tps65219_probe(struct i2c_client *client)
 {
 	struct tps65219 *tps;
-	unsigned int chipid;
 	bool pwr_button;
 	int ret;
 
@@ -246,12 +245,6 @@ static int tps65219_probe(struct i2c_client *client)
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
-- 
2.43.0


