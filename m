Return-Path: <linux-omap+bounces-3728-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D69A5ABDF53
	for <lists+linux-omap@lfdr.de>; Tue, 20 May 2025 17:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 183021BA7FE1
	for <lists+linux-omap@lfdr.de>; Tue, 20 May 2025 15:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5662580F3;
	Tue, 20 May 2025 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pinWP7XL"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE5D243369;
	Tue, 20 May 2025 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755683; cv=none; b=Y4uO+HRfKUvuAoGgNncCoMfmusM/MTaDZNMztkUMj8j7BNM8butsCkBW9RLJnlLH80agtd3A0ENqu3Jp0/QB4ydTMKpjzoMQt9yWCgCMgFD4obLk8AnobnfeWRBWamxF5nmS4NNi5nMTnHIFZM/3CCL+FMAFfFhdx5fNsFAL/9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755683; c=relaxed/simple;
	bh=KbQfROc5Hg75Nw8HeRQO1lwKCtk4FnVOja7DflWtN0M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jawVa9bTzvQZCdGvmZoIGENjxToaV6dUPdueW8j9ORrjP+cVzpPOzhcJrlMILSIWkI2eQjTSvpcUw5+sTi/XBp9voQOOUG9NC563hlD6DDjJJhCkzxP3mCnQpeQdERsGbpx0SqIgjjjPTcCAP4sf0/gKK9nBoU4aTLZ8wQw9L7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pinWP7XL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19B4C4CEE9;
	Tue, 20 May 2025 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747755681;
	bh=KbQfROc5Hg75Nw8HeRQO1lwKCtk4FnVOja7DflWtN0M=;
	h=From:To:Cc:Subject:Date:From;
	b=pinWP7XLPurM1CAOrQlu5ITfUwT8IcME14Zq0/Hpq7oG/0QwsRmN8Gsxw+1JS+oNM
	 gzPHbhMogDUwZsbFd1nfCJQSKbqIHq4FE5VNUzCCjEDCbnhZfK61NIsYP18oZc5mpQ
	 np00Rerr/lsGArUr3jpcUX0W5IIiuVhzF0cCtjaR/PMn5DKbf7zvDhZxM44g2IrkNK
	 PucpYSuKfIHGcjurdOKW05KaSFq0d9J4gvCL06rV1pIbmu+NYTybV7cws55NWrldCK
	 KfLgYJJTt8hFDkxHb4v+m64onP+JneRwBZRwUHQE4ez0lBTQpz17MElO340iVewp6a
	 1gLvZdALj5XLQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Lee Jones <lee@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Chen Ni <nichen@iscas.ac.cn>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH] mfd: fix building without CONFIG_OF
Date: Tue, 20 May 2025 17:40:43 +0200
Message-Id: <20250520154106.2019525-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Using the of_fwnode_handle() means that local 'node' variables are unused
whenever CONFIG_OF is disabled for compile testing:

drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
drivers/mfd/88pm860x-core.c:576:29: error: unused variable 'node' [-Werror=unused-variable]
  576 |         struct device_node *node = i2c->dev.of_node;
      |                             ^~~~
drivers/mfd/max8925-core.c: In function 'max8925_irq_init':
drivers/mfd/max8925-core.c:659:29: error: unused variable 'node' [-Werror=unused-variable]
  659 |         struct device_node *node = chip->dev->of_node;
      |                             ^~~~
drivers/mfd/twl4030-irq.c: In function 'twl4030_init_irq':
drivers/mfd/twl4030-irq.c:679:46: error: unused variable 'node' [-Werror=unused-variable]
  679 |         struct                  device_node *node = dev->of_node;
      |                                              ^~~~

Replace these with the corresponding dev_fwnode() lookups that
keep the code simpler in addition to avoiding the warnings.

Fixes: e3d44f11da04 ("mfd: Switch to irq_domain_create_*()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Thomas, can you pick this up into the tip/irq/cleanups branch that
contains the earlier commit that introduced the warnings?
---
 drivers/mfd/88pm860x-core.c | 3 +--
 drivers/mfd/max8925-core.c  | 6 +++---
 drivers/mfd/twl4030-irq.c   | 3 +--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 488e346047c1..77230fbe07be 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -573,7 +573,6 @@ static int device_irq_init(struct pm860x_chip *chip,
 	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 	int data, mask, ret = -EINVAL;
 	int nr_irqs, irq_base = -1;
-	struct device_node *node = i2c->dev.of_node;
 
 	mask = PM8607_B0_MISC1_INV_INT | PM8607_B0_MISC1_INT_CLEAR
 		| PM8607_B0_MISC1_INT_MASK;
@@ -624,7 +623,7 @@ static int device_irq_init(struct pm860x_chip *chip,
 		ret = -EBUSY;
 		goto out;
 	}
-	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, chip->irq_base, 0,
+	irq_domain_create_legacy(dev_fwnode(&i2c->dev), nr_irqs, chip->irq_base, 0,
 				 &pm860x_irq_domain_ops, chip);
 	chip->core_irq = i2c->irq;
 	if (!chip->core_irq)
diff --git a/drivers/mfd/max8925-core.c b/drivers/mfd/max8925-core.c
index 78b16c67a5fc..25377dcce60e 100644
--- a/drivers/mfd/max8925-core.c
+++ b/drivers/mfd/max8925-core.c
@@ -656,7 +656,6 @@ static int max8925_irq_init(struct max8925_chip *chip, int irq,
 {
 	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 	int ret;
-	struct device_node *node = chip->dev->of_node;
 
 	/* clear all interrupts */
 	max8925_reg_read(chip->i2c, MAX8925_CHG_IRQ1);
@@ -682,8 +681,9 @@ static int max8925_irq_init(struct max8925_chip *chip, int irq,
 		return -EBUSY;
 	}
 
-	irq_domain_create_legacy(of_fwnode_handle(node), MAX8925_NR_IRQS, chip->irq_base, 0,
-				 &max8925_irq_domain_ops, chip);
+	irq_domain_create_legacy(dev_fwnode(chip->dev), MAX8925_NR_IRQS,
+				 chip->irq_base, 0, &max8925_irq_domain_ops,
+				 chip);
 
 	/* request irq handler for pmic main irq*/
 	chip->core_irq = irq;
diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 232c2bfe8c18..d3ab40651307 100644
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
+	irq_domain_create_legacy(dev_fwnode(dev), nr_irqs, irq_base, 0,
 				 &irq_domain_simple_ops, NULL);
 
 	irq_end = irq_base + TWL4030_CORE_NR_IRQS;
-- 
2.39.5


