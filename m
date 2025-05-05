Return-Path: <linux-omap+bounces-3660-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F52AAB6BB
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 07:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3C7A7A2D7F
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 05:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75105339080;
	Tue,  6 May 2025 00:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X27a6MLV"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A283745AC;
	Mon,  5 May 2025 22:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485939; cv=none; b=m1NciCu9Xor3fiUKQWhmGjgmruEKEuMeJxhZq1E0TpWv/S5xJTA+dgCTlqJJIECEyTm3usCr570c/9mpNAnlNTv2nrWq9uECAYTAEfWu3UB8sbzX6lQuUlrja4r6FbVLkGn/kbATGf2P3GaGfjIm2a06ZSVhMM4tTFg0QzEpf6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485939; c=relaxed/simple;
	bh=PC+jTUt+sBuQzvXdmwfPrlJqZ2o7S8lrY1pss0LCaHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SCqJRuzZGf0pBVei8UlAZIgJnB7n4TLkX+D9bIvlTYE6FV3HaJES1GIlyMslr9nytb6uu+6w/YPF1Y1X4DJiw86e2Y9Q9b5LHuFYD6KMqv5bB+JTyryWGADLBpUkW3jl8ZkJcgndwFU+hGucKyY3yP6svvphvQXUcybyYY6AeJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X27a6MLV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B389BC4CEEF;
	Mon,  5 May 2025 22:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485937;
	bh=PC+jTUt+sBuQzvXdmwfPrlJqZ2o7S8lrY1pss0LCaHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X27a6MLV5dIGbyzh76VTcsfJiuxcCF88fXihxB24EpDRuK8v6ILYUhQPB3uj282hj
	 pm4yFH6s3SQ0HW89d9OYoewOe/rOOOop54UKbR/PLnur8MFDoPsrZMYUk/LHp1gW+t
	 w1zGVMxO3zKM5JCfzNElg2jFsugIm3KAZN4B9CebDxXb/upZp5YLPPhpxqdvjoJfP4
	 352Ebh3V/fZcBtFzkymp0FTP5jBhB+g3nnr7ZpNFVWAo8Ra4C2pOAieNY/qF0hWfqu
	 FZXhnazoc8aSPmFQFM5Be3k3Kk4fSm7vBBNI7QrPH/OxHshb0pRtnGUMDz2Mspqpa4
	 JTX0HTmJfoQ7g==
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
Subject: [PATCH AUTOSEL 6.6 075/294] mfd: tps65219: Remove TPS65219_REG_TI_DEV_ID check
Date: Mon,  5 May 2025 18:52:55 -0400
Message-Id: <20250505225634.2688578-75-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index 0e0c42e4fdfc7..72a5f51fe32a5 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -228,7 +228,6 @@ static struct regmap_irq_chip tps65219_irq_chip = {
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


