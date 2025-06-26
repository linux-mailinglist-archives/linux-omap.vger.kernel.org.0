Return-Path: <linux-omap+bounces-3979-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E33AE9462
	for <lists+linux-omap@lfdr.de>; Thu, 26 Jun 2025 04:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D14C64E103A
	for <lists+linux-omap@lfdr.de>; Thu, 26 Jun 2025 02:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEDC191499;
	Thu, 26 Jun 2025 02:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UaQ/1306"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7292F1FC6;
	Thu, 26 Jun 2025 02:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750906119; cv=none; b=e8xei3f04tjU9SBrf0Cayg9jfQ26N2j8n7xuJl1c71VK5qEd0yEFJLFpZZXW1N+vxnQ1W+f95asHvA/yIpbinkoYnbM/TWeForcf5MlLTXE5S1lOqsOQeQ1jGEOi+1o7aVFsEBKAOXU4s12hinI/xV1f/0xkdjzDFNXzHrgqvag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750906119; c=relaxed/simple;
	bh=evkCResN8ve34VH/xgIvp/XfqG7fhDvbaQIMPQrBtsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gxq/kciwaVn45pc3Zk+GIyJtftZTrL4PA/rSSieOso3IfZmqE2OextVqXB2MJlzZ2OD0MJUzB4zZ7tnLV/4myJOQqvMycKk0W++C3WfYfP5IfKHK5nx6VWhw0edmrFS3wO6A9LjCv0+Rtp3pyz+jNSjVedV57tTzp/gTUwdSmQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UaQ/1306; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A5DC4CEEA;
	Thu, 26 Jun 2025 02:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750906117;
	bh=evkCResN8ve34VH/xgIvp/XfqG7fhDvbaQIMPQrBtsY=;
	h=From:To:Cc:Subject:Date:From;
	b=UaQ/1306xYkQkh85fsQu5orsO+KXmlf4KvPeMdDzsawxyhXalj1Jr3Rqd9oDtvzaU
	 X1f/Ty8lzE/AvbDsalE9msJPayW9h0KoHCZsgAw5Fa/0zDSYn6Qc3I/ghoZ3uVDOXp
	 D6Bv1XH9UCyK79TkJjhXe9fW795GdfS3jtB8UUO9nbMasjDMhUXRMcjWrs7r5UkOS4
	 pEBgoX/zRNQHx8tiE419KO3bC798hIN7ZoX+zH/dHBFpyTFA9wUIHHK3Y9ljOwcG+q
	 eFHOWAaRNUGPTraAVIPbCyHRJZSX7KqzCa8Sgls9HV5AMwWxw11VSvfxpQkqp5Yjcu
	 mmmrD7LGhE5AA==
From: Geliang Tang <geliang@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: Geliang Tang <tanggeliang@kylinos.cn>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [RESEND PATCH mfd-next v2] mfd: Drop unused variables 'node'
Date: Thu, 26 Jun 2025 10:48:07 +0800
Message-ID: <a2cc3ac9466633ea44a656a855ed80289ae917e0.1750905716.git.tanggeliang@kylinos.cn>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geliang Tang <tanggeliang@kylinos.cn>

This patch drops the unused variables 'node' to fix the following build
warnings:

drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
drivers/mfd/88pm860x-core.c:576:29: warning: unused variable 'node' [-Wunused-variable]
  576 |         struct device_node *node = i2c->dev.of_node;
      |                             ^~~~

drivers/mfd/max8925-core.c: In function 'max8925_irq_init':
drivers/mfd/max8925-core.c:659:29: warning: unused variable 'node' [-Wunused-variable]
  659 |         struct device_node *node = chip->dev->of_node;
      |                             ^~~~

drivers/mfd/twl4030-irq.c: In function 'twl4030_init_irq':
drivers/mfd/twl4030-irq.c:679:46: warning: unused variable 'node' [-Wunused-variable]
  679 |         struct                  device_node *node = dev->of_node;
      |                                              ^~~~

Signed-off-by: Geliang Tang <tanggeliang@kylinos.cn>
---
RESEND:
 - cc more people.
v2:
 - drop unused variables 'node' in max8925-core.c and twl4030-irq.c too.
---
 drivers/mfd/88pm860x-core.c | 1 -
 drivers/mfd/max8925-core.c  | 1 -
 drivers/mfd/twl4030-irq.c   | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 488e346047c1..750f9db95386 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -573,7 +573,6 @@ static int device_irq_init(struct pm860x_chip *chip,
 	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 	int data, mask, ret = -EINVAL;
 	int nr_irqs, irq_base = -1;
-	struct device_node *node = i2c->dev.of_node;
 
 	mask = PM8607_B0_MISC1_INV_INT | PM8607_B0_MISC1_INT_CLEAR
 		| PM8607_B0_MISC1_INT_MASK;
diff --git a/drivers/mfd/max8925-core.c b/drivers/mfd/max8925-core.c
index 78b16c67a5fc..9d6358337d97 100644
--- a/drivers/mfd/max8925-core.c
+++ b/drivers/mfd/max8925-core.c
@@ -656,7 +656,6 @@ static int max8925_irq_init(struct max8925_chip *chip, int irq,
 {
 	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 	int ret;
-	struct device_node *node = chip->dev->of_node;
 
 	/* clear all interrupts */
 	max8925_reg_read(chip->i2c, MAX8925_CHG_IRQ1);
diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 232c2bfe8c18..c95a73186112 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -676,7 +676,6 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 	static struct irq_chip	twl4030_irq_chip;
 	int			status, i;
 	int			irq_base, irq_end, nr_irqs;
-	struct			device_node *node = dev->of_node;
 
 	/*
 	 * TWL core and pwr interrupts must be contiguous because
-- 
2.48.1


