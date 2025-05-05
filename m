Return-Path: <linux-omap+bounces-3653-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F75AAA1BD
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 00:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1DA7168FFA
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 22:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA9B2D2680;
	Mon,  5 May 2025 22:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmIXQmfv"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7565C27F74A;
	Mon,  5 May 2025 22:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483624; cv=none; b=BRFoQESjWEEkEPvfAmzgm2XcMu7XE3OsgT5kx0FnKAj17GaHkcOXWS9j4Xno4eoewKc7bFXwXaR8N6WOcJgHCU33+byL1BuBXJ3bovyk9wUsH4gi8XpbHgML09HFyk1upluwvhSNW9KIuiTKMEGKdxiAt3msNbQUaihjtu+aKvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483624; c=relaxed/simple;
	bh=ylqYxdQlHi6aZDACM65/6Kigw4Q3GOPM/6rz8NCqPEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i6S1tycth9+btWgRGL5FZ9GCp/V+8DjUvb+JdMhbtaO6UUN1ayNDbRFcSxP0lQSVQicEN+AsayDpX1HCyAK8h8fV7je2lsNEKwnikrg3DmbTloOhTKQ7aO0lwn8faruKr6q62iWKfpOMFgg9OPX7ZunkfBXlsGg9j9tEc1oG2qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmIXQmfv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08B2C4CEE4;
	Mon,  5 May 2025 22:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483623;
	bh=ylqYxdQlHi6aZDACM65/6Kigw4Q3GOPM/6rz8NCqPEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LmIXQmfviLE9falHGSeQRXD8oTFYD+Ce26AhPa7AOlMfj0InMUA/yIKr9eMqDyEUu
	 4wlXMrkZYGtCLVz9fPPbut3nrlo9bWYfRCTzokcqUa8flg8d5WSAQnx+/ptlAqcsug
	 6Jw/egiIC5f657WVdikwxaTyud7W3ZJ1F1f9rdX1DfaikRflDwkgqrEN+CTdWApgl9
	 1IS+QUSb/8p+l+VmhvTM4N3wWCKOatwhjAImec+gBY0C+CNjXACOnSfs2pxHSHA/iN
	 5NbUQtQ3GjAD49UYCE4G5mq9IvdCDAa1RupdZ9u7+L4NTrB4upMyQQhBeiXXc08NXG
	 Y3AIg0Wnor9Uw==
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
Subject: [PATCH AUTOSEL 6.14 149/642] mfd: tps65219: Remove TPS65219_REG_TI_DEV_ID check
Date: Mon,  5 May 2025 18:06:05 -0400
Message-Id: <20250505221419.2672473-149-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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
index 081c5a30b04a2..4aca922658e34 100644
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
2.39.5


