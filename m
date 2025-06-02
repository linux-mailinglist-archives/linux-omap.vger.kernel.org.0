Return-Path: <linux-omap+bounces-3752-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A588ACBC28
	for <lists+linux-omap@lfdr.de>; Mon,  2 Jun 2025 22:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DDB51883905
	for <lists+linux-omap@lfdr.de>; Mon,  2 Jun 2025 20:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF82F1C1F12;
	Mon,  2 Jun 2025 20:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaGAcwRA"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F8A1624E1
	for <linux-omap@vger.kernel.org>; Mon,  2 Jun 2025 20:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748895016; cv=none; b=KJGpbLGXTdeOxtADoPA8Es3vkgoZjIluZfXITzFOpFoOU9Wv+lIDoICZsi8Qas9SGPnZ9DEVm5Iv974uCNgMRiiwQt8PYQk/hlwRmNzwCqRJiz/+nDQpmxAJ3S1mMYRn9su6IKGdPqeoFBxkcxLI6EyqGdqGQ0Gl7F+VfUvE4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748895016; c=relaxed/simple;
	bh=V3rgvrNv7I+83Wtsm3zqSRA78GgiGfOmxB/LGej0M4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RZfobmZGpOM97TQfpOSi87Njg3XmicuNQohG1PyIEdYtqZkDABS2w8vL8T+QrJHxYWOzSYLxctaGAW6CzDiksV3ytG9LTaUdk8Qh9x38c6Ou7olQXb59G+UpcUqutr/OtnsVvj9MOYzhxaoiDex0jEW/05oY1phVK2sQUKQALEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaGAcwRA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2FAC4CEEB;
	Mon,  2 Jun 2025 20:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748895014;
	bh=V3rgvrNv7I+83Wtsm3zqSRA78GgiGfOmxB/LGej0M4w=;
	h=From:To:Cc:Subject:Date:From;
	b=KaGAcwRAJk1QqkwBVVzqdL+stJoKAjbZpXTiIiTH0PNsuHL3WxgJeA3LZJoMMtzTt
	 xRKQ05mmwbAqX9/gzwq2p4F0dzxOkregslTEmXep1VIwJN93VDAMyab7AwkWgJx5VN
	 SeRmWOQCQTQCHMOEvoqfZvCYMxD3kaVAa73x0dI71bE19qq+02V3bg/BQpAFMc58aK
	 y2pyAbJSZauPtTmwC8FoQMir7OhgmUjpMalfeQsMGZTcb6EqgsNX70bHYbFDAWvTEN
	 w5evBJbbWUiUlEZdzmN41ZdVnRCbRLHqYLdULGekGtMKOXCJiVDxqfuDbq/R8KvSQd
	 Lc9jhHD4InDMw==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	lee@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	tglx@linutronix.de,
	jirislaby@kernel.org
Cc: linux-omap@vger.kernel.org
Subject: [PATCH] mfd: Fix compilation without CONFIG_OF
Date: Mon,  2 Jun 2025 15:09:56 -0500
Message-ID: <20250602201008.1850418-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

When compiling without CONFIG_OF but with CONFIG_WERROR enabled
several mfd drivers fail with -Werror=unused-variable.

The assignment from these variables is only used in of_fwnode_handle()
and thus they can be moved to only be used directly in the macro.

Fixes: a36aa0f7226a2 ("mfd: Switch to irq_domain_create_*()")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/mfd/88pm860x-core.c | 5 ++---
 drivers/mfd/max8925-core.c  | 5 ++---
 drivers/mfd/twl4030-irq.c   | 3 +--
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 488e346047c12..25300b53a8eff 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -573,7 +573,6 @@ static int device_irq_init(struct pm860x_chip *chip,
 	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 	int data, mask, ret = -EINVAL;
 	int nr_irqs, irq_base = -1;
-	struct device_node *node = i2c->dev.of_node;
 
 	mask = PM8607_B0_MISC1_INV_INT | PM8607_B0_MISC1_INT_CLEAR
 		| PM8607_B0_MISC1_INT_MASK;
@@ -624,8 +623,8 @@ static int device_irq_init(struct pm860x_chip *chip,
 		ret = -EBUSY;
 		goto out;
 	}
-	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, chip->irq_base, 0,
-				 &pm860x_irq_domain_ops, chip);
+	irq_domain_create_legacy(of_fwnode_handle(i2c->dev.of_node), nr_irqs,
+				 chip->irq_base, 0, &pm860x_irq_domain_ops, chip);
 	chip->core_irq = i2c->irq;
 	if (!chip->core_irq)
 		goto out;
diff --git a/drivers/mfd/max8925-core.c b/drivers/mfd/max8925-core.c
index 78b16c67a5fc6..91388477ad2b7 100644
--- a/drivers/mfd/max8925-core.c
+++ b/drivers/mfd/max8925-core.c
@@ -656,7 +656,6 @@ static int max8925_irq_init(struct max8925_chip *chip, int irq,
 {
 	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 	int ret;
-	struct device_node *node = chip->dev->of_node;
 
 	/* clear all interrupts */
 	max8925_reg_read(chip->i2c, MAX8925_CHG_IRQ1);
@@ -682,8 +681,8 @@ static int max8925_irq_init(struct max8925_chip *chip, int irq,
 		return -EBUSY;
 	}
 
-	irq_domain_create_legacy(of_fwnode_handle(node), MAX8925_NR_IRQS, chip->irq_base, 0,
-				 &max8925_irq_domain_ops, chip);
+	irq_domain_create_legacy(of_fwnode_handle(chip->dev->of_node), MAX8925_NR_IRQS,
+				 chip->irq_base, 0, &max8925_irq_domain_ops, chip);
 
 	/* request irq handler for pmic main irq*/
 	chip->core_irq = irq;
diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 232c2bfe8c180..a2ab5deef9e21 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -676,7 +676,6 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 	static struct irq_chip	twl4030_irq_chip;
 	int			status, i;
 	int			irq_base, irq_end, nr_irqs;
-	struct			device_node *node = dev->of_node;
 
 	/*
 	 * TWL core and pwr interrupts must be contiguous because
@@ -691,7 +690,7 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 		return irq_base;
 	}
 
-	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, irq_base, 0,
+	irq_domain_create_legacy(of_fwnode_handle(dev->of_node), nr_irqs, irq_base, 0,
 				 &irq_domain_simple_ops, NULL);
 
 	irq_end = irq_base + TWL4030_CORE_NR_IRQS;
-- 
2.43.0


