Return-Path: <linux-omap+bounces-2846-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4B19F5823
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 21:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B87B188175C
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 20:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FCF1F9EC8;
	Tue, 17 Dec 2024 20:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SXRnGwRO"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BDA1F9EB9;
	Tue, 17 Dec 2024 20:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734468605; cv=none; b=lCHezE8vPGJK1tH/K86QH8xBl3QzNZBKZMjQobi5XPbklbrKrtxiQyM2mWRkxZAdkiQrseRK1AJ8OmsPDWh/yUmTbkq3+kV3fAI3zNPPlh7gUm2a7y/VlfHfnqW7Uz2k1I+gEvobBQFO2pgU4YvSIOf9FiPk1gu4rO0VnS/1eFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734468605; c=relaxed/simple;
	bh=mZlTlq74Zsx83Hk8sIiKsS9q50kgYVdWeIXNj3xnkJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WB27azHWM1wTgmkGraU/2Oyy6KJO3GRIR6HZ2kr/vtPif7rFFFRRMSIPRCR9dNESEMfFbY94YMHwl2EPil1pg/VLbd9iTGKr7CdNezN9en+bkeu2HpQjo6+U5oP0Ql8W5elQ4ZjPw/WgOREYFsaIROn3mCvlXpU+OpSZzv4s95I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SXRnGwRO; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKnZVi098742;
	Tue, 17 Dec 2024 14:49:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734468575;
	bh=F9V/m94d4Q9kQpNvv9HlMs2+If0hYEG8bWCVkNU7a+w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SXRnGwRO7MhMEWf98e+Xyujc5/SUvduZEjm+WZd9/s8t+sek2sBrDZZBrRh3P9QdD
	 6Yn7BigGb8mXC1KWz6VX61GG2kPy/rG0cbvm3dsp+Z4sOkpDQnBn7zbzUahlh8CMt4
	 bIZ2DjkOIDVSBjRaEX3Jw9mdjmupFdALUFMsbLyM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKnZGO070018
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 14:49:35 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 14:49:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 14:49:35 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.8])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKnZIC097729;
	Tue, 17 Dec 2024 14:49:35 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 1/2] mfd: tps65219: Use MFD_CELL macros
Date: Tue, 17 Dec 2024 14:49:34 -0600
Message-ID: <20241217204935.1012106-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217204935.1012106-1-s-ramamoorthy@ti.com>
References: <20241217204935.1012106-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Use MFD_CELL macro helpers instead of plain struct properties, which makes
the code shorter with the common defined MFD cell attributes.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/mfd/tps65219.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 57ff5cb294a6..081c5a30b04a 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -110,19 +110,12 @@ static const struct resource tps65219_regulator_resources[] = {
 };
 
 static const struct mfd_cell tps65219_cells[] = {
-	{
-		.name = "tps65219-regulator",
-		.resources = tps65219_regulator_resources,
-		.num_resources = ARRAY_SIZE(tps65219_regulator_resources),
-	},
-	{ .name = "tps65219-gpio", },
+	MFD_CELL_RES("tps65219-regulator", tps65219_regulator_resources),
+	MFD_CELL_NAME("tps65219-gpio"),
 };
 
-static const struct mfd_cell tps65219_pwrbutton_cell = {
-	.name = "tps65219-pwrbutton",
-	.resources = tps65219_pwrbutton_resources,
-	.num_resources = ARRAY_SIZE(tps65219_pwrbutton_resources),
-};
+static const struct mfd_cell tps65219_pwrbutton_cell =
+	MFD_CELL_RES("tps65219-pwrbutton", tps65219_pwrbutton_resources);
 
 static const struct regmap_config tps65219_regmap_config = {
 	.reg_bits = 8,
-- 
2.34.1


