Return-Path: <linux-omap+bounces-3655-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71083AAA971
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 03:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBE671885E35
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 01:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC8212CD8B;
	Mon,  5 May 2025 22:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kt2mXu3S"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E467F299AA2;
	Mon,  5 May 2025 22:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485002; cv=none; b=io80+uEjATtuJAP5o1Q+wqovHjL/W1wVQAxz+dVnOLbxniNAM0F9PLeQbGNiWN0wsKYVLHhx09qMaVxAiADDjax8JX/yRpy7I+2Ke/DKqN9p8AXda4F6UDV4Ku1By2Sj4x1uh4MW07R9d+qw2Uq6TwzazWMgbmFDVVW/3oJ4ZzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485002; c=relaxed/simple;
	bh=ay8e5jZYitraKytTGlIPwdEHkmewyYwRjos8ZAFOtVY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sk+Y87ceib/iXvw5P8IgCv5zaY2IvEmrB9dldzJGZLhRvUzDSYL+yxwHqY+rc6dg8VKchhHf1Cuatf8akikUcSqqeYD0BqvQ6P0orTZZni2HyFuDSKaWJrPaCdm4m6hlHNexCLFtQcnWTOkjITYet5sYAMiLMfjX4SZCD5TL+uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kt2mXu3S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EBFC4CEEE;
	Mon,  5 May 2025 22:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485001;
	bh=ay8e5jZYitraKytTGlIPwdEHkmewyYwRjos8ZAFOtVY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kt2mXu3SGuuElopaDqMPbV+0cBpNxtO29TwuHrN40wLNnyey/pP9gcr426UmCzPke
	 Y2HyvhjrUehd9L8QuMz5cyWKizTYJo7K0gHVwgm6dP9Ird50jYTmQQTQJCUO2wOCrH
	 ioO/yHESd1W7eUWaauoi7BPDHtL8YuG1NOfDYhFrtXkNyQiPFtWr7J/4b40zsM5XLC
	 c8qstO4JwClHkYP22u72jgCMUEf2jxZNjTpsZjbA0grTQ+BPASfWVpxJSYbur2czju
	 kD+5oRUg6y/Ir4Q9HKolVDYJxqUksjWQ+7xLtsiFhHZjYUw4QJpx47/6SGFU7m52Zi
	 yKICZdL4lnBEg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linux-omap@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 119/486] mfd: tps65219: Remove TPS65219_REG_TI_DEV_ID check
Date: Mon,  5 May 2025 18:33:15 -0400
Message-Id: <20250505223922.2682012-119-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Shree Ramamoorthy <s-ramamoorthy@ti.com>

[ Upstream commit 76b58d5111fdcffce615beb71520bc7a6f1742c9 ]

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
Link: https://lore.kernel.org/r/20250206173725.386720-4-s-ramamoorthy@ti.com
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mfd/tps65219.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 57ff5cb294a66..d3b77abec786e 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -228,7 +228,6 @@ static const struct regmap_irq_chip tps65219_irq_chip = {
 static int tps65219_probe(struct i2c_client *client)
 {
 	struct tps65219 *tps;
-	unsigned int chipid;
 	bool pwr_button;
 	int ret;
 
@@ -253,12 +252,6 @@ static int tps65219_probe(struct i2c_client *client)
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
2.39.5


